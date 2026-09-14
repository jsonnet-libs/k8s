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
  version('0.20', '0.20.4'),
  version('1.3', '1.3.2'),
  version('2.5', '2.5.0'),
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
