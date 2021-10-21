package builder

import (
	"encoding/json"
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
	data, err := json.Marshal(s.value)
	if err != nil {
		panic(err)
	}
	return string(data)
}

// floats
type DoubleType struct {
	named
	value float64
}

func Double(name string, value float64) DoubleType {
	return DoubleType{named: named(name), value: value}
}

func (f DoubleType) String() string {
	return fmt.Sprintf("%d", f.value)
}

// ints
type IntegerType struct {
	named
	value int
}

func Integer(name string, value int) IntegerType {
	return IntegerType{named: named(name), value: value}
}

func (s IntegerType) String() string {
	return strconv.Itoa(s.value)
}

// bools
type BooleanType struct {
	named
	value bool
}

func Boolean(name string, value bool) BooleanType {
	return BooleanType{named: named(name), value: value}
}

func (s BooleanType) String() string {
	return fmt.Sprintf(`%v`, s.value)
}

// timestamp
// type TimestampType struct {
// 	named
// 	value time
// }

// func Timestamp(name string, value time) TimestampType {
// 	return TimestampType{named: named(name), value: value}
// }

// func (s TimestampType) String() string {
// 	return fmt.Sprintf(`%s`, s.value)
// }
