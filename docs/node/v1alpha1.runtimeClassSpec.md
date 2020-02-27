
## runtimeClassSpec
RuntimeClassSpec is a specification of a RuntimeClass. It contains parameters that are required to describe the RuntimeClass to the Container Runtime Interface (CRI) implementation, as well as any other components that need to understand how the pod will be run. The RuntimeClassSpec is immutable.

**Functions:**

[`fn .withRuntimeHandler`](#fn-withruntimehandler)  
[`fn overhead.withPodFixed`](#fn-overheadwithpodfixed)  
[`fn scheduling.withNodeSelector`](#fn-schedulingwithnodeselector)  
[`fn scheduling.withTolerations`](#fn-schedulingwithtolerations)  

---


### `fn .withRuntimeHandler`
RuntimeHandler specifies the underlying runtime and configuration that the CRI implementation will use to handle pods of this class. The possible values are specific to the node & CRI configuration.  It is assumed that all handlers are available on every node, and handlers of the same name are equivalent on every node. For example, a handler called "runc" might specify that the runc OCI runtime (using native Linux containers) will be used to run the containers in a pod. The RuntimeHandler must conform to the DNS Label (RFC 1123) requirements and is immutable.
```jsonnet
{
  withRuntimeHandler(runtimeHandler):: {}
}
```

### `fn overhead.withPodFixed`
PodFixed represents the fixed resource overhead associated with running a pod.
```jsonnet
{
  withPodFixed(podFixed):: {}
}
```

### `fn scheduling.withNodeSelector`
nodeSelector lists labels that must be present on nodes that support this RuntimeClass. Pods using this RuntimeClass can only be scheduled to a node matched by this selector. The RuntimeClass nodeSelector is merged with a pod's existing nodeSelector. Any conflicts will cause the pod to be rejected in admission.
```jsonnet
{
  withNodeSelector(nodeSelector):: {}
}
```

### `fn scheduling.withTolerations`
tolerations are appended (excluding duplicates) to pods running with this RuntimeClass during admission, effectively unioning the set of nodes tolerated by the pod and the RuntimeClass.
```jsonnet
{
  withTolerations(tolerations):: {}
}
```

