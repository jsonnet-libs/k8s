local config = import 'jsonnet/config.jsonnet';

config.new(
  name='grafana-operator',
  specs=[
    {
      output: '4.1',
      prefix: '^org\\.integreatly\\..*',
      crds: ['https://raw.githubusercontent.com/grafana-operator/grafana-operator/v4.1.1/deploy/manifests/v4.1.1/crds.yaml'],
      localName: 'grafana_operator',
    },
    {
      output: '4.2',
      prefix: '^org\\.integreatly\\..*',
      crds: ['https://raw.githubusercontent.com/grafana-operator/grafana-operator/v4.2.0/deploy/manifests/v4.2.0/crds.yaml'],
      localName: 'grafana_operator',
    },
  ]
)
