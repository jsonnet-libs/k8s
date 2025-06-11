local config = import 'jsonnet/config.jsonnet';

local
  version(
    output,
    version,
    crdFiles=['bundle.yaml']  // from v0.5 onward, a single bundle.yaml contains all of the external-secrets CRDs.
  ) =
    {
      output: output,
      version: version,
      crdFiles: crdFiles,
    };

local versions = [
  version('0.4', '0.4.4', crdFiles=[
    // 0.4.4 is the last version with individual CRD files
    'external-secrets.io_clustersecretstores.yaml',
    'external-secrets.io_externalsecrets.yaml',
    'external-secrets.io_secretstores.yaml',
  ]),
  version('0.5', '0.5.9'),
  version('0.6', '0.6.1'),
  // From v0.7, the upstream kustomization.yaml was actually not properly containing all CRDs, we parse the bundle.yaml instead across the board for now.
  version('0.7', '0.7.3'),
  version('0.8', '0.8.12'),
  version('0.9', '0.9.12'),
  version('0.15', '0.15.1'),
  version('0.16', '0.16.2'),
  version('0.17', '0.17.0'),
];

config.new(
  name='external-secrets',
  specs=[
    {
      local urlTemplate = 'https://raw.githubusercontent.com/external-secrets/external-secrets/v%s/deploy/crds/%s',
      output: v.output,
      prefix: '^io\\.external-secrets\\..*',
      crds: [
        urlTemplate % [v.version, crdFile]
        for crdFile in v.crdFiles
      ],
      localName: 'external_secrets',
    }
    for v in versions
  ]
)
