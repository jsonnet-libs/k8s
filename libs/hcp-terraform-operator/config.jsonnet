// libs/hcp-terraform-operator/config.jsonnet
local config = import 'jsonnet/config.jsonnet';

local versions = [
  '2.7.1',
  '2.7.0',
  '2.6.0',
  '2.4.1',
];

config.new(
  name='hcp-terraform-operator',
  specs=[
    {
      crds: [
        'https://raw.githubusercontent.com/hashicorp/hcp-terraform-operator/v%s/config/crd/bases/app.terraform.io_agentpools.yaml' %v,
        'https://raw.githubusercontent.com/hashicorp/hcp-terraform-operator/v%s/config/crd/bases/app.terraform.io_modules.yaml' %v,
        'https://raw.githubusercontent.com/hashicorp/hcp-terraform-operator/v%s/config/crd/bases/app.terraform.io_projects.yaml' %v,
        'https://raw.githubusercontent.com/hashicorp/hcp-terraform-operator/v%s/config/crd/bases/app.terraform.io_workspaces.yaml' %v,
      ],
      localName: 'hcp-terraform-operator',
      output: v,
      prefix: '^io\\.terraform\\..*',
    }
    for v in versions
  ]
)
