local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '1.6', version: '1.6.1' },
];

config.new(
  name='grafana-alloy',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/grafana/alloy/refs/tags/v%s/operations/helm/charts/alloy/charts/crds/crds' % v.version,
      output: v.output,
      prefix: '^com\\.grafana\\..*',
      crds: [
        '%s/monitoring.grafana.com_podlogs.yaml' % url,
      ],
      localName: 'grafana-alloy',
    }
    for v in versions
  ]
)
