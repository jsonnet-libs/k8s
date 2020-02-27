
## daemonSetStatus
DaemonSetStatus represents the current status of a daemon set.

**Functions:**

[`fn .withCollisionCount`](#fn-withcollisioncount)  
[`fn .withConditions`](#fn-withconditions)  
[`fn .withCurrentNumberScheduled`](#fn-withcurrentnumberscheduled)  
[`fn .withDesiredNumberScheduled`](#fn-withdesirednumberscheduled)  
[`fn .withNumberAvailable`](#fn-withnumberavailable)  
[`fn .withNumberMisscheduled`](#fn-withnumbermisscheduled)  
[`fn .withNumberReady`](#fn-withnumberready)  
[`fn .withNumberUnavailable`](#fn-withnumberunavailable)  
[`fn .withObservedGeneration`](#fn-withobservedgeneration)  
[`fn .withUpdatedNumberScheduled`](#fn-withupdatednumberscheduled)  

---


### `fn .withCollisionCount`
Count of hash collisions for the DaemonSet. The DaemonSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
```jsonnet
{
  withCollisionCount(collisionCount):: {}
}
```

### `fn .withConditions`
Represents the latest available observations of a DaemonSet's current state.
```jsonnet
{
  withConditions(conditions):: {}
}
```

### `fn .withCurrentNumberScheduled`
The number of nodes that are running at least 1 daemon pod and are supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
```jsonnet
{
  withCurrentNumberScheduled(currentNumberScheduled):: {}
}
```

### `fn .withDesiredNumberScheduled`
The total number of nodes that should be running the daemon pod (including nodes correctly running the daemon pod). More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
```jsonnet
{
  withDesiredNumberScheduled(desiredNumberScheduled):: {}
}
```

### `fn .withNumberAvailable`
The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and available (ready for at least spec.minReadySeconds)
```jsonnet
{
  withNumberAvailable(numberAvailable):: {}
}
```

### `fn .withNumberMisscheduled`
The number of nodes that are running the daemon pod, but are not supposed to run the daemon pod. More info: https://kubernetes.io/docs/concepts/workloads/controllers/daemonset/
```jsonnet
{
  withNumberMisscheduled(numberMisscheduled):: {}
}
```

### `fn .withNumberReady`
The number of nodes that should be running the daemon pod and have one or more of the daemon pod running and ready.
```jsonnet
{
  withNumberReady(numberReady):: {}
}
```

### `fn .withNumberUnavailable`
The number of nodes that should be running the daemon pod and have none of the daemon pod running and available (ready for at least spec.minReadySeconds)
```jsonnet
{
  withNumberUnavailable(numberUnavailable):: {}
}
```

### `fn .withObservedGeneration`
The most recent generation observed by the daemon set controller.
```jsonnet
{
  withObservedGeneration(observedGeneration):: {}
}
```

### `fn .withUpdatedNumberScheduled`
The total number of nodes that are running updated daemon pod
```jsonnet
{
  withUpdatedNumberScheduled(updatedNumberScheduled):: {}
}
```

