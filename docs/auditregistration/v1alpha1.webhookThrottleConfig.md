
## webhookThrottleConfig
WebhookThrottleConfig holds the configuration for throttling events

**Functions:**

[`fn .withBurst`](#fn-withburst)  
[`fn .withQps`](#fn-withqps)  

---


### `fn .withBurst`
ThrottleBurst is the maximum number of events sent at the same moment default 15 QPS
```jsonnet
{
  withBurst(burst):: {}
}
```

### `fn .withQps`
ThrottleQPS maximum number of batches per second default 10 QPS
```jsonnet
{
  withQps(qps):: {}
}
```

