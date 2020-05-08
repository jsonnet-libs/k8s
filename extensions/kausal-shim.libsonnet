// kausal-shim.libsonnet: mimics internals of the ksonnet-lib API for kausal.libsonnet
//
// importing ourselves here, to avoid receiving kausal patches,
// which we otherwise would (super includes them)
local k = import 'k.libsonnet';

{
  core+: { v1+: {
    container+: {
      envType: k.core.v1.envVar,
      portsType: k.core.v1.containerPort,
      volumeMountsType: k.core.v1.volumeMount,
    },
    pod+: {
      spec+: {
        volumesType: k.core.v1.volume,
      },
    },
    service+: {
      spec+: {
        withClusterIp: self.withClusterIP,
        portsType: k.core.v1.servicePort,
      },
    },
  } },

  local appsAffinityPatch = {
    nodeAffinity+: {
      preferredDuringSchedulingIgnoredDuringExecutionType: k.core.v1.preferredSchedulingTerm {
        new():: {},
        preferenceType: {
          matchFieldsType: k.core.v1.nodeSelectorRequirement,
        },
      },
    },
    podAntiAffinity+: {
      requiredDuringSchedulingIgnoredDuringExecutionType: k.core.v1.podAffinityTerm {
        new():: {},
      },
    },
  },

  local appsPatch = {
    deployment+: {
      spec+: { template+: { spec+: {
        containersType: k.core.v1.container,
        tolerationsType: k.core.v1.toleration {
          new():: {},
        },
        affinity+: appsAffinityPatch,
      } } },
    },
    daemonSet+: {
      new():: super.new(''),
      spec+: { template+: { spec+: {
        withHostPid:: self.withHostPID,
      } } },
    },
    statefulSet+: {
      spec+: { template+: { spec+: {
        affinity+: appsAffinityPatch,
        tolerationsType: k.core.v1.toleration {
          new():: {},
        },
        imagePullSecretsType: k.core.v1.localObjectReference {
          new():: {},
        },
      } } },
    },
  },

  apps+: {
    v1+: appsPatch,
    v1beta1+: appsPatch,
  },
  extensions+: {
    v1beta1+: appsPatch {
      ingress+: {
        new():: super.new(''),
        spec+: {
          rulesType: k.extensions.v1beta1.ingressRule {
            httpType+: { pathsType: k.extensions.v1beta1.httpIngressPath },
          },
        },
      },
    },
  },

  batch+: { v1beta1+: {
    cronJob+: {
      new():: super.new(''),
    },
  } },

  rbac+: {
    v1beta1+: {
      policyRule+: {
        withNonResourceUrls: self.withNonResourceURLs,
      },
      clusterRole+: {
        new():: super.new(''),
        rulesType: k.rbac.v1beta1.policyRule {
          new():: {},
        },
      },
      clusterRoleBinding+: {
        new():: super.new(''),
        subjectsType: k.rbac.v1beta1.subject {
          new():: {},
        },
      },
      role+: {
        new():: super.new(''),
      },
      roleBinding+: {
        new():: super.new(''),
      },
    },
  },

  policy+: {
    v1beta1+: {
      podDisruptionBudget+: {
        new():: super.new(''),
      },
    },
  },

  storage+: { v1+: {
    storageClass+: {
      new():: super.new(''),
    },
  } },

  scheduling+: { v1beta1+: {
    priorityClass+: {
      new():: super.new(''),
    },
  } },
}
