local patch = {
  deployment+: {
    new(
      name,
      replicas=1,
      containers=error 'containers unset',
      podLabels={ app: 'name' },  // <- This is weird, but ksonnet did it
    ):: super.new(name)
        + super.spec.withReplicas(replicas)
        + super.spec.template.spec.withContainers(containers)
        + super.spec.template.metadata.withLabels(podLabels),
  },

  statefulSet+: {
    new(
      name,
      replicas=1,
      containers=error 'containers unset',
      volumeClaims=null,
      podLabels={ app: 'name' },  // <- This is weird, but ksonnet did it
    ):: super.new(name)
        + super.spec.withReplicas(replicas)
        + super.spec.tmeplate.spec.withContainers(containers)
        + super.spec.template.metadata.withLabels(podLabels)
        + super.spec.withVolumeClaimTemplates(volumeClaims),
  },
};

{
  apps+: {
    v1+: patch,
    v1beta1+: patch,
    v1beta2+: patch,
  },
}
