local config = import 'jsonnet/config.jsonnet';

config.new(
  name='cfn',
  specs=[
    {
      output: '44.00',
      openapi: 'https://d1uauaxba7bl26.cloudfront.net/latest/gzip/CloudFormationResourceSpecification.json',
      localName: 'cfn',
    },
  ]
)
