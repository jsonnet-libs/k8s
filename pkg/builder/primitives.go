package builder

import (
	"fmt"
	"strconv"
	"strings"
)

// strings
type StringType struct {
	named
	value string
}

func String(name, value string) StringType {
	return StringType{named: named(name), value: value}
}

func (s StringType) String() string {
	qs := `'`
	if strings.Contains(s.value, "'") {
		qs = `"`
	}

	s.value = strings.Replace(s.value, "\n", `\n`, -1)

	return qs + s.value + qs
}

// ints
type IntType struct {
	named
	value int
}

func Int(name string, value int) IntType {
	return IntType{named: named(name), value: value}
}

func (s IntType) String() string {
	return strconv.Itoa(s.value)
}

// bools
type BoolType struct {
	named
	value bool
}

func Bool(name string, value bool) BoolType {
	return BoolType{named: named(name), value: value}
}

func (s BoolType) String() string {
	return fmt.Sprintf(`%v`, s.value)
}
