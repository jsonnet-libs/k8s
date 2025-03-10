local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.30', tag: 'v1.30.0'},
  { version: '1.29', tag: 'v1.29.0'},
  { version: '1.28', tag: 'v1.28.1'},
  { version: '1.27', tag: 'v1.27.1'},
  { version: '1.26', tag: 'v1.26.2'},
];

config.new(
  name='contour',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.projectcontour\\..*',
      crds: ['https://raw.githubusercontent.com/projectcontour/contour/%(tag)s/examples/contour/01-crds.yaml' % v],
      localName: 'contour',
    }
    for v in versions
  ]
)
