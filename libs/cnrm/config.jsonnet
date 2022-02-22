local config = import 'jsonnet/config.jsonnet';

config.new(
  name='cnrm',
  specs=[
    {
      output: '1.33',
      prefix: '^com\\.google\\.cloud\\.cnrm\\..*',
      crds: ['https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-config-connector/v1.74.0/install-bundles/install-bundle-workload-identity/crds.yaml'],
      localName: 'cnrm',
    },
  ],
)
