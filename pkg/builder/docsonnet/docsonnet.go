package docsonnet

import (
	j "github.com/jsonnet-libs/k8s/pkg/builder"
)

const dPkg = "doc-util/main.libsonnet"

const (
	String   = "string"
	Int      = "integer"
	Object   = "object"
	Function = "function"
	Any      = "any"
)

func Import() j.Type {
	return j.Local(j.Import("d", dPkg))
}

type Arguments map[string]string

func Args(s ...string) Arguments {
	if len(s)%2 != 0 {
		panic("Args expects even number of arguments (pairs)")
	}

	args := make(Arguments)
	for i := range s {
		if i%2 != 0 {
			continue
		}

		args[s[i]] = s[i+1]
	}

	return args
}

func Func(name, help string, args Arguments) j.Type {
	dsArgs := make([]j.Type, 0, len(args))
	for k, t := range args {
		dsArgs = append(dsArgs, j.Call("", "d.arg", j.Args(
			j.String("name", k),
			j.String("type", t),
		)))
	}

	return j.Call("#"+name, "d.fn", j.Args(
		j.String("help", help),
		j.List("args", dsArgs...),
	))
}

func Obj(name, help string) j.Type {
	return j.Call("#"+name, "d.obj", j.Args(
		j.String("help", help),
	))
}

func Pkg(name, url, help string) j.Type {
	return j.Call("#", "d.pkg", j.Args(
		j.String("name", name),
		j.String("url", url),
		j.String("help", help),
	))
}
