local d = import 'doc-util/main.libsonnet';

local patch = {
  subject+: {
    '#fromServiceAccount': d.fn(
      '`fromServiceAccount` returns a subject for a service account.',
      [d.arg('service_account', d.T.object)]
    ),
    fromServiceAccount(service_account)::
      super.withKind('ServiceAccount') +
      super.withName(service_account.metadata.name) +
      super.withNamespace(service_account.metadata.namespace),
  },
};

{
  rbac+: {
    v1+: patch,
    v1alpha1+: patch,
    v1beta1+: patch,
  },
}
