local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '2.9', tag: 'v2.9.0' },
  { version: '2.8', tag: 'v2.8.0' },
  { version: '2.7', tag: 'v2.7.0' },
  { version: '2.6', tag: 'v2.6.1' },
  { version: '2.5', tag: 'v2.5.0' },
  { version: '2.4', tag: 'v2.4.0' },
  { version: '2.3', tag: 'v2.3.0' },
  { version: '2.2', tag: 'v2.2.0' },
  { version: '2.1', tag: 'v2.1.0' },
  { version: '2.0', tag: 'v2.0.0' },
  { version: '1.9', tag: 'v1.9.1' },
];

config.new(
  name='eck-operator',
  specs=[
    {
      output: v.version,
      prefix: '^co\\.elastic\\.k8s\\..*',
      crds: ['https://raw.githubusercontent.com/elastic/cloud-on-k8s/%s/deploy/eck-operator/charts/eck-operator-crds/templates/all-crds.yaml' % v.tag],
      localName: 'eck-operator',
    }
    for v in versions
  ]
)
