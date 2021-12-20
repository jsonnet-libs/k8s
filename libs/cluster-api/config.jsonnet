local config = import 'jsonnet/config.jsonnet';

config.new(
  name='cluster-api',
  specs=[
    {
      output: 'v1.0.2',
      openapi: 'http://localhost:8001/openapi/v2',
      prefix: '^io\\.x-k8s\\.cluster\\..*',
      crds: ['https://github.com/kubernetes-sigs/cluster-api/releases/download/v1.0.2/core-components.yaml'],
      localName: 'cluster-api',
    },
  ]
)
