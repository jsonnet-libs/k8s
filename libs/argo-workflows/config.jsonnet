local config = import 'jsonnet/config.jsonnet';

config.new(
  name='argo-workflows',
  specs=[
    {
      output: '3.1',
      prefix: '^io\\.argoproj\\..*',
      crds: [
        // Full manifests are broken: https://github.com/argoproj/argo-workflows/issues/6588
        'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.1.8/manifests/base/crds/minimal/argoproj.io_clusterworkflowtemplates.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.1.8/manifests/base/crds/minimal/argoproj.io_cronworkflows.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.1.8/manifests/base/crds/minimal/argoproj.io_workfloweventbindings.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.1.8/manifests/base/crds/minimal/argoproj.io_workflows.yaml',
        'https://raw.githubusercontent.com/argoproj/argo-workflows/v3.1.8/manifests/base/crds/minimal/argoproj.io_workflowtemplates.yaml',
      ],
      localName: 'argo_workflows',
    },
  ]
)
