.PHONY: build-dev build test push

IMAGE_NAME ?= k8s-crds
IMAGE_PREFIX ?= jsonnet-libs
IMAGE_TAG ?= 0.0.1

OUTPUT_DIR ?= ${PWD}/gen
CONFIG_FILE ?= ${PWD}/config.yml

build:
	docker build -t $(IMAGE_PREFIX)/${IMAGE_NAME}:${IMAGE_TAG} .

shell: build
	docker run --rm -ti $(IMAGE_PREFIX)/${IMAGE_NAME}:${IMAGE_TAG} /bin/bash

run: build
	docker run --rm -ti \
		--user $(shell id -u):$(shell id -g) \
		-v $(shell dirname $(shell realpath $(CONFIG_FILE))):/config \
		-v $(OUTPUT_DIR):/output \
		$(IMAGE_PREFIX)/${IMAGE_NAME}:${IMAGE_TAG} /config/$(shell basename $(CONFIG_FILE))

test: build

push: build test push-image

push-image:
	docker push $(IMAGE_PREFIX)/${IMAGE_NAME}:$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/${IMAGE_NAME}:latest
