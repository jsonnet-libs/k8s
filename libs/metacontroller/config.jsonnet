local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '4.12', version: '4.12.5' },
];

config.new(
  name='metacontroller',
  specs=[
    {
      output: v.output,
      prefix: '^io\\.k8s\\.metacontroller\\..*',  // group: metacontroller.k8s.io
      crds: [
        'https://github.com/metacontroller/metacontroller/releases/download/v%s/metacontroller-crds-v1.yaml'
        % v.version,
      ],
      localName: 'metacontroller',
    }
    for v in versions
  ]
)
