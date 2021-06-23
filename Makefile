IMAGE_NAME ?= k8s-gen
IMAGE_PREFIX ?= jsonnetlibs
IMAGE_TAG ?= 0.0.2

OUTPUT_DIR ?= ${PWD}/gen
ABS_OUTPUT_DIR := $(shell realpath $(OUTPUT_DIR))

IMPORTS=$(shell find libs -name config.jsonnet | xargs -I {} echo "(import '{}'),")

.DEFAULT_GOAL: default
default:

## Requires go-jsonnet for -c flag
.PHONY: .github/workflows/main.yml
.github/workflows/main.yml:
	jsonnet -c -m . -S -J . --tla-code "libs=[$(IMPORTS)]" jsonnet/github_action.jsonnet

clean:
	rm -f .github/workflows/main.yml:

configure: clean .github/workflows/main.yml

debug: build
	make $@ DEBUG=true

all: build libs/*

libs/*:
	mkdir -p $(ABS_OUTPUT_DIR) && \
	bash bin/docker.sh \
		-v $(shell realpath $@):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		-e DRY_RUN=${DRY_RUN} \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) /config /output

build:
	docker build -t $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) .

push: build push-image

push-image:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):latest

.PHONY: clean configure debug run all libs/* build push push-image
