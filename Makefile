.PHONY: configure debug run build test push push-image

IMAGE_NAME ?= k8s-gen
IMAGE_PREFIX ?= jsonnet-libs
IMAGE_TAG ?= 0.0.1

INPUT_DIR ?= ${PWD}/libs/k8s-alpha
OUTPUT_DIR ?= ${PWD}/gen

ABS_INPUT_DIR := $(shell realpath $(INPUT_DIR))
ABS_OUTPUT_DIR := $(shell realpath $(OUTPUT_DIR))

## Requires go-jsonnet for -c flag
configure:
	 jsonnet -c -m . -S jsonnet/github_action.jsonnet

debug: build
	DEBUG=true bash bin/docker.sh \
		-v $(ABS_INPUT_DIR):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)

run: build
	bash bin/docker.sh \
		-v $(ABS_INPUT_DIR):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) /config /output


build:
	docker build -t $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) .

test: build

push: build test push-image

push-image:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):latest
