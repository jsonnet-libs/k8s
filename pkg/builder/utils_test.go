package builder

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"testing"
)

func assertRender(t *testing.T, o Type, s string) {
	got := Doc{Root: o}.String()
	s = strings.TrimPrefix(s, "\n")
	s = strings.TrimSuffix(s, "\n")

	diff(t, s, got)
}

func diff(t *testing.T, want, got string) {
	dir, err := ioutil.TempDir("", "diff")
	check(t, err)
	defer os.RemoveAll(dir)

	check(t, ioutil.WriteFile(filepath.Join(dir, "want"), []byte(want), os.ModePerm))
	check(t, ioutil.WriteFile(filepath.Join(dir, "got"), []byte(got), os.ModePerm))

	buf := bytes.Buffer{}
	want = filepath.Join(dir, "want")
	got = filepath.Join(dir, "got")
	cmd := exec.Command("bash", "-c", fmt.Sprintf("diff -u -N %s %s | cat -vet | colordiff", want, got))
	cmd.Stderr = os.Stderr
	cmd.Stdout = &buf
	err = cmd.Run()

	// the diff utility exits with `1` if there are differences. We need to not fail there.
	if exitError, ok := err.(*exec.ExitError); ok && err != nil {
		if exitError.ExitCode() != 1 {
			return
		}
	}

	out := buf.String()
	if out == "" {
		return
	}

	out = fmt.Sprintf("diff -u -N %s %s\n%s", want, got, out)
	fmt.Println(out)
	t.FailNow()

	return
}

func check(t *testing.T, err error) {
	if err != nil {
		fmt.Println(err)
		t.FailNow()
	}
}
