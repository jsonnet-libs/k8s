
## podPresetSpec
PodPresetSpec is a description of a pod preset.

**Functions:**

[`fn .withEnv`](#fn-withenv)  
[`fn .withEnvFrom`](#fn-withenvfrom)  
[`fn .withVolumeMounts`](#fn-withvolumemounts)  
[`fn .withVolumes`](#fn-withvolumes)  
[`fn selector.withMatchExpressions`](#fn-selectorwithmatchexpressions)  
[`fn selector.withMatchLabels`](#fn-selectorwithmatchlabels)  

---


### `fn .withEnv`
Env defines the collection of EnvVar to inject into containers.
```jsonnet
{
  withEnv(env):: {}
}
```

### `fn .withEnvFrom`
EnvFrom defines the collection of EnvFromSource to inject into containers.
```jsonnet
{
  withEnvFrom(envFrom):: {}
}
```

### `fn .withVolumeMounts`
VolumeMounts defines the collection of VolumeMount to inject into containers.
```jsonnet
{
  withVolumeMounts(volumeMounts):: {}
}
```

### `fn .withVolumes`
Volumes defines the collection of Volume to inject into the pod.
```jsonnet
{
  withVolumes(volumes):: {}
}
```

### `fn selector.withMatchExpressions`
matchExpressions is a list of label selector requirements. The requirements are ANDed.
```jsonnet
{
  withMatchExpressions(matchExpressions):: {}
}
```

### `fn selector.withMatchLabels`
matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is "key", the operator is "In", and the values array contains only "value". The requirements are ANDed.
```jsonnet
{
  withMatchLabels(matchLabels):: {}
}
```

