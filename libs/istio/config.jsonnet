local config = import 'jsonnet/config.jsonnet';
local versions = [
  ['1.24', '1.24.0'],
  ['1.23', '1.23.3'],
  ['1.22', '1.22.3'],
  ['1.21', '1.21.5'],
  ['1.20', '1.20.0'],
  ['1.19', '1.19.1'],
  ['1.18', '1.18.6'],
  ['1.17', '1.17.6'],
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
