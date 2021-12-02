local config = import 'jsonnet/config.jsonnet';

config.new(
  name='flagger',
  specs=[
    {
      output: '1.16',
      prefix: '^app\\.flagger\\..*',
      crds: ['https://raw.githubusercontent.com/fluxcd/flagger/v1.16.0/charts/flagger/crds/crd.yaml'],
      localName: 'flagger',
    },
  ]
)
