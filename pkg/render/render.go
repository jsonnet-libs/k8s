package render

import (
	"path/filepath"
	"sort"
	"strings"

	j "github.com/jsonnet-libs/k8s/pkg/builder"
	"github.com/jsonnet-libs/k8s/pkg/model"
)

const (
	GenPrefix = "_gen"
	GenExt    = ".libsonnet"
	IndexFile = "gen.libsonnet"
	MainFile  = "main.libsonnet"
)

func Filename(group string) string {
	return filepath.Join(GenPrefix, group+GenExt)
}

func Index(groups map[string]model.Group) j.ObjectType {
	fields := make([]j.Type, 0, len(groups))
	for name := range groups {
		fields = append(fields, j.Hidden(j.Import(name, Filename(name))))
	}

	SortFields(fields)

	return j.Object("", fields...)
}

func Main(adds []string) j.Type {
	index := j.Import("", IndexFile)
	if len(adds) == 0 {
		return index
	}

	elems := []j.Type{index}
	for _, a := range adds {
		a = filepath.Base(a)
		add := j.Import("", a)
		elems = append(elems, add)
	}

	return j.Add("", elems...)
}

// Objects is a collection of Jsonnet objects, indexed by their expected path on
// the filesystem
type Objects map[string]j.ObjectType

func (o Objects) Add(set Objects, prefix string) {
	for k, v := range set {
		o[filepath.Join("/"+prefix, k)] = v
	}
}

// Group renders the entire given group, returning e.g.:
// - /main.libsonnet, the group index
// - /v1/main.libsonnet, the version v1 index
// - /v1/deployment.libsonnet, Deployment
// - /v1/daemonset.libsonnet, DaemonSet
func Group(name string, g model.Group) j.ObjectType {
	fields := []j.Type{}
	for name, ver := range g {
		v := Version(name, ver)
		fields = append(fields, j.Hidden(v))
	}

	SortFields(fields)

	return j.Object(name, fields...)
}

// Version renders the entire given object, returning e.g.:
// - /main.libsonnet, the version index
// - /deployment.libsonnet, Deployment
// - /daemonset.libsonnet, DaemonSet
func Version(name string, v model.Version) j.ObjectType {
	fields := []j.Type{
		// j.Local(j.ConciseObject(LocalApiVersion, j.String("apiVersion", v.ApiVersion))),
	}
	for name, kind := range v.Kinds {
		k := Kind(name, kind, v.ApiVersion)
		docs := j.Comment(k, kind.Help)
		fields = append(fields, docs)
	}

	SortFields(fields)

	return j.Object(name, fields...)
}

func Kind(name string, k model.Kind, apiVersion string) j.Type {
	fields := []j.Type{}

	for k, m := range k.Modifiers {
		if i := Modifier(k, m); i != nil {
			fields = append(fields, i)
		}
	}

	// sort early, the following should have sticky positions
	SortFields(fields)

	// prepend new() function, so it is at top
	if k.New != nil {
		fn := j.Comment(
			constructor(*k.New, strings.Title(name), apiVersion),
			k.New.Help,
		)

		fields = append([]j.Type{fn}, fields...)
	}

	// mixin field for compatibility
	fields = append(fields, j.Ref("mixin", "self"))
	return j.Object(name, fields...)
}

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

func SortFields(fields []j.Type) {
	sort.SliceStable(fields, func(i, j int) bool {
		return fields[i].Name() < fields[j].Name()
	})
}
