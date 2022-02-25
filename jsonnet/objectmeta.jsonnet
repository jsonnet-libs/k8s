local spec = import '/dev/stdin';

local extractDefinitions = [
  'io.k8s.apimachinery.pkg.apis.meta.v1.ObjectMeta',
  'io.k8s.apimachinery.pkg.apis.meta.v1.OwnerReference',
  'io.k8s.apimachinery.pkg.apis.meta.v1.Time',
];

{
  definitions: {
    [k]: spec.definitions[k]
    for k in std.objectFields(spec.definitions)
    if std.member(extractDefinitions, k)
  },
  info: {
    title: 'Kubernetes',
    version: 'unversioned',
  },
  swagger: '2.0',
}
