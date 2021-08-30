local config = import 'jsonnet/config.jsonnet';

config.new(
  name='flagger',
  specs=[
    {
      output: '1.13',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^app\\.flagger\\..*',
      crds: ['https://raw.githubusercontent.com/fluxcd/flagger/v1.13.0/charts/flagger/crds/crd.yaml'],
      localName: 'flagger',
    },
  ]
)
