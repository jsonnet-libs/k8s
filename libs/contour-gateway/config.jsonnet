local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.29', tag: 'v1.29.1'},
  { version: '1.28', tag: 'v1.28.5'}, // Contour v1.28+ fully supports Gateway API v1.0.0
];

config.new(
  name='contour-gateway',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.k8s\\.networking\\..*',
      crds: [
        'https://raw.githubusercontent.com/projectcontour/contour/%(tag)s/examples/gateway/00-crds.yaml' % v,
      ],
      localName: 'contour-gateway',
    }
    for v in versions
  ]
)
