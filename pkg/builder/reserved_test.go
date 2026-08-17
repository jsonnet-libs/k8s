package builder

import (
	"testing"
)

func TestSafeIdentifier(t *testing.T) {
	cases := []struct {
		name string
		want string
	}{
		{"function", "function_"},
		{"local", "local_"},
		{"if", "if_"},
		{"foo", "foo"},
		{"bar", "bar"},
	}

	for _, c := range cases {
		got := SafeIdentifier(c.name)
		if got != c.want {
			t.Errorf("SafeIdentifier(%q) = %q, want %q", c.name, got, c.want)
		}
	}
}

func TestSafeString(t *testing.T) {
	want := `
{
  withFunction(function_): {
    'function': function_
  }
}
`

	o := Object("",
		Func("withFunction",
			Args(
				Required(SafeString("function", "")),
			),
			Object("",
				Ref("function", "function_"),
			),
		),
	)

	assertRender(t, o, want)
}
