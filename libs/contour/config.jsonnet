local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.20', tag: 'v1.20.1'},
  { version: '1.19', tag: 'v1.19.1'},
  { version: '1.18', tag: 'v1.18.3'},
  { version: '1.17', tag: 'v1.17.2'},
  { version: '1.16', tag: 'v1.16.1'},
  { version: '1.15', tag: 'v1.15.2'},
  { version: '1.14', tag: 'v1.14.2'},
  { version: '1.13', tag: 'v1.13.1'},
  { version: '1.12', tag: 'v1.12.0'},
  { version: '1.11', tag: 'v1.11.0'},
  { version: '1.10', tag: 'v1.10.1'},
  { version: '1.9', tag: 'v1.9.0'},
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
