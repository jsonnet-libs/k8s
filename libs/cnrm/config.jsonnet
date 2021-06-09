local config = import 'jsonnet/config.jsonnet';

config.new(
  name='cnrm',
  specs=[
    {
      output: '1.33',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^com\\.google\\.cloud\\.cnrm\\..*',
      crds: ['https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-config-connector/1.33.0/install-bundles/install-bundle-workload-identity/crds.yaml'],
      localName: 'cnrm',
    },
  ],
)
