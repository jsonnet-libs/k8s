
## endpoint
Endpoint represents a single logical "backend" implementing a service.

**Functions:**

[`fn .withAddresses`](#fn-withaddresses)  
[`fn .withHostname`](#fn-withhostname)  
[`fn .withTopology`](#fn-withtopology)  
[`fn conditions.withReady`](#fn-conditionswithready)  
[`fn targetRef.withFieldPath`](#fn-targetrefwithfieldpath)  
[`fn targetRef.withName`](#fn-targetrefwithname)  
[`fn targetRef.withNamespace`](#fn-targetrefwithnamespace)  
[`fn targetRef.withResourceVersion`](#fn-targetrefwithresourceversion)  
[`fn targetRef.withUid`](#fn-targetrefwithuid)  

---


### `fn .withAddresses`
addresses of this endpoint. The contents of this field are interpreted according to the corresponding EndpointSlice addressType field. This allows for cases like dual-stack (IPv4 and IPv6) networking. Consumers (e.g. kube-proxy) must handle different types of addresses in the context of their own capabilities. This must contain at least one address but no more than 100.
```jsonnet
{
  withAddresses(addresses):: {}
}
```

### `fn .withHostname`
hostname of this endpoint. This field may be used by consumers of endpoints to distinguish endpoints from each other (e.g. in DNS names). Multiple endpoints which use the same hostname should be considered fungible (e.g. multiple A values in DNS). Must pass DNS Label (RFC 1123) validation.
```jsonnet
{
  withHostname(hostname):: {}
}
```

### `fn .withTopology`
topology contains arbitrary topology information associated with the endpoint. These key/value pairs must conform with the label format. https://kubernetes.io/docs/concepts/overview/working-with-objects/labels Topology may include a maximum of 16 key/value pairs. This includes, but is not limited to the following well known keys: * kubernetes.io/hostname: the value indicates the hostname of the node
  where the endpoint is located. This should match the corresponding
  node label.
* topology.kubernetes.io/zone: the value indicates the zone where the
  endpoint is located. This should match the corresponding node label.
* topology.kubernetes.io/region: the value indicates the region where the
  endpoint is located. This should match the corresponding node label.
```jsonnet
{
  withTopology(topology):: {}
}
```

### `fn conditions.withReady`
ready indicates that this endpoint is prepared to receive traffic, according to whatever system is managing the endpoint. A nil value indicates an unknown state. In most cases consumers should interpret this unknown state as ready.
```jsonnet
{
  withReady(ready):: {}
}
```

### `fn targetRef.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn targetRef.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn targetRef.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn targetRef.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn targetRef.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

