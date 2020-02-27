
## replicaSetStatus
ReplicaSetStatus represents the current status of a ReplicaSet.

**Functions:**

[`fn .withAvailableReplicas`](#fn-withavailablereplicas)  
[`fn .withConditions`](#fn-withconditions)  
[`fn .withFullyLabeledReplicas`](#fn-withfullylabeledreplicas)  
[`fn .withObservedGeneration`](#fn-withobservedgeneration)  
[`fn .withReadyReplicas`](#fn-withreadyreplicas)  
[`fn .withReplicas`](#fn-withreplicas)  

---


### `fn .withAvailableReplicas`
The number of available replicas (ready for at least minReadySeconds) for this replica set.
```jsonnet
{
  withAvailableReplicas(availableReplicas):: {}
}
```

### `fn .withConditions`
Represents the latest available observations of a replica set's current state.
```jsonnet
{
  withConditions(conditions):: {}
}
```

### `fn .withFullyLabeledReplicas`
The number of pods that have labels matching the labels of the pod template of the replicaset.
```jsonnet
{
  withFullyLabeledReplicas(fullyLabeledReplicas):: {}
}
```

### `fn .withObservedGeneration`
ObservedGeneration reflects the generation of the most recently observed ReplicaSet.
```jsonnet
{
  withObservedGeneration(observedGeneration):: {}
}
```

### `fn .withReadyReplicas`
The number of ready replicas for this replica set.
```jsonnet
{
  withReadyReplicas(readyReplicas):: {}
}
```

### `fn .withReplicas`
Replicas is the most recently oberved number of replicas. More info: https://kubernetes.io/docs/concepts/workloads/controllers/replicationcontroller/#what-is-a-replicationcontroller
```jsonnet
{
  withReplicas(replicas):: {}
}
```

