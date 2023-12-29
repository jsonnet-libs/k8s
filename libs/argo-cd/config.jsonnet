local config = import 'jsonnet/config.jsonnet';
local versions = ['2.2.12', '2.3.7', '2.4.11', '2.5.6', '2.6.11', '2.7.6', '2.8.7', '2.9.3'];
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
