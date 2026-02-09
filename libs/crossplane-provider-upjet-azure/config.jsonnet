local config = import 'jsonnet/config.jsonnet';

// Run `make` to get the latest version and regenerate `crds.libsonnet`
local version = std.stripChars(importstr './version', ' \n');
local crds = import './crds.libsonnet';

config.new(
  name='crossplane-provider-upjet-azure',
  specs=[
    {
      output: 'upbound-provider-azure/namespaced',
      prefix: '^io\\.upbound\\.m\\.azure\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-azure/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'azure',
    },
    {
      output: 'upbound-provider-azure/cluster',
      prefix: '^io\\.upbound\\.azure\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-azure/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'azure',
    },
  ],
)
