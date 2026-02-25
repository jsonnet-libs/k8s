local config = import 'jsonnet/config.jsonnet';

local versions = [

  { output: '4.10', version: '4.10.1' },
  { output: '5.12', version: '5.12.0' },
  { output: '5.13', version: '5.13.0' },
  { output: '5.14', version: '5.14.0' },
  { output: '5.15', version: '5.15.1' },
  { output: '5.16', version: '5.16.0' },
  { output: '5.17', version: '5.17.1' },
  { output: '5.18', version: '5.18.0' },
  { output: '5.19', version: '5.19.4' },
  { output: '5.20', version: '5.20.0' },
  { output: '5.21', version: '5.21.4' },
  { output: '5.22', version: '5.22.0' },
];

config.new(
  name='grafana-operator',
  specs=[
    {
      local url = if std.startsWith(v.output, '4.') then
        'https://raw.githubusercontent.com/grafana-operator/grafana-operator/v%s/deploy/manifests/v%s/crds.yaml' % [v.version, v.version]
      else
        'https://raw.githubusercontent.com/grafana-operator/grafana-operator/v%s/deploy/kustomize/base/crds.yaml' % v.version,
      output: v.output,
      prefix: '^org\\.integreatly\\..*',
      crds: [url],
      localName: 'grafana_operator',
    }
    for v in versions
  ]
)
