
## volumeAttachmentStatus
VolumeAttachmentStatus is the status of a VolumeAttachment request.

**Functions:**

[`fn .withAttached`](#fn-withattached)  
[`fn .withAttachmentMetadata`](#fn-withattachmentmetadata)  
[`fn attachError.withMessage`](#fn-attacherrorwithmessage)  
[`fn attachError.withTime`](#fn-attacherrorwithtime)  
[`fn detachError.withMessage`](#fn-detacherrorwithmessage)  
[`fn detachError.withTime`](#fn-detacherrorwithtime)  

---


### `fn .withAttached`
Indicates the volume is successfully attached. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
```jsonnet
{
  withAttached(attached):: {}
}
```

### `fn .withAttachmentMetadata`
Upon successful attach, this field is populated with any information returned by the attach operation that must be passed into subsequent WaitForAttach or Mount calls. This field must only be set by the entity completing the attach operation, i.e. the external-attacher.
```jsonnet
{
  withAttachmentMetadata(attachmentMetadata):: {}
}
```

### `fn attachError.withMessage`
String detailing the error encountered during Attach or Detach operation. This string may be logged, so it should not contain sensitive information.
```jsonnet
{
  withMessage(message):: {}
}
```

### `fn attachError.withTime`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withTime(time):: {}
}
```

### `fn detachError.withMessage`
String detailing the error encountered during Attach or Detach operation. This string may be logged, so it should not contain sensitive information.
```jsonnet
{
  withMessage(message):: {}
}
```

### `fn detachError.withTime`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withTime(time):: {}
}
```

