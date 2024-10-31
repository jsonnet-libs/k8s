// libs/milvus-operator/config.jsonnet
local config = import 'jsonnet/config.jsonnet';

local versions = [
  '0.9.11',
  '1.0.0',
  '1.0.7',
];

config.new(
  name='milvus-operator',
  specs=[
    {
      crds: [
        'https://raw.githubusercontent.com/zilliztech/milvus-operator/v%s/config/crd/bases/milvus.io_milvusclusters.yaml' % v,
        'https://raw.githubusercontent.com/zilliztech/milvus-operator/v%s/config/crd/bases/milvus.io_milvuses.yaml' % v,
        'https://raw.githubusercontent.com/zilliztech/milvus-operator/v%s/config/crd/bases/milvus.io_milvusupgrades.yaml' % v,
      ],
      localName: 'milvus-operator',
      output: v,
      prefix: '^io\\.milvus\\..*',
    }
    for v in versions
  ]
)
