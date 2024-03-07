local config = import 'jsonnet/config.jsonnet';

local versions = ['0.32', '0.33', '0.34', '0.35', '0.36', '0.37', '0.38', '0.39'];

config.new(
  name='strimzi',
  specs=[
    {
      output: version,
      prefix: '^io\\.strimzi\\..*',
      crds: ['https://github.com/strimzi/strimzi-kafka-operator/releases/download/%(version)s.0/strimzi-crds-%(version)s.0.yaml' % { version: version }],
      localName: 'strimzi',
    }
    for version in versions
  ]
)
