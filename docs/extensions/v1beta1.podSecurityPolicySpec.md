
## podSecurityPolicySpec
PodSecurityPolicySpec defines the policy enforced. Deprecated: use PodSecurityPolicySpec from policy API Group instead.

**Functions:**

[`fn .withAllowPrivilegeEscalation`](#fn-withallowprivilegeescalation)  
[`fn .withAllowedCSIDrivers`](#fn-withallowedcsidrivers)  
[`fn .withAllowedCapabilities`](#fn-withallowedcapabilities)  
[`fn .withAllowedFlexVolumes`](#fn-withallowedflexvolumes)  
[`fn .withAllowedHostPaths`](#fn-withallowedhostpaths)  
[`fn .withAllowedProcMountTypes`](#fn-withallowedprocmounttypes)  
[`fn .withAllowedUnsafeSysctls`](#fn-withallowedunsafesysctls)  
[`fn .withDefaultAddCapabilities`](#fn-withdefaultaddcapabilities)  
[`fn .withDefaultAllowPrivilegeEscalation`](#fn-withdefaultallowprivilegeescalation)  
[`fn .withForbiddenSysctls`](#fn-withforbiddensysctls)  
[`fn .withHostIPC`](#fn-withhostipc)  
[`fn .withHostNetwork`](#fn-withhostnetwork)  
[`fn .withHostPID`](#fn-withhostpid)  
[`fn .withHostPorts`](#fn-withhostports)  
[`fn .withPrivileged`](#fn-withprivileged)  
[`fn .withReadOnlyRootFilesystem`](#fn-withreadonlyrootfilesystem)  
[`fn .withRequiredDropCapabilities`](#fn-withrequireddropcapabilities)  
[`fn .withVolumes`](#fn-withvolumes)  
[`fn fsGroup.withRanges`](#fn-fsgroupwithranges)  
[`fn fsGroup.withRule`](#fn-fsgroupwithrule)  
[`fn runAsGroup.withRanges`](#fn-runasgroupwithranges)  
[`fn runAsGroup.withRule`](#fn-runasgroupwithrule)  
[`fn runAsUser.withRanges`](#fn-runasuserwithranges)  
[`fn runAsUser.withRule`](#fn-runasuserwithrule)  
[`fn runtimeClass.withAllowedRuntimeClassNames`](#fn-runtimeclasswithallowedruntimeclassnames)  
[`fn runtimeClass.withDefaultRuntimeClassName`](#fn-runtimeclasswithdefaultruntimeclassname)  
[`fn seLinux.seLinuxOptions.withLevel`](#fn-selinuxselinuxoptionswithlevel)  
[`fn seLinux.seLinuxOptions.withRole`](#fn-selinuxselinuxoptionswithrole)  
[`fn seLinux.seLinuxOptions.withType`](#fn-selinuxselinuxoptionswithtype)  
[`fn seLinux.seLinuxOptions.withUser`](#fn-selinuxselinuxoptionswithuser)  
[`fn seLinux.withRule`](#fn-selinuxwithrule)  
[`fn supplementalGroups.withRanges`](#fn-supplementalgroupswithranges)  
[`fn supplementalGroups.withRule`](#fn-supplementalgroupswithrule)  

---


### `fn .withAllowPrivilegeEscalation`
allowPrivilegeEscalation determines if a pod can request to allow privilege escalation. If unspecified, defaults to true.
```jsonnet
{
  withAllowPrivilegeEscalation(allowPrivilegeEscalation):: {}
}
```

### `fn .withAllowedCSIDrivers`
AllowedCSIDrivers is a whitelist of inline CSI drivers that must be explicitly set to be embedded within a pod spec. An empty value indicates that any CSI driver can be used for inline ephemeral volumes.
```jsonnet
{
  withAllowedCSIDrivers(allowedCSIDrivers):: {}
}
```

### `fn .withAllowedCapabilities`
allowedCapabilities is a list of capabilities that can be requested to add to the container. Capabilities in this field may be added at the pod author's discretion. You must not list a capability in both allowedCapabilities and requiredDropCapabilities.
```jsonnet
{
  withAllowedCapabilities(allowedCapabilities):: {}
}
```

### `fn .withAllowedFlexVolumes`
allowedFlexVolumes is a whitelist of allowed Flexvolumes.  Empty or nil indicates that all Flexvolumes may be used.  This parameter is effective only when the usage of the Flexvolumes is allowed in the "volumes" field.
```jsonnet
{
  withAllowedFlexVolumes(allowedFlexVolumes):: {}
}
```

### `fn .withAllowedHostPaths`
allowedHostPaths is a white list of allowed host paths. Empty indicates that all host paths may be used.
```jsonnet
{
  withAllowedHostPaths(allowedHostPaths):: {}
}
```

### `fn .withAllowedProcMountTypes`
AllowedProcMountTypes is a whitelist of allowed ProcMountTypes. Empty or nil indicates that only the DefaultProcMountType may be used. This requires the ProcMountType feature flag to be enabled.
```jsonnet
{
  withAllowedProcMountTypes(allowedProcMountTypes):: {}
}
```

### `fn .withAllowedUnsafeSysctls`
allowedUnsafeSysctls is a list of explicitly allowed unsafe sysctls, defaults to none. Each entry is either a plain sysctl name or ends in "*" in which case it is considered as a prefix of allowed sysctls. Single * means all unsafe sysctls are allowed. Kubelet has to whitelist all allowed unsafe sysctls explicitly to avoid rejection.

Examples: e.g. "foo/*" allows "foo/bar", "foo/baz", etc. e.g. "foo.*" allows "foo.bar", "foo.baz", etc.
```jsonnet
{
  withAllowedUnsafeSysctls(allowedUnsafeSysctls):: {}
}
```

### `fn .withDefaultAddCapabilities`
defaultAddCapabilities is the default set of capabilities that will be added to the container unless the pod spec specifically drops the capability.  You may not list a capability in both defaultAddCapabilities and requiredDropCapabilities. Capabilities added here are implicitly allowed, and need not be included in the allowedCapabilities list.
```jsonnet
{
  withDefaultAddCapabilities(defaultAddCapabilities):: {}
}
```

### `fn .withDefaultAllowPrivilegeEscalation`
defaultAllowPrivilegeEscalation controls the default setting for whether a process can gain more privileges than its parent process.
```jsonnet
{
  withDefaultAllowPrivilegeEscalation(defaultAllowPrivilegeEscalation):: {}
}
```

### `fn .withForbiddenSysctls`
forbiddenSysctls is a list of explicitly forbidden sysctls, defaults to none. Each entry is either a plain sysctl name or ends in "*" in which case it is considered as a prefix of forbidden sysctls. Single * means all sysctls are forbidden.

Examples: e.g. "foo/*" forbids "foo/bar", "foo/baz", etc. e.g. "foo.*" forbids "foo.bar", "foo.baz", etc.
```jsonnet
{
  withForbiddenSysctls(forbiddenSysctls):: {}
}
```

### `fn .withHostIPC`
hostIPC determines if the policy allows the use of HostIPC in the pod spec.
```jsonnet
{
  withHostIPC(hostIPC):: {}
}
```

### `fn .withHostNetwork`
hostNetwork determines if the policy allows the use of HostNetwork in the pod spec.
```jsonnet
{
  withHostNetwork(hostNetwork):: {}
}
```

### `fn .withHostPID`
hostPID determines if the policy allows the use of HostPID in the pod spec.
```jsonnet
{
  withHostPID(hostPID):: {}
}
```

### `fn .withHostPorts`
hostPorts determines which host port ranges are allowed to be exposed.
```jsonnet
{
  withHostPorts(hostPorts):: {}
}
```

### `fn .withPrivileged`
privileged determines if a pod can request to be run as privileged.
```jsonnet
{
  withPrivileged(privileged):: {}
}
```

### `fn .withReadOnlyRootFilesystem`
readOnlyRootFilesystem when set to true will force containers to run with a read only root file system.  If the container specifically requests to run with a non-read only root file system the PSP should deny the pod. If set to false the container may run with a read only root file system if it wishes but it will not be forced to.
```jsonnet
{
  withReadOnlyRootFilesystem(readOnlyRootFilesystem):: {}
}
```

### `fn .withRequiredDropCapabilities`
requiredDropCapabilities are the capabilities that will be dropped from the container.  These are required to be dropped and cannot be added.
```jsonnet
{
  withRequiredDropCapabilities(requiredDropCapabilities):: {}
}
```

### `fn .withVolumes`
volumes is a white list of allowed volume plugins. Empty indicates that no volumes may be used. To allow all volumes you may use '*'.
```jsonnet
{
  withVolumes(volumes):: {}
}
```

### `fn fsGroup.withRanges`
ranges are the allowed ranges of fs groups.  If you would like to force a single fs group then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn fsGroup.withRule`
rule is the strategy that will dictate what FSGroup is used in the SecurityContext.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn runAsGroup.withRanges`
ranges are the allowed ranges of gids that may be used. If you would like to force a single gid then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn runAsGroup.withRule`
rule is the strategy that will dictate the allowable RunAsGroup values that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn runAsUser.withRanges`
ranges are the allowed ranges of uids that may be used. If you would like to force a single uid then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn runAsUser.withRule`
rule is the strategy that will dictate the allowable RunAsUser values that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn runtimeClass.withAllowedRuntimeClassNames`
allowedRuntimeClassNames is a whitelist of RuntimeClass names that may be specified on a pod. A value of "*" means that any RuntimeClass name is allowed, and must be the only item in the list. An empty list requires the RuntimeClassName field to be unset.
```jsonnet
{
  withAllowedRuntimeClassNames(allowedRuntimeClassNames):: {}
}
```

### `fn runtimeClass.withDefaultRuntimeClassName`
defaultRuntimeClassName is the default RuntimeClassName to set on the pod. The default MUST be allowed by the allowedRuntimeClassNames list. A value of nil does not mutate the Pod.
```jsonnet
{
  withDefaultRuntimeClassName(defaultRuntimeClassName):: {}
}
```

### `fn seLinux.seLinuxOptions.withLevel`
Level is SELinux level label that applies to the container.
```jsonnet
{
  withLevel(level):: {}
}
```

### `fn seLinux.seLinuxOptions.withRole`
Role is a SELinux role label that applies to the container.
```jsonnet
{
  withRole(role):: {}
}
```

### `fn seLinux.seLinuxOptions.withType`
Type is a SELinux type label that applies to the container.
```jsonnet
{
  withType(type):: {}
}
```

### `fn seLinux.seLinuxOptions.withUser`
User is a SELinux user label that applies to the container.
```jsonnet
{
  withUser(user):: {}
}
```

### `fn seLinux.withRule`
rule is the strategy that will dictate the allowable labels that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn supplementalGroups.withRanges`
ranges are the allowed ranges of supplemental groups.  If you would like to force a single supplemental group then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn supplementalGroups.withRule`
rule is the strategy that will dictate what supplemental groups is used in the SecurityContext.
```jsonnet
{
  withRule(rule):: {}
}
```

