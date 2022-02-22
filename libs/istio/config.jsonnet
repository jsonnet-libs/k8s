local config = import 'jsonnet/config.jsonnet';
local versions = [
  ['1.13', '1.13.0'],
  ['1.12', '1.12.3'],
  ['1.11', '1.11.6'],
  ['1.10', '1.10.6'],
];

config.new(
  name='istio',
  specs=[
    {
      output: version[0],
      prefix: '^io\\.istio\\..*',
      crds: ['https://raw.githubusercontent.com/istio/istio/' + version[1] + '/manifests/charts/base/crds/crd-all.gen.yaml'],
      localName: 'istio',
    }
    for version in versions
  ]
)
