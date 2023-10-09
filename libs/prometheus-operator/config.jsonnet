local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.57', version: '0.57.0' },
  { output: '0.58', version: '0.58.0' },
  { output: '0.59', version: '0.59.2' },
  { output: '0.60', version: '0.60.0' },
  { output: '0.61', version: '0.61.1' },
  { output: '0.62', version: '0.62.0' },
  { output: '0.63', version: '0.63.0' },
  { output: '0.64', version: '0.64.1' },
  { output: '0.65', version: '0.65.2' },
  { output: '0.66', version: '0.66.0' },
  { output: '0.67', version: '0.67.1' },
  { output: '0.68', version: '0.68.0' },
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
        '%s/monitoring.coreos.com_prometheusagents.yaml' % url,  // Added in 0.64
        '%s/monitoring.coreos.com_prometheuses.yaml' % url,
        '%s/monitoring.coreos.com_prometheusrules.yaml' % url,
        '%s/monitoring.coreos.com_scrapeconfigs.yaml' % url,  // Added in 0.65
        '%s/monitoring.coreos.com_servicemonitors.yaml' % url,
        '%s/monitoring.coreos.com_thanosrulers.yaml' % url,
      ],
      prefix: '^com\\.coreos\\..*',
      localName: 'prometheus-operator',
    }
    for v in versions
  ]
)
