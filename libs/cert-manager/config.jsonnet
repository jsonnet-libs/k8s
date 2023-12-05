local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.13', tag: 'v1.13.2'},
  { version: '1.12', tag: 'v1.12.6'},
  { version: '1.11', tag: 'v1.11.5'},
  { version: '1.10', tag: 'v1.10.2'},
  { version: '1.9', tag: 'v1.9.2'},
  { version: '1.8', tag: 'v1.8.2'},
  { version: '1.7', tag: 'v1.7.3'},
  { version: '1.6', tag: 'v1.6.3'},
  { version: '1.5', tag: 'v1.5.5'},
  { version: '1.4', tag: 'v1.4.4'},
  { version: '1.3', tag: 'v1.3.3'},
];

config.new(
  name='cert-manager',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.cert-manager\\..*',
      crds: ['https://github.com/jetstack/cert-manager/releases/download/'+v.tag+'/cert-manager.crds.yaml'],
      localName: 'cert_manager',
    }
    for v in versions
  ]
)
