local config = import 'jsonnet/config.jsonnet';
local versions = [
  ['1.25', '1.25.2','files'],
  ['1.24', '1.24.5','files'],
  ['1.23', '1.23.3','crds'],
  ['1.22', '1.22.3','crds'],
  ['1.21', '1.21.5','crds'],
  ['1.20', '1.20.0','crds'],
  ['1.19', '1.19.1','crds'],
  ['1.18', '1.18.6','crds'],
  ['1.17', '1.17.6','crds'],
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
