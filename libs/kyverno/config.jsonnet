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
    {
      output: '1.9',
      prefix: '^io\\.kyverno\\..*',
      localName: 'kyverno',
      crds: [
        // CRDs retrieved from https://github.com/kyverno/kyverno/blob/v1.9.0/config/crds
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_admissionreports.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_backgroundscanreports.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_cleanuppolicies.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_clusteradmissionreports.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_clusterbackgroundscanreports.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_clustercleanuppolicies.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_clusterpolicies.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_generaterequests.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_policies.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_policyexceptions.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/kyverno.io_updaterequests.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/wgpolicyk8s.io_clusterpolicyreports.yaml',
        'https://raw.githubusercontent.com/kyverno/kyverno/v1.9.0/config/crds/wgpolicyk8s.io_policyreports.yaml',
      ],
    },
  ]
)
