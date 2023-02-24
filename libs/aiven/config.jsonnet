local config = import 'jsonnet/config.jsonnet';

local versions = [
  '0.3.0',
  '0.4.0',
  '0.5.2',
  '0.6.0',
  '0.7.1',
  '0.8.0',
];

config.new(
  name='aiven',
  specs=[
    {
      # output directory, usually the version of the upstream application/CRD
      output: version,

      # crds Endpoints of the CRD manifests, should be omitted if there is an openapi spec
      # Only resources of kind CustomResourceDefintion are applied; the default policy is to just
      # pass in the CRDs here though.
      crds: ['https://github.com/aiven/aiven-operator/releases/download/v' + version + '/deployment.yaml'],

      # openapi spec v2 endpoint
      # No need to define this if `crds` is defined
      // openapi: 'http://localhost:8001/openapi/v2',

      # prefix Regex that should match the reverse of the CRDs spec.group
      # for example `group: networking.istio.io`
      # would become ^io\\.istio\\.networking\\..*"
      prefix: '^io\\.aiven\\..*',

      # localName used in the docs for the example(s)
      localName: 'aiven',
    },
    for version in versions
  ]
)


