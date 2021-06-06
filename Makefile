.PHONY: configure debug run build test push push-image

IMAGE_NAME ?= k8s-gen
IMAGE_PREFIX ?= jsonnetlibs
IMAGE_TAG ?= 0.0.1

INPUT_DIR ?= ${PWD}/libs/k8s-alpha
OUTPUT_DIR ?= ${PWD}/gen

ABS_INPUT_DIR := $(shell realpath $(INPUT_DIR))
ABS_OUTPUT_DIR := $(shell realpath $(OUTPUT_DIR))

LIBS=$(shell echo libs/* | sed "s/ /,/g")

## Requires go-jsonnet for -c flag
configure:
	jsonnet -c -m . -A "libs=$(LIBS)" -S jsonnet/github_action.jsonnet

debug: build
	mkdir -p $(ABS_OUTPUT_DIR) && \
	DEBUG=true bash bin/docker.sh \
		-v $(ABS_INPUT_DIR):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)

run: build
	mkdir -p $(ABS_OUTPUT_DIR) && \
	bash bin/docker.sh \
		-v $(ABS_INPUT_DIR):/config \
		-v $(ABS_OUTPUT_DIR):/output \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) /config /output

all:
	bash bin/all.sh $(ABS_OUTPUT_DIR)


build:
	docker build -t $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) .

test: build

push: build test push-image

push-image:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):latest
