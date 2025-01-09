local config = import 'jsonnet/config.jsonnet';
local versions = ['2.9.3', '2.10.9', '2.11.12', '2.12.8', '2.13.2'];
local manifests = ['application-crd.yaml', 'appproject-crd.yaml', 'applicationset-crd.yaml'];

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
