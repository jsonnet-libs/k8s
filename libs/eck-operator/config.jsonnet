# libs/eck-operator/config.jsonnet
local config = import 'jsonnet/config.jsonnet';

local versions = ['1.7.0'];

config.new(
  name='eck-operator',
  specs=[
    {
      output: version,
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^co\\.elastic\\.k8s\\..*',
      crds: ['https://raw.githubusercontent.com/elastic/cloud-on-k8s/%s/config/crds/v1/all-crds.yaml' % version],
      localName: 'eck-operator',
    }
    for version in versions
  ]
)
