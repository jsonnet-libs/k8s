// libs/milvus-operator/config.jsonnet
local config = import 'jsonnet/config.jsonnet';

local versions = [
  { output: '0.9', version: '0.9.15' },
];

config.new(
  name='milvus-operator',
  specs=[
    {
      crds: [
        'https://raw.githubusercontent.com/zilliztech/milvus-operator/v%s/config/crd/bases/milvus.io_milvusclusters.yaml' % v.version,
        'https://raw.githubusercontent.com/zilliztech/milvus-operator/v%s/config/crd/bases/milvus.io_milvuses.yaml' % v.version,
        'https://raw.githubusercontent.com/zilliztech/milvus-operator/v%s/config/crd/bases/milvus.io_milvusupgrades.yaml' % v.version,
      ],
      localName: 'milvus-operator',
      output: v.output,
      prefix: '^io\\.milvus\\..*',
    }
    for v in versions
  ]
)
