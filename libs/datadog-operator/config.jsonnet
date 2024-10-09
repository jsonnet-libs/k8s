local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.6.0', tag: 'v1.6.0' },
  { version: '1.7.0', tag: 'v1.7.0' },
  { version: '1.8.0', tag: 'v1.8.0' },
  { version: '1.9.0', tag: 'v1.9.0' },
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
        'https://raw.githubusercontent.com/DataDog/datadog-operator/%s/config/crd/bases/v1/datadoghq.com_datadogpodautoscalers.yaml' % [v.tag],  // new in v1.8.0 but we can do it this lazy way because the k8s build will silently succeed regardless of remote http code
        'https://raw.githubusercontent.com/DataDog/datadog-operator/%s/config/crd/bases/v1/datadoghq.com_datadogdashboards.yaml' % [v.tag], 
      
      ],
      localName: 'datadog-operator',
    }
    for v in versions
  ]
)
