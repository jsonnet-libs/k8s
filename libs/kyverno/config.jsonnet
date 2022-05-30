local config = import 'jsonnet/config.jsonnet';

config.new(
  name='kyverno',
  specs=[
    {
      output: '1.6',
      prefix: '^io\\.kyverno\\..*',
      localName: 'kyverno',
      crds: [
        // CRDs retrieved from https://github.com/kyverno/kyverno/blob/v1.6.2/config/crds/kustomization.yaml
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.6.2/config/crds/kyverno.io_clusterpolicies.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.6.2/config/crds/kyverno.io_clusterpolicies.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.6.2/config/crds/kyverno.io_clusterreportchangerequests.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.6.2/config/crds/kyverno.io_generaterequests.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.6.2/config/crds/kyverno.io_policies.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.6.2/config/crds/kyverno.io_reportchangerequests.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.6.2/config/crds/wgpolicyk8s.io_clusterpolicyreports.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.6.2/config/crds/wgpolicyk8s.io_policyreports.yaml',
      ],
    },
  ]
)
