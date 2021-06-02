.PHONY: configure build debug run test push push-image

IMAGE_NAME ?= k8s-crds
IMAGE_PREFIX ?= jsonnet-libs
IMAGE_TAG ?= 0.0.1

INPUT_DIR ?= ${PWD}/libs/k8s-alpha
OUTPUT_DIR ?= ${PWD}/gen

ABS_INPUT_DIR := $(shell realpath $(INPUT_DIR))
JSONNET_FILE := $(ABS_INPUT_DIR)/config.jsonnet
ABS_OUTPUT_DIR := $(shell realpath $(OUTPUT_DIR))

# Requires Go implementation of Jsonnet
# Implementation of `-c` argument pending: https://github.com/google/jsonnet/issues/195
configure:
	jsonnet -c -m $(ABS_INPUT_DIR) -S $(JSONNET_FILE)

build:
	docker build -t $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) .

debug: configure build
	docker run --rm -ti \
		--user $(shell id -u):$(shell id -g) \
		-v $(ABS_INPUT_DIR):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		--entrypoint /bin/bash \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)

run: configure build
	docker run --rm -ti \
		--user $(shell id -u):$(shell id -g) \
		-v $(ABS_INPUT_DIR):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) /config /output

test: build

push: build test push-image

push-image:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):latest
