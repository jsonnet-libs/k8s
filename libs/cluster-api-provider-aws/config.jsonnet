local config = import 'jsonnet/config.jsonnet';

config.new(
  name='cluster-api-provider-aws',
  specs=[
    {
      output: 'v1.2.0',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.x-k8s\\.cluster\\..*',
      crds: ['https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/v1.2.0/infrastructure-components.yaml'],
      localName: 'cluster-api-provider-aws',
    },
  ]
)
