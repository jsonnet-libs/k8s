package model

import (
	"fmt"
	"strings"

	"github.com/Cicatrice/cfn-gen/pkg/cloudformation"
	"github.com/fatih/camelcase"
)

type excludeType string

const (
	notExcluded       = ""
	excludeEverywhere = "everywhere"
	excludeInRootOnly = "root"
)

var propertiesWithoutModifiers = map[string]excludeType{
	"apiVersion": excludeInRootOnly,
	"status":     excludeEverywhere,
}

// Modifier is a function that returns a patch to modify the value at `Target`
type Modifier struct {
	Help string `json:"help"`

	// Arg is the name of the functions argument
	Arg Parameter `json:"arg"`
	// Target is the jsonpath to the field that is modified
	Target string `json:"target"`

	// Type is the type of the modified value
	Type cloudformation.Type `json:"type"`
}

// Constructor creates new objects
type Constructor struct {
	Help string `json:"help"`
	// Args are the arguments this constructor takes.
	// Generated constructors only have one argument, `name`
	Args []Parameter `json:"args"`
}

// Parameter is a function argument, with an optional default value
type Parameter struct {
	Key     string      `json:"key"`
	Default interface{} `json:"default"`
}

func (p Parameter) String() string {
	if p.Default == nil {
		return p.Key
	}
	return fmt.Sprintf("%s=%v", p.Key, p.Default)
}

// Object is the logical group for Modifiers that target fields of a nested
// object
type Object struct {
	Help   string    `json:"help"`
	Fields modifiers `json:"fields"`
}

// modsForProps generates Modifiers for a (nested) map of swagger properties
// (object fields)
func modsForProps(props map[string]*cloudformation.Schema, ctx string, root bool) map[string]interface{} {
	mods := make(map[string]interface{})
	for k, _ := range props {
		if excluded := propertiesWithoutModifiers[k]; excluded == excludeEverywhere || (root && excluded == excludeInRootOnly) {
			continue
		}
		//		name, mod := newModifier(k, p, ctx)
		//	mods[name] = mod
	}
	return mods
}

// newModifier returns a modifier for the given swagger Property.
// calls modsForProps in case of a nested object.
func newModifier(name string, p *cloudformation.Prop, ctx string) (string, interface{}) {
	name = CamelLower(name)
	return "", ""
}

// fnArg normalizes an arguments name so it does not use any reserved words
func fnArg(name string) string {
	if name == "error" {
		return "err"
	}
	if name == "local" {
		return "Local"
	}
	if name == "function" {
		return "Function"
	}
	if strings.HasPrefix(name, "-") {
		return strings.TrimPrefix(name, "-")
	}
	return name
}

// normalizedTitle normalizes a name and applied strings.Title()
func normalizedTitle(name string) string {
	if strings.HasPrefix(name, "-") {
		name = strings.TrimPrefix(name, "-")
	}

	return strings.Title(name)
}

// CamelLower returns the string with the word lowercased.
func CamelLower(s string) string {
	elems := camelcase.Split(s)
	elems[0] = strings.ToLower(elems[0])
	return strings.Join(elems, "")
}
