
## daemonSetCondition
DaemonSetCondition describes the state of a DaemonSet at a certain point.

**Functions:**

[`fn .withLastTransitionTime`](#fn-withlasttransitiontime)  
[`fn .withMessage`](#fn-withmessage)  
[`fn .withReason`](#fn-withreason)  
[`fn .withType`](#fn-withtype)  

---


### `fn .withLastTransitionTime`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withLastTransitionTime(lastTransitionTime):: {}
}
```

### `fn .withMessage`
A human readable message indicating details about the transition.
```jsonnet
{
  withMessage(message):: {}
}
```

### `fn .withReason`
The reason for the condition's last transition.
```jsonnet
{
  withReason(reason):: {}
}
```

### `fn .withType`
Type of DaemonSet condition.
```jsonnet
{
  withType(type):: {}
}
```

