local config = import 'jsonnet/config.jsonnet';

local versions = ['0.1.0'];

// https://github.com/etcd-io/etcd-operator/releases/download/v0.1.0/install-v0.1.0.yaml


config.new(
  name='etcd-operator',
  specs=[
    {
      crds: [
        'https://github.com/etcd-io/etcd-operator/releases/download/v%(version)s/install-v%(version)s.yaml' % { version: v },
      ],
      localName: 'etcd-operator',
      output: v,
      prefix: '^io\\.etcd\\.operator',
    }
    for v in versions
  ]
)
