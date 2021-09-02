local config = import 'jsonnet/config.jsonnet';

config.new(
  name='istio',
  specs=[
    {
      output: '1.8',
      prefix: '^io\\.istio\\..*',
      crds: ['https://raw.githubusercontent.com/istio/istio/1.8.1/manifests/charts/base/crds/crd-all.gen.yaml'],
      localName: 'istio',
    },
  ]
)
