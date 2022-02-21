package swagger

import (
	"encoding/json"
	"io/ioutil"
	"net/http"
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

type Loader struct {
	Load func([]byte) (*Swagger, error)
}

func (l Loader) LoadHTTP(url string) (*Swagger, error) {
	r, err := http.Get(url)
	if err != nil {
		return nil, err
	}

	data, err := ioutil.ReadAll(r.Body)
	if err != nil {
		return nil, err
	}

	return l.Load(data)
}

func LoadSwagger(data []byte) (*Swagger, error) {
	var s Swagger
	if err := json.Unmarshal(data, &s); err != nil {
		return nil, err
	}
	s.resolveMap = map[string]*Schema{}

	for k, def := range s.Definitions {
		s.Definitions[k] = s.resolveRefs(def)
	}

	return &s, nil
}

type Swagger struct {
	resolveMap  map[string]*Schema // store objects in a map in order to support recursive references
	Definitions Definitions        `json:"definitions"`
}

func (s *Swagger) resolveRefs(d *Schema) *Schema {
	for key, prop := range d.Props {
		resolved := s.get(prop)
		resolved.Items = s.get(resolved.Items)

		d.Props[key] = resolved
	}

	return d
}

func (s *Swagger) get(prop *Schema) *Schema {
	if prop == nil || prop.DollarRef == nil {
		return prop
	}

	ref := prop.Ref()
	if skipRefs[ref] {
		return prop
	}

	if rs, ok := s.resolveMap[ref]; ok {
		return rs
	}
	rs := s.Definitions[ref]
	rs.ResolvedRef = ref
	s.resolveMap[ref] = rs
	rs = s.resolveRefs(rs)
	return rs
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
