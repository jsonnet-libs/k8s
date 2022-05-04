local config = import 'jsonnet/config.jsonnet';

config.new(
  name='argo-cd',
  specs=[
    {
      output: '2.2',
      prefix: '^io\\.argoproj\\..*',
      localName: 'argo_cd',
      crds: [
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.2.8/manifests/crds/application-crd.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.2.8/manifests/crds/appproject-crd.yaml',
      ],
    },
    {
      output: '2.3',
      prefix: '^io\\.argoproj\\..*',
      localName: 'argo_cd',
      crds: [
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.3.3/manifests/crds/application-crd.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.3.3/manifests/crds/appproject-crd.yaml',
      ],
    },
  ]
)
