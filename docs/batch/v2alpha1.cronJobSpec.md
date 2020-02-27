
## cronJobSpec
CronJobSpec describes how the job execution will look like and when it will actually run.

**Functions:**

[`fn .withConcurrencyPolicy`](#fn-withconcurrencypolicy)  
[`fn .withFailedJobsHistoryLimit`](#fn-withfailedjobshistorylimit)  
[`fn .withSchedule`](#fn-withschedule)  
[`fn .withStartingDeadlineSeconds`](#fn-withstartingdeadlineseconds)  
[`fn .withSuccessfulJobsHistoryLimit`](#fn-withsuccessfuljobshistorylimit)  
[`fn .withSuspend`](#fn-withsuspend)  
[`fn jobTemplate.metadata.withAnnotations`](#fn-jobtemplatemetadatawithannotations)  
[`fn jobTemplate.metadata.withClusterName`](#fn-jobtemplatemetadatawithclustername)  
[`fn jobTemplate.metadata.withCreationTimestamp`](#fn-jobtemplatemetadatawithcreationtimestamp)  
[`fn jobTemplate.metadata.withDeletionGracePeriodSeconds`](#fn-jobtemplatemetadatawithdeletiongraceperiodseconds)  
[`fn jobTemplate.metadata.withDeletionTimestamp`](#fn-jobtemplatemetadatawithdeletiontimestamp)  
[`fn jobTemplate.metadata.withFinalizers`](#fn-jobtemplatemetadatawithfinalizers)  
[`fn jobTemplate.metadata.withGenerateName`](#fn-jobtemplatemetadatawithgeneratename)  
[`fn jobTemplate.metadata.withGeneration`](#fn-jobtemplatemetadatawithgeneration)  
[`fn jobTemplate.metadata.withLabels`](#fn-jobtemplatemetadatawithlabels)  
[`fn jobTemplate.metadata.withManagedFields`](#fn-jobtemplatemetadatawithmanagedfields)  
[`fn jobTemplate.metadata.withName`](#fn-jobtemplatemetadatawithname)  
[`fn jobTemplate.metadata.withNamespace`](#fn-jobtemplatemetadatawithnamespace)  
[`fn jobTemplate.metadata.withOwnerReferences`](#fn-jobtemplatemetadatawithownerreferences)  
[`fn jobTemplate.metadata.withResourceVersion`](#fn-jobtemplatemetadatawithresourceversion)  
[`fn jobTemplate.metadata.withSelfLink`](#fn-jobtemplatemetadatawithselflink)  
[`fn jobTemplate.metadata.withUid`](#fn-jobtemplatemetadatawithuid)  
[`fn jobTemplate.spec.selector.withMatchExpressions`](#fn-jobtemplatespecselectorwithmatchexpressions)  
[`fn jobTemplate.spec.selector.withMatchLabels`](#fn-jobtemplatespecselectorwithmatchlabels)  
[`fn jobTemplate.spec.template.metadata.withAnnotations`](#fn-jobtemplatespectemplatemetadatawithannotations)  
[`fn jobTemplate.spec.template.metadata.withClusterName`](#fn-jobtemplatespectemplatemetadatawithclustername)  
[`fn jobTemplate.spec.template.metadata.withCreationTimestamp`](#fn-jobtemplatespectemplatemetadatawithcreationtimestamp)  
[`fn jobTemplate.spec.template.metadata.withDeletionGracePeriodSeconds`](#fn-jobtemplatespectemplatemetadatawithdeletiongraceperiodseconds)  
[`fn jobTemplate.spec.template.metadata.withDeletionTimestamp`](#fn-jobtemplatespectemplatemetadatawithdeletiontimestamp)  
[`fn jobTemplate.spec.template.metadata.withFinalizers`](#fn-jobtemplatespectemplatemetadatawithfinalizers)  
[`fn jobTemplate.spec.template.metadata.withGenerateName`](#fn-jobtemplatespectemplatemetadatawithgeneratename)  
[`fn jobTemplate.spec.template.metadata.withGeneration`](#fn-jobtemplatespectemplatemetadatawithgeneration)  
[`fn jobTemplate.spec.template.metadata.withLabels`](#fn-jobtemplatespectemplatemetadatawithlabels)  
[`fn jobTemplate.spec.template.metadata.withManagedFields`](#fn-jobtemplatespectemplatemetadatawithmanagedfields)  
[`fn jobTemplate.spec.template.metadata.withName`](#fn-jobtemplatespectemplatemetadatawithname)  
[`fn jobTemplate.spec.template.metadata.withNamespace`](#fn-jobtemplatespectemplatemetadatawithnamespace)  
[`fn jobTemplate.spec.template.metadata.withOwnerReferences`](#fn-jobtemplatespectemplatemetadatawithownerreferences)  
[`fn jobTemplate.spec.template.metadata.withResourceVersion`](#fn-jobtemplatespectemplatemetadatawithresourceversion)  
[`fn jobTemplate.spec.template.metadata.withSelfLink`](#fn-jobtemplatespectemplatemetadatawithselflink)  
[`fn jobTemplate.spec.template.metadata.withUid`](#fn-jobtemplatespectemplatemetadatawithuid)  
[`fn jobTemplate.spec.template.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.withNodeSelectorTerms`](#fn-jobtemplatespectemplatespecaffinitynodeaffinityrequiredduringschedulingignoredduringexecutionwithnodeselectorterms)  
[`fn jobTemplate.spec.template.spec.affinity.nodeAffinity.withPreferredDuringSchedulingIgnoredDuringExecution`](#fn-jobtemplatespectemplatespecaffinitynodeaffinitywithpreferredduringschedulingignoredduringexecution)  
[`fn jobTemplate.spec.template.spec.affinity.podAffinity.withPreferredDuringSchedulingIgnoredDuringExecution`](#fn-jobtemplatespectemplatespecaffinitypodaffinitywithpreferredduringschedulingignoredduringexecution)  
[`fn jobTemplate.spec.template.spec.affinity.podAffinity.withRequiredDuringSchedulingIgnoredDuringExecution`](#fn-jobtemplatespectemplatespecaffinitypodaffinitywithrequiredduringschedulingignoredduringexecution)  
[`fn jobTemplate.spec.template.spec.affinity.podAntiAffinity.withPreferredDuringSchedulingIgnoredDuringExecution`](#fn-jobtemplatespectemplatespecaffinitypodantiaffinitywithpreferredduringschedulingignoredduringexecution)  
[`fn jobTemplate.spec.template.spec.affinity.podAntiAffinity.withRequiredDuringSchedulingIgnoredDuringExecution`](#fn-jobtemplatespectemplatespecaffinitypodantiaffinitywithrequiredduringschedulingignoredduringexecution)  
[`fn jobTemplate.spec.template.spec.dnsConfig.withNameservers`](#fn-jobtemplatespectemplatespecdnsconfigwithnameservers)  
[`fn jobTemplate.spec.template.spec.dnsConfig.withOptions`](#fn-jobtemplatespectemplatespecdnsconfigwithoptions)  
[`fn jobTemplate.spec.template.spec.dnsConfig.withSearches`](#fn-jobtemplatespectemplatespecdnsconfigwithsearches)  
[`fn jobTemplate.spec.template.spec.securityContext.seLinuxOptions.withLevel`](#fn-jobtemplatespectemplatespecsecuritycontextselinuxoptionswithlevel)  
[`fn jobTemplate.spec.template.spec.securityContext.seLinuxOptions.withRole`](#fn-jobtemplatespectemplatespecsecuritycontextselinuxoptionswithrole)  
[`fn jobTemplate.spec.template.spec.securityContext.seLinuxOptions.withType`](#fn-jobtemplatespectemplatespecsecuritycontextselinuxoptionswithtype)  
[`fn jobTemplate.spec.template.spec.securityContext.seLinuxOptions.withUser`](#fn-jobtemplatespectemplatespecsecuritycontextselinuxoptionswithuser)  
[`fn jobTemplate.spec.template.spec.securityContext.windowsOptions.withGmsaCredentialSpec`](#fn-jobtemplatespectemplatespecsecuritycontextwindowsoptionswithgmsacredentialspec)  
[`fn jobTemplate.spec.template.spec.securityContext.windowsOptions.withGmsaCredentialSpecName`](#fn-jobtemplatespectemplatespecsecuritycontextwindowsoptionswithgmsacredentialspecname)  
[`fn jobTemplate.spec.template.spec.securityContext.windowsOptions.withRunAsUserName`](#fn-jobtemplatespectemplatespecsecuritycontextwindowsoptionswithrunasusername)  
[`fn jobTemplate.spec.template.spec.securityContext.withFsGroup`](#fn-jobtemplatespectemplatespecsecuritycontextwithfsgroup)  
[`fn jobTemplate.spec.template.spec.securityContext.withRunAsGroup`](#fn-jobtemplatespectemplatespecsecuritycontextwithrunasgroup)  
[`fn jobTemplate.spec.template.spec.securityContext.withRunAsNonRoot`](#fn-jobtemplatespectemplatespecsecuritycontextwithrunasnonroot)  
[`fn jobTemplate.spec.template.spec.securityContext.withRunAsUser`](#fn-jobtemplatespectemplatespecsecuritycontextwithrunasuser)  
[`fn jobTemplate.spec.template.spec.securityContext.withSupplementalGroups`](#fn-jobtemplatespectemplatespecsecuritycontextwithsupplementalgroups)  
[`fn jobTemplate.spec.template.spec.securityContext.withSysctls`](#fn-jobtemplatespectemplatespecsecuritycontextwithsysctls)  
[`fn jobTemplate.spec.template.spec.withActiveDeadlineSeconds`](#fn-jobtemplatespectemplatespecwithactivedeadlineseconds)  
[`fn jobTemplate.spec.template.spec.withAutomountServiceAccountToken`](#fn-jobtemplatespectemplatespecwithautomountserviceaccounttoken)  
[`fn jobTemplate.spec.template.spec.withContainers`](#fn-jobtemplatespectemplatespecwithcontainers)  
[`fn jobTemplate.spec.template.spec.withDnsPolicy`](#fn-jobtemplatespectemplatespecwithdnspolicy)  
[`fn jobTemplate.spec.template.spec.withEnableServiceLinks`](#fn-jobtemplatespectemplatespecwithenableservicelinks)  
[`fn jobTemplate.spec.template.spec.withEphemeralContainers`](#fn-jobtemplatespectemplatespecwithephemeralcontainers)  
[`fn jobTemplate.spec.template.spec.withHostAliases`](#fn-jobtemplatespectemplatespecwithhostaliases)  
[`fn jobTemplate.spec.template.spec.withHostIPC`](#fn-jobtemplatespectemplatespecwithhostipc)  
[`fn jobTemplate.spec.template.spec.withHostNetwork`](#fn-jobtemplatespectemplatespecwithhostnetwork)  
[`fn jobTemplate.spec.template.spec.withHostPID`](#fn-jobtemplatespectemplatespecwithhostpid)  
[`fn jobTemplate.spec.template.spec.withHostname`](#fn-jobtemplatespectemplatespecwithhostname)  
[`fn jobTemplate.spec.template.spec.withImagePullSecrets`](#fn-jobtemplatespectemplatespecwithimagepullsecrets)  
[`fn jobTemplate.spec.template.spec.withInitContainers`](#fn-jobtemplatespectemplatespecwithinitcontainers)  
[`fn jobTemplate.spec.template.spec.withNodeName`](#fn-jobtemplatespectemplatespecwithnodename)  
[`fn jobTemplate.spec.template.spec.withNodeSelector`](#fn-jobtemplatespectemplatespecwithnodeselector)  
[`fn jobTemplate.spec.template.spec.withOverhead`](#fn-jobtemplatespectemplatespecwithoverhead)  
[`fn jobTemplate.spec.template.spec.withPreemptionPolicy`](#fn-jobtemplatespectemplatespecwithpreemptionpolicy)  
[`fn jobTemplate.spec.template.spec.withPriority`](#fn-jobtemplatespectemplatespecwithpriority)  
[`fn jobTemplate.spec.template.spec.withPriorityClassName`](#fn-jobtemplatespectemplatespecwithpriorityclassname)  
[`fn jobTemplate.spec.template.spec.withReadinessGates`](#fn-jobtemplatespectemplatespecwithreadinessgates)  
[`fn jobTemplate.spec.template.spec.withRestartPolicy`](#fn-jobtemplatespectemplatespecwithrestartpolicy)  
[`fn jobTemplate.spec.template.spec.withRuntimeClassName`](#fn-jobtemplatespectemplatespecwithruntimeclassname)  
[`fn jobTemplate.spec.template.spec.withSchedulerName`](#fn-jobtemplatespectemplatespecwithschedulername)  
[`fn jobTemplate.spec.template.spec.withServiceAccount`](#fn-jobtemplatespectemplatespecwithserviceaccount)  
[`fn jobTemplate.spec.template.spec.withServiceAccountName`](#fn-jobtemplatespectemplatespecwithserviceaccountname)  
[`fn jobTemplate.spec.template.spec.withShareProcessNamespace`](#fn-jobtemplatespectemplatespecwithshareprocessnamespace)  
[`fn jobTemplate.spec.template.spec.withSubdomain`](#fn-jobtemplatespectemplatespecwithsubdomain)  
[`fn jobTemplate.spec.template.spec.withTerminationGracePeriodSeconds`](#fn-jobtemplatespectemplatespecwithterminationgraceperiodseconds)  
[`fn jobTemplate.spec.template.spec.withTolerations`](#fn-jobtemplatespectemplatespecwithtolerations)  
[`fn jobTemplate.spec.template.spec.withTopologySpreadConstraints`](#fn-jobtemplatespectemplatespecwithtopologyspreadconstraints)  
[`fn jobTemplate.spec.template.spec.withVolumes`](#fn-jobtemplatespectemplatespecwithvolumes)  
[`fn jobTemplate.spec.withActiveDeadlineSeconds`](#fn-jobtemplatespecwithactivedeadlineseconds)  
[`fn jobTemplate.spec.withBackoffLimit`](#fn-jobtemplatespecwithbackofflimit)  
[`fn jobTemplate.spec.withCompletions`](#fn-jobtemplatespecwithcompletions)  
[`fn jobTemplate.spec.withManualSelector`](#fn-jobtemplatespecwithmanualselector)  
[`fn jobTemplate.spec.withParallelism`](#fn-jobtemplatespecwithparallelism)  
[`fn jobTemplate.spec.withTtlSecondsAfterFinished`](#fn-jobtemplatespecwithttlsecondsafterfinished)  

---


### `fn .withConcurrencyPolicy`
Specifies how to treat concurrent executions of a Job. Valid values are: - "Allow" (default): allows CronJobs to run concurrently; - "Forbid": forbids concurrent runs, skipping next run if previous run hasn't finished yet; - "Replace": cancels currently running job and replaces it with a new one
```jsonnet
{
  withConcurrencyPolicy(concurrencyPolicy):: {}
}
```

### `fn .withFailedJobsHistoryLimit`
The number of failed finished jobs to retain. This is a pointer to distinguish between explicit zero and not specified.
```jsonnet
{
  withFailedJobsHistoryLimit(failedJobsHistoryLimit):: {}
}
```

### `fn .withSchedule`
The schedule in Cron format, see https://en.wikipedia.org/wiki/Cron.
```jsonnet
{
  withSchedule(schedule):: {}
}
```

### `fn .withStartingDeadlineSeconds`
Optional deadline in seconds for starting the job if it misses scheduled time for any reason.  Missed jobs executions will be counted as failed ones.
```jsonnet
{
  withStartingDeadlineSeconds(startingDeadlineSeconds):: {}
}
```

### `fn .withSuccessfulJobsHistoryLimit`
The number of successful finished jobs to retain. This is a pointer to distinguish between explicit zero and not specified.
```jsonnet
{
  withSuccessfulJobsHistoryLimit(successfulJobsHistoryLimit):: {}
}
```

### `fn .withSuspend`
This flag tells the controller to suspend subsequent executions, it does not apply to already started executions.  Defaults to false.
```jsonnet
{
  withSuspend(suspend):: {}
}
```

### `fn jobTemplate.metadata.withAnnotations`
Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations
```jsonnet
{
  withAnnotations(annotations):: {}
}
```

### `fn jobTemplate.metadata.withClusterName`
The name of the cluster which the object belongs to. This is used to distinguish resources with same name and namespace in different clusters. This field is not set anywhere right now and apiserver is going to ignore it if set in create or update request.
```jsonnet
{
  withClusterName(clusterName):: {}
}
```

### `fn jobTemplate.metadata.withCreationTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withCreationTimestamp(creationTimestamp):: {}
}
```

### `fn jobTemplate.metadata.withDeletionGracePeriodSeconds`
Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only.
```jsonnet
{
  withDeletionGracePeriodSeconds(deletionGracePeriodSeconds):: {}
}
```

### `fn jobTemplate.metadata.withDeletionTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withDeletionTimestamp(deletionTimestamp):: {}
}
```

### `fn jobTemplate.metadata.withFinalizers`
Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed.
```jsonnet
{
  withFinalizers(finalizers):: {}
}
```

### `fn jobTemplate.metadata.withGenerateName`
GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided. If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with a unique suffix. The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.

If this field is specified and the generated name exists, the server will NOT return a 409 - instead, it will either return 201 Created or 500 with Reason ServerTimeout indicating a unique name could not be found in the time allotted, and the client should retry (optionally after the time indicated in the Retry-After header).

Applied only if Name is not specified. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
```jsonnet
{
  withGenerateName(generateName):: {}
}
```

### `fn jobTemplate.metadata.withGeneration`
A sequence number representing a specific generation of the desired state. Populated by the system. Read-only.
```jsonnet
{
  withGeneration(generation):: {}
}
```

### `fn jobTemplate.metadata.withLabels`
Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels
```jsonnet
{
  withLabels(labels):: {}
}
```

### `fn jobTemplate.metadata.withManagedFields`
ManagedFields maps workflow-id and version to the set of fields that are managed by that workflow. This is mostly for internal housekeeping, and users typically shouldn't need to set or understand this field. A workflow can be the user's name, a controller's name, or the name of a specific apply path like "ci-cd". The set of fields is always in the version that the workflow used when modifying the object.
```jsonnet
{
  withManagedFields(managedFields):: {}
}
```

### `fn jobTemplate.metadata.withName`
Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn jobTemplate.metadata.withNamespace`
Namespace defines the space within each name must be unique. An empty namespace is equivalent to the "default" namespace, but "default" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.

Must be a DNS_LABEL. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/namespaces
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn jobTemplate.metadata.withOwnerReferences`
List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller.
```jsonnet
{
  withOwnerReferences(ownerReferences):: {}
}
```

### `fn jobTemplate.metadata.withResourceVersion`
An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.

Populated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn jobTemplate.metadata.withSelfLink`
SelfLink is a URL representing this object. Populated by the system. Read-only.

DEPRECATED Kubernetes will stop propagating this field in 1.20 release and the field is planned to be removed in 1.21 release.
```jsonnet
{
  withSelfLink(selfLink):: {}
}
```

### `fn jobTemplate.metadata.withUid`
UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.

Populated by the system. Read-only. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn jobTemplate.spec.selector.withMatchExpressions`
matchExpressions is a list of label selector requirements. The requirements are ANDed.
```jsonnet
{
  withMatchExpressions(matchExpressions):: {}
}
```

### `fn jobTemplate.spec.selector.withMatchLabels`
matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.
```jsonnet
{
  withMatchLabels(matchLabels):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withAnnotations`
Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations
```jsonnet
{
  withAnnotations(annotations):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withClusterName`
The name of the cluster which the object belongs to. This is used to distinguish resources with same name and namespace in different clusters. This field is not set anywhere right now and apiserver is going to ignore it if set in create or update request.
```jsonnet
{
  withClusterName(clusterName):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withCreationTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withCreationTimestamp(creationTimestamp):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withDeletionGracePeriodSeconds`
Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only.
```jsonnet
{
  withDeletionGracePeriodSeconds(deletionGracePeriodSeconds):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withDeletionTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withDeletionTimestamp(deletionTimestamp):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withFinalizers`
Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed.
```jsonnet
{
  withFinalizers(finalizers):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withGenerateName`
GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided. If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with a unique suffix. The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.

If this field is specified and the generated name exists, the server will NOT return a 409 - instead, it will either return 201 Created or 500 with Reason ServerTimeout indicating a unique name could not be found in the time allotted, and the client should retry (optionally after the time indicated in the Retry-After header).

Applied only if Name is not specified. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
```jsonnet
{
  withGenerateName(generateName):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withGeneration`
A sequence number representing a specific generation of the desired state. Populated by the system. Read-only.
```jsonnet
{
  withGeneration(generation):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withLabels`
Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels
```jsonnet
{
  withLabels(labels):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withManagedFields`
ManagedFields maps workflow-id and version to the set of fields that are managed by that workflow. This is mostly for internal housekeeping, and users typically shouldn't need to set or understand this field. A workflow can be the user's name, a controller's name, or the name of a specific apply path like "ci-cd". The set of fields is always in the version that the workflow used when modifying the object.
```jsonnet
{
  withManagedFields(managedFields):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withName`
Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withNamespace`
Namespace defines the space within each name must be unique. An empty namespace is equivalent to the "default" namespace, but "default" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.

Must be a DNS_LABEL. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/namespaces
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withOwnerReferences`
List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller.
```jsonnet
{
  withOwnerReferences(ownerReferences):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withResourceVersion`
An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.

Populated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withSelfLink`
SelfLink is a URL representing this object. Populated by the system. Read-only.

DEPRECATED Kubernetes will stop propagating this field in 1.20 release and the field is planned to be removed in 1.21 release.
```jsonnet
{
  withSelfLink(selfLink):: {}
}
```

### `fn jobTemplate.spec.template.metadata.withUid`
UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.

Populated by the system. Read-only. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn jobTemplate.spec.template.spec.affinity.nodeAffinity.requiredDuringSchedulingIgnoredDuringExecution.withNodeSelectorTerms`
Required. A list of node selector terms. The terms are ORed.
```jsonnet
{
  withNodeSelectorTerms(nodeSelectorTerms):: {}
}
```

### `fn jobTemplate.spec.template.spec.affinity.nodeAffinity.withPreferredDuringSchedulingIgnoredDuringExecution`
The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred.
```jsonnet
{
  withPreferredDuringSchedulingIgnoredDuringExecution(preferredDuringSchedulingIgnoredDuringExecution):: {}
}
```

### `fn jobTemplate.spec.template.spec.affinity.podAffinity.withPreferredDuringSchedulingIgnoredDuringExecution`
The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
```jsonnet
{
  withPreferredDuringSchedulingIgnoredDuringExecution(preferredDuringSchedulingIgnoredDuringExecution):: {}
}
```

### `fn jobTemplate.spec.template.spec.affinity.podAffinity.withRequiredDuringSchedulingIgnoredDuringExecution`
If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
```jsonnet
{
  withRequiredDuringSchedulingIgnoredDuringExecution(requiredDuringSchedulingIgnoredDuringExecution):: {}
}
```

### `fn jobTemplate.spec.template.spec.affinity.podAntiAffinity.withPreferredDuringSchedulingIgnoredDuringExecution`
The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding "weight" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred.
```jsonnet
{
  withPreferredDuringSchedulingIgnoredDuringExecution(preferredDuringSchedulingIgnoredDuringExecution):: {}
}
```

### `fn jobTemplate.spec.template.spec.affinity.podAntiAffinity.withRequiredDuringSchedulingIgnoredDuringExecution`
If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied.
```jsonnet
{
  withRequiredDuringSchedulingIgnoredDuringExecution(requiredDuringSchedulingIgnoredDuringExecution):: {}
}
```

### `fn jobTemplate.spec.template.spec.dnsConfig.withNameservers`
A list of DNS name server IP addresses. This will be appended to the base nameservers generated from DNSPolicy. Duplicated nameservers will be removed.
```jsonnet
{
  withNameservers(nameservers):: {}
}
```

### `fn jobTemplate.spec.template.spec.dnsConfig.withOptions`
A list of DNS resolver options. This will be merged with the base options generated from DNSPolicy. Duplicated entries will be removed. Resolution options given in Options will override those that appear in the base DNSPolicy.
```jsonnet
{
  withOptions(options):: {}
}
```

### `fn jobTemplate.spec.template.spec.dnsConfig.withSearches`
A list of DNS search domains for host-name lookup. This will be appended to the base search paths generated from DNSPolicy. Duplicated search paths will be removed.
```jsonnet
{
  withSearches(searches):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.seLinuxOptions.withLevel`
Level is SELinux level label that applies to the container.
```jsonnet
{
  withLevel(level):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.seLinuxOptions.withRole`
Role is a SELinux role label that applies to the container.
```jsonnet
{
  withRole(role):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.seLinuxOptions.withType`
Type is a SELinux type label that applies to the container.
```jsonnet
{
  withType(type):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.seLinuxOptions.withUser`
User is a SELinux user label that applies to the container.
```jsonnet
{
  withUser(user):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.windowsOptions.withGmsaCredentialSpec`
GMSACredentialSpec is where the GMSA admission webhook (https://github.com/kubernetes-sigs/windows-gmsa) inlines the contents of the GMSA credential spec named by the GMSACredentialSpecName field. This field is alpha-level and is only honored by servers that enable the WindowsGMSA feature flag.
```jsonnet
{
  withGmsaCredentialSpec(gmsaCredentialSpec):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.windowsOptions.withGmsaCredentialSpecName`
GMSACredentialSpecName is the name of the GMSA credential spec to use. This field is alpha-level and is only honored by servers that enable the WindowsGMSA feature flag.
```jsonnet
{
  withGmsaCredentialSpecName(gmsaCredentialSpecName):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.windowsOptions.withRunAsUserName`
The UserName in Windows to run the entrypoint of the container process. Defaults to the user specified in image metadata if unspecified. May also be set in PodSecurityContext. If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence. This field is alpha-level and it is only honored by servers that enable the WindowsRunAsUserName feature flag.
```jsonnet
{
  withRunAsUserName(runAsUserName):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.withFsGroup`
A special supplemental group that applies to all containers in a pod. Some volume types allow the Kubelet to change the ownership of that volume to be owned by the pod:

1. The owning GID will be the FSGroup 2. The setgid bit is set (new files created in the volume will be owned by FSGroup) 3. The permission bits are OR'd with rw-rw----

If unset, the Kubelet will not modify the ownership and permissions of any volume.
```jsonnet
{
  withFsGroup(fsGroup):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.withRunAsGroup`
The GID to run the entrypoint of the container process. Uses runtime default if unset. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container.
```jsonnet
{
  withRunAsGroup(runAsGroup):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.withRunAsNonRoot`
Indicates that the container must run as a non-root user. If true, the Kubelet will validate the image at runtime to ensure that it does not run as UID 0 (root) and fail to start the container if it does. If unset or false, no such validation will be performed. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence.
```jsonnet
{
  withRunAsNonRoot(runAsNonRoot):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.withRunAsUser`
The UID to run the entrypoint of the container process. Defaults to user specified in image metadata if unspecified. May also be set in SecurityContext.  If set in both SecurityContext and PodSecurityContext, the value specified in SecurityContext takes precedence for that container.
```jsonnet
{
  withRunAsUser(runAsUser):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.withSupplementalGroups`
A list of groups applied to the first process run in each container, in addition to the container's primary GID.  If unspecified, no groups will be added to any container.
```jsonnet
{
  withSupplementalGroups(supplementalGroups):: {}
}
```

### `fn jobTemplate.spec.template.spec.securityContext.withSysctls`
Sysctls hold a list of namespaced sysctls used for the pod. Pods with unsupported sysctls (by the container runtime) might fail to launch.
```jsonnet
{
  withSysctls(sysctls):: {}
}
```

### `fn jobTemplate.spec.template.spec.withActiveDeadlineSeconds`
Optional duration in seconds the pod may be active on the node relative to StartTime before the system will actively try to mark it failed and kill associated containers. Value must be a positive integer.
```jsonnet
{
  withActiveDeadlineSeconds(activeDeadlineSeconds):: {}
}
```

### `fn jobTemplate.spec.template.spec.withAutomountServiceAccountToken`
AutomountServiceAccountToken indicates whether a service account token should be automatically mounted.
```jsonnet
{
  withAutomountServiceAccountToken(automountServiceAccountToken):: {}
}
```

### `fn jobTemplate.spec.template.spec.withContainers`
List of containers belonging to the pod. Containers cannot currently be added or removed. There must be at least one container in a Pod. Cannot be updated.
```jsonnet
{
  withContainers(containers):: {}
}
```

### `fn jobTemplate.spec.template.spec.withDnsPolicy`
Set DNS policy for the pod. Defaults to "ClusterFirst". Valid values are 'ClusterFirstWithHostNet', 'ClusterFirst', 'Default' or 'None'. DNS parameters given in DNSConfig will be merged with the policy selected with DNSPolicy. To have DNS options set along with hostNetwork, you have to specify DNS policy explicitly to 'ClusterFirstWithHostNet'.
```jsonnet
{
  withDnsPolicy(dnsPolicy):: {}
}
```

### `fn jobTemplate.spec.template.spec.withEnableServiceLinks`
EnableServiceLinks indicates whether information about services should be injected into pod's environment variables, matching the syntax of Docker links. Optional: Defaults to true.
```jsonnet
{
  withEnableServiceLinks(enableServiceLinks):: {}
}
```

### `fn jobTemplate.spec.template.spec.withEphemeralContainers`
List of ephemeral containers run in this pod. Ephemeral containers may be run in an existing pod to perform user-initiated actions such as debugging. This list cannot be specified when creating a pod, and it cannot be modified by updating the pod spec. In order to add an ephemeral container to an existing pod, use the pod's ephemeralcontainers subresource. This field is alpha-level and is only honored by servers that enable the EphemeralContainers feature.
```jsonnet
{
  withEphemeralContainers(ephemeralContainers):: {}
}
```

### `fn jobTemplate.spec.template.spec.withHostAliases`
HostAliases is an optional list of hosts and IPs that will be injected into the pod's hosts file if specified. This is only valid for non-hostNetwork pods.
```jsonnet
{
  withHostAliases(hostAliases):: {}
}
```

### `fn jobTemplate.spec.template.spec.withHostIPC`
Use the host's ipc namespace. Optional: Default to false.
```jsonnet
{
  withHostIPC(hostIPC):: {}
}
```

### `fn jobTemplate.spec.template.spec.withHostNetwork`
Host networking requested for this pod. Use the host's network namespace. If this option is set, the ports that will be used must be specified. Default to false.
```jsonnet
{
  withHostNetwork(hostNetwork):: {}
}
```

### `fn jobTemplate.spec.template.spec.withHostPID`
Use the host's pid namespace. Optional: Default to false.
```jsonnet
{
  withHostPID(hostPID):: {}
}
```

### `fn jobTemplate.spec.template.spec.withHostname`
Specifies the hostname of the Pod If not specified, the pod's hostname will be set to a system-defined value.
```jsonnet
{
  withHostname(hostname):: {}
}
```

### `fn jobTemplate.spec.template.spec.withImagePullSecrets`
ImagePullSecrets is an optional list of references to secrets in the same namespace to use for pulling any of the images used by this PodSpec. If specified, these secrets will be passed to individual puller implementations for them to use. For example, in the case of docker, only DockerConfig type secrets are honored. More info: https://kubernetes.io/docs/concepts/containers/images#specifying-imagepullsecrets-on-a-pod
```jsonnet
{
  withImagePullSecrets(imagePullSecrets):: {}
}
```

### `fn jobTemplate.spec.template.spec.withInitContainers`
List of initialization containers belonging to the pod. Init containers are executed in order prior to containers being started. If any init container fails, the pod is considered to have failed and is handled according to its restartPolicy. The name for an init container or normal container must be unique among all containers. Init containers may not have Lifecycle actions, Readiness probes, Liveness probes, or Startup probes. The resourceRequirements of an init container are taken into account during scheduling by finding the highest request/limit for each resource type, and then using the max of of that value or the sum of the normal containers. Limits are applied to init containers in a similar fashion. Init containers cannot currently be added or removed. Cannot be updated. More info: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/
```jsonnet
{
  withInitContainers(initContainers):: {}
}
```

### `fn jobTemplate.spec.template.spec.withNodeName`
NodeName is a request to schedule this pod onto a specific node. If it is non-empty, the scheduler simply schedules this pod onto that node, assuming that it fits resource requirements.
```jsonnet
{
  withNodeName(nodeName):: {}
}
```

### `fn jobTemplate.spec.template.spec.withNodeSelector`
NodeSelector is a selector which must be true for the pod to fit on a node. Selector which must match a node's labels for the pod to be scheduled on that node. More info: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/
```jsonnet
{
  withNodeSelector(nodeSelector):: {}
}
```

### `fn jobTemplate.spec.template.spec.withOverhead`
Overhead represents the resource overhead associated with running a pod for a given RuntimeClass. This field will be autopopulated at admission time by the RuntimeClass admission controller. If the RuntimeClass admission controller is enabled, overhead must not be set in Pod create requests. The RuntimeClass admission controller will reject Pod create requests which have the overhead already set. If RuntimeClass is configured and selected in the PodSpec, Overhead will be set to the value defined in the corresponding RuntimeClass, otherwise it will remain unset and treated as zero. More info: https://git.k8s.io/enhancements/keps/sig-node/20190226-pod-overhead.md This field is alpha-level as of Kubernetes v1.16, and is only honored by servers that enable the PodOverhead feature.
```jsonnet
{
  withOverhead(overhead):: {}
}
```

### `fn jobTemplate.spec.template.spec.withPreemptionPolicy`
PreemptionPolicy is the Policy for preempting pods with lower priority. One of Never, PreemptLowerPriority. Defaults to PreemptLowerPriority if unset. This field is alpha-level and is only honored by servers that enable the NonPreemptingPriority feature.
```jsonnet
{
  withPreemptionPolicy(preemptionPolicy):: {}
}
```

### `fn jobTemplate.spec.template.spec.withPriority`
The priority value. Various system components use this field to find the priority of the pod. When Priority Admission Controller is enabled, it prevents users from setting this field. The admission controller populates this field from PriorityClassName. The higher the value, the higher the priority.
```jsonnet
{
  withPriority(priority):: {}
}
```

### `fn jobTemplate.spec.template.spec.withPriorityClassName`
If specified, indicates the pod's priority. "system-node-critical" and "system-cluster-critical" are two special keywords which indicate the highest priorities with the former being the highest priority. Any other name must be defined by creating a PriorityClass object with that name. If not specified, the pod priority will be default or zero if there is no default.
```jsonnet
{
  withPriorityClassName(priorityClassName):: {}
}
```

### `fn jobTemplate.spec.template.spec.withReadinessGates`
If specified, all readiness gates will be evaluated for pod readiness. A pod is ready when all its containers are ready AND all conditions specified in the readiness gates have status equal to "True" More info: https://git.k8s.io/enhancements/keps/sig-network/0007-pod-ready%2B%2B.md
```jsonnet
{
  withReadinessGates(readinessGates):: {}
}
```

### `fn jobTemplate.spec.template.spec.withRestartPolicy`
Restart policy for all containers within the pod. One of Always, OnFailure, Never. Default to Always. More info: https://kubernetes.io/docs/concepts/workloads/pods/pod-lifecycle/#restart-policy
```jsonnet
{
  withRestartPolicy(restartPolicy):: {}
}
```

### `fn jobTemplate.spec.template.spec.withRuntimeClassName`
RuntimeClassName refers to a RuntimeClass object in the node.k8s.io group, which should be used to run this pod.  If no RuntimeClass resource matches the named class, the pod will not be run. If unset or empty, the "legacy" RuntimeClass will be used, which is an implicit class with an empty definition that uses the default runtime handler. More info: https://git.k8s.io/enhancements/keps/sig-node/runtime-class.md This is a beta feature as of Kubernetes v1.14.
```jsonnet
{
  withRuntimeClassName(runtimeClassName):: {}
}
```

### `fn jobTemplate.spec.template.spec.withSchedulerName`
If specified, the pod will be dispatched by specified scheduler. If not specified, the pod will be dispatched by default scheduler.
```jsonnet
{
  withSchedulerName(schedulerName):: {}
}
```

### `fn jobTemplate.spec.template.spec.withServiceAccount`
DeprecatedServiceAccount is a depreciated alias for ServiceAccountName. Deprecated: Use serviceAccountName instead.
```jsonnet
{
  withServiceAccount(serviceAccount):: {}
}
```

### `fn jobTemplate.spec.template.spec.withServiceAccountName`
ServiceAccountName is the name of the ServiceAccount to use to run this pod. More info: https://kubernetes.io/docs/tasks/configure-pod-container/configure-service-account/
```jsonnet
{
  withServiceAccountName(serviceAccountName):: {}
}
```

### `fn jobTemplate.spec.template.spec.withShareProcessNamespace`
Share a single process namespace between all of the containers in a pod. When this is set containers will be able to view and signal processes from other containers in the same pod, and the first process in each container will not be assigned PID 1. HostPID and ShareProcessNamespace cannot both be set. Optional: Default to false. This field is beta-level and may be disabled with the PodShareProcessNamespace feature.
```jsonnet
{
  withShareProcessNamespace(shareProcessNamespace):: {}
}
```

### `fn jobTemplate.spec.template.spec.withSubdomain`
If specified, the fully qualified Pod hostname will be "<hostname>.<subdomain>.<pod namespace>.svc.<cluster domain>". If not specified, the pod will not have a domainname at all.
```jsonnet
{
  withSubdomain(subdomain):: {}
}
```

### `fn jobTemplate.spec.template.spec.withTerminationGracePeriodSeconds`
Optional duration in seconds the pod needs to terminate gracefully. May be decreased in delete request. Value must be non-negative integer. The value zero indicates delete immediately. If this value is nil, the default grace period will be used instead. The grace period is the duration in seconds after the processes running in the pod are sent a termination signal and the time when the processes are forcibly halted with a kill signal. Set this value longer than the expected cleanup time for your process. Defaults to 30 seconds.
```jsonnet
{
  withTerminationGracePeriodSeconds(terminationGracePeriodSeconds):: {}
}
```

### `fn jobTemplate.spec.template.spec.withTolerations`
If specified, the pod's tolerations.
```jsonnet
{
  withTolerations(tolerations):: {}
}
```

### `fn jobTemplate.spec.template.spec.withTopologySpreadConstraints`
TopologySpreadConstraints describes how a group of pods ought to spread across topology domains. Scheduler will schedule pods in a way which abides by the constraints. This field is alpha-level and is only honored by clusters that enables the EvenPodsSpread feature. All topologySpreadConstraints are ANDed.
```jsonnet
{
  withTopologySpreadConstraints(topologySpreadConstraints):: {}
}
```

### `fn jobTemplate.spec.template.spec.withVolumes`
List of volumes that can be mounted by containers belonging to the pod. More info: https://kubernetes.io/docs/concepts/storage/volumes
```jsonnet
{
  withVolumes(volumes):: {}
}
```

### `fn jobTemplate.spec.withActiveDeadlineSeconds`
Specifies the duration in seconds relative to the startTime that the job may be active before the system tries to terminate it; value must be positive integer
```jsonnet
{
  withActiveDeadlineSeconds(activeDeadlineSeconds):: {}
}
```

### `fn jobTemplate.spec.withBackoffLimit`
Specifies the number of retries before marking this job failed. Defaults to 6
```jsonnet
{
  withBackoffLimit(backoffLimit):: {}
}
```

### `fn jobTemplate.spec.withCompletions`
Specifies the desired number of successfully finished pods the job should be run with.  Setting to nil means that the success of any pod signals the success of all pods, and allows parallelism to have any positive value.  Setting to 1 means that parallelism is limited to 1 and the success of that pod signals the success of the job. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
```jsonnet
{
  withCompletions(completions):: {}
}
```

### `fn jobTemplate.spec.withManualSelector`
manualSelector controls generation of pod labels and pod selectors. Leave `manualSelector` unset unless you are certain what you are doing. When false or unset, the system pick labels unique to this job and appends those labels to the pod template.  When true, the user is responsible for picking unique labels and specifying the selector.  Failure to pick a unique label may cause this and other jobs to not function correctly.  However, You may see `manualSelector=true` in jobs that were created with the old `extensions/v1beta1` API. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/#specifying-your-own-pod-selector
```jsonnet
{
  withManualSelector(manualSelector):: {}
}
```

### `fn jobTemplate.spec.withParallelism`
Specifies the maximum desired number of pods the job should run at any given time. The actual number of pods running in steady state will be less than this number when ((.spec.completions - .status.successful) < .spec.parallelism), i.e. when the work left to do is less than max parallelism. More info: https://kubernetes.io/docs/concepts/workloads/controllers/jobs-run-to-completion/
```jsonnet
{
  withParallelism(parallelism):: {}
}
```

### `fn jobTemplate.spec.withTtlSecondsAfterFinished`
ttlSecondsAfterFinished limits the lifetime of a Job that has finished execution (either Complete or Failed). If this field is set, ttlSecondsAfterFinished after the Job finishes, it is eligible to be automatically deleted. When the Job is being deleted, its lifecycle guarantees (e.g. finalizers) will be honored. If this field is unset, the Job won't be automatically deleted. If this field is set to zero, the Job becomes eligible to be deleted immediately after it finishes. This field is alpha-level and is only honored by servers that enable the TTLAfterFinished feature.
```jsonnet
{
  withTtlSecondsAfterFinished(ttlSecondsAfterFinished):: {}
}
```

