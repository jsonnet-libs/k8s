
## deploymentRollback
DEPRECATED. DeploymentRollback stores the information required to rollback a deployment.

**Functions:**

[`fn .withName`](#fn-withname)  
[`fn .withUpdatedAnnotations`](#fn-withupdatedannotations)  
[`fn rollbackTo.withRevision`](#fn-rollbacktowithrevision)  

---


### `fn .withName`
Required: This must match the Name of a deployment.
```jsonnet
{
  withName(name):: {}
}
```

### `fn .withUpdatedAnnotations`
The annotations to be updated to a deployment
```jsonnet
{
  withUpdatedAnnotations(updatedAnnotations):: {}
}
```

### `fn rollbackTo.withRevision`
The revision to rollback to. If set to 0, rollback to the last revision.
```jsonnet
{
  withRevision(revision):: {}
}
```

