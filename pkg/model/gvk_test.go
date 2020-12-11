package model

import (
	"encoding/json"
	"fmt"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func TestVersionRemarshal(t *testing.T) {
	version := Version{
		APIVersion: "apps/v1",
		Kinds: map[string]Kind{
			"deployment": {
				Help: "Deployments deploy things",
			},
			"daemonSet": {
				Help: "DaemonSets are the worst demons",
			},
			"statefulSet": {
				Help: "StatefulSets are sets of EmpireStateBuildings",
			},
		},
	}

	data, err := json.Marshal(version)
	require.NoError(t, err)

	fmt.Println(string(data))

	var got Version
	json.Unmarshal(data, &got)

	assert.Equal(t, version, got)
}
