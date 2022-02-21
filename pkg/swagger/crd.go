package swagger

import (
	"bytes"
	"io"
	"strings"

	goyaml "gopkg.in/yaml.v3"
	apiextensionsv1 "k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/v1"
	"k8s.io/apimachinery/pkg/util/yaml"
)

func SplitYAML(resources []byte) ([][]byte, error) {
	dec := goyaml.NewDecoder(bytes.NewReader(resources))

	var res [][]byte
	for {
		var value interface{}
		err := dec.Decode(&value)
		if err == io.EOF {
			break
		}
		if err != nil {
			return nil, err
		}
		valueBytes, err := goyaml.Marshal(value)
		if err != nil {
			return nil, err
		}
		res = append(res, valueBytes)
	}
	return res, nil
}

func LoadCRDs(manifest []byte) (*Swagger, error) {
	crds, err := SplitYAML(manifest)
	if err != nil {
		return nil, err
	}

	definitions := []apiextensionsv1.CustomResourceDefinition{}
	//decoder := yaml.NewYAMLToJSONDecoder(bytes.NewBuffer(f))
	for _, crdfile := range crds {
		crd := apiextensionsv1.CustomResourceDefinition{}

		decoder := yaml.NewYAMLOrJSONDecoder(bytes.NewBuffer(crdfile), 4096)
		if err := decoder.Decode(&crd); err != nil {
			panic(err)
		}
		definitions = append(definitions, crd)
	}

	var defs Definitions
	for _, d := range definitions {
		toReverse := strings.Split(d.ObjectMeta.Name, ".")
		reversed := []string{}
		for i := range toReverse {
			n := toReverse[len(toReverse)-1-i]
			reversed = append(reversed, n)
		}

		for _, version := range d.Spec.Versions {
			schema := version.Schema.OpenAPIV3Schema

			nameArray := append(reversed, []string{version.Name, d.Spec.Names.Kind}...)
			name := strings.Join(nameArray, ".")

			defs[name] = &Schema{
				Type:  Type(schema.Type),
				Desc:  schema.Description,
				Props: propToSchema(schema.Properties),
				Items: itemsToSchema(schema.Items),
				XGvk: []XGvk{
					{
						Group:   d.Spec.Group,
						Kind:    d.Spec.Names.Kind,
						Version: version.Name,
					},
				},
			}
		}
	}
	return &Swagger{
		Definitions: defs,
	}, nil
}

func propToSchema(prop map[string]apiextensionsv1.JSONSchemaProps) Definitions {
	var s Definitions

	for key, value := range prop {
		s[key] = &Schema{
			Type:  Type(value.Type),
			Desc:  value.Description,
			Props: propToSchema(value.Properties),
			Items: itemsToSchema(value.Items),
		}
	}

	return s
}

func itemsToSchema(item *apiextensionsv1.JSONSchemaPropsOrArray) *Schema {
	schema := item.Schema
	return &Schema{
		Type:  Type(schema.Type),
		Desc:  schema.Description,
		Props: propToSchema(schema.Properties),
		Items: itemsToSchema(schema.Items),
	}
}
