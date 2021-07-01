IMAGE_NAME ?= k8s-gen
IMAGE_PREFIX ?= jsonnetlibs
IMAGE_TAG ?= 0.0.5

OUTPUT_DIR ?= ${PWD}/gen
ABS_OUTPUT_DIR := $(shell realpath $(OUTPUT_DIR))

IMPORTS=$(shell find libs -name config.jsonnet | xargs -I {} echo "(import '{}'),")

PAGES ?= false
GEN_COMMIT ?= false

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
		-e GEN_COMMIT="$(GEN_COMMIT)" \
		-e SSH_KEY="$${SSH_KEY}" \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) /config /output

build:
	docker build -t $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) .

push: build push-image

push-image:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):latest

.PHONY: clean configure debug run all libs/* build push push-image
