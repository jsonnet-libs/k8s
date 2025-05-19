local config = import 'jsonnet/config.jsonnet';
local versions = ['v2.1.1'];

config.new(
  name='crossplane-vault',
  specs=[
    {
      output: version,
      prefix: '^io\\.upbound\\.vault\\..*',
      crds: ['https://doc.crds.dev/raw/github.com/upbound/provider-terraform@%s' % version],
      localName: 'crossplane_vault',
    },
    for version in versions
  ]
)
