
## leaseSpec
LeaseSpec is a specification of a Lease.

**Functions:**

[`fn .withAcquireTime`](#fn-withacquiretime)  
[`fn .withHolderIdentity`](#fn-withholderidentity)  
[`fn .withLeaseDurationSeconds`](#fn-withleasedurationseconds)  
[`fn .withLeaseTransitions`](#fn-withleasetransitions)  
[`fn .withRenewTime`](#fn-withrenewtime)  

---


### `fn .withAcquireTime`
MicroTime is version of Time with microsecond level precision.
```jsonnet
{
  withAcquireTime(acquireTime):: {}
}
```

### `fn .withHolderIdentity`
holderIdentity contains the identity of the holder of a current lease.
```jsonnet
{
  withHolderIdentity(holderIdentity):: {}
}
```

### `fn .withLeaseDurationSeconds`
leaseDurationSeconds is a duration that candidates for a lease need to wait to force acquire it. This is measure against time of last observed RenewTime.
```jsonnet
{
  withLeaseDurationSeconds(leaseDurationSeconds):: {}
}
```

### `fn .withLeaseTransitions`
leaseTransitions is the number of transitions of a lease between holders.
```jsonnet
{
  withLeaseTransitions(leaseTransitions):: {}
}
```

### `fn .withRenewTime`
MicroTime is version of Time with microsecond level precision.
```jsonnet
{
  withRenewTime(renewTime):: {}
}
```

