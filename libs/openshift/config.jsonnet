local config = import 'jsonnet/config.jsonnet';
local versions = [
  '3.11',
  '4.0',
  '4.1',
  '4.2',
  '4.3',
  '4.4',
  '4.5',
];

config.new(
  name='openshift',
  specs=[
    {
      output: version,
      openapi: 'https://raw.githubusercontent.com/openshift/origin/release-'+version+'/api/swagger-spec/openshift-openapi-spec.json',
      prefix: '^com\\.github\\.openshift\\.api\\..*',
      localName: 'o',
      description: 'Generated Jsonnet library for OpenShift v' + version,
    }
    for version in versions
  ]
)
