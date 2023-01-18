local config = import 'jsonnet/config.jsonnet';
local versions = ['2.5.6', '2.4.11', '2.3.7', '2.2.12'];
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
