std.manifestYamlDoc({
  specs:
    [
      {
        output: 'crossplane/crossplane/1.2',
        openapi: 'http://localhost:8001/openapi/v2',
        prefix: '^io\\.crossplane\\.(pkg|apiextensions)\\..*',
        crd: 'https://doc.crds.dev/raw/github.com/crossplane/crossplane@v1.2.1',
        localName: 'crossplane',
        repository: 'github.com/jsonnet-libs/crossplane-lib',
      },
      {
        output: 'crossplane/provider-aws/0.18',
        openapi: 'http://localhost:8001/openapi/v2',
        prefix: '^io\\.crossplane\\.aws\\..*',
        crd: 'https://doc.crds.dev/raw/github.com/crossplane/provider-aws@v0.18.1',
        localName: 'crossplane_aws',
        repository: 'github.com/jsonnet-libs/crossplane-lib',
      },
      {
        output: 'crossplane/provider-gcp/0.17',
        openapi: 'http://localhost:8001/openapi/v2',
        prefix: '^io\\.crossplane\\.gcp\\..*',
        crd: 'https://doc.crds.dev/raw/github.com/crossplane/provider-gcp@v0.17.0',
        localName: 'crossplane_gcp',
        repository: 'github.com/jsonnet-libs/crossplane-lib',
      },
      {
        output: 'crossplane/provider-azure/0.16',
        openapi: 'http://localhost:8001/openapi/v2',
        prefix: '^io\\.crossplane\\.azure\\..*',
        crd: 'https://doc.crds.dev/raw/github.com/crossplane/provider-azure@v0.16.1',
        localName: 'crossplane_azure',
        repository: 'github.com/jsonnet-libs/crossplane-lib',
      },
    ] + [
      {
        output: 'istio/1.8',
        openapi: 'http://localhost:8001/openapi/v2',
        prefix: '^io\\.istio\\..*',
        crd: 'https://raw.githubusercontent.com/istio/istio/1.8.1/manifests/charts/base/crds/crd-all.gen.yaml',
        localName: 'istio',
        repository: 'github.com/jsonnet-libs/istio-lib',
      },
      {
        output: 'cnrm/1.33',
        openapi: 'http://localhost:8001/openapi/v2',
        prefix: '^com\\.google\\.cloud\\.cnrm\\..*',
        crd: 'https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-config-connector/1.33.0/install-bundles/install-bundle-workload-identity/crds.yaml',
        localName: 'cnrm',
        repository: 'github.com/jsonnet-libs/cnrm-lib',
      },
    ],
}, true)
