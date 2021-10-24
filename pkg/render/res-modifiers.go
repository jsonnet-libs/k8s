package render

import (
	"fmt"

	j "github.com/Cicatrice/cfn-gen/pkg/builder"
	d "github.com/Cicatrice/cfn-gen/pkg/builder/docsonnet"
	"github.com/Cicatrice/cfn-gen/pkg/cloudformation"
	"github.com/stoewer/go-strcase"
)

const (
	withPfx  string = "with"
	mixinSuf string = "Mixin"
)

func modNew(resource *cloudformation.ResourceType) []j.Type {
	args := j.Args(
		j.Boolean("errorOnEmptyProp", true),
	)
	dArgs := d.Args(
		"errorOnEmptyProp", "bool",
	)

	props := []j.Type{}

	// For each required property, add an if/then/else with jsonnet error if `errorOnEmptyProp` (arg on constructor) is true
	for propName, property := range resource.Resource.Props {
		if property.Required {
			props = append(props,
				j.IfThenElse(
					propName,
					j.Ref(
						"errorOnEmptyProp",
						"errorOnEmptyProp",
					),
					j.Error(
						"",
						fmt.Sprintf(
							"You need to define %s properties for %s resource",
							propName,
							resource.OriginName),
					),
					j.Null(""),
				),
			)
		}
	}

	result := j.Add("",
		j.ConciseObject("",
			j.String("Type", resource.OriginName),
			j.ConciseObject("Properties", props...),
		),
	)

	fun := j.Func("new",
		args,
		result,
	)
	doc := d.Func("new",
		resource.Resource.Documentation(),
		dArgs,
	)

	return []j.Type{fun, doc}
}

func modProperties(resource *cloudformation.ResourceType) []j.Type {
	out := []j.Type{}

	for propName, prop := range resource.Resource.Props {
		argName := strcase.LowerCamelCase(propName)

		stype := prop.Value()

		dArgs := d.Args(argName, stype)
		args := j.Args()

		hasMixin := false

		switch stype {
		case "bool":
			args = j.Args(
				j.Required(j.Boolean(argName, false)),
			)
		case "string":
			args = j.Args(
				j.Required(j.String(argName, "")),
			)
		case "integer", "long":
			stype = "number"
			dArgs = d.Args(argName, stype)
			args = j.Args(
				j.Required(j.Integer(argName, 0)),
			)
		case "float", "double":
			//stype = "double"
			stype = "number" // fallback to number as `double` is not supported by `docsonnet` yet
			dArgs = d.Args(argName, stype)
			args = j.Args(
				j.Required(j.Double(argName, 0)),
			)
		case "array":
			hasMixin = true
			args = j.Args(
				j.Required(j.List(argName, []j.Type{}...)),
			)
		case "object":
			hasMixin = true
			args = j.Args(
				j.Required(j.ConciseObject(argName)),
			)
		default:
			stype = "object" // fallback to object in the meanwhile ; need to implement a more clever PropertyType interpolation
			dArgs = d.Args(argName, stype)
			hasMixin = true
			args = j.Args(
				j.Required(j.ConciseObject(argName)),
			)
			fmt.Println("Not supported yet ", resource.FullName, propName)
		}

		//set := fnResult(f, false)
		doc := d.Func(withPfx+propName, prop.Documentation(), dArgs)
		fun := j.Func(withPfx+propName, args, j.ConciseObject("",
			j.Merge(j.ConciseObject("Properties",
				j.Ref(propName, argName),
			)),
		))

		out = append(out, fun, doc)

		if hasMixin {
			docMixin := d.Func(withPfx+propName+mixinSuf,
				prop.Documentation(),
				dArgs,
			)
			funMixin := j.Func(withPfx+propName+mixinSuf, args, j.ConciseObject("",
				j.Merge(j.ConciseObject("Properties",
					j.Merge(j.Ref(propName, argName)),
				)),
			))
			out = append(out, funMixin, docMixin)
		}

	}
	SortFields(out)
	return out
}
