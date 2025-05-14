local config = import 'jsonnet/config.jsonnet';

local versions = [
  { version: '1.4', tag: 'v1.4.12' },

];

config.new(
  name='aws-rds-controller',
  specs=[
    {
      local url = 'https://raw.githubusercontent.com/aws-controllers-k8s/rds-controller/%s/helm/crds' % v.tag,
      output: v.version,
      crds: [
        '%s/rds.services.k8s.aws_dbclusterparametergroups.yaml' % url,
        '%s/rds.services.k8s.aws_dbclusters.yaml' % url,
        '%s/rds.services.k8s.aws_dbclustersnapshots.yaml' % url,
        '%s/rds.services.k8s.aws_dbinstances.yaml' % url,
        '%s/rds.services.k8s.aws_dbparametergroups.yaml' % url,
        '%s/rds.services.k8s.aws_dbproxies.yaml' % url,
        '%s/rds.services.k8s.aws_dbsnapshots.yaml' % url,
        '%s/rds.services.k8s.aws_dbsubnetgroups.yaml' % url,
        '%s/rds.services.k8s.aws_globalclusters.yaml' % url,
        '%s/services.k8s.aws_adoptedresources.yaml' % url,
        '%s/services.k8s.aws_fieldexports.yaml' % url,
      ],
      localName: 'aws-rds-controller',
    }
    for v in versions
  ]
)
