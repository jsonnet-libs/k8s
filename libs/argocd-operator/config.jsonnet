local config = import 'jsonnet/config.jsonnet';
local versions =
  [
    '0.12.2',
    '0.13.1',
    '0.14.1',
  ];
local manifests = ['argoproj.io_applicationsets.yaml', 'argoproj.io_applications.yaml', 'argoproj.io_appprojects.yaml', 'argoproj.io_argocdexports.yaml', 'argoproj.io_argocds.yaml', 'argoproj.io_notificationsconfigurations.yaml'];

config.new(
  name='argocd-operator',
  specs=[
    {
      output: version,
      prefix: '^io\\.argoproj\\..*',
      localName: 'argocd_operator',
      crds: [
        'https://raw.githubusercontent.com/argoproj-labs/argocd-operator/v%s/bundle/manifests/%s' %
        [version, manifest]
        for manifest in manifests
      ],
    }
    for version in versions
  ]
)
