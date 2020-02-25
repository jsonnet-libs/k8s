package builder

import (
	"fmt"
	"strconv"
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
	return fmt.Sprintf(`"%s"`, s.value)
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
