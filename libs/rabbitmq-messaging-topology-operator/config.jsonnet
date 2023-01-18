local config = import 'jsonnet/config.jsonnet';
local versions = [
  { tag: "v1.8.0", version: "1.8" },
  { tag: "v1.9.0", version: "1.9" },
  { tag: "v1.10.0", version: "1.10" },
];


config.new(
  name='rabbitmq-messaging-topology-operator',
  specs=[
    {
      output: v.version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^com\\.rabbitmq\\..*',
      crds: [
        'https://github.com/rabbitmq/messaging-topology-operator/releases/download/%s/messaging-topology-operator.yaml' % v.tag
      ],
      localName: 'rabbitmq-messaging-topology-operator',
    }
    for v in versions
  ]
)
