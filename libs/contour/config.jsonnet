local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.33', tag: 'v1.33.3'},
  { version: '1.32', tag: 'v1.32.4'},
  { version: '1.31', tag: 'v1.31.5'},
  { version: '1.30', tag: 'v1.30.0'},
  { version: '1.29', tag: 'v1.29.0'},
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
