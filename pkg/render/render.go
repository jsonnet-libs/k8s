package render

import (
	"strings"

	j "github.com/jsonnet-libs/k8s/pkg/builder"
	"github.com/jsonnet-libs/k8s/pkg/model"
)

func Group(name string, g model.Group) j.ObjectType {
	fields := []j.Type{}
	for name, ver := range g {
		v := Version(name, ver)
		fields = append(fields, j.Hidden(v))
	}
	return j.Object(name, fields...)
}

func Version(name string, v model.Version) j.ObjectType {
	fields := []j.Type{
		j.Local(j.ConciseObject(LocalApiVersion, j.String("apiVersion", v.ApiVersion))),
	}

	for name, kind := range v.Kinds {
		k := Kind(name, kind)
		docs := j.Comment(k, kind.Help)
		fields = append(fields, docs)
	}

	o := j.Object(name, fields...)
	return o
}

func Kind(name string, k model.Kind) j.Type {
	fields := []j.Type{}

	if k.New != nil {
		fields = append(fields, j.Comment(
			constructor(*k.New, strings.Title(name)),
			k.New.Help,
		))
	}

	for k, m := range k.Modifiers {
		if i := Modifier(k, m); i != nil {
			fields = append(fields, i)
		}
	}

	// mixin field for compatibility
	fields = append(fields, j.Ref("mixin", "self"))
	return j.Object(name, fields...)
}

func constructor(c model.Constructor, kind string) j.FuncType {
	ret := j.Add("",
		j.Ref("", LocalApiVersion),
		j.ConciseObject("", j.String("kind", kind)),
		j.Call("", "self.metadata.withName", j.Args(j.Ref("name", "name"))),
	)

	return j.Func("new",
		j.Args(j.Required(j.String("name", ""))),
		ret,
	)
}
