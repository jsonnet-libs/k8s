local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '0.20', tag: 'v0.20.1' },
];

config.new(
  name='nats',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.nats\\.jetstream\\..*',
      crds: ['https://github.com/nats-io/nack/releases/download/%(tag)s/crds.yml' % { tag: v.tag }],
      localName: 'nats',
    }
    for v in versions
  ]
)
