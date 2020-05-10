package model

import (
	"fmt"
	"strings"

	"github.com/fatih/camelcase"
	"github.com/jsonnet-libs/k8s/pkg/swagger"
)

// we don't need modifiers for these, they shall not be changed
func modifierBlacklist() map[string]bool {
	return map[string]bool{
		"apiVersion": true,
		"status":     true,
	}

}

// Modifier is a function that returns a patch to modify the value at `Target`
type Modifier struct {
	Help string `json:"help"`

	// Arg is the name of the functions argument
	Arg Parameter `json:"arg"`
	// Target is the jsonpath to the field that is modified
	Target string `json:"target"`

	// Type is the type of the modified value
	Type swagger.Type `json:"type"`
}

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
func modsForProps(props map[string]*swagger.Schema, ctx string) map[string]interface{} {
	mods := make(map[string]interface{})
	for k, p := range props {
		if modifierBlacklist()[k] {
			continue
		}
		name, mod := newModifier(k, p, ctx)
		mods[name] = mod
	}
	return mods
}

// newModifier returns a modifier for the given swagger Property.
// calls modsForProps in case of a nested object.
func newModifier(name string, p *swagger.Schema, ctx string) (string, interface{}) {
	name = CamelLower(name)

	switch p.Type {
	case swagger.TypeObject:
		// if it has children, return modifier group instead
		if len(p.Props) != 0 {
			o := Object{
				Help:   safeStr(p.Desc),
				Fields: modsForProps(p.Props, ctx+"."+name),
			}
			return name, o
		}

		// no children? create modifier
		fallthrough
	default:
		fn := Modifier{
			Help:   safeStr(p.Desc),
			Arg:    Parameter{Key: fnArg(name)},
			Target: strings.TrimPrefix(ctx+"."+name, "."),
			Type:   p.Type,
		}
		return fmt.Sprintf("with%s", strings.Title(name)), fn
	}
}

// fnArg normalizes an arguments name so it does not use any reserved words
func fnArg(name string) string {
	if name == "error" {
		return "err"
	}
	return name
}

// camelLower returns the string with the word lowercased.
func CamelLower(s string) string {
	elems := camelcase.Split(s)
	elems[0] = strings.ToLower(elems[0])
	return strings.Join(elems, "")
}
