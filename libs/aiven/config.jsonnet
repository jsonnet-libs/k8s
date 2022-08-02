local config = import 'jsonnet/config.jsonnet';

config.new(
  name='aiven',
  specs=[
    {
      # output directory, usually the version of the upstream application/CRD
      output: '0.3.0',

      # crds Endpoints of the CRD manifests, should be omitted if there is an openapi spec
      # Only resources of kind CustomResourceDefintion are applied; the default policy is to just
      # pass in the CRDs here though.
      crds: ['https://github.com/aiven/aiven-operator/releases/download/v0.3.0/deployment.yaml'],

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
  ]
)


