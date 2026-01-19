local config = import 'jsonnet/config.jsonnet';
local versions = [
  { version: '1.0', tag: 'v1.0.0' },
];

config.new(
  name='provider-grafana',
  specs=
  std.flatMap(
    function(v)
      [
        {
          output: v.version + '/namespaced',
          prefix: '^io\\.crossplane\\.m\\.grafana\\..*',
          crds: ['https://github.com/grafana/crossplane-provider-grafana/releases/download/%(tag)s/crds.yaml' % v],
          localName: 'crossplane_grafana',
        },
        {
          output: v.version + '/cluster',
          prefix: '^io\\.crossplane\\.grafana\\..*',
          crds: ['https://github.com/grafana/crossplane-provider-grafana/releases/download/%(tag)s/crds.yaml' % v],
          localName: 'crossplane_grafana',
        },
      ],
    versions
  )
)
