package render

import (
	"path/filepath"
	"sort"
	"strings"

	j "github.com/jsonnet-libs/k8s/pkg/builder"
	"github.com/jsonnet-libs/k8s/pkg/model"
)

const (
	CustomPrefix = "_custom"
	GenPrefix    = "_gen"
	GenExt       = ".libsonnet"
	IndexFile    = "gen" + GenExt
	MainFile     = "main" + GenExt
)

// Index creates gen.libsonnet, the index of all generated artifacts
func Index(groups map[string]model.Group) j.ObjectType {
	fields := make([]j.Type, 0, len(groups))
	for name := range groups {
		imp := filepath.Join(GenPrefix, name, MainFile)
		fields = append(fields, j.Hidden(j.Import(name, imp)))
	}

	SortFields(fields)

	return j.Object("", fields...)
}

// Main creates main.libsonnet:
// - import the generated index (gen.libsonnet)
// - add all hand-written patches on top
func Main(adds []string) j.Type {
	index := j.Import("", IndexFile)
	if len(adds) == 0 {
		return index
	}

	elems := []j.Type{index}
	for _, a := range adds {
		a = filepath.Join(CustomPrefix, filepath.Base(a))
		add := j.Import("", a)
		elems = append(elems, add)
	}

	return j.Add("", elems...)
}

// Objects is a collection of Jsonnet objects, indexed by their expected path on
// the filesystem
type Objects map[string]j.ObjectType

func (o Objects) Add(prefix string, set Objects) {
	for k, v := range set {
		o[filepath.Join(prefix, k)] = v
	}
}

// Group renders the entire given group, returning e.g.:
// - main.libsonnet, the group index
// - v1/main.libsonnet, the version v1 index
// - v1/deployment.libsonnet, Deployment
// - v1/daemonset.libsonnet, DaemonSet
func Group(name string, g model.Group) Objects {
	imports := []j.Type{}
	objects := make(Objects)

	for name, ver := range g {
		v := Version(name, ver)
		objects.Add(name, v)
		imports = append(imports, j.Import(name, filepath.Join(name, MainFile)))
	}

	SortFields(imports)
	objects[MainFile] = j.Object(name, imports...)

	return objects
}

// Version renders the entire given object, returning e.g.:
// - /main.libsonnet, the version index
// - /deployment.libsonnet, Deployment
// - /daemonset.libsonnet, DaemonSet
func Version(name string, v model.Version) Objects {
	imports := []j.Type{}
	objects := make(Objects)

	for name, kind := range v.Kinds {
		k := Kind(name, kind)
		fn := name + GenExt
		objects[fn] = k
		imports = append(imports, j.Import(name, fn))
	}

	SortFields(imports)
	objects[MainFile] = j.Object(name, imports...)

	return objects
}

// Kind renders the given Kind, including all modifiers and perhaps a
// constructor
func Kind(name string, k model.Kind) j.ObjectType {
	fields := []j.Type{}

	for k, m := range k.Modifiers {
		if i := Modifier(k, m); i != nil {
			fields = append(fields, i...)
		}
	}

	// sort early, the following should have sticky positions
	SortFields(fields)

	// prepend new() function, so it is at top
	if k.New != nil {
		fn := j.Comment(
			constructor(*k.New, strings.Title(name), k.ApiVersion()),
			k.New.Help,
		)

		fields = append([]j.Type{fn}, fields...)
	}

	// mixin field for compatibility
	fields = append(fields, j.Ref("mixin", "self"))
	return j.Object(name, fields...)
}

// constructor creates a generic constructor, that 'just' adds apiVersion and
// kind to an object. For more sophisticated constructors, the generated
// artifact is overridden using hand-written files later on.
func constructor(c model.Constructor, kind, apiVersion string) j.FuncType {
	ret := j.Add("",
		j.Object("",
			j.String("apiVersion", apiVersion),
			j.String("kind", kind),
		),
		j.Call("", "self.metadata.withName", j.Args(j.Ref("name", "name"))),
	)

	return j.Func("new",
		j.Args(j.Required(j.String("name", ""))),
		ret,
	)
}

// SortFields sorts Jsonnet fields
func SortFields(fields []j.Type) {
	sort.SliceStable(fields, func(i, j int) bool {
		return fields[i].Name() < fields[j].Name()
	})
}
