local config = import 'jsonnet/config.jsonnet';

local versions = [
  '0.2.0', '0.2.1'
];

config.new(
  name='composable',
  specs=[
    {
      output: version,
      prefix: '^com\\.ibm\\.ibmcloud\\..*',
      crds: ['https://github.com/ankorstore/composable/releases/download/v%s/crds.yaml' % version],
      localName: 'composable',
      patchDir: 'custom/helpers',
    }
    for version in versions
  ],
)
