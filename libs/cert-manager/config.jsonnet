local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.21', tag: 'v1.21.0' },
  { version: '1.20', tag: 'v1.20.3' },
  { version: '1.19', tag: 'v1.19.1' },
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
