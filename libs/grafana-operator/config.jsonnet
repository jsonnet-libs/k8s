local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '4.1', tag: 'v4.1.1'},
  { version: '4.2', tag: 'v4.2.0'},
  { version: '4.3', tag: 'v4.3.0'},
  { version: '4.4', tag: 'v4.4.1'},
  { version: '4.5', tag: 'v4.5.1'},
  { version: '4.6', tag: 'v4.6.0'},
  { version: '4.7', tag: 'v4.7.1'},
  { version: '4.8', tag: 'v4.8.0'},
];

config.new(
  name='grafana-operator',
  specs=[
    {
      output: v.version,
      prefix: '^org\\.integreatly\\..*',
      crds: ['https://raw.githubusercontent.com/grafana-operator/grafana-operator/%s/deploy/manifests/%s/crds.yaml' % [v.tag, v.tag]],
      localName: 'grafana_operator',
    }
    for v in versions
  ]
)
