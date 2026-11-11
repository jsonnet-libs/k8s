local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.21', version: 'v0.21.4' },
];

// Both API groups share the group name `secretgen`, so each needs its own output, like karpenter.
local groups = [
  { output: 'carvel', prefix: '^dev\\.carvel\\.secretgen\\..*' },
  { output: 'k14s', prefix: '^io\\.k14s\\.secretgen\\..*' },
];

config.new(
  name='secretgen-controller',
  specs=[
    {
      output: v.output + '/' + g.output,
      prefix: g.prefix,
      crds: [
        'https://raw.githubusercontent.com/carvel-dev/secretgen-controller/%s/config/package-bundle/config/crds.yml' % v.version,
      ],
      localName: 'secretgen',
    }
    for v in versions
    for g in groups
  ]
)
