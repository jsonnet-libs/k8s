local config = import 'jsonnet/config.jsonnet';

local
  version(
    output,
    version,
    crdFiles=['bundle.yaml']
  ) =
    {
      output: output,
      version: version,
      crdFiles: crdFiles,
    };

local versions = [
  version('0.15', '0.15.1'),
  version('0.16', '0.16.2'),
  version('0.17', '0.17.0'),
  version('0.18', '0.18.2'),
  version('0.19', '0.19.2'),
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
