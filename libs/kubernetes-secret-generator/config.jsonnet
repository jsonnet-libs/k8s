local config = import 'jsonnet/config.jsonnet';

local version = '3.4.0';

config.new(
  name='kubernetes-secret-generator',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/mittwald/kubernetes-secret-generator/v%s/deploy/crds/' % version,
      output: version,
      prefix: '^de\\.mittwald\\.secretgenerator\\..*',
      crds: [
        '%s/secretgenerator.mittwald.de_basicauths_crd.yaml' % url,
        '%s/secretgenerator.mittwald.de_sshkeypairs_crd.yaml' % url,
        '%s/secretgenerator.mittwald.de_stringsecrets_crd.yaml' % url,
        ],
      localName: 'kubernetes_secret_generator',
    },
  ],
)
