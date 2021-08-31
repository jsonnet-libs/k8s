local config = import 'jsonnet/config.jsonnet';

local versions = ['0.23', '0.24'];

config.new(
  name='strimzi',
  specs=[
    local proxy_port = std.find(version, versions)[0] + 8001;
    {
      output: version,
      openapi: 'http://localhost:%s/openapi/v2' % proxy_port,
      proxy_port: proxy_port,
      prefix: '^io\\.strimzi\\..*',
      crds: ['https://github.com/strimzi/strimzi-kafka-operator/releases/download/%(version)s.0/strimzi-crds-%(version)s.0.yaml' % { version: version }],
      localName: 'strimzi',
    }
    for version in versions
  ]
)
