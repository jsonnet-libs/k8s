
## networkPolicy
DEPRECATED 1.9 - This group version of NetworkPolicy is deprecated by networking/v1/NetworkPolicy. NetworkPolicy describes what network traffic is allowed for a set of Pods

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
[`fn spec.podSelector.withMatchExpressions`](#fn-specpodselectorwithmatchexpressions)  
[`fn spec.podSelector.withMatchLabels`](#fn-specpodselectorwithmatchlabels)  
[`fn spec.withEgress`](#fn-specwithegress)  
[`fn spec.withIngress`](#fn-specwithingress)  
[`fn spec.withPolicyTypes`](#fn-specwithpolicytypes)  

---


### `fn new`
new returns an instance of Networkpolicy
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

### `fn spec.podSelector.withMatchExpressions`
matchExpressions is a list of label selector requirements. The requirements are ANDed.
```jsonnet
{
  withMatchExpressions(matchExpressions):: {}
}
```

### `fn spec.podSelector.withMatchLabels`
matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.
```jsonnet
{
  withMatchLabels(matchLabels):: {}
}
```

### `fn spec.withEgress`
List of egress rules to be applied to the selected pods. Outgoing traffic is allowed if there are no NetworkPolicies selecting the pod (and cluster policy otherwise allows the traffic), OR if the traffic matches at least one egress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy limits all outgoing traffic (and serves solely to ensure that the pods it selects are isolated by default). This field is beta-level in 1.8
```jsonnet
{
  withEgress(egress):: {}
}
```

### `fn spec.withIngress`
List of ingress rules to be applied to the selected pods. Traffic is allowed to a pod if there are no NetworkPolicies selecting the pod OR if the traffic source is the pod's local node, OR if the traffic matches at least one ingress rule across all of the NetworkPolicy objects whose podSelector matches the pod. If this field is empty then this NetworkPolicy does not allow any traffic (and serves solely to ensure that the pods it selects are isolated by default).
```jsonnet
{
  withIngress(ingress):: {}
}
```

### `fn spec.withPolicyTypes`
List of rule types that the NetworkPolicy relates to. Valid options are "Ingress", "Egress", or "Ingress,Egress". If this field is not specified, it will default based on the existence of Ingress or Egress rules; policies that contain an Egress section are assumed to affect Egress, and all policies (whether or not they contain an Ingress section) are assumed to affect Ingress. If you want to write an egress-only policy, you must explicitly specify policyTypes [ "Egress" ]. Likewise, if you want to write a policy that specifies that no egress is allowed, you must specify a policyTypes value that include "Egress" (since such a policy would not include an Egress section and would otherwise default to just [ "Ingress" ]). This field is beta-level in 1.8
```jsonnet
{
  withPolicyTypes(policyTypes):: {}
}
```

