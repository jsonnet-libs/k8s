
## statefulSetUpdateStrategy
StatefulSetUpdateStrategy indicates the strategy that the StatefulSet controller will use to perform updates. It includes any additional parameters necessary to perform the update for the indicated strategy.

**Functions:**

[`fn .withType`](#fn-withtype)  
[`fn rollingUpdate.withPartition`](#fn-rollingupdatewithpartition)  

---


### `fn .withType`
Type indicates the type of the StatefulSetUpdateStrategy.
```jsonnet
{
  withType(type):: {}
}
```

### `fn rollingUpdate.withPartition`
Partition indicates the ordinal at which the StatefulSet should be partitioned.
```jsonnet
{
  withPartition(partition):: {}
}
```

