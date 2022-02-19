local config = import 'jsonnet/config.jsonnet';

config.new(
  name='argo-cd',
  specs=[
    {
      output: '2.2',
      prefix: '^io\\.argoproj\\..*',
      localName: 'argo_cd',
      crds: [
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.2.5/manifests/crds/application-crd.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.2.5/manifests/crds/appproject-crd.yaml',
      ],
    },
  ]
)
