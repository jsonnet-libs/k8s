local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.67', version: '0.67.1' },
  { output: '0.68', version: '0.68.0' },
  { output: '0.69', version: '0.69.1' },
  { output: '0.70', version: '0.70.0' },
  { output: '0.71', version: '0.71.2' },
  { output: '0.72', version: '0.72.0' },
  { output: '0.73', version: '0.73.2' },
  { output: '0.74', version: '0.74.0' },
  { output: '0.75', version: '0.75.2' },
  { output: '0.76', version: '0.76.2' },
  { output: '0.77', version: '0.77.2' },
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
