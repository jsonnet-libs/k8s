local fn = {
  mapContainers(f):: {
    local podContainers = super.spec.template.spec.containers,
    spec+: {
      template+: {
        spec+: {
          containers: std.map(f, podContainers),
        },
      },
    },
  },
  mapContainersWithName(names, f)::
    local nameSet = if std.type(names) == 'array' then std.set(names) else std.set([names]);
    local inNameSet(name) = std.length(std.setInter(nameSet, std.set([name]))) > 0;

    self.mapContainers(function(c) if std.objectHas(c, 'name') && inNameSet(c.name) then f(c) else c),
};

local patch = {
  mapContainers(f):: fn.mapContainers(f),
  mapContainersWithName(names, f):: fn.mapContainersWithName(names, f),
};

{
  core+: { v1+: {
    pod+: patch,
    podTemplate+: patch,
    replicationController+: patch,
  } },
  batch+: { v1+: {
    cronJob+: patch,
    job+: patch,
  } },
  apps+: { v1+: {
    daemonSet+: patch,
    deployment+: patch,
    replicaSet+: patch,
    statefulSet+: patch,
  } },
}
