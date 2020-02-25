package builder

import (
	"testing"
)

func TestObjectPrimitive(t *testing.T) {
	want := `
{
  int: 1,
  string: "hello",
  bool: true
}
`

	o := Object("",
		Int("int", 1),
		String("string", "hello"),
		Bool("bool", true),
	)

	assertRender(t, o, want)
}

func TestObjectFuncs(t *testing.T) {
	want := `
{
  regular(s="string", b=false, i=3): {
    s: s,
    b: b,
    i: i
  },
  hidden(h=3): h
}
`

	o := Object("",
		Func("regular",
			Args(
				String("s", "string"),
				Bool("b", false),
				Int("i", 3),
			),
			Object("",
				Ref("s", "s"),
				Ref("b", "b"),
				Ref("i", "i"),
			),
		),
		Func("hidden",
			Args(Int("h", 3)),
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
			Int("int", 2),
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
		Bool("b", false),
	)
	assertRender(t, o, want)
}
