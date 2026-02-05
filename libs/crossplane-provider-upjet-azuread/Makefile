ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TMP:=$(shell mktemp -d)

all: update-version crds.libsonnet

.PHONY: update-version
update-version:
	@NEW_VERSION=$$(gh release view --repo crossplane-contrib/provider-upjet-azuread --json tagName --jq '.tagName'); \
	if [ ! -f version ] || [ "$$(cat version)" != "$$NEW_VERSION" ]; then \
		echo "$$NEW_VERSION" > version; \
		echo "Updated version to $$NEW_VERSION"; \
	else \
		echo "Version unchanged: $$NEW_VERSION"; \
	fi

crds.libsonnet: version
	cd $(TMP) && \
	jb init && \
	jb install github.com/crossplane-contrib/provider-upjet-azuread/package/crds@$(shell cat version) && \
	echo '[' > $(ROOT_DIR)/crds.libsonnet && \
	cd vendor/github.com/crossplane-contrib/provider-upjet-azuread/package/crds && \
	find . -type f -printf "%f\n" | sort | xargs -I {} echo "'{}'," >> $(ROOT_DIR)/crds.libsonnet && \
	echo ']' >> $(ROOT_DIR)/crds.libsonnet && \
	jsonnetfmt -i $(ROOT_DIR)/crds.libsonnet && \
	rm -rf $(TMP) || \
	rm -rf $(TMP)
