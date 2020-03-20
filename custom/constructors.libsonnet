{
  core+: {
    v1+: {
      container+: {
        new(name, image)::
          super.withName(name) + super.withImage(image),
      },
    },
  },
  apps+: {
    v1+: {
      deployment+: {
        new(name, containers, replicas=1)::
          super.new(name)
          + super.spec.template.spec.withContainers(containers)
          + super.spec.withReplicas(replicas),
      },
    },
  },
}
