package render

import (
	"fmt"
	"strings"

	j "github.com/Cicatrice/cfn-gen/pkg/builder"
	d "github.com/Cicatrice/cfn-gen/pkg/builder/docsonnet"
	"github.com/Cicatrice/cfn-gen/pkg/model"
)

const (
	// LocalAPIVersion references a "private: json field containing the APIVersion
	LocalAPIVersion = "_apiVersion"
)

// Modifier retrieves the correct modifier(s) for a given type
func Modifier(name string, i interface{}) []j.Type {
	switch t := i.(type) {
	case model.Modifier:
		return modFunction(name, t)
	case model.Object:
		objMod := modObject(name, t)
		return []j.Type{
			d.Obj(name, t.Help),
			objMod,
		}
	}
	panic(fmt.Sprintf("unexpected %T", i))
}

func modObject(name string, o model.Object) j.ObjectType {
	childs := make([]j.Type, 0, len(o.Fields))
	for k, m := range o.Fields {
		childs = append(childs, Modifier(k, m)...)
	}

	SortFields(childs)

	newObj := j.Object
	if len(childs) == 1 && !isFuncType(childs[0]) {
		newObj = j.ConciseObject
	}

	return newObj(name, childs...)
}

func modFunction(name string, f model.Modifier) []j.Type {
	// parameters
	args := j.Args(
		j.Required(j.String(f.Arg.Key, "")),
	)

	if f.Type == "" {
		f.Type = "any"
	}
	dArgs := d.Args(f.Arg.Key, string(f.Type))

	out := make([]j.Type, 0, 2)

	// withXyz()
	set := fnResult(f, false)
	out = append(out,
		d.Func(name, f.Help, dArgs),
		j.Func(name, args, j.ConciseObject("", set)),
	)
	/*
		// withXyzMixin()
		if f.Type == swagger.TypeObject || f.Type == swagger.TypeArray {
			add := fnResult(f, true)
			mixName := name + "Mixin"
			out = append(out,
				d.Func(mixName,
					f.Help+"\n\n**Note:** This function appends passed data to existing values",
					dArgs,
				),
				j.Func(mixName, args, j.ConciseObject("", add)),
			)
		}
	*/
	return out
}

func fnResult(f model.Modifier, adder bool) j.Type {
	elems := strings.Split(f.Target, ".")
	ret := reduceReverse(elems, func(i int, s string, o j.Type) j.Type {
		switch i {
		case 0:
			// if array, also accept single value
			// if f.Type == swagger.TypeArray {
			// 	return j.IfThenElse(s,
			// 		j.Call("", "std.isArray", j.Args(j.Ref("v", f.Arg.Key))),
			// 		j.Ref("", f.Arg.Key),
			// 		j.List("", j.Ref("", f.Arg.Key)),
			// 	)
			// }
			return j.Ref(s, f.Arg.Key)
		case 1:
			if !adder {
				return j.ConciseObject(s, o)
			}
			fallthrough
		default:
			return j.ConciseObject(s, j.Merge(o))
		}
	})
	if len(elems) != 1 || adder {
		ret = j.Merge(ret)
	}

	return ret
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
