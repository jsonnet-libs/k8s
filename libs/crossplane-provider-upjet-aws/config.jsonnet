local config = import 'jsonnet/config.jsonnet';

// Bump version in `version` file and run `make` to regenerate `crds.libsonnet`
local version = importstr './version';
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
