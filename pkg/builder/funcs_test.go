package builder

import "testing"

func TestLargeFunc(t *testing.T) {
	want := `
{
  large(
    string="string",
    bool=true,
    number=5,
    map={ foo: "bar" }
  ):: {
    m: map,
    b: bool,
    s: string,
    n: number
  }
}
`

	o := Object("",
		Hidden(LargeFunc("large",
			Args(
				String("string", "string"),
				Boolean("bool", true),
				Integer("number", 5),
				ConciseObject("map", String("foo", "bar")),
			),
			Object("",
				Ref("m", "map"),
				Ref("b", "bool"),
				Ref("s", "string"),
				Ref("n", "number"),
			),
		)),
	)

	assertRender(t, o, want)
}
