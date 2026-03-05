ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
IMAGE_REGISTRY := mcr.microsoft.com/application-lb
CHART := oci://$(IMAGE_REGISTRY)/charts/alb-controller
CRD_IMAGE := $(IMAGE_REGISTRY)/images/alb-controller-crds

all: update-version crds update-config

.PHONY: update-version
update-version:
	@NEW_VERSION=$$(helm show chart $(CHART) | grep '^version:' | awk '{print $$2}'); \
	if [ ! -f version ] || [ "$$(cat version)" != "$$NEW_VERSION" ]; then \
		echo "$$NEW_VERSION" > $(ROOT_DIR)/version; \
		echo "Updated version to $$NEW_VERSION"; \
	else \
		echo "Version unchanged: $$NEW_VERSION"; \
	fi

.PHONY: crds
crds: version
	@VERSION=$$(cat $(ROOT_DIR)/version); \
	MINOR=$$(cat $(ROOT_DIR)/version | cut -d. -f1-2); \
	mkdir -p $(ROOT_DIR)/crds/$$MINOR; \
	docker run --rm \
		--entrypoint sh \
		-v $(ROOT_DIR)/crds/$$MINOR:/out \
		$(CRD_IMAGE):$$VERSION \
		-c "cat /alb-controller-crds/agc-crds/*.yaml /alb-controller-crds/extra-crds/*.yaml > /out/crds.yaml"

.PHONY: update-config
update-config: version
	@VERSION=$$(cat $(ROOT_DIR)/version); \
	MINOR=$$(cat $(ROOT_DIR)/version | cut -d. -f1-2); \
	if ! grep -q "'$$MINOR'" $(ROOT_DIR)/config.jsonnet; then \
		awk -v entry="  { version: '$$MINOR', tag: '$$VERSION' }," \
			'/^];/{print entry} {print}' \
			$(ROOT_DIR)/config.jsonnet > $(ROOT_DIR)/config.jsonnet.tmp; \
		mv $(ROOT_DIR)/config.jsonnet.tmp $(ROOT_DIR)/config.jsonnet; \
		echo "Added $$MINOR ($$VERSION) to config.jsonnet"; \
	else \
		echo "Version $$MINOR already in config.jsonnet"; \
	fi
