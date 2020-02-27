
## scheduling
Scheduling specifies the scheduling constraints for nodes supporting a RuntimeClass.

**Functions:**

[`fn .withNodeSelector`](#fn-withnodeselector)  
[`fn .withTolerations`](#fn-withtolerations)  

---


### `fn .withNodeSelector`
nodeSelector lists labels that must be present on nodes that support this RuntimeClass. Pods using this RuntimeClass can only be scheduled to a node matched by this selector. The RuntimeClass nodeSelector is merged with a pod's existing nodeSelector. Any conflicts will cause the pod to be rejected in admission.
```jsonnet
{
  withNodeSelector(nodeSelector):: {}
}
```

### `fn .withTolerations`
tolerations are appended (excluding duplicates) to pods running with this RuntimeClass during admission, effectively unioning the set of nodes tolerated by the pod and the RuntimeClass.
```jsonnet
{
  withTolerations(tolerations):: {}
}
```

