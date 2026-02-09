local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.19', tag: 'v1.19.1' },
  { version: '1.18', tag: 'v1.18.3' },
  { version: '1.17', tag: 'v1.17.3' },
];

config.new(
  name='cert-manager',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.cert-manager\\..*',
      crds: ['https://github.com/cert-manager/cert-manager/releases/download/' + v.tag + '/cert-manager.crds.yaml'],
      localName: 'cert_manager',
    }
    for v in versions
  ]
)
