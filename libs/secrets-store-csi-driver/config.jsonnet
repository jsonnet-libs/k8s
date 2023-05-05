local config = import 'jsonnet/config.jsonnet';
local versions = ['1.2.4', '1.3.3'];
local manifests = [
    'secrets-store.csi.x-k8s.io_secretproviderclasses.yaml',
];

config.new(
  name='secrets-store-csi-driver',
  specs=[
    {
      output: std.join('.', std.split(version, '.')[:2]),
      prefix: '^io\\.x-k8s\\.csi\\.secrets-store\\..*',
      localName: 'secrets_store_csi_driver',
      patchDir: 'custom/secrets-store-csi-driver',
      crds: [
        'https://github.com/kubernetes-sigs/secrets-store-csi-driver/releases/download/v%s/%s' %
        [version, manifest]
        for manifest in manifests
      ],
    }
    for version in versions
  ]
)
