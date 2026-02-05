ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TMP:=$(shell mktemp -d)
AWS_VERSION?=$(shell cat version)

default: crds.libsonnet

crds.libsonnet: version
	cd $(TMP) && \
	jb init && \
	jb install github.com/crossplane-contrib/provider-upjet-aws/package/crds@$(AWS_VERSION) && \
	echo '[' > $(ROOT_DIR)/crds.libsonnet && \
	cd vendor/github.com/crossplane-contrib/provider-upjet-aws/package/crds && \
	find . -type f -printf "%f\n" | sort | xargs -I {} echo "'{}'," >> $(ROOT_DIR)/crds.libsonnet && \
	echo ']' >> $(ROOT_DIR)/crds.libsonnet && \
	jsonnetfmt -i $(ROOT_DIR)/crds.libsonnet && \
	rm -rf $(TMP) || \
	rm -rf $(TMP)
