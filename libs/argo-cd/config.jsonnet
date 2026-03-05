local config = import 'jsonnet/config.jsonnet';
local versions =
  [
    '3.0.20',
    '3.1.11',
    '3.2.5',
  ];
local manifests = ['application-crd.yaml', 'appproject-crd.yaml', 'applicationset-crd.yaml'];

// Source: https://argo-cd.readthedocs.io/en/stable/developer-guide/release-process-and-cadence/#patch-releases-eg-25x
assert std.length(versions) <= 3 : 'Only the three most recent minor versions are eligible for patch releases. Versions older than the three most recent minor versions are considered EOL and will not receive bug fixes or security updates.';

config.new(
  name='argo-cd',
  specs=[
    {
      output: std.join('.', std.split(version, '.')[:2]),
      prefix: '^io\\.argoproj\\..*',
      localName: 'argo_cd',
      crds: [
        'https://raw.githubusercontent.com/argoproj/argo-cd/v%s/manifests/crds/%s' %
        [version, manifest]
        for manifest in manifests
      ],
    }
    for version in versions
  ]
)
