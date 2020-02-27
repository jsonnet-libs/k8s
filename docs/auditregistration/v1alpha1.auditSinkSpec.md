
## auditSinkSpec
AuditSinkSpec holds the spec for the audit sink

**Functions:**

[`fn policy.withLevel`](#fn-policywithlevel)  
[`fn policy.withStages`](#fn-policywithstages)  
[`fn webhook.clientConfig.service.withName`](#fn-webhookclientconfigservicewithname)  
[`fn webhook.clientConfig.service.withNamespace`](#fn-webhookclientconfigservicewithnamespace)  
[`fn webhook.clientConfig.service.withPath`](#fn-webhookclientconfigservicewithpath)  
[`fn webhook.clientConfig.service.withPort`](#fn-webhookclientconfigservicewithport)  
[`fn webhook.clientConfig.withCaBundle`](#fn-webhookclientconfigwithcabundle)  
[`fn webhook.clientConfig.withUrl`](#fn-webhookclientconfigwithurl)  
[`fn webhook.throttle.withBurst`](#fn-webhookthrottlewithburst)  
[`fn webhook.throttle.withQps`](#fn-webhookthrottlewithqps)  

---


### `fn policy.withLevel`
The Level that all requests are recorded at. available options: None, Metadata, Request, RequestResponse required
```jsonnet
{
  withLevel(level):: {}
}
```

### `fn policy.withStages`
Stages is a list of stages for which events are created.
```jsonnet
{
  withStages(stages):: {}
}
```

### `fn webhook.clientConfig.service.withName`
`name` is the name of the service. Required
```jsonnet
{
  withName(name):: {}
}
```

### `fn webhook.clientConfig.service.withNamespace`
`namespace` is the namespace of the service. Required
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn webhook.clientConfig.service.withPath`
`path` is an optional URL path which will be sent in any request to this service.
```jsonnet
{
  withPath(path):: {}
}
```

### `fn webhook.clientConfig.service.withPort`
If specified, the port on the service that hosting webhook. Default to 443 for backward compatibility. `port` should be a valid port number (1-65535, inclusive).
```jsonnet
{
  withPort(port):: {}
}
```

### `fn webhook.clientConfig.withCaBundle`
`caBundle` is a PEM encoded CA bundle which will be used to validate the webhook's server certificate. If unspecified, system trust roots on the apiserver are used.
```jsonnet
{
  withCaBundle(caBundle):: {}
}
```

### `fn webhook.clientConfig.withUrl`
`url` gives the location of the webhook, in standard URL form (`scheme://host:port/path`). Exactly one of `url` or `service` must be specified.

The `host` should not refer to a service running in the cluster; use the `service` field instead. The host might be resolved via external DNS in some apiservers (e.g., `kube-apiserver` cannot resolve in-cluster DNS as that would be a layering violation). `host` may also be an IP address.

Please note that using `localhost` or `127.0.0.1` as a `host` is risky unless you take great care to run this webhook on all hosts which run an apiserver which might need to make calls to this webhook. Such installs are likely to be non-portable, i.e., not easy to turn up in a new cluster.

The scheme must be "https"; the URL must begin with "https://".

A path is optional, and if present may be any string permissible in a URL. You may use the path to pass an arbitrary string to the webhook, for example, a cluster identifier.

Attempting to use a user or basic auth e.g. "user:password@" is not allowed. Fragments ("#...") and query parameters ("?...") are not allowed, either.
```jsonnet
{
  withUrl(url):: {}
}
```

### `fn webhook.throttle.withBurst`
ThrottleBurst is the maximum number of events sent at the same moment default 15 QPS
```jsonnet
{
  withBurst(burst):: {}
}
```

### `fn webhook.throttle.withQps`
ThrottleQPS maximum number of batches per second default 10 QPS
```jsonnet
{
  withQps(qps):: {}
}
```

