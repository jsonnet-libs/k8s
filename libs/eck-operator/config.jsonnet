# libs/eck-operator/config.jsonnet
local config = import 'jsonnet/config.jsonnet';

config.new(
  name='eck-operator',
  specs=[
    {
      # output directory, usually the version of the upstream application/CRD
      output: '1.6.0',

      # openapi spec v2 endpoint
      # Use the localhost k3s endpoint in case `crds` is defined
      openapi: 'http://localhost:8001/openapi/v2',

      # prefix Regex that should match the reverse of the CRDs spec.group
      # for example `group: networking.istio.io`
      # would become ^io\\.istio\\.networking\\..*"
      prefix: '^co\\.elastic\\.k8s\\..*',

      # crds Endpoints of the CRD manifests, should be omitted if there is an openapi spec
      crds: ['https://raw.githubusercontent.com/elastic/cloud-on-k8s/1.6/config/crds/all-crds.yaml'],

      # localName used in the docs for the example(s)
      localName: 'eck-operator',
    },
  ]
)
