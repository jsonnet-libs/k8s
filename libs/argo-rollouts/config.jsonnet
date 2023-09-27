local config = import 'jsonnet/config.jsonnet';
local manifests = [
  'analysis-run-crd.yaml',
  'analysis-template-crd.yaml',
  'cluster-analysis-template-crd.yaml',
  'experiment-crd.yaml',
  'rollout-crd.yaml',
];
local versions = [
  '1.6.0'
];

config.new(
  name='argo-rollouts',
  specs=[
    {
      output: std.join('.', std.split(version, '.')[:2]),
      prefix: '^io\\.argoproj\\..*',
      localName: 'argo_rollouts',
      crds: [
        'https://raw.githubusercontent.com/argoproj/argo-rollouts/v%s/manifests/crds/%s' %
        [version, manifest]
        for manifest in manifests
      ],
    }
    for version in versions
  ]
)
