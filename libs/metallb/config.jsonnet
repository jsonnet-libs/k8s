local config = import 'jsonnet/config.jsonnet';
local versions = ['0.14.8'];
local manifests = [
  'bfdprofiles',
  'bgpadvertisements',
  'bgppeers',
  'communities',
  'ipaddresspools',
  'l2advertisements',
  'servicel2statuses',
];

config.new(
  name='metallb',
  specs=[
    {
      localName: 'metallb',
      output: std.join('.', std.split(version, '.')[:2]),
      prefix: '^io\\.metallb\\..*',
      crds: [
        'https://raw.githubusercontent.com/metallb/metallb/v%s/config/crd/bases/metallb.io_%s.yaml'
        % [version, manifest]
        for manifest in manifests
      ],
    }
    for version in versions
  ]
)
