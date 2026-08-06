package util

import "github.com/urfave/cli/v3"

func HasStr(arguments []cli.Argument, arg string) bool {
	for _, argument := range arguments {
		if argument.Get().(string) == arg {
			return true
		}
	}

	return false
}
