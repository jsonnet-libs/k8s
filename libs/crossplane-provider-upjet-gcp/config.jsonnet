local config = import 'jsonnet/config.jsonnet';

// Run `make` to get the latest version and regenerate `crds.libsonnet`
local version = std.stripChars(importstr './version', ' \n');
local crds = import './crds.libsonnet';

config.new(
  name='crossplane-provider-upjet-gcp',
  specs=[
    {
      output: 'upbound-provider-gcp/namespaced',
      prefix: '^io\\.upbound\\.m\\.gcp\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-gcp/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'gcp',
    },
    {
      output: 'upbound-provider-gcp/cluster',
      prefix: '^io\\.upbound\\.gcp\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-gcp/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'gcp',
    },
  ],
)
