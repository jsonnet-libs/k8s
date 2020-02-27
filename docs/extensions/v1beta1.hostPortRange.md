
## hostPortRange
HostPortRange defines a range of host ports that will be enabled by a policy for pods to use.  It requires both the start and end to be defined. Deprecated: use HostPortRange from policy API Group instead.

**Functions:**

[`fn .withMax`](#fn-withmax)  
[`fn .withMin`](#fn-withmin)  

---


### `fn .withMax`
max is the end of the range, inclusive.
```jsonnet
{
  withMax(max):: {}
}
```

### `fn .withMin`
min is the start of the range, inclusive.
```jsonnet
{
  withMin(min):: {}
}
```

