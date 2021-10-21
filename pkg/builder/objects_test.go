package builder

import (
	"testing"
)

func TestObjectPrimitive(t *testing.T) {
	want := `
{
  int: 1,
  string: "hello",
  bool: true,
  float: 23.5
}
`

	o := Object("",
		Integer("int", 1),
		String("string", "hello"),
		Boolean("bool", true),
		Double("float", 23.5),
	)

	assertRender(t, o, want)
}

func TestObjectFuncs(t *testing.T) {
	want := `
{
  regular(s="string", b=false, i=3, f=23.5): {
    s: s,
    b: b,
    i: i,
    f: f
  },
  hidden(h=3): h
}
`

	o := Object("",
		Func("regular",
			Args(
				String("s", "string"),
				Boolean("b", false),
				Integer("i", 3),
				Double("f", 23.5),
			),
			Object("",
				Ref("s", "s"),
				Ref("b", "b"),
				Ref("i", "i"),
				Ref("f", "f"),
			),
		),
		Func("hidden",
			Args(Integer("h", 3)),
			Ref("h", "h"),
		),
	)

	assertRender(t, o, want)
}

func TestObjectMerge(t *testing.T) {
	want := `
{
  regular+: {
    int: 2
  },
  hidden+:: {
    incognito: "yes!"
  }
}
`

	o := Object("",
		Merge(Object("regular",
			Integer("int", 2),
		)),
		Hidden(Merge(Object("hidden",
			String("incognito", "yes!"),
		))),
	)

	assertRender(t, o, want)
}

func TestObjectLocal(t *testing.T) {
	want := `
{
  local msg = "hello",
  greet: msg,
  local sth = "else"
}
`

	o := Object("",
		Local(String("msg", "hello")),
		Ref("greet", "msg"),
		Local(String("sth", "else")),
	)

	assertRender(t, o, want)
}

func TestObjectConcise(t *testing.T) {
	want := `{ s: "string", b: false }`
	o := ConciseObject("",
		String("s", "string"),
		Boolean("b", false),
	)
	assertRender(t, o, want)
}
