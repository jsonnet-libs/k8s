local config = import 'jsonnet/config.jsonnet';

config.new(
  name='composable',
  specs=[
    {
      output: '0.2.0',
      prefix: '^com\\.ibm\\.ibmcloud\\..*',
      crds: ['https://github.com/ankorstore/composable/releases/download/v0.2.0/crds.yaml'],
      localName: 'composable',
      patchDir: 'custom/helpers',
    },
  ],
)
