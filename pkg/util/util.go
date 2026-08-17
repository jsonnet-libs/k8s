package util

func HasStr(arguments []string, arg string) bool {
	for _, argument := range arguments {
		if argument == arg {
			return true
		}
	}

	return false
}
