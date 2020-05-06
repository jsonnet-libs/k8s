package model

import (
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestCamelLower(t *testing.T) {
	cases := []struct {
		before, after string
	}{
		{"Foo", "foo"},
		{"FooBar", "fooBar"},
		{"123FooBar", "123FooBar"},
		{"", ""},
		{"withNonResourceURLs", "withNonResourceUrls"},
		{"NotIs", "notIs"},
		{"URLs", "urls"},
	}

	for _, c := range cases {
		got := CamelLower(c.before)
		assert.Equal(t, c.after, got)
	}
}

func TestAllUpper(t *testing.T) {
	cases := map[string]bool{
		"ABC": true,
		"":    false,
		"abc": false,
		"AbC": false,
	}

	for k, v := range cases {
		assert.Equalf(t, v, allUpper(k), "'%s' %v", k, v)
	}
}
