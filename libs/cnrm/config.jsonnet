local config = import 'jsonnet/config.jsonnet';
local versions = [
  ['1.74', '1.74.0'],
  ['1.82', '1.82.0'],
  ['1.93', '1.93.0'],
  ['1.99', '1.99.0'],
];


config.new(
  name='cnrm',
  specs=[
    {
      output: version[0],
      prefix: '^com\\.google\\.cloud\\.cnrm\\..*',
      crds: ['https://raw.githubusercontent.com/GoogleCloudPlatform/k8s-config-connector/v' + version[1] +'/install-bundles/install-bundle-workload-identity/crds.yaml'],
      localName: 'cnrm',
    }
    for version in versions
  ],
)
