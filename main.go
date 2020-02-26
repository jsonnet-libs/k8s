package main

import (
	"fmt"
	"io/ioutil"
	"log"
	"regexp"
	"strings"

	j "github.com/jsonnet-libs/k8s/pkg/builder"
	"github.com/jsonnet-libs/k8s/pkg/swagger"
)

const (
	ListMetaId   = "io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta"
	ObjectMetaId = "io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta"
)

var expr = regexp.MustCompile(`(?mU)(?P<domain>io\.k8s\.api)\.(?P<group>.*)\.(?P<version>.*)\.(?P<kind>.*)$`)
var modifierBlacklist = map[string]bool{
	"kind":       true,
	"apiVersion": true,
	"status":     true,
}

func main() {
	data, err := ioutil.ReadFile("swagger.json")
	if err != nil {
		log.Fatalln(err)
	}

	s, err := swagger.Load(data)
	if err != nil {
		log.Fatalln(err)
	}

	defs := s.Definitions.Filter(func(k string, v swagger.Schema) bool {
		if !expr.MatchString(k) {
			return false
		}

		meta := v.Props["metadata"]
		if meta == nil || meta.DollarRef == nil {
			return true
		}
		return meta.Ref() != ListMetaId
	})

	groups := defsToGroups(defs)

	core := groups["core"]
	ov := renderGroup("core", core)

	d := j.Doc{
		Root: ov,
	}
	fmt.Println(d.String())
}

const (
	LocalApiVersion = "_apiVersion"
)

func renderGroup(name string, g Group) j.ObjectType {
	fields := []j.Type{}
	for name, ver := range g {
		v := renderVersion(name, ver)
		fields = append(fields, j.Hidden(v))
	}
	return j.Object(name, fields...)
}

func renderVersion(name string, v Version) j.ObjectType {
	fields := []j.Type{
		j.Local(j.ConciseObject(LocalApiVersion, j.String("apiVersion", v.ApiVersion))),
	}

	for name, kind := range v.Kinds {
		k := renderKind(name, kind)
		docs := j.Comment(k, kind.Help)
		fields = append(fields, docs)
	}

	o := j.Object(name, fields...)
	return o
}

func renderKind(name string, k Kind) j.Type {
	fields := []j.Type{}

	if k.New != nil {
		fields = append(fields, j.Comment(
			constructor(*k.New, strings.Title(name)),
			k.New.Help,
		))
	}

	for k, m := range k.Modifiers {
		if i := mod(k, m); i != nil {
			fields = append(fields, i)
		}
	}

	// mixin field for compatibility
	fields = append(fields, j.Ref("mixin", "self"))
	return j.Object(name, fields...)
}

func constructor(f Modifier, kind string) j.FuncType {
	ret := j.Add("",
		j.Ref("", LocalApiVersion),
		j.ConciseObject("", j.String("kind", kind)),
		j.Call("", "self.metadata.withName", j.Args(j.Ref("name", "name"))),
	)

	return j.Func(
		"new",
		j.Args(j.Required(j.String("name", ""))),
		ret,
	)
}

func mod(name string, i interface{}) j.Type {
	switch t := i.(type) {
	case Modifier:
		return fn(name, t)
	case Object:
		return j.Comment(obj(name, t), t.Help)
	}
	panic(fmt.Sprintf("unexpected %T", i))
}

func fnComment(s string) string {
	return s
}

func obj(name string, o Object) j.ObjectType {
	childs := make([]j.Type, 0, len(o.Fields))
	for k, m := range o.Fields {
		childs = append(childs, mod(k, m))
	}
	newObj := j.Object
	if len(childs) == 1 && !isFuncType(childs[0]) {
		newObj = j.ConciseObject
	}
	return newObj(name, childs...)
}

func fn(name string, f Modifier) j.FuncType {
	// parameters
	args := make([]j.Type, 0, len(f.Parameters))
	p := f.Parameters[0]
	args = append(args, j.Required(j.String(p.Key, "")))

	// return patch
	elems := strings.Split(f.Target, ".")
	ret := reduceReverse(elems, func(i int, s string, o j.Type) j.Type {
		switch i {
		case 0:
			return j.Ref(s, p.Key)
		case 1:
			return j.ConciseObject(s, o)
		default:
			return j.ConciseObject(s, j.Merge(o))
		}
	})
	if len(elems) != 1 {
		ret = j.Merge(ret)
	}

	return j.Func(name, args, j.ConciseObject("", ret))
}

// reduceReverse calls f for each in arr in reverse order.
// o will the result of the previous element's invocation, nil if i==0
func reduceReverse(arr []string, f func(i int, s string, o j.Type) j.Type) j.Type {
	size := len(arr) - 1
	var last j.Type
	for ii := range arr {
		i := size - ii
		last = f(ii, arr[i], last)
	}
	return last
}

func isFuncType(t j.Type) bool {
	_, ok := t.(j.FuncType)
	return ok
}
