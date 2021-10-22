package render

import (
	"fmt"
	"strings"

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
	args := j.Args()
	dArgs := d.Args()

	props := []j.Type{}

	for propName, property := range resource.Resource.Props {
		if property.Required {
			props = append(props,
				j.Error(propName, fmt.Sprintf("You need to define %s properties for %s resource", propName, resource.OriginName)),
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

// should be moved to a common Jsonnet library with CreationPolicy/DeletionPolicy/UpdatePolicy/UpdateReplacePolicy/Metadata
// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-product-attribute-reference.html
func modDependsOn(resource *cloudformation.ResourceType) []j.Type {
	dArgs := d.Args("dependencies", "array")
	args := j.Args(
		j.List("dependencies", []j.Type{}...),
	)

	result := j.Add("",
		j.ConciseObject("",
			j.Ref("DependsOn", "dependencies"),
		),
	)

	fun := j.Func("dependsOn",
		args,
		result,
	)
	doc := d.Func("dependsOn",
		fmt.Sprintf(`https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-%s.html`, strings.ToLower("dependsOn")),
		dArgs,
	)

	resultMixin := j.Add("",
		j.ConciseObject("",
			j.Merge(j.Ref("DependsOn", "dependencies")),
		),
	)

	funMixin := j.Func("dependsOn"+mixinSuf,
		args,
		resultMixin,
	)
	docMixin := d.Func("dependsOn"+mixinSuf,
		fmt.Sprintf(`https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-%s.html`, strings.ToLower("dependsOn")),
		dArgs,
	)

	return []j.Type{fun, doc, funMixin, docMixin}
}

func modPolicies(resource *cloudformation.ResourceType, att string) []j.Type {
	dArgs := d.Args("policy", "object")
	args := j.Args(
		j.Object("policy", []j.Type{}...),
	)

	result := j.Add("",
		j.ConciseObject("",
			j.Ref(att, "policy"),
		),
	)

	fun := j.Func(strcase.LowerCamelCase(att),
		args,
		result,
	)
	doc := d.Func(strcase.LowerCamelCase(att),
		fmt.Sprintf(`https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-%s.html`, strings.ToLower(att)),
		dArgs,
	)

	resultMixin := j.Add("",
		j.ConciseObject("",
			j.Merge(j.Ref(att, "policy")),
		),
	)

	funMixin := j.Func(strcase.LowerCamelCase(att)+mixinSuf,
		args,
		resultMixin,
	)
	docMixin := d.Func(strcase.LowerCamelCase(att)+mixinSuf,
		fmt.Sprintf(`https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-%s.html`, strings.ToLower(att)),
		dArgs,
	)

	return []j.Type{fun, doc, funMixin, docMixin}
}

func modMetadata(resource *cloudformation.ResourceType) []j.Type {
	dArgs := d.Args("metadatas", "object")
	args := j.Args(
		j.List("metadatas", []j.Type{}...),
	)

	result := j.Add("",
		j.ConciseObject("",
			j.Ref("Metadata", "metadatas"),
		),
	)

	fun := j.Func("metadata",
		args,
		result,
	)
	doc := d.Func("metadata",
		fmt.Sprintf(`https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-%s.html`, strings.ToLower("metadata")),
		dArgs,
	)

	resultMixin := j.Add("",
		j.ConciseObject("",
			j.Merge(j.Ref("Metadata", "metadatas")),
		),
	)

	funMixin := j.Func("metadata"+mixinSuf,
		args,
		resultMixin,
	)
	docMixin := d.Func("metadata"+mixinSuf,
		fmt.Sprintf(`https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-attribute-%s.html`, strings.ToLower("metadata")),
		dArgs,
	)

	return []j.Type{fun, doc, funMixin, docMixin}
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
			stype = "number"
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
