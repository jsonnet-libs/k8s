local config = import 'jsonnet/config.jsonnet';

// Run `make` to get the latest version and regenerate `crds.libsonnet`
local version = std.stripChars(importstr './version', ' \n');
local crds = import './crds.libsonnet';

config.new(
  name='crossplane-provider-upjet-azuread',
  specs=[
    {
      output: 'upbound-provider-azuread/cluster',
      prefix: '^io\\.upbound\\.azuread\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-azuread/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'azuread',
    },
  ],
)
