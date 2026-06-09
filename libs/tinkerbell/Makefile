ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TMP:=$(shell mktemp -d)

all: update-version crds.libsonnet

.PHONY: update-version
update-version:
	@NEW_VERSION=$$(gh release view --repo tinkerbell/tinkerbell --json tagName --jq '.tagName'); \
	if [ ! -f version ] || [ "$$(cat version)" != "$$NEW_VERSION" ]; then \
		echo "$$NEW_VERSION" > version; \
		echo "Updated version to $$NEW_VERSION"; \
	else \
		echo "Version unchanged: $$NEW_VERSION"; \
	fi

crds.libsonnet: version
	cd $(TMP) && \
	git clone --depth 1 --branch $(shell cat version) --filter=blob:none --sparse https://github.com/tinkerbell/tinkerbell.git && \
	cd tinkerbell && \
	git sparse-checkout set crd/bases && \
	echo '[' > $(ROOT_DIR)/crds.libsonnet && \
	cd crd/bases && \
	find . -type f -name '*.yaml' | sed 's|^\./||' | sort | xargs -I {} echo "'{}'," >> $(ROOT_DIR)/crds.libsonnet && \
	echo ']' >> $(ROOT_DIR)/crds.libsonnet && \
	jsonnetfmt -i $(ROOT_DIR)/crds.libsonnet && \
	rm -rf $(TMP) || \
	rm -rf $(TMP)
