IMAGE_NAME ?= k8s-gen
IMAGE_PREFIX ?= ghcr.io/jsonnet-libs
IMAGE_TAG ?= 0.0.8

OUTPUT_DIR ?= ${PWD}/gen
ABS_OUTPUT_DIR := $(shell realpath $(OUTPUT_DIR))

IMPORTS=$(shell find libs -name config.jsonnet | xargs -I {} echo "(import '{}'),")

PAGES ?= false
GEN_COMMIT ?= false
DIFF ?= true
GITHUB_SHA ?= $(shell git rev-parse HEAD)
GIT_AUTHOR_NAME ?= $(shell git --no-pager log --format=format:'%an' -n 1)
GIT_AUTHOR_EMAIL ?= $(shell git --no-pager log --format=format:'%ae' -n 1)
GIT_COMMITTER_NAME ?= $(shell git --no-pager log --format=format:'%an' -n 1)
GIT_COMMITTER_EMAIL ?= $(shell git --no-pager log --format=format:'%ae' -n 1)

OBJECTMETA_VERSION := v1.23.4

.DEFAULT_GOAL: default
default:

## Requires go-jsonnet for -c flag
.PHONY: .github/workflows/main.yml
.github/workflows/main.yml:
	jsonnet -c -m . -S -J . --tla-code "libs=[$(IMPORTS)]" jsonnet/github_action.jsonnet

## Requires go-jsonnet for -c flag
.PHONY: tf/main.tf.json
tf/main.tf.json:
	jsonnet -c -m . -S -J . --tla-code "pages=$(PAGES)" --tla-code "libs=[$(IMPORTS)]" jsonnet/terraform.jsonnet

clean:
	rm -f .github/workflows/main.yml:
	rm -f tf/main.tf.json

configure: clean .github/workflows/main.yml tf/main.tf.json

update_objectmeta:
	curl -sL "https://raw.githubusercontent.com/kubernetes/kubernetes/$(OBJECTMETA_VERSION)/api/openapi-spec/swagger.json" | jsonnet -o pkg/swagger/objectmeta.json jsonnet/objectmeta.jsonnet

debug: build
	mkdir -p $(ABS_OUTPUT_DIR) && \
	DEBUG=true ./bin/docker.sh \
		-v $(shell realpath $@):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		-e GEN_COMMIT="$(GEN_COMMIT)" \
		-e SSH_KEY="$${SSH_KEY}" \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)

all: build libs/*

libs/*:
	mkdir -p $(ABS_OUTPUT_DIR) && \
	./bin/docker.sh \
		-v $(shell realpath $@):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		-e DIFF="$(DIFF)" \
		-e GEN_COMMIT="$(GEN_COMMIT)" \
		-e GITHUB_SHA="$(GITHUB_SHA)" \
		-e GIT_AUTHOR_NAME="$(GIT_AUTHOR_NAME)" \
		-e GIT_AUTHOR_EMAIL="$(GIT_AUTHOR_EMAIL)" \
		-e GIT_COMMITTER_NAME="$(GIT_COMMITTER_NAME)" \
		-e GIT_COMMITTER_EMAIL="$(GIT_COMMITTER_EMAIL)" \
		-e SSH_KEY="$${SSH_KEY}" \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) /config /output

build:
	docker build -t $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) .

save:
	mkdir -p artifacts
	docker save $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) > artifacts/docker-image.tar

load:
	docker load < artifacts/docker-image.tar

push: build push-image

push-image:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):latest

.PHONY: clean configure update_objectmeta debug run all libs/* build push push-image
