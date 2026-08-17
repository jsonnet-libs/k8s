package builder

// reservedIdentifiers are Jsonnet keywords that cannot be used as identifiers
// (e.g., function parameters). Object keys are escaped separately by escapeKey.
var reservedIdentifiers = map[string]struct{}{
	"assert":      {},
	"else":        {},
	"error":       {},
	"false":       {},
	"for":         {},
	"function":    {},
	"if":          {},
	"import":      {},
	"importstr":   {},
	"in":          {},
	"local":       {},
	"null":        {},
	"self":        {},
	"super":       {},
	"tailstrict":  {},
	"then":        {},
	"true":        {},
}

// SafeIdentifier returns a safe version of the given identifier. If it is a
// Jsonnet reserved keyword, it appends an underscore. Otherwise, the name is
// returned unchanged.
func SafeIdentifier(name string) string {
	if _, ok := reservedIdentifiers[name]; ok {
		return name + "_"
	}
	return name
}
