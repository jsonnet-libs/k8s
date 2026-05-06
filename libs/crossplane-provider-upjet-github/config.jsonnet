local config = import 'jsonnet/config.jsonnet';

// Run `make` to get the latest version and regenerate `crds.libsonnet`
local version = std.stripChars(importstr './version', ' \n');
local crds = import './crds.libsonnet';

config.new(
  name='crossplane-provider-upjet-github',
  specs=[
    {
      output: 'upbound-provider-github/namespaced',
      prefix: '^io\\.upbound\\.m\\.github\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-github/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'github',
    },
    {
      output: 'upbound-provider-github/cluster',
      prefix: '^io\\.upbound\\.github\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-github/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'github',
    },
  ],
)
