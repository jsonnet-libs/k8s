
## event
Event is a report of an event somewhere in the cluster. It generally denotes some state change in the system.

**Functions:**

[`fn new`](#fn-new)  
[`fn .withAction`](#fn-withaction)  
[`fn .withDeprecatedCount`](#fn-withdeprecatedcount)  
[`fn .withDeprecatedFirstTimestamp`](#fn-withdeprecatedfirsttimestamp)  
[`fn .withDeprecatedLastTimestamp`](#fn-withdeprecatedlasttimestamp)  
[`fn .withEventTime`](#fn-witheventtime)  
[`fn .withNote`](#fn-withnote)  
[`fn .withReason`](#fn-withreason)  
[`fn .withReportingController`](#fn-withreportingcontroller)  
[`fn .withReportingInstance`](#fn-withreportinginstance)  
[`fn .withType`](#fn-withtype)  
[`fn deprecatedSource.withComponent`](#fn-deprecatedsourcewithcomponent)  
[`fn deprecatedSource.withHost`](#fn-deprecatedsourcewithhost)  
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
[`fn regarding.withFieldPath`](#fn-regardingwithfieldpath)  
[`fn regarding.withName`](#fn-regardingwithname)  
[`fn regarding.withNamespace`](#fn-regardingwithnamespace)  
[`fn regarding.withResourceVersion`](#fn-regardingwithresourceversion)  
[`fn regarding.withUid`](#fn-regardingwithuid)  
[`fn related.withFieldPath`](#fn-relatedwithfieldpath)  
[`fn related.withName`](#fn-relatedwithname)  
[`fn related.withNamespace`](#fn-relatedwithnamespace)  
[`fn related.withResourceVersion`](#fn-relatedwithresourceversion)  
[`fn related.withUid`](#fn-relatedwithuid)  
[`fn series.withCount`](#fn-serieswithcount)  
[`fn series.withLastObservedTime`](#fn-serieswithlastobservedtime)  
[`fn series.withState`](#fn-serieswithstate)  

---


### `fn new`
new returns an instance of Event
```jsonnet
{
  new(name):: {}
}
```

### `fn .withAction`
What action was taken/failed regarding to the regarding object.
```jsonnet
{
  withAction(action):: {}
}
```

### `fn .withDeprecatedCount`
Deprecated field assuring backward compatibility with core.v1 Event type
```jsonnet
{
  withDeprecatedCount(deprecatedCount):: {}
}
```

### `fn .withDeprecatedFirstTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withDeprecatedFirstTimestamp(deprecatedFirstTimestamp):: {}
}
```

### `fn .withDeprecatedLastTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withDeprecatedLastTimestamp(deprecatedLastTimestamp):: {}
}
```

### `fn .withEventTime`
MicroTime is version of Time with microsecond level precision.
```jsonnet
{
  withEventTime(eventTime):: {}
}
```

### `fn .withNote`
Optional. A human-readable description of the status of this operation. Maximal length of the note is 1kB, but libraries should be prepared to handle values up to 64kB.
```jsonnet
{
  withNote(note):: {}
}
```

### `fn .withReason`
Why the action was taken.
```jsonnet
{
  withReason(reason):: {}
}
```

### `fn .withReportingController`
Name of the controller that emitted this Event, e.g. `kubernetes.io/kubelet`.
```jsonnet
{
  withReportingController(reportingController):: {}
}
```

### `fn .withReportingInstance`
ID of the controller instance, e.g. `kubelet-xyzf`.
```jsonnet
{
  withReportingInstance(reportingInstance):: {}
}
```

### `fn .withType`
Type of this event (Normal, Warning), new types could be added in the future.
```jsonnet
{
  withType(type):: {}
}
```

### `fn deprecatedSource.withComponent`
Component from which the event is generated.
```jsonnet
{
  withComponent(component):: {}
}
```

### `fn deprecatedSource.withHost`
Node name on which the event is generated.
```jsonnet
{
  withHost(host):: {}
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

### `fn regarding.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn regarding.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn regarding.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn regarding.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn regarding.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn related.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn related.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn related.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn related.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn related.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn series.withCount`
Number of occurrences in this series up to the last heartbeat time
```jsonnet
{
  withCount(count):: {}
}
```

### `fn series.withLastObservedTime`
MicroTime is version of Time with microsecond level precision.
```jsonnet
{
  withLastObservedTime(lastObservedTime):: {}
}
```

### `fn series.withState`
Information whether this series is ongoing or finished. Deprecated. Planned removal for 1.18
```jsonnet
{
  withState(state):: {}
}
```

