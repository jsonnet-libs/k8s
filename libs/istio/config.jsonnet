local config = import 'jsonnet/config.jsonnet';
local versions = [
  ['1.28', '1.28.3','files'],
  ['1.27', '1.27.5','files'],
];

config.new(
  name='istio',
  specs=[
    {
      output: version[0],
      prefix: '^io\\.istio\\..*',
      crds: ['https://raw.githubusercontent.com/istio/istio/' + version[1] + '/manifests/charts/base/' + version[2] + '/crd-all.gen.yaml'],
      localName: 'istio',
      patchDir: 'custom',
    }
    for version in versions
  ]
)
