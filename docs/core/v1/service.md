## Service

Service is a named abstraction of software service (for example, mysql)
consisting of local port (for example 3306) that the proxy listens on, and the
selector that determines which pods will answer requests sent through the proxy.

### `fn new`

`new` returns an instance of `Service`

```jsonnet
new(name):: {}
```

### `fn metadata.withNamespace`

```jsonnet
withNamespace(namespace):: {}
```
