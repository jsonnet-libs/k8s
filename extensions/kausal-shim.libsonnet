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
        portsType: k.core.v1.servicePort,
      },
    },
  } },

  apps+: { v1+: {
    deployment+: {
      spec+: {
        template+: {
          spec+: {
            containersType: k.core.v1.container,
            tolerationsType: k.core.v1.toleration {
              new():: {},
            },
          },
        },
      },
    },
    daemonSet+: {
      new():: super.new(''),
    },
  } },

  batch+: { v1beta1+: {
    cronJob+: {
      new():: super.new(''),
    },
  } },

  rbac+: {
    v1beta1+: {
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
    },
  },
}
