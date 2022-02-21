package swagger

import (
	"strings"
)

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

	// sometimes multiple XGVKs exist for the same schema. In this case we want to
	// select the most specific one.
	var x *XGvk
	for _, g := range s.XGvk {
		if x == nil || (x.Group == "" && g.Group != "") {
			x = &g
		}
		if x.Version == "" && g.Version != "" {
			x = &g
		}
		if x.Kind == "" && g.Kind != "" {
			x = &g
		}
	}
	// safeguard against malformed schemas with completely empty XGVKs
	if x == nil {
		return nil, false
	}
	return x, true
}
