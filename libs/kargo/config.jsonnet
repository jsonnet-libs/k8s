local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.8.4', tag: 'v1.8.4' },
];

config.new(
  name='kargo',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.akuity\\.kargo\\..*',
      localName: 'kargo',
      crds: [
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_clusterconfigs.yaml' % v.tag,
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_clusterpromotiontasks.yaml' % v.tag,
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_freights.yaml' % v.tag,
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_projectconfigs.yaml' % v.tag,
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_projects.yaml' % v.tag,
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_promotions.yaml' % v.tag,
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_promotiontasks.yaml' % v.tag,
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_stages.yaml' % v.tag,
        'https://raw.githubusercontent.com/akuity/kargo/refs/tags/%s/charts/kargo/resources/crds/kargo.akuity.io_warehouses.yaml' % v.tag,
      ],
    }
    for v in versions
  ]
)
