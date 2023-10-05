local config = import 'jsonnet/config.jsonnet';

local versions = [
  {output: '1.15.0', version:'v1.15.0'},
  {output: '1.17.0', version:'v1.17.0'},
  {output: '1.18.1', version:'v1.18.1'}
];

config.new(
  name='edp-keycloak-operator',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/epam/edp-keycloak-operator/%s/deploy-templates/crds/' % v.version,
      output: v.output,
      prefix: '^com\\.epam\\.edp\\..*',
      crds: [
        '%s/v1.edp.epam.com_clusterkeycloakrealms.yaml' % url,
        '%s/v1.edp.epam.com_clusterkeycloaks.yaml' % url,
        '%s/v1.edp.epam.com_keycloakauthflows.yaml' % url,
        '%s/v1.edp.epam.com_keycloakclients.yaml' % url,
        '%s/v1.edp.epam.com_keycloakclientscopes.yaml' % url,
        '%s/v1.edp.epam.com_keycloakrealmcomponents.yaml' % url,
        '%s/v1.edp.epam.com_keycloakrealmgroups.yaml' % url,
        '%s/v1.edp.epam.com_keycloakrealmidentityproviders.yaml' % url,
        '%s/v1.edp.epam.com_keycloakrealmrolebatches.yaml' % url,
        '%s/v1.edp.epam.com_keycloakrealmroles.yaml' % url,
        '%s/v1.edp.epam.com_keycloakrealms.yaml' % url,
        '%s/v1.edp.epam.com_keycloakrealmusers.yaml' % url,
        '%s/v1.edp.epam.com_keycloaks.yaml' % url,
      ],
      localName: 'edp-keycloak-operator',
    }
    for v in versions
  ]
)
