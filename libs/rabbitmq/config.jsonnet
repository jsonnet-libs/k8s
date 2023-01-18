local config = import 'jsonnet/config.jsonnet';
local versions = [
  { tag: "1.7.0", version: "1.7" },
  { tag: "1.14.0", version: "1.14" }
  { tag: "2.0.0", version: "2.0" },
  { tag: "2.1.0", version: "2.1" },
];


config.new(
  name='rabbitmq',
  specs=[
    {
      output: v.version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^com\\.rabbitmq\\..*',
      crds: [
        'https://github.com/rabbitmq/cluster-operator/releases/download/v%s/cluster-operator.yml' % v.tag
      ],
      localName: 'rabbitmq',
    }
    for v in versions
  ]
)
