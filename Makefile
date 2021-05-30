.PHONY: configure build debug run test push push-image

IMAGE_NAME ?= k8s-crds
IMAGE_PREFIX ?= jsonnet-libs
IMAGE_TAG ?= 0.0.1

OUTPUT_DIR ?= ${PWD}/gen
INPUT_DIR ?= ${PWD}/k8s-alpha
JSONNET_FILE ?= ${INPUT_DIR}/config.jsonnet
CONFIG_FILE ?= ${INPUT_DIR}/config.yml

configure:
	jsonnet -S $(JSONNET_FILE) > $(CONFIG_FILE)

build:
	docker build -t $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) .

debug: configure build
	docker run --rm -ti \
		--user $(shell id -u):$(shell id -g) \
		-v $(shell dirname $(shell realpath $(CONFIG_FILE))):/config \
		-v $(OUTPUT_DIR):/output \
		--entrypoint /bin/bash \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)

run: configure build
	docker run --rm -ti \
		--user $(shell id -u):$(shell id -g) \
		-v $(shell dirname $(shell realpath $(CONFIG_FILE))):/config \
		-v $(OUTPUT_DIR):/output \
		$(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG) /config/$(shell basename $(CONFIG_FILE))

test: build

push: build test push-image

push-image:
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):$(IMAGE_TAG)
	docker push $(IMAGE_PREFIX)/$(IMAGE_NAME):latest
