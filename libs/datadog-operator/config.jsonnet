local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.6.0', tag: 'v1.6.0' },
  { version: '1.7.0', tag: 'v1.7.0' },
];

config.new(
  name='datadog-operator',
  specs=[
    {
      output: v.version,
      prefix: '^com\\.datadoghq\\..*',
      crds: [
        'https://raw.githubusercontent.com/DataDog/datadog-operator/%s/config/crd/bases/v1/datadoghq.com_datadogagentprofiles.yaml' % [v.tag],
        'https://raw.githubusercontent.com/DataDog/datadog-operator/%s/config/crd/bases/v1/datadoghq.com_datadogagents.yaml' % [v.tag],
        'https://raw.githubusercontent.com/DataDog/datadog-operator/%s/config/crd/bases/v1/datadoghq.com_datadogmetrics.yaml' % [v.tag],
        'https://raw.githubusercontent.com/DataDog/datadog-operator/%s/config/crd/bases/v1/datadoghq.com_datadogmonitors.yaml' % [v.tag],
        'https://raw.githubusercontent.com/DataDog/datadog-operator/%s/config/crd/bases/v1/datadoghq.com_datadogslos.yaml' % [v.tag],
      ],
      localName: 'datadog-operator',
    }
    for v in versions
  ]
)
