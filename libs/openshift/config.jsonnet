local config = import 'jsonnet/config.jsonnet';
local versions = [
  '4.12',
  '4.13',
  '4.14',
  '4.15',
  '4.16',
];

config.new(
  name='openshift',
  specs=[
    {
      output: version,
      openapi: 'https://raw.githubusercontent.com/openshift/api/release-%s/openapi/openapi.json' % version,
      prefix: '^com\\.github\\.openshift\\.api\\..*',
      localName: 'o',
      description: 'Generated Jsonnet library for OpenShift v' + version,
    }
    for version in versions
  ]
)
