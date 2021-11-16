local config = import 'jsonnet/config.jsonnet';
local versions = [
  '1.11',
  '1.10',
  '1.9',
  '1.8',
  '1.7',
  '1.6'
];

config.new(
  name='istio',
  specs=[
    {
      output: version,
      prefix: '^io\\.istio\\..*',
      crds: ['https://raw.githubusercontent.com/istio/istio/' + version + '.1' + '/manifests/charts/base/crds/crd-all.gen.yaml'],
      localName: 'istio',
    }
    for version in versions
  ]
)
