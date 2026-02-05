local config = import 'jsonnet/config.jsonnet';

// Run `make` to get the latest version and regenerate `crds.libsonnet`
local version = std.stripChars(importstr './version', ' \n');
local crds = import './crds.libsonnet';

config.new(
  name='crossplane-provider-upjet-aws',
  specs=[
    {
      output: 'upbound-provider-aws/namespaced',
      prefix: '^io\\.upbound\\.m\\.aws\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-aws/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'aws',
    },
    {
      output: 'upbound-provider-aws/cluster',
      prefix: '^io\\.upbound\\.aws\\..*',
      crds: ['https://raw.githubusercontent.com/crossplane-contrib/provider-upjet-aws/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'aws',
    },
  ],
)
