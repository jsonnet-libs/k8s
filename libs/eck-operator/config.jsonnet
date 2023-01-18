local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.7', tag: 'v1.7.0'},
  { version: '1.8', tag: 'v1.8.0'},
  { version: '2.4', tag: 'v2.4.0'},
  { version: '2.5', tag: 'v2.5.0'},
  { version: '2.6', tag: 'v2.6.1'},
];

config.new(
  name='eck-operator',
  specs=[
    {
      output: v.version,
      prefix: '^co\\.elastic\\.k8s\\..*',
      crds: ['https://raw.githubusercontent.com/elastic/cloud-on-k8s/%s/config/crds/v1/all-crds.yaml' % v.tag],
      localName: 'eck-operator',
    }
    for v in versions
  ]
)
