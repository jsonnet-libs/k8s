
## horizontalPodAutoscalerCondition
HorizontalPodAutoscalerCondition describes the state of a HorizontalPodAutoscaler at a certain point.

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
message is a human-readable explanation containing details about the transition
```jsonnet
{
  withMessage(message):: {}
}
```

### `fn .withReason`
reason is the reason for the condition's last transition.
```jsonnet
{
  withReason(reason):: {}
}
```

### `fn .withType`
type describes the current condition
```jsonnet
{
  withType(type):: {}
}
```

