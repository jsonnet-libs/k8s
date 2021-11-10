local config = import 'jsonnet/config.jsonnet';

local versions = ['1.7', '1.8'];

config.new(
  name='eck-operator',
  specs=[
    {
      output: version,
      prefix: '^co\\.elastic\\.k8s\\..*',
      crds: ['https://raw.githubusercontent.com/elastic/cloud-on-k8s/%s.0/config/crds/v1/all-crds.yaml' % version],
      localName: 'eck-operator',
    }
    for version in versions
  ]
)
