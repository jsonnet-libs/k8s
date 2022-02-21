package swagger

import (
	"bytes"
	_ "embed"
	"io"
	"strings"

	goyaml "gopkg.in/yaml.v3"
	apiextensionsv1 "k8s.io/apiextensions-apiserver/pkg/apis/apiextensions/v1"
	"k8s.io/apimachinery/pkg/util/yaml"
)

//go:embed objectmeta.json
var objectmeta []byte

type CRDLoader struct {
	objectMetaDefinitions *Schema
}

func (c *CRDLoader) Load(manifest []byte) (Definitions, error) {
	crds, err := c.splitYAML(manifest)
	if err != nil {
		return nil, err
	}

	if err := c.loadObjectMeta(); err != nil {
		return nil, err
	}

	definitions := []apiextensionsv1.CustomResourceDefinition{}
	for _, crdfile := range crds {
		crd := apiextensionsv1.CustomResourceDefinition{}

		decoder := yaml.NewYAMLOrJSONDecoder(bytes.NewBuffer(crdfile), 4096)
		if err := decoder.Decode(&crd); err != nil {
			panic(err)
		}
		definitions = append(definitions, crd)
	}

	defs := make(Definitions)
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
				Props: c.propToSchema(schema.Properties),
				Items: c.itemsToSchema(schema.Items),
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
	return defs, nil
}

func (c *CRDLoader) loadObjectMeta() error {
	loader := &SwaggerLoader{}
	definitions, err := loader.Load(objectmeta)
	if err != nil {
		return err
	}

	c.objectMetaDefinitions = definitions["io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta"]
	return nil
}

func (c *CRDLoader) propToSchema(prop map[string]apiextensionsv1.JSONSchemaProps) Definitions {
	s := make(Definitions, len(prop))

	for key, value := range prop {
		if key == "metadata" && value.Type == "object" {
			s[key] = c.objectMetaDefinitions
			continue
		}
		s[key] = &Schema{
			Type:  Type(value.Type),
			Desc:  value.Description,
			Props: c.propToSchema(value.Properties),
			Items: c.itemsToSchema(value.Items),
		}
	}

	return s
}

func (c *CRDLoader) itemsToSchema(item *apiextensionsv1.JSONSchemaPropsOrArray) *Schema {
	if item == nil {
		return nil
	}
	schema := item.Schema
	return &Schema{
		Type:  Type(schema.Type),
		Desc:  schema.Description,
		Props: c.propToSchema(schema.Properties),
		Items: c.itemsToSchema(schema.Items),
	}
}

func (c *CRDLoader) splitYAML(resources []byte) ([][]byte, error) {
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

