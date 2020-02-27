
## endpointConditions
EndpointConditions represents the current condition of an endpoint.

**Functions:**

[`fn .withReady`](#fn-withready)  

---


### `fn .withReady`
ready indicates that this endpoint is prepared to receive traffic, according to whatever system is managing the endpoint. A nil value indicates an unknown state. In most cases consumers should interpret this unknown state as ready.
```jsonnet
{
  withReady(ready):: {}
}
```

