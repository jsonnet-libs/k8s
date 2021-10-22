package cloudformation

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"path/filepath"
	"regexp"
)

var exprResourceTypes = regexp.MustCompile(`^(?P<realm>[A-Za-z0-9]+)::(?P<service>[A-Za-z0-9]+)::(?P<resource>[A-Za-z0-9]+)$`)
var exprPorpertyTypes = regexp.MustCompile(`^(?P<realm>[A-Za-z0-9]+)::(?P<service>[A-Za-z0-9]+)::(?P<resource>[A-Za-z0-9]+)\.(?P<proptype>[A-Za-z0-9]+)$`)
var exprService = regexp.MustCompile(`^(?P<realm>[A-Za-z0-9]+)::(?P<service>[A-Za-z0-9]+)$`)
var exprRealm = regexp.MustCompile(`^(?P<realm>[A-Za-z0-9]+)$`)

var skipRefs = map[string]bool{}

var url string
var spec CloudFormationSpec
var cloudformationInstance *CloudFormation

func escapePropertyTypes() []string {
	return []string{"Tag"}
}

func LoadHTTP(u string) (*CloudFormationSpec, error) {
	r, err := http.Get(u)
	if err != nil {
		fmt.Println("Error in http.Get")
		return nil, err
	}

	data, err := ioutil.ReadAll(r.Body)
	if err != nil {
		fmt.Println("Error in ioutil.ReadAll")
		return nil, err
	}
	d, err := Load(data)

	spec = *d
	url = u

	return d, err
}

func Load(data []byte) (*CloudFormationSpec, error) {
	var sp CloudFormationSpec
	var c CloudFormation

	if err := json.Unmarshal(data, &sp); err != nil {
		fmt.Println("Error in json.Unmarshal")
		return nil, err
	}

	// List all Realms
	realms := []string{}
	ris := make(map[string]*Realm)

	for resourceName := range sp.ResourceTypes {
		realmName := Name("realm", resourceName)

		// ensure realm is not already in the list
		if contains(realms, realmName) {
			continue
		}
		realms = append(realms, realmName)

		var ri Realm
		sis := make(map[string]*Service)

		// List services for the current realm
		services := []string{}

		for resourceName := range sp.ResourceTypes {
			serviceName := FullName("service", resourceName, ".")
			serviceRealm := FullName("realm", resourceName, ".")

			// ensure service is not already in the list
			if realmName != serviceRealm || contains(services, serviceName) {
				continue
			}

			resources := []string{}

			var si Service
			ris := make(map[string]*ResourceType)

			// List resources for the current service
			for resourceName, resource := range sp.ResourceTypes {
				name := Name("resource", resourceName)
				resourceService := FullName("service", resourceName, ".")

				// ensure resource is not already in the list
				if serviceName != resourceService || contains(resources, resourceName) {
					continue
				}

				propertytypes := []string{}

				var r ResourceType
				ps := make(map[string]*PropertyType)

				// List resources for the current service
				for propertytypeName, propertytype := range sp.PropertyTypes {
					if contains(escapePropertyTypes(), propertytypeName) {
						continue
					}
					name := PName("proptype", propertytypeName)
					propertytypeResource := PFullName("resource", propertytypeName, ".", ".")

					// ensure resource is not already in the list
					if resourceName != propertytypeResource || contains(propertytypes, propertytypeName) {
						continue
					}

					p := PropertyType{
						CloudFormation: c,
						Realm:          ri,
						Service:        si,
						ResourceType:   r,
						Name:           name,
						OriginName:     propertytypeName,
						Prop:           *propertytype,
					}

					ps[PFullName("property", propertytypeName, ".", ".")] = &p

					propertytypes = append(propertytypes, name)
				}

				r = ResourceType{
					CloudFormation: c,
					Realm:          ri,
					Service:        si,
					Name:           name,
					FullName:       FullName("resource", resourceName, "."),
					PackageName:    Name("resource", resourceName),
					OriginName:     resourceName,
					Resource:       *resource,
					PropertyTypes:  ps,
				}

				ris[FullName("resource", resourceName, ".")] = &r

				resources = append(resources, resourceName)
			}

			si = Service{
				CloudFormation: c,
				Realm:          ri,
				Name:           Name("service", resourceName),
				FullName:       FullName("service", resourceName, "."),
				PackageName:    Name("service", resourceName),
				OriginName:     FullName("service", resourceName, "::"),
				ResourceTypes:  ris,
				//	PropertyTypes  map[string]*PropertyType
				//	Modifiers      modifiers `json:"modifiers,omitempty"`
			}

			sis[FullName("service", resourceName, ".")] = &si

			services = append(services, serviceName)

		}

		ri = Realm{
			CloudFormation: c,
			Name:           realmName,
			FullName:       realmName,
			OriginName:     realmName,
			PackageName:    realmName,

			Services: sis,
		}
		ris[realmName] = &ri

	}

	c = CloudFormation{
		Realms: ris,
	}
	cloudformationInstance = &c

	return &sp, nil
}

func Get() *CloudFormation {
	return cloudformationInstance
}

func ListRealms() map[string]*Realm {
	rs := make(map[string]*Realm)
	for _, r := range Get().Realms {
		rs[r.OriginName] = r
	}
	return rs
}

func ListServices() map[string]*Service {
	ss := make(map[string]*Service)
	for _, r := range Get().Realms {
		for _, s := range r.Services {
			ss[s.OriginName] = s
		}
	}
	return ss
}

func ListResourceTypes() map[string]*ResourceType {
	rs := make(map[string]*ResourceType)
	for _, r := range Get().Realms {
		for _, s := range r.Services {
			for _, t := range s.ResourceTypes {
				rs[t.OriginName] = t
			}
		}
	}
	return rs
}

func reSubMatchMap(r *regexp.Regexp, str string) map[string]string {
	match := r.FindStringSubmatch(str)
	subMatchMap := make(map[string]string)
	for i, name := range r.SubexpNames() {
		if i != 0 {
			subMatchMap[name] = match[i]
		}
	}

	return subMatchMap
}

func FullName(part string, resourceName string, sep string) string {
	m := reSubMatchMap(exprResourceTypes, resourceName)
	switch part {
	case "realm":
		return fmt.Sprintf("%s", m["realm"])
	case "service":
		return fmt.Sprintf("%s%s%s", m["realm"], sep, m["service"])
	case "resource":
		return fmt.Sprintf("%s%s%s%s%s", m["realm"], sep, m["service"], sep, m["resource"])
	}
	return ""
}

func PFullName(part string, propertytypeName string, sep string, ssep string) string {
	m := reSubMatchMap(exprPorpertyTypes, propertytypeName)
	switch part {
	case "realm":
		return fmt.Sprintf("%s", m["realm"])
	case "service":
		return fmt.Sprintf("%s%s%s", m["realm"], sep, m["service"])
	case "resource":
		return fmt.Sprintf("%s%s%s%s%s", m["realm"], sep, m["service"], sep, m["resource"])
	case "proptype":
		return fmt.Sprintf("%s%s%s%s%s%s%s", m["realm"], sep, m["service"], sep, m["resource"], ssep, m["proptype"])
	}
	return ""
}

func (r Realm) FilePath() string {
	return filepath.Join(r.N("realm"))
}

func (r Service) FilePath() string {
	return filepath.Join(r.N("realm"), r.N("service"))
}

func (r ResourceType) FilePath() string {
	return filepath.Join(r.N("realm"), r.N("service"), r.N("resource"))
}

func (s Service) N(part string) string {
	m := reSubMatchMap(exprService, s.OriginName)
	return fmt.Sprintf("%s", m[part])
}

func (s ResourceType) N(part string) string {
	m := reSubMatchMap(exprResourceTypes, s.OriginName)
	return fmt.Sprintf("%s", m[part])
}

func (s Realm) N(part string) string {
	m := reSubMatchMap(exprRealm, s.OriginName)
	return fmt.Sprintf("%s", m[part])
}

func (p Prop) Documentation() string {
	return regexp.MustCompile(`^http(s)?://`).ReplaceAllString(p.UnsecureDocumentation, "https://")
}

func (p Schema) Documentation() string {
	return regexp.MustCompile(`^http(s)?://`).ReplaceAllString(p.UnsecureDocumentation, "https://")
}

func PName(part string, propertytypeName string) string {
	m := reSubMatchMap(exprPorpertyTypes, propertytypeName)
	return fmt.Sprintf("%s", m[part])
}

func Name(part string, resourceName string) string {
	m := reSubMatchMap(exprResourceTypes, resourceName)
	return fmt.Sprintf("%s", m[part])
}

type CloudFormationSpec struct {
	ResourceTypes ResourceTypes `json:"ResourceTypes"`
	PropertyTypes PropertyTypes `json:"PropertyTypes"`
}

type CloudFormation struct {
	Realms map[string]*Realm
}

type Realm struct {
	CloudFormation CloudFormation
	Name           string `json:"name"`
	OriginName     string
	FullName       string
	PackageName    string
	Services       map[string]*Service
}

type Service struct {
	CloudFormation CloudFormation
	Realm          Realm
	Name           string `json:"name"`
	FullName       string
	PackageName    string `json:"package"`
	OriginName     string
	ResourceTypes  map[string]*ResourceType
	Modifiers      modifiers `json:"modifiers,omitempty"`
}

type ResourceType struct {
	CloudFormation CloudFormation
	Service        Service
	PropertyTypes  map[string]*PropertyType
	Realm          Realm
	Name           string `json:"name"`
	FullName       string
	PackageName    string
	OriginName     string
	FileName       string
	Resource       Schema
	Modifiers      modifiers `json:"modifiers,omitempty"`
}

type PropertyType struct {
	CloudFormation CloudFormation
	Realm          Realm
	Service        Service
	ResourceType   ResourceType
	Name           string
	PropertyName   string `json:"name"`
	OriginName     string
	FileName       string
	Prop           Schema
	Modifiers      modifiers `json:"modifiers,omitempty"`
}

type modifiers map[string]interface{}

type ResourceTypes map[string]*Schema
type PropertyTypes map[string]*Schema

// Schema is a general object definition
type Schema struct {
	// general
	UnsecureDocumentation string `json:"Documentation"`

	// type: object
	Props map[string]*Prop `json:"Properties"`
	Atts  map[string]*Att  `json:"Attributes"`
}

//  zcat ../goformation/CloudFormationResourceSpecification.json |  jq -r '.PropertyTypes|values[].Properties|values[]|keys[]' | sort -u
type Prop struct {
	UnsecureDocumentation string            `json:"Documentation"`
	DuplicatesAllowed     bool              `json:"DuplicatesAllowed"`
	ItemType              ItemType          `json:"ItemType"`
	PrimitiveType         PrimitiveType     `json:"PrimitiveType"`
	PrimitiveItemType     PrimitiveItemType `json:"PrimitiveItemType"`
	Required              bool              `json:"Required"`
	Type                  Type              `json:"Type"`
	UpdateType            UpdateType        `json:"UpdateType"`
}

// https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-resource-specification-format.html#cfn-resource-specification-format-propertytypes
func (p Prop) Value() string {
	if p.PrimitiveType != "" {
		switch p.PrimitiveType {
		case PrimitiveTypeBoolean:
			return "bool"
		case PrimitiveTypeDouble:
			//return "double"
			return "float"
		case PrimitiveTypeLong:
			return "long"
		case PrimitiveTypeInteger:
			return "integer"
		case PrimitiveTypeJson:
			return "object"
		case PrimitiveTypeString:
			return "string"
		case PrimitiveTypeTimestamp:
			// TODO Need to find a way to explain this is not implemented so far
		}
	} else {
		switch p.Type {
		case "List":
			return "array"
		case "Map":
			return "object"
		default:
			return "object"
		}
	}
	return ""
}

type Att struct {
	PrimitiveType PrimitiveType `json:"PrimitiveType"`
}

type Type string
type ItemType string
type PrimitiveType string
type PrimitiveItemType string
type UpdateType string

const (
	PrimitiveItemTypeString  PrimitiveItemType = "String"
	PrimitiveItemTypeDouble  PrimitiveItemType = "Double"
	PrimitiveItemTypeInteger PrimitiveItemType = "Integer"
	PrimitiveItemTypeBoolean PrimitiveItemType = "Boolean"
	PrimitiveItemTypeNull    PrimitiveItemType = "null"
)

const (
	UpdateTypeConditional UpdateType = "Conditional"
	UpdateTypeImmutable   UpdateType = "Immutable"
	UpdateTypeMutable     UpdateType = "Mutable"
)

const (
	PrimitiveTypeString    PrimitiveType = "String"
	PrimitiveTypeDouble    PrimitiveType = "Double"
	PrimitiveTypeInteger   PrimitiveType = "Integer"
	PrimitiveTypeLong      PrimitiveType = "Long"
	PrimitiveTypeBoolean   PrimitiveType = "Boolean"
	PrimitiveTypeJson      PrimitiveType = "Json"
	PrimitiveTypeNull      PrimitiveType = "null"
	PrimitiveTypeTimestamp PrimitiveType = "Timestamp"
)
