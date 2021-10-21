package render

import (
	"testing"

	j "github.com/Cicatrice/cfn-gen/pkg/builder"
	"github.com/stretchr/testify/assert"
)

func TestSortFields(t *testing.T) {
	sorted := []j.Type{
		j.Local(j.String("abc", "")),
		j.Local(j.String("def", "")),

		j.String("#", ""),

		j.String("#aaa", ""),
		j.String("aaa", ""),

		j.String("bbb", ""),

		j.String("#ccc", ""),
		j.String("ccc", ""),

		j.String("ddd", ""),
	}

	unsorted := []j.Type{
		j.Local(j.String("def", "")),
		j.String("aaa", ""),
		j.String("bbb", ""),
		j.String("#aaa", ""),
		j.Local(j.String("abc", "")),
		j.String("#ccc", ""),
		j.String("ddd", ""),
		j.String("ccc", ""),
		j.String("#", ""),
	}

	SortFields(unsorted)

	assert.Equal(t, sorted, unsorted)
}

func TestLocal(t *testing.T) {
	cases := []struct {
		name string
		a, b j.Type
		is   bool
	}{
		{
			name: "a",
			a:    j.Local(j.String("a", "")),
			b:    j.String("b", ""),
			is:   true,
		},
		{
			name: "b",
			a:    j.String("b", ""),
			b:    j.Local(j.String("a", "")),
			is:   false,
		},
		{
			name: "both",
			a:    j.Local(j.String("a", "")),
			b:    j.Local(j.String("b", "")),
			is:   false,
		},
		{
			name: "none",
			a:    j.String("a", ""),
			b:    j.String("b", ""),
			is:   false,
		},
	}

	for _, c := range cases {
		t.Run(c.name, func(t *testing.T) {
			b := local(c.a, c.b)
			assert.Equal(t, c.is, b)
		})
	}
}
