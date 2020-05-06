package swagger

import (
	"encoding/json"
	"regexp"
	"strings"
)

var skipRefs = map[string]bool{
	// recursive
	"io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1.JSONSchemaProps":      true,
	"io.k8s.apiextensions-apiserver.pkg.apis.apiextensions.v1beta1.JSONSchemaProps": true,

	// list will be filtered anyways
	"io.k8s.apimachinery.pkg.apis.meta.v1.ListMeta": true,
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
	if skipRefs[ref] {
		return prop
	}

	rs := defs[ref]
	rs.ResolvedRef = ref
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
type Type string

const (
	TypeString Type = "string"
	TypeInt    Type = "integer"
	TypeBool   Type = "boolean"
	TypeObject Type = "object"
	TypeArray  Type = "array"
)

// Schema is a general object definition
type Schema struct {
	// general
	Type Type   `json:"type"`
	Desc string `json:"description"`

	// type: object
	Props map[string]*Schema `json:"properties"`
	// type: array
	Items *Schema `json:"items"`

	// incomplete: reference
	DollarRef   *string `json:"$ref"`
	ResolvedRef string

	// vendor extensions
	XGvk []XGvk `json:"x-kubernetes-group-version-kind"`
}

type XGvk struct {
	Group   string
	Kind    string
	Version string
}

func (s Schema) Ref() string {
	if s.DollarRef == nil {
		return s.ResolvedRef
	}
	return strings.TrimPrefix(*s.DollarRef, "#/definitions/")
}

func (s Schema) GroupVersionKind() (*XGvk, bool) {
	if len(s.XGvk) == 0 {
		return nil, false
	}

	x := s.XGvk[0]
	return &x, true
}
