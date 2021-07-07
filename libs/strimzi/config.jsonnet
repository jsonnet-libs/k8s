local config = import 'jsonnet/config.jsonnet';

config.new(
  name='strimzi',
  specs=[
    {
      output: '0.23',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.strimzi\\..*',
      crds: ['https://github.com/strimzi/strimzi-kafka-operator/releases/download/0.23.0/strimzi-crds-0.23.0.yaml'],
      localName: 'strimzi',
    },
  ]
)
