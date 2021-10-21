package render

import (
	"path"
	"path/filepath"

	"github.com/stoewer/go-strcase"

	j "github.com/Cicatrice/cfn-gen/pkg/builder"
	d "github.com/Cicatrice/cfn-gen/pkg/builder/docsonnet"
	"github.com/Cicatrice/cfn-gen/pkg/cloudformation"
)

// Common set of directory structure / file extensions
const (
	ExtPrefix    = "extensions"
	CustomPrefix = "_custom"
	GenPrefix    = "_gen"
	GenExt       = ".libsonnet"
	IndexFile    = "gen" + GenExt
	MainFile     = "main" + GenExt
)

// Index creates gen.libsonnet, the index of all generated artifacts
func Index(realms map[string]*cloudformation.Realm, name, repo, dir, description string) j.ObjectType {
	fields := []j.Type{
		d.Import(),
		d.Pkg(name, path.Join(repo, dir, "main.libsonnet"), description),
	}

	for _, realm := range realms {
		imp := filepath.Join(GenPrefix, realm.N("realm"), MainFile)
		fields = append(fields, j.Hidden(j.Import(realm.Name, imp)))
	}

	SortFields(fields)

	return j.Object("", fields...)
}

// Objects is a collection of Jsonnet objects, indexed by their expected path on
// the filesystem
type Objects map[string]j.ObjectType

// Add appends a jsonnet object to an object
func (o Objects) Add(prefix string, set Objects) {
	for k, v := range set {
		o[filepath.Join(prefix, k)] = v
	}
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

func Realm(name string, realm *cloudformation.Realm) j.ObjectType {
	fields := []j.Type{
		d.Import(),
		d.Pkg(realm.PackageName, "", ""),
	}

	for _, service := range realm.Services {
		imp := filepath.Join(service.N("service"), MainFile)
		fields = append(fields, j.Hidden(j.Import(service.Name, imp)))
	}

	SortFields(fields)
	rr := j.Object(realm.PackageName, fields...)
	return rr

}

func Service(name string, service *cloudformation.Service, gen string) Objects {
	fields := []j.Type{
		d.Import(),
		d.Pkg(service.PackageName, "", ""),
	}

	objects := make(Objects)

	for resourceName, resource := range service.ResourceTypes {
		r := Resource(resourceName, resource)
		fn := filepath.Join(gen, resource.FilePath()+GenExt)
		objects[fn] = r
		fields = append(fields, j.Import(resource.Name, fn))
	}

	SortFields(fields)
	objects[filepath.Join(gen, service.FilePath(), MainFile)] = j.Object(service.PackageName, fields...)

	return objects
}

func Resource(name string, resource *cloudformation.ResourceType) j.ObjectType {
	fields := []j.Type{
		d.Import(),
		d.Pkg(resource.PackageName, "", resource.Resource.Documentation()),
	}

	// with... functions
	for k, m := range resource.Modifiers {
		if i := Modifier(k, m); i != nil {
			fields = append(fields, i...)
		}
	}

	// PROPERTIES
	for propName, prop := range resource.Resource.Props {
		/*
			if prop.Type {
				dArgs := d.Args(string(prop.Type), string(prop.Type))
			} else {
				dArgs := ""
			}*/
		argName := strcase.LowerCamelCase(propName)
		dArgs := d.Args(argName, "string")
		args := j.Args(
			j.Required(j.String(argName, "")),
		)
		//set := fnResult(f, false)
		fields = append(fields,
			d.Func("with"+propName, prop.Documentation(), dArgs),
			j.Func("with"+propName, args, j.ConciseObject("",
				j.Merge(j.ConciseObject("Properties",
					j.Ref(propName, argName),
				)),
			)),
		)

	}

	SortFields(fields)

	// fields = append(fields,
	// 	j.String("#mixin", "ignore"),
	// 	j.Ref("mixin", "self"),
	//)

	return j.Object(resource.PackageName, fields...)
}
