ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
TMP:=$(shell mktemp -d)
AWS_VERSION?=v1.14.0

.PHONY: upbound_aws_crds.libsonnet
upbound_aws_crds.libsonnet:
	cd $(TMP) && \
	jb init && \
	jb install github.com/crossplane-contrib/provider-upjet-aws/package/crds@$(AWS_VERSION) && \
	echo '[' > $(ROOT_DIR)/upbound_aws_crds.libsonnet && \
	cd vendor/github.com/crossplane-contrib/provider-upjet-aws/package/crds && \
	find . -type f -printf "%f\n" | sort | xargs -I {} echo "'{}'," >> $(ROOT_DIR)/upbound_aws_crds.libsonnet && \
	echo ']' >> $(ROOT_DIR)/upbound_aws_crds.libsonnet && \
	jsonnetfmt -i $(ROOT_DIR)/upbound_aws_crds.libsonnet && \
	rm -rf $(TMP) || \
	rm -rf $(TMP)


GCP_VERSION?=v1.8.3

.PHONY: upbound_gcp_crds.libsonnet
upbound_gcp_crds.libsonnet:
	cd $(TMP) && \
	jb init && \
	jb install github.com/crossplane-contrib/provider-upjet-gcp/package/crds@$(AWS_VERSION) && \
	echo '[' > $(ROOT_DIR)/upbound_gcp_crds.libsonnet && \
	cd vendor/github.com/crossplane-contrib/provider-upjet-gcp/package/crds && \
	find . -type f -printf "%f\n" | sort | xargs -I {} echo "'{}'," >> $(ROOT_DIR)/upbound_gcp_crds.libsonnet && \
	echo ']' >> $(ROOT_DIR)/upbound_gcp_crds.libsonnet && \
	jsonnetfmt -i $(ROOT_DIR)/upbound_gcp_crds.libsonnet && \
	rm -rf $(TMP) || \
	rm -rf $(TMP)
