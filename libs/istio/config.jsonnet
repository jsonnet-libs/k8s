local config = import 'jsonnet/config.jsonnet';
local versions = [
  ['1.15', '1.15.2'],
  ['1.14', '1.14.5'],
  ['1.13', '1.13.9'],
  ['1.12', '1.12.9'],
  ['1.11', '1.11.8'],
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
