local config = import 'jsonnet/config.jsonnet';

local versions = [
  '0.50.1',
  '0.51.0',
  '1.0.0',
];


config.new(
  name='strimzi',
  specs=[
    {
      output: version,
      prefix: '^io\\.strimzi\\..*',
      crds: ['https://github.com/strimzi/strimzi-kafka-operator/releases/download/%(version)s/strimzi-crds-%(version)s.yaml' % { version: version }],
      localName: 'strimzi',
    }
    for version in versions
  ]
)
