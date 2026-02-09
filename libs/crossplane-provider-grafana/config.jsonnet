local config = import 'jsonnet/config.jsonnet';

// Run `make` to get the latest version and regenerate `crds.libsonnet`
local version = std.stripChars(importstr './version', ' \n');
local crds = import './crds.libsonnet';

config.new(
  name='crossplane-provider-grafana',
  specs=[
    {
      output: 'crossplane-provider-grafana/namespaced',
      prefix: '^io\\.crossplane\\.m\\.grafana\\..*',
      crds: ['https://raw.githubusercontent.com/grafana/crossplane-provider-grafana/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'grafana',
    },
    {
      output: 'crossplane-provider-grafana/cluster',
      prefix: '^io\\.crossplane\\.grafana\\..*',
      crds: ['https://raw.githubusercontent.com/grafana/crossplane-provider-grafana/%s/package/crds/%s' % [version, crd] for crd in crds],
      localName: 'grafana',
    },
  ],
)
