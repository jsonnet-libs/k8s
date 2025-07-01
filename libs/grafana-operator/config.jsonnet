local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '4.1', version: '4.1.1' },
  { output: '4.2', version: '4.2.0' },
  { output: '4.3', version: '4.3.0' },
  { output: '4.4', version: '4.4.1' },
  { output: '4.5', version: '4.5.1' },
  { output: '4.6', version: '4.6.0' },
  { output: '4.7', version: '4.7.1' },
  { output: '4.8', version: '4.8.0' },
  { output: '4.9', version: '4.9.0' },
  { output: '4.10', version: '4.10.1' },
  { output: '5.0', version: '5.0.2' },
  { output: '5.4', version: '5.4.2' },
  { output: '5.5', version: '5.5.2' },
  { output: '5.6', version: '5.6.3' },
  { output: '5.7', version: '5.7.0' },
  { output: '5.8', version: '5.8.1' },
  { output: '5.9', version: '5.9.2' },
  { output: '5.10', version: '5.10.0' },
  { output: '5.11', version: '5.11.0' },
  { output: '5.12', version: '5.12.0' },
  { output: '5.13', version: '5.13.0' },
  { output: '5.14', version: '5.14.0' },
  { output: '5.15', version: '5.15.1' },
  { output: '5.16', version: '5.16.0' },
  { output: '5.17', version: '5.17.1' },
  { output: '5.18', version: '5.18.0' },
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
