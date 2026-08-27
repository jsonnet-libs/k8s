local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.83', version: '0.83.0' },
  { output: '0.84', version: '0.84.1' },
  { output: '0.85', version: '0.85.0' },
  { output: '0.86', version: '0.86.0' },
  { output: '0.87', version: '0.87.1' },
  { output: '0.88', version: '0.88.1' },
  { output: '0.89', version: '0.89.0' },
  { output: '0.90', version: '0.90.1' },
  { output: '0.91', version: '0.91.0' },
  { output: '0.92', version: '0.92.1' },
  { output: '0.93', version: '0.93.1' },
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
