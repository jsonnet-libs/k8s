local config = import 'jsonnet/config.jsonnet';
local versions = ['12.2.2', '13.0.4', '13.1.5', '13.2.3', '14.1.1'];
local manifests = [
  'resources.teleport.dev_githubconnectors.yaml',
  'resources.teleport.dev_loginrules.yaml',
  'resources.teleport.dev_oidcconnectors.yaml',
  'resources.teleport.dev_roles.yaml',
  'resources.teleport.dev_samlconnectors.yaml',
  'resources.teleport.dev_users.yaml',
  'resources.teleport.dev_provisiontokens.yaml', # added in 13.0
  'resources.teleport.dev_oktaimportrules.yaml', # added in 13.2
];

config.new(
  name='teleport-operator',
  specs=[
    {
      output: std.join('.', std.split(version, '.')[:2]),
      prefix: '^dev\\.teleport\\.resources\\..*',
      localName: 'teleport-operator',
      crds: [
        'https://raw.githubusercontent.com/gravitational/teleport/v%s/examples/chart/teleport-cluster/charts/teleport-operator/templates/%s' %
        [version, manifest]
        for manifest in manifests
      ],
    }
    for version in versions
  ]
)
