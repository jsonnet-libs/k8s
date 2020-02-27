
## podSecurityPolicy
PodSecurityPolicy governs the ability to make requests that affect the Security Context that will be applied to a pod and container.

**Functions:**

[`fn new`](#fn-new)  
[`fn metadata.withAnnotations`](#fn-metadatawithannotations)  
[`fn metadata.withClusterName`](#fn-metadatawithclustername)  
[`fn metadata.withCreationTimestamp`](#fn-metadatawithcreationtimestamp)  
[`fn metadata.withDeletionGracePeriodSeconds`](#fn-metadatawithdeletiongraceperiodseconds)  
[`fn metadata.withDeletionTimestamp`](#fn-metadatawithdeletiontimestamp)  
[`fn metadata.withFinalizers`](#fn-metadatawithfinalizers)  
[`fn metadata.withGenerateName`](#fn-metadatawithgeneratename)  
[`fn metadata.withGeneration`](#fn-metadatawithgeneration)  
[`fn metadata.withLabels`](#fn-metadatawithlabels)  
[`fn metadata.withManagedFields`](#fn-metadatawithmanagedfields)  
[`fn metadata.withName`](#fn-metadatawithname)  
[`fn metadata.withNamespace`](#fn-metadatawithnamespace)  
[`fn metadata.withOwnerReferences`](#fn-metadatawithownerreferences)  
[`fn metadata.withResourceVersion`](#fn-metadatawithresourceversion)  
[`fn metadata.withSelfLink`](#fn-metadatawithselflink)  
[`fn metadata.withUid`](#fn-metadatawithuid)  
[`fn spec.fsGroup.withRanges`](#fn-specfsgroupwithranges)  
[`fn spec.fsGroup.withRule`](#fn-specfsgroupwithrule)  
[`fn spec.runAsGroup.withRanges`](#fn-specrunasgroupwithranges)  
[`fn spec.runAsGroup.withRule`](#fn-specrunasgroupwithrule)  
[`fn spec.runAsUser.withRanges`](#fn-specrunasuserwithranges)  
[`fn spec.runAsUser.withRule`](#fn-specrunasuserwithrule)  
[`fn spec.runtimeClass.withAllowedRuntimeClassNames`](#fn-specruntimeclasswithallowedruntimeclassnames)  
[`fn spec.runtimeClass.withDefaultRuntimeClassName`](#fn-specruntimeclasswithdefaultruntimeclassname)  
[`fn spec.seLinux.seLinuxOptions.withLevel`](#fn-specselinuxselinuxoptionswithlevel)  
[`fn spec.seLinux.seLinuxOptions.withRole`](#fn-specselinuxselinuxoptionswithrole)  
[`fn spec.seLinux.seLinuxOptions.withType`](#fn-specselinuxselinuxoptionswithtype)  
[`fn spec.seLinux.seLinuxOptions.withUser`](#fn-specselinuxselinuxoptionswithuser)  
[`fn spec.seLinux.withRule`](#fn-specselinuxwithrule)  
[`fn spec.supplementalGroups.withRanges`](#fn-specsupplementalgroupswithranges)  
[`fn spec.supplementalGroups.withRule`](#fn-specsupplementalgroupswithrule)  
[`fn spec.withAllowPrivilegeEscalation`](#fn-specwithallowprivilegeescalation)  
[`fn spec.withAllowedCSIDrivers`](#fn-specwithallowedcsidrivers)  
[`fn spec.withAllowedCapabilities`](#fn-specwithallowedcapabilities)  
[`fn spec.withAllowedFlexVolumes`](#fn-specwithallowedflexvolumes)  
[`fn spec.withAllowedHostPaths`](#fn-specwithallowedhostpaths)  
[`fn spec.withAllowedProcMountTypes`](#fn-specwithallowedprocmounttypes)  
[`fn spec.withAllowedUnsafeSysctls`](#fn-specwithallowedunsafesysctls)  
[`fn spec.withDefaultAddCapabilities`](#fn-specwithdefaultaddcapabilities)  
[`fn spec.withDefaultAllowPrivilegeEscalation`](#fn-specwithdefaultallowprivilegeescalation)  
[`fn spec.withForbiddenSysctls`](#fn-specwithforbiddensysctls)  
[`fn spec.withHostIPC`](#fn-specwithhostipc)  
[`fn spec.withHostNetwork`](#fn-specwithhostnetwork)  
[`fn spec.withHostPID`](#fn-specwithhostpid)  
[`fn spec.withHostPorts`](#fn-specwithhostports)  
[`fn spec.withPrivileged`](#fn-specwithprivileged)  
[`fn spec.withReadOnlyRootFilesystem`](#fn-specwithreadonlyrootfilesystem)  
[`fn spec.withRequiredDropCapabilities`](#fn-specwithrequireddropcapabilities)  
[`fn spec.withVolumes`](#fn-specwithvolumes)  

---


### `fn new`
new returns an instance of Podsecuritypolicy
```jsonnet
{
  new(name):: {}
}
```

### `fn metadata.withAnnotations`
Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations
```jsonnet
{
  withAnnotations(annotations):: {}
}
```

### `fn metadata.withClusterName`
The name of the cluster which the object belongs to. This is used to distinguish resources with same name and namespace in different clusters. This field is not set anywhere right now and apiserver is going to ignore it if set in create or update request.
```jsonnet
{
  withClusterName(clusterName):: {}
}
```

### `fn metadata.withCreationTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withCreationTimestamp(creationTimestamp):: {}
}
```

### `fn metadata.withDeletionGracePeriodSeconds`
Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only.
```jsonnet
{
  withDeletionGracePeriodSeconds(deletionGracePeriodSeconds):: {}
}
```

### `fn metadata.withDeletionTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withDeletionTimestamp(deletionTimestamp):: {}
}
```

### `fn metadata.withFinalizers`
Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed.
```jsonnet
{
  withFinalizers(finalizers):: {}
}
```

### `fn metadata.withGenerateName`
GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided. If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with a unique suffix. The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.

If this field is specified and the generated name exists, the server will NOT return a 409 - instead, it will either return 201 Created or 500 with Reason ServerTimeout indicating a unique name could not be found in the time allotted, and the client should retry (optionally after the time indicated in the Retry-After header).

Applied only if Name is not specified. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
```jsonnet
{
  withGenerateName(generateName):: {}
}
```

### `fn metadata.withGeneration`
A sequence number representing a specific generation of the desired state. Populated by the system. Read-only.
```jsonnet
{
  withGeneration(generation):: {}
}
```

### `fn metadata.withLabels`
Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels
```jsonnet
{
  withLabels(labels):: {}
}
```

### `fn metadata.withManagedFields`
ManagedFields maps workflow-id and version to the set of fields that are managed by that workflow. This is mostly for internal housekeeping, and users typically shouldn't need to set or understand this field. A workflow can be the user's name, a controller's name, or the name of a specific apply path like "ci-cd". The set of fields is always in the version that the workflow used when modifying the object.
```jsonnet
{
  withManagedFields(managedFields):: {}
}
```

### `fn metadata.withName`
Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn metadata.withNamespace`
Namespace defines the space within each name must be unique. An empty namespace is equivalent to the "default" namespace, but "default" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.

Must be a DNS_LABEL. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/namespaces
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn metadata.withOwnerReferences`
List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller.
```jsonnet
{
  withOwnerReferences(ownerReferences):: {}
}
```

### `fn metadata.withResourceVersion`
An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.

Populated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn metadata.withSelfLink`
SelfLink is a URL representing this object. Populated by the system. Read-only.

DEPRECATED Kubernetes will stop propagating this field in 1.20 release and the field is planned to be removed in 1.21 release.
```jsonnet
{
  withSelfLink(selfLink):: {}
}
```

### `fn metadata.withUid`
UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.

Populated by the system. Read-only. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn spec.fsGroup.withRanges`
ranges are the allowed ranges of fs groups.  If you would like to force a single fs group then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn spec.fsGroup.withRule`
rule is the strategy that will dictate what FSGroup is used in the SecurityContext.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn spec.runAsGroup.withRanges`
ranges are the allowed ranges of gids that may be used. If you would like to force a single gid then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn spec.runAsGroup.withRule`
rule is the strategy that will dictate the allowable RunAsGroup values that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn spec.runAsUser.withRanges`
ranges are the allowed ranges of uids that may be used. If you would like to force a single uid then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn spec.runAsUser.withRule`
rule is the strategy that will dictate the allowable RunAsUser values that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn spec.runtimeClass.withAllowedRuntimeClassNames`
allowedRuntimeClassNames is a whitelist of RuntimeClass names that may be specified on a pod. A value of "*" means that any RuntimeClass name is allowed, and must be the only item in the list. An empty list requires the RuntimeClassName field to be unset.
```jsonnet
{
  withAllowedRuntimeClassNames(allowedRuntimeClassNames):: {}
}
```

### `fn spec.runtimeClass.withDefaultRuntimeClassName`
defaultRuntimeClassName is the default RuntimeClassName to set on the pod. The default MUST be allowed by the allowedRuntimeClassNames list. A value of nil does not mutate the Pod.
```jsonnet
{
  withDefaultRuntimeClassName(defaultRuntimeClassName):: {}
}
```

### `fn spec.seLinux.seLinuxOptions.withLevel`
Level is SELinux level label that applies to the container.
```jsonnet
{
  withLevel(level):: {}
}
```

### `fn spec.seLinux.seLinuxOptions.withRole`
Role is a SELinux role label that applies to the container.
```jsonnet
{
  withRole(role):: {}
}
```

### `fn spec.seLinux.seLinuxOptions.withType`
Type is a SELinux type label that applies to the container.
```jsonnet
{
  withType(type):: {}
}
```

### `fn spec.seLinux.seLinuxOptions.withUser`
User is a SELinux user label that applies to the container.
```jsonnet
{
  withUser(user):: {}
}
```

### `fn spec.seLinux.withRule`
rule is the strategy that will dictate the allowable labels that may be set.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn spec.supplementalGroups.withRanges`
ranges are the allowed ranges of supplemental groups.  If you would like to force a single supplemental group then supply a single range with the same start and end. Required for MustRunAs.
```jsonnet
{
  withRanges(ranges):: {}
}
```

### `fn spec.supplementalGroups.withRule`
rule is the strategy that will dictate what supplemental groups is used in the SecurityContext.
```jsonnet
{
  withRule(rule):: {}
}
```

### `fn spec.withAllowPrivilegeEscalation`
allowPrivilegeEscalation determines if a pod can request to allow privilege escalation. If unspecified, defaults to true.
```jsonnet
{
  withAllowPrivilegeEscalation(allowPrivilegeEscalation):: {}
}
```

### `fn spec.withAllowedCSIDrivers`
AllowedCSIDrivers is a whitelist of inline CSI drivers that must be explicitly set to be embedded within a pod spec. An empty value indicates that any CSI driver can be used for inline ephemeral volumes. This is an alpha field, and is only honored if the API server enables the CSIInlineVolume feature gate.
```jsonnet
{
  withAllowedCSIDrivers(allowedCSIDrivers):: {}
}
```

### `fn spec.withAllowedCapabilities`
allowedCapabilities is a list of capabilities that can be requested to add to the container. Capabilities in this field may be added at the pod author's discretion. You must not list a capability in both allowedCapabilities and requiredDropCapabilities.
```jsonnet
{
  withAllowedCapabilities(allowedCapabilities):: {}
}
```

### `fn spec.withAllowedFlexVolumes`
allowedFlexVolumes is a whitelist of allowed Flexvolumes.  Empty or nil indicates that all Flexvolumes may be used.  This parameter is effective only when the usage of the Flexvolumes is allowed in the "volumes" field.
```jsonnet
{
  withAllowedFlexVolumes(allowedFlexVolumes):: {}
}
```

### `fn spec.withAllowedHostPaths`
allowedHostPaths is a white list of allowed host paths. Empty indicates that all host paths may be used.
```jsonnet
{
  withAllowedHostPaths(allowedHostPaths):: {}
}
```

### `fn spec.withAllowedProcMountTypes`
AllowedProcMountTypes is a whitelist of allowed ProcMountTypes. Empty or nil indicates that only the DefaultProcMountType may be used. This requires the ProcMountType feature flag to be enabled.
```jsonnet
{
  withAllowedProcMountTypes(allowedProcMountTypes):: {}
}
```

### `fn spec.withAllowedUnsafeSysctls`
allowedUnsafeSysctls is a list of explicitly allowed unsafe sysctls, defaults to none. Each entry is either a plain sysctl name or ends in "*" in which case it is considered as a prefix of allowed sysctls. Single * means all unsafe sysctls are allowed. Kubelet has to whitelist all allowed unsafe sysctls explicitly to avoid rejection.

Examples: e.g. "foo/*" allows "foo/bar", "foo/baz", etc. e.g. "foo.*" allows "foo.bar", "foo.baz", etc.
```jsonnet
{
  withAllowedUnsafeSysctls(allowedUnsafeSysctls):: {}
}
```

### `fn spec.withDefaultAddCapabilities`
defaultAddCapabilities is the default set of capabilities that will be added to the container unless the pod spec specifically drops the capability.  You may not list a capability in both defaultAddCapabilities and requiredDropCapabilities. Capabilities added here are implicitly allowed, and need not be included in the allowedCapabilities list.
```jsonnet
{
  withDefaultAddCapabilities(defaultAddCapabilities):: {}
}
```

### `fn spec.withDefaultAllowPrivilegeEscalation`
defaultAllowPrivilegeEscalation controls the default setting for whether a process can gain more privileges than its parent process.
```jsonnet
{
  withDefaultAllowPrivilegeEscalation(defaultAllowPrivilegeEscalation):: {}
}
```

### `fn spec.withForbiddenSysctls`
forbiddenSysctls is a list of explicitly forbidden sysctls, defaults to none. Each entry is either a plain sysctl name or ends in "*" in which case it is considered as a prefix of forbidden sysctls. Single * means all sysctls are forbidden.

Examples: e.g. "foo/*" forbids "foo/bar", "foo/baz", etc. e.g. "foo.*" forbids "foo.bar", "foo.baz", etc.
```jsonnet
{
  withForbiddenSysctls(forbiddenSysctls):: {}
}
```

### `fn spec.withHostIPC`
hostIPC determines if the policy allows the use of HostIPC in the pod spec.
```jsonnet
{
  withHostIPC(hostIPC):: {}
}
```

### `fn spec.withHostNetwork`
hostNetwork determines if the policy allows the use of HostNetwork in the pod spec.
```jsonnet
{
  withHostNetwork(hostNetwork):: {}
}
```

### `fn spec.withHostPID`
hostPID determines if the policy allows the use of HostPID in the pod spec.
```jsonnet
{
  withHostPID(hostPID):: {}
}
```

### `fn spec.withHostPorts`
hostPorts determines which host port ranges are allowed to be exposed.
```jsonnet
{
  withHostPorts(hostPorts):: {}
}
```

### `fn spec.withPrivileged`
privileged determines if a pod can request to be run as privileged.
```jsonnet
{
  withPrivileged(privileged):: {}
}
```

### `fn spec.withReadOnlyRootFilesystem`
readOnlyRootFilesystem when set to true will force containers to run with a read only root file system.  If the container specifically requests to run with a non-read only root file system the PSP should deny the pod. If set to false the container may run with a read only root file system if it wishes but it will not be forced to.
```jsonnet
{
  withReadOnlyRootFilesystem(readOnlyRootFilesystem):: {}
}
```

### `fn spec.withRequiredDropCapabilities`
requiredDropCapabilities are the capabilities that will be dropped from the container.  These are required to be dropped and cannot be added.
```jsonnet
{
  withRequiredDropCapabilities(requiredDropCapabilities):: {}
}
```

### `fn spec.withVolumes`
volumes is a white list of allowed volume plugins. Empty indicates that no volumes may be used. To allow all volumes you may use '*'.
```jsonnet
{
  withVolumes(volumes):: {}
}
```

