
## volumeError
VolumeError captures an error encountered during a volume operation.

**Functions:**

[`fn .withMessage`](#fn-withmessage)  
[`fn .withTime`](#fn-withtime)  

---


### `fn .withMessage`
String detailing the error encountered during Attach or Detach operation. This string may be logged, so it should not contain sensitive information.
```jsonnet
{
  withMessage(message):: {}
}
```

### `fn .withTime`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withTime(time):: {}
}
```

