local config = import 'jsonnet/config.jsonnet';

local crds = {
  in6: [
    'kyverno.io_clusterpolicies.yaml',
    'kyverno.io_clusterreportchangerequests.yaml',
    'kyverno.io_generaterequests.yaml',
    'kyverno.io_policies.yaml',
    'kyverno.io_reportchangerequests.yaml',
    'wgpolicyk8s.io_clusterpolicyreports.yaml',
    'wgpolicyk8s.io_policyreports.yaml',
  ],
  in7: [

    'kyverno.io_clusterpolicies.yaml',
    'kyverno.io_clusterreportchangerequests.yaml',
    'kyverno.io_generaterequests.yaml',
    'kyverno.io_policies.yaml',
    'kyverno.io_reportchangerequests.yaml',
    'kyverno.io_updaterequests.yaml',
    'wgpolicyk8s.io_clusterpolicyreports.yaml',
    'wgpolicyk8s.io_policyreports.yaml',
  ],
  in8: [
    'kyverno.io_admissionreports.yaml',
    'kyverno.io_backgroundscanreports.yaml',
    'kyverno.io_clusteradmissionreports.yaml',
    'kyverno.io_clusterbackgroundscanreports.yaml',
    'kyverno.io_clusterpolicies.yaml',
    'kyverno.io_generaterequests.yaml',
    'kyverno.io_policies.yaml',
    'kyverno.io_updaterequests.yaml',
    'wgpolicyk8s.io_clusterpolicyreports.yaml',
    'wgpolicyk8s.io_policyreports.yaml',
  ]
};

local versions = [
  { version: '1.6', tag: 'v1.6.3', crds: crds.in6},
  { version: '1.7', tag: 'v1.7.5', crds: crds.in7},
  { version: '1.8', tag: 'v1.8.5', crds: crds.in8},
];

config.new(
  name='kyverno',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.kyverno\\..*',
      localName: 'kyverno',
      crds: [
        'https://raw.githubusercontent.com/kyverno/kyverno/%s/config/crds/%s' % [v.tag, c]
        for c in v.crds
      ]
    }
    for v in versions
  ]
)
