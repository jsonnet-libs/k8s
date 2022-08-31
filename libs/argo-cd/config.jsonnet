local config = import 'jsonnet/config.jsonnet';

config.new(
  name='argo-cd',
  specs=[
    {
      output: '2.2',
      prefix: '^io\\.argoproj\\..*',
      localName: 'argo_cd',
      crds: [
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.2.12/manifests/crds/application-crd.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.2.12/manifests/crds/appproject-crd.yaml',
      ],
    },
    {
      output: '2.3',
      prefix: '^io\\.argoproj\\..*',
      localName: 'argo_cd',
      crds: [
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.3.7/manifests/crds/application-crd.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.3.7/manifests/crds/appproject-crd.yaml',
      ],
    },
    {
      output: '2.4',
      prefix: '^io\\.argoproj\\..*',
      localName: 'argo_cd',
      crds: [
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.4.11/manifests/crds/application-crd.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-cd/v2.4.11/manifests/crds/appproject-crd.yaml',
      ],
    },
  ]
)
