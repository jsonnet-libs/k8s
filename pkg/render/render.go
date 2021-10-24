package render

import (
	"path"
	"path/filepath"

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

func Service(name string, service *cloudformation.Service, gen string) map[string]j.Type {
	fields := []j.Type{
		d.Import(),
		d.Pkg(service.PackageName, "", ""),
	}

	objects := make(map[string]j.Type)

	for resourceName, resource := range service.ResourceTypes {
		r := Resource(resourceName, resource)
		fn := filepath.Join(resource.N("resource") + GenExt)
		objects[filepath.Join(gen, resource.FilePath()+GenExt)] = r
		fields = append(fields, j.Hidden(j.Import(resource.Name, fn)))
	}

	SortFields(fields)
	objects[filepath.Join(gen, service.FilePath(), MainFile)] = j.Object(service.PackageName, fields...)

	return objects
}

func Resource(name string, resource *cloudformation.ResourceType) j.Type {
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

	fields = append(fields, modNew(resource)...)
	//fields = append(fields, modDependsOn(resource)...)
	//fields = append(fields, modPolicies(resource, "CreationPolicy")...)
	//fields = append(fields, modPolicies(resource, "DeletionPolicy")...)
	//fields = append(fields, modPolicies(resource, "UpdatePolicy")...)
	//fields = append(fields, modPolicies(resource, "UpdateReplacePolicy")...)
	//fields = append(fields, modMetadata(resource)...)
	fields = append(fields, modProperties(resource)...)

	return j.Add("", j.Import("", "../../../extensions/attributes.libsonnet"), j.Object(resource.PackageName, fields...))
}
