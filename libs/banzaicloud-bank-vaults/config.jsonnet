local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.17', tag: 'v1.17.0'},
  { version: '1.16', tag: 'v1.16.0'},
  { version: '1.15', tag: 'v1.15.3'},
];

config.new(
  name='banzaicloud-bank-vaults',
  specs=[
    {
      output: v.version,
      prefix: '^com\\.banzaicloud\\.vault\\..*',
      crds: ['https://raw.githubusercontent.com/'+v.tag+'/charts/vault-operator/crds/crd.yaml'],
      localName: 'banzaicloud_bank_vaults',
    }
    for v in versions
  ]
)
