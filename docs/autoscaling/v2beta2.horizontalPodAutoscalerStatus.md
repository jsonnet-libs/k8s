
## horizontalPodAutoscalerStatus
HorizontalPodAutoscalerStatus describes the current status of a horizontal pod autoscaler.

**Functions:**

[`fn .withConditions`](#fn-withconditions)  
[`fn .withCurrentMetrics`](#fn-withcurrentmetrics)  
[`fn .withCurrentReplicas`](#fn-withcurrentreplicas)  
[`fn .withDesiredReplicas`](#fn-withdesiredreplicas)  
[`fn .withLastScaleTime`](#fn-withlastscaletime)  
[`fn .withObservedGeneration`](#fn-withobservedgeneration)  

---


### `fn .withConditions`
conditions is the set of conditions required for this autoscaler to scale its target, and indicates whether or not those conditions are met.
```jsonnet
{
  withConditions(conditions):: {}
}
```

### `fn .withCurrentMetrics`
currentMetrics is the last read state of the metrics used by this autoscaler.
```jsonnet
{
  withCurrentMetrics(currentMetrics):: {}
}
```

### `fn .withCurrentReplicas`
currentReplicas is current number of replicas of pods managed by this autoscaler, as last seen by the autoscaler.
```jsonnet
{
  withCurrentReplicas(currentReplicas):: {}
}
```

### `fn .withDesiredReplicas`
desiredReplicas is the desired number of replicas of pods managed by this autoscaler, as last calculated by the autoscaler.
```jsonnet
{
  withDesiredReplicas(desiredReplicas):: {}
}
```

### `fn .withLastScaleTime`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withLastScaleTime(lastScaleTime):: {}
}
```

### `fn .withObservedGeneration`
observedGeneration is the most recent generation observed by this autoscaler.
```jsonnet
{
  withObservedGeneration(observedGeneration):: {}
}
```

