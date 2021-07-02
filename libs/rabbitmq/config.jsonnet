local config = import 'jsonnet/config.jsonnet';

config.new(
  name='rabbitmq',
  specs=[
    {
      output: '1.7',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^com\\.rabbitmq\\..*',
      crds: ['https://github.com/rabbitmq/cluster-operator/releases/download/v1.7.0/cluster-operator.yml'],
      localName: 'rabbitmq',
    },
  ]
)
