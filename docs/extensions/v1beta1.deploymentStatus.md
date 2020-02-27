
## deploymentStatus
DeploymentStatus is the most recently observed status of the Deployment.

**Functions:**

[`fn .withAvailableReplicas`](#fn-withavailablereplicas)  
[`fn .withCollisionCount`](#fn-withcollisioncount)  
[`fn .withConditions`](#fn-withconditions)  
[`fn .withObservedGeneration`](#fn-withobservedgeneration)  
[`fn .withReadyReplicas`](#fn-withreadyreplicas)  
[`fn .withReplicas`](#fn-withreplicas)  
[`fn .withUnavailableReplicas`](#fn-withunavailablereplicas)  
[`fn .withUpdatedReplicas`](#fn-withupdatedreplicas)  

---


### `fn .withAvailableReplicas`
Total number of available pods (ready for at least minReadySeconds) targeted by this deployment.
```jsonnet
{
  withAvailableReplicas(availableReplicas):: {}
}
```

### `fn .withCollisionCount`
Count of hash collisions for the Deployment. The Deployment controller uses this field as a collision avoidance mechanism when it needs to create the name for the newest ReplicaSet.
```jsonnet
{
  withCollisionCount(collisionCount):: {}
}
```

### `fn .withConditions`
Represents the latest available observations of a deployment's current state.
```jsonnet
{
  withConditions(conditions):: {}
}
```

### `fn .withObservedGeneration`
The generation observed by the deployment controller.
```jsonnet
{
  withObservedGeneration(observedGeneration):: {}
}
```

### `fn .withReadyReplicas`
Total number of ready pods targeted by this deployment.
```jsonnet
{
  withReadyReplicas(readyReplicas):: {}
}
```

### `fn .withReplicas`
Total number of non-terminated pods targeted by this deployment (their labels match the selector).
```jsonnet
{
  withReplicas(replicas):: {}
}
```

### `fn .withUnavailableReplicas`
Total number of unavailable pods targeted by this deployment. This is the total number of pods that are still required for the deployment to have 100% available capacity. They may either be pods that are running but not yet available or pods that still have not been created.
```jsonnet
{
  withUnavailableReplicas(unavailableReplicas):: {}
}
```

### `fn .withUpdatedReplicas`
Total number of non-terminated pods targeted by this deployment that have the desired template spec.
```jsonnet
{
  withUpdatedReplicas(updatedReplicas):: {}
}
```

