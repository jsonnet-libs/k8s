
## statefulSetStatus
StatefulSetStatus represents the current state of a StatefulSet.

**Functions:**

[`fn .withCollisionCount`](#fn-withcollisioncount)  
[`fn .withConditions`](#fn-withconditions)  
[`fn .withCurrentReplicas`](#fn-withcurrentreplicas)  
[`fn .withCurrentRevision`](#fn-withcurrentrevision)  
[`fn .withObservedGeneration`](#fn-withobservedgeneration)  
[`fn .withReadyReplicas`](#fn-withreadyreplicas)  
[`fn .withReplicas`](#fn-withreplicas)  
[`fn .withUpdateRevision`](#fn-withupdaterevision)  
[`fn .withUpdatedReplicas`](#fn-withupdatedreplicas)  

---


### `fn .withCollisionCount`
collisionCount is the count of hash collisions for the StatefulSet. The StatefulSet controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ControllerRevision.
```jsonnet
{
  withCollisionCount(collisionCount):: {}
}
```

### `fn .withConditions`
Represents the latest available observations of a statefulset's current state.
```jsonnet
{
  withConditions(conditions):: {}
}
```

### `fn .withCurrentReplicas`
currentReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by currentRevision.
```jsonnet
{
  withCurrentReplicas(currentReplicas):: {}
}
```

### `fn .withCurrentRevision`
currentRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [0,currentReplicas).
```jsonnet
{
  withCurrentRevision(currentRevision):: {}
}
```

### `fn .withObservedGeneration`
observedGeneration is the most recent generation observed for this StatefulSet. It corresponds to the StatefulSet's generation, which is updated on mutation by the API Server.
```jsonnet
{
  withObservedGeneration(observedGeneration):: {}
}
```

### `fn .withReadyReplicas`
readyReplicas is the number of Pods created by the StatefulSet controller that have a Ready Condition.
```jsonnet
{
  withReadyReplicas(readyReplicas):: {}
}
```

### `fn .withReplicas`
replicas is the number of Pods created by the StatefulSet controller.
```jsonnet
{
  withReplicas(replicas):: {}
}
```

### `fn .withUpdateRevision`
updateRevision, if not empty, indicates the version of the StatefulSet used to generate Pods in the sequence [replicas-updatedReplicas,replicas)
```jsonnet
{
  withUpdateRevision(updateRevision):: {}
}
```

### `fn .withUpdatedReplicas`
updatedReplicas is the number of Pods created by the StatefulSet controller from the StatefulSet version indicated by updateRevision.
```jsonnet
{
  withUpdatedReplicas(updatedReplicas):: {}
}
```

