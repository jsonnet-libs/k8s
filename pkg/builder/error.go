package builder

import "fmt"

type ErrorType struct {
	named
	msg string
}

func (e ErrorType) String() string {
	op := "error"

	return fmt.Sprintf(`(%s '%s')`, op, e.msg)
}

func Error(name, msg string) ErrorType {
	return ErrorType{named: named(name), msg: msg}
}
