package swagger

import (
	"encoding/json"
	"regexp"
	"strings"
)

var recursiveRefs = map[string]bool{
	"io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.JSONSchemaProps":      true,
	"io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaProps": true,
}

func Load(data []byte) (*Swagger, error) {
	var s Swagger
	if err := json.Unmarshal(data, &s); err != nil {
		return nil, err
	}

	for k, def := range s.Definitions {
		s.Definitions[k] = resolveRefs(def, s.Definitions)
	}

	return &s, nil
}

func resolveRefs(d *Schema, defs Definitions) *Schema {
	for key, prop := range d.Props {
		resolved := get(prop, defs)
		resolved.Items = get(resolved.Items, defs)

		d.Props[key] = resolved
	}

	return d
}

func get(prop *Schema, defs Definitions) *Schema {
	if prop == nil || prop.DollarRef == nil {
		return prop
	}

	ref := prop.Ref()
	if recursiveRefs[ref] {
		return prop
	}

	rs := defs[ref]
	return resolveRefs(rs, defs)
}

type Swagger struct {
	Definitions Definitions `json:"definitions"`
}

type Definitions map[string]*Schema

func (ds Definitions) Filter(f func(k string, v Schema) bool) Definitions {
	out := make(Definitions)
	for k, v := range ds {
		if f(k, *v) {
			out[k] = v
		}
	}
	return out
}

func (ds Definitions) Sub(exp string) Definitions {
	rg := regexp.MustCompile(exp)
	return ds.Filter(func(k string, v Schema) bool {
		return rg.MatchString(k)
	})
}

// swagger types
const (
	TypeString = "string"
	TypeInt    = "integer"
	TypeBool   = "boolean"
	TypeObject = "object"
	TypeArray  = "array"
)

// Schema is a general object definition
type Schema struct {
	// general
	Type string `json:"type"`
	Desc string `json:"description"`

	// type: object
	Props map[string]*Schema `json:"properties"`
	// type: array
	Items *Schema `json:"items"`

	// incomplete: reference
	DollarRef *string `json:"$ref"`

	// vendor extensions
	XGvk interface{} `json:"x-kubernetes-group-version-kind"`
}

func (s Schema) Ref() string {
	if s.DollarRef == nil {
		return ""
	}
	return strings.TrimPrefix(*s.DollarRef, "#/definitions/")
}
