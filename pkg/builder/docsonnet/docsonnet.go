package docsonnet

import (
	j "github.com/Cicatrice/cfn-gen/pkg/builder"
)

const dPkg = "doc-util/main.libsonnet"

func Import() j.Type {
	return j.Local(j.Import("d", dPkg))
}

func Args(s ...string) []j.Type {
	if len(s)%2 != 0 {
		panic("Args expects even number of arguments (pairs)")
	}

	args := make([]j.Type, 0, len(s)/2)
	for i := range s {
		if i%2 != 0 {
			continue
		}

		args = append(args, j.Call("", "d.arg", []j.Type{
			j.String("name", s[i]),
			j.Ref("type", "d.T."+s[i+1]),
		}))
	}

	return args
}

func Func(name, help string, args []j.Type) j.Type {
	return j.Hidden(j.Call("#"+name, "d.fn", j.Args(
		j.String("help", help),
		j.List("args", args...),
	)))
}

func Obj(name, help string) j.Type {
	return j.Hidden(j.Call("#"+name, "d.obj", j.Args(
		j.String("help", help),
	)))
}

func Pkg(name, url, help string) j.Type {
	return j.Hidden(j.Call("#", "d.pkg", j.Args(
		j.String("name", name),
		j.String("url", url),
		j.String("help", help),
	)))
}
