local config = import 'jsonnet/config.jsonnet';

local versions = [
    {output: '0.57', version:'0.57.0'},
];

config.new(
  name='prometheus-operator',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/prometheus-operator/prometheus-operator/v%s/example/prometheus-operator-crd' % v.version,
      output: v.output,
      crds: [
        '%s/monitoring.coreos.com_alertmanagerconfigs.yaml' % url,
        '%s/monitoring.coreos.com_alertmanagers.yaml' % url,
        '%s/monitoring.coreos.com_podmonitors.yaml' % url,
        '%s/monitoring.coreos.com_probes.yaml' % url,
        '%s/monitoring.coreos.com_prometheuses.yaml' % url,
        '%s/monitoring.coreos.com_prometheusrules.yaml' % url,
        '%s/monitoring.coreos.com_servicemonitors.yaml' % url,
        '%s/monitoring.coreos.com_thanosrulers.yaml' % url,
      ],
      prefix: '^com\\.coreos\\..*',
      localName: 'prometheus-operator',
    }
    for v in versions
  ]
)
