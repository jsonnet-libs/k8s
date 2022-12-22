local config = import 'jsonnet/config.jsonnet';
local versions = [
  ['1.16', '1.16.0'],
  ['1.15', '1.15.3'],
  ['1.14', '1.14.5'],
  ['1.13', '1.13.9'],
];

config.new(
  name='istio',
  specs=[
    {
      output: version[0],
      prefix: '^io\\.istio\\..*',
      crds: ['https://raw.githubusercontent.com/istio/istio/' + version[1] + '/manifests/charts/base/crds/crd-all.gen.yaml'],
      localName: 'istio',
      patchDir: 'custom',
    }
    for version in versions
  ]
)
