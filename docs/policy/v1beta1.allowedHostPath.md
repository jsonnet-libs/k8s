
## allowedHostPath
AllowedHostPath defines the host volume conditions that will be enabled by a policy for pods to use. It requires the path prefix to be defined.

**Functions:**

[`fn .withPathPrefix`](#fn-withpathprefix)  
[`fn .withReadOnly`](#fn-withreadonly)  

---


### `fn .withPathPrefix`
pathPrefix is the path prefix that the host volume must match. It does not support `*`. Trailing slashes are trimmed when validating the path prefix with a host path.

Examples: `/foo` would allow `/foo`, `/foo/` and `/foo/bar` `/foo` would not allow `/food` or `/etc/foo`
```jsonnet
{
  withPathPrefix(pathPrefix):: {}
}
```

### `fn .withReadOnly`
when set to true, will allow host volumes matching the pathPrefix only if all volume mounts are readOnly.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

