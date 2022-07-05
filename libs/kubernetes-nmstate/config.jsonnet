local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '0.71', tag: 'v0.71.0' },
  { version: '0.70', tag: 'v0.70.1' },
];

config.new(
  name='kubernetes-nmstate',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.nmstate\\..*',
      crds: ['https://github.com/nmstate/kubernetes-nmstate/releases/download/' + v.tag + '/nmstate.io_nmstates.yaml'],
      localName: 'nmstate',
    }
    for v in versions
  ]
)
