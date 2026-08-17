.DEFAULT_GOAL: default
default:

## Generate a library from its config.json.
## Optionally restrict to one or more versions by passing VERSIONS="<v1> <v2> ...".
libs/*:
	./k8s-gen --config $(shell realpath $@)/config.json $(VERSIONS)

.PHONY: default libs/*
