
## volumeAttachment
VolumeAttachment captures the intent to attach or detach the specified volume to/from the specified node.

VolumeAttachment objects are non-namespaced.

**Functions:**

[`fn new`](#fn-new)  
[`fn metadata.withAnnotations`](#fn-metadatawithannotations)  
[`fn metadata.withClusterName`](#fn-metadatawithclustername)  
[`fn metadata.withCreationTimestamp`](#fn-metadatawithcreationtimestamp)  
[`fn metadata.withDeletionGracePeriodSeconds`](#fn-metadatawithdeletiongraceperiodseconds)  
[`fn metadata.withDeletionTimestamp`](#fn-metadatawithdeletiontimestamp)  
[`fn metadata.withFinalizers`](#fn-metadatawithfinalizers)  
[`fn metadata.withGenerateName`](#fn-metadatawithgeneratename)  
[`fn metadata.withGeneration`](#fn-metadatawithgeneration)  
[`fn metadata.withLabels`](#fn-metadatawithlabels)  
[`fn metadata.withManagedFields`](#fn-metadatawithmanagedfields)  
[`fn metadata.withName`](#fn-metadatawithname)  
[`fn metadata.withNamespace`](#fn-metadatawithnamespace)  
[`fn metadata.withOwnerReferences`](#fn-metadatawithownerreferences)  
[`fn metadata.withResourceVersion`](#fn-metadatawithresourceversion)  
[`fn metadata.withSelfLink`](#fn-metadatawithselflink)  
[`fn metadata.withUid`](#fn-metadatawithuid)  
[`fn spec.source.inlineVolumeSpec.awsElasticBlockStore.withFsType`](#fn-specsourceinlinevolumespecawselasticblockstorewithfstype)  
[`fn spec.source.inlineVolumeSpec.awsElasticBlockStore.withPartition`](#fn-specsourceinlinevolumespecawselasticblockstorewithpartition)  
[`fn spec.source.inlineVolumeSpec.awsElasticBlockStore.withReadOnly`](#fn-specsourceinlinevolumespecawselasticblockstorewithreadonly)  
[`fn spec.source.inlineVolumeSpec.awsElasticBlockStore.withVolumeID`](#fn-specsourceinlinevolumespecawselasticblockstorewithvolumeid)  
[`fn spec.source.inlineVolumeSpec.azureDisk.withCachingMode`](#fn-specsourceinlinevolumespecazurediskwithcachingmode)  
[`fn spec.source.inlineVolumeSpec.azureDisk.withDiskName`](#fn-specsourceinlinevolumespecazurediskwithdiskname)  
[`fn spec.source.inlineVolumeSpec.azureDisk.withDiskURI`](#fn-specsourceinlinevolumespecazurediskwithdiskuri)  
[`fn spec.source.inlineVolumeSpec.azureDisk.withFsType`](#fn-specsourceinlinevolumespecazurediskwithfstype)  
[`fn spec.source.inlineVolumeSpec.azureDisk.withReadOnly`](#fn-specsourceinlinevolumespecazurediskwithreadonly)  
[`fn spec.source.inlineVolumeSpec.azureFile.withReadOnly`](#fn-specsourceinlinevolumespecazurefilewithreadonly)  
[`fn spec.source.inlineVolumeSpec.azureFile.withSecretName`](#fn-specsourceinlinevolumespecazurefilewithsecretname)  
[`fn spec.source.inlineVolumeSpec.azureFile.withSecretNamespace`](#fn-specsourceinlinevolumespecazurefilewithsecretnamespace)  
[`fn spec.source.inlineVolumeSpec.azureFile.withShareName`](#fn-specsourceinlinevolumespecazurefilewithsharename)  
[`fn spec.source.inlineVolumeSpec.cephfs.secretRef.withName`](#fn-specsourceinlinevolumespeccephfssecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.cephfs.secretRef.withNamespace`](#fn-specsourceinlinevolumespeccephfssecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.cephfs.withMonitors`](#fn-specsourceinlinevolumespeccephfswithmonitors)  
[`fn spec.source.inlineVolumeSpec.cephfs.withPath`](#fn-specsourceinlinevolumespeccephfswithpath)  
[`fn spec.source.inlineVolumeSpec.cephfs.withReadOnly`](#fn-specsourceinlinevolumespeccephfswithreadonly)  
[`fn spec.source.inlineVolumeSpec.cephfs.withSecretFile`](#fn-specsourceinlinevolumespeccephfswithsecretfile)  
[`fn spec.source.inlineVolumeSpec.cephfs.withUser`](#fn-specsourceinlinevolumespeccephfswithuser)  
[`fn spec.source.inlineVolumeSpec.cinder.secretRef.withName`](#fn-specsourceinlinevolumespeccindersecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.cinder.secretRef.withNamespace`](#fn-specsourceinlinevolumespeccindersecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.cinder.withFsType`](#fn-specsourceinlinevolumespeccinderwithfstype)  
[`fn spec.source.inlineVolumeSpec.cinder.withReadOnly`](#fn-specsourceinlinevolumespeccinderwithreadonly)  
[`fn spec.source.inlineVolumeSpec.cinder.withVolumeID`](#fn-specsourceinlinevolumespeccinderwithvolumeid)  
[`fn spec.source.inlineVolumeSpec.claimRef.withFieldPath`](#fn-specsourceinlinevolumespecclaimrefwithfieldpath)  
[`fn spec.source.inlineVolumeSpec.claimRef.withName`](#fn-specsourceinlinevolumespecclaimrefwithname)  
[`fn spec.source.inlineVolumeSpec.claimRef.withNamespace`](#fn-specsourceinlinevolumespecclaimrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.claimRef.withResourceVersion`](#fn-specsourceinlinevolumespecclaimrefwithresourceversion)  
[`fn spec.source.inlineVolumeSpec.claimRef.withUid`](#fn-specsourceinlinevolumespecclaimrefwithuid)  
[`fn spec.source.inlineVolumeSpec.csi.controllerExpandSecretRef.withName`](#fn-specsourceinlinevolumespeccsicontrollerexpandsecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.csi.controllerExpandSecretRef.withNamespace`](#fn-specsourceinlinevolumespeccsicontrollerexpandsecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.csi.controllerPublishSecretRef.withName`](#fn-specsourceinlinevolumespeccsicontrollerpublishsecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.csi.controllerPublishSecretRef.withNamespace`](#fn-specsourceinlinevolumespeccsicontrollerpublishsecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.csi.nodePublishSecretRef.withName`](#fn-specsourceinlinevolumespeccsinodepublishsecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.csi.nodePublishSecretRef.withNamespace`](#fn-specsourceinlinevolumespeccsinodepublishsecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.csi.nodeStageSecretRef.withName`](#fn-specsourceinlinevolumespeccsinodestagesecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.csi.nodeStageSecretRef.withNamespace`](#fn-specsourceinlinevolumespeccsinodestagesecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.csi.withDriver`](#fn-specsourceinlinevolumespeccsiwithdriver)  
[`fn spec.source.inlineVolumeSpec.csi.withFsType`](#fn-specsourceinlinevolumespeccsiwithfstype)  
[`fn spec.source.inlineVolumeSpec.csi.withReadOnly`](#fn-specsourceinlinevolumespeccsiwithreadonly)  
[`fn spec.source.inlineVolumeSpec.csi.withVolumeAttributes`](#fn-specsourceinlinevolumespeccsiwithvolumeattributes)  
[`fn spec.source.inlineVolumeSpec.csi.withVolumeHandle`](#fn-specsourceinlinevolumespeccsiwithvolumehandle)  
[`fn spec.source.inlineVolumeSpec.fc.withFsType`](#fn-specsourceinlinevolumespecfcwithfstype)  
[`fn spec.source.inlineVolumeSpec.fc.withLun`](#fn-specsourceinlinevolumespecfcwithlun)  
[`fn spec.source.inlineVolumeSpec.fc.withReadOnly`](#fn-specsourceinlinevolumespecfcwithreadonly)  
[`fn spec.source.inlineVolumeSpec.fc.withTargetWWNs`](#fn-specsourceinlinevolumespecfcwithtargetwwns)  
[`fn spec.source.inlineVolumeSpec.fc.withWwids`](#fn-specsourceinlinevolumespecfcwithwwids)  
[`fn spec.source.inlineVolumeSpec.flexVolume.secretRef.withName`](#fn-specsourceinlinevolumespecflexvolumesecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.flexVolume.secretRef.withNamespace`](#fn-specsourceinlinevolumespecflexvolumesecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.flexVolume.withDriver`](#fn-specsourceinlinevolumespecflexvolumewithdriver)  
[`fn spec.source.inlineVolumeSpec.flexVolume.withFsType`](#fn-specsourceinlinevolumespecflexvolumewithfstype)  
[`fn spec.source.inlineVolumeSpec.flexVolume.withOptions`](#fn-specsourceinlinevolumespecflexvolumewithoptions)  
[`fn spec.source.inlineVolumeSpec.flexVolume.withReadOnly`](#fn-specsourceinlinevolumespecflexvolumewithreadonly)  
[`fn spec.source.inlineVolumeSpec.flocker.withDatasetName`](#fn-specsourceinlinevolumespecflockerwithdatasetname)  
[`fn spec.source.inlineVolumeSpec.flocker.withDatasetUUID`](#fn-specsourceinlinevolumespecflockerwithdatasetuuid)  
[`fn spec.source.inlineVolumeSpec.gcePersistentDisk.withFsType`](#fn-specsourceinlinevolumespecgcepersistentdiskwithfstype)  
[`fn spec.source.inlineVolumeSpec.gcePersistentDisk.withPartition`](#fn-specsourceinlinevolumespecgcepersistentdiskwithpartition)  
[`fn spec.source.inlineVolumeSpec.gcePersistentDisk.withPdName`](#fn-specsourceinlinevolumespecgcepersistentdiskwithpdname)  
[`fn spec.source.inlineVolumeSpec.gcePersistentDisk.withReadOnly`](#fn-specsourceinlinevolumespecgcepersistentdiskwithreadonly)  
[`fn spec.source.inlineVolumeSpec.glusterfs.withEndpoints`](#fn-specsourceinlinevolumespecglusterfswithendpoints)  
[`fn spec.source.inlineVolumeSpec.glusterfs.withEndpointsNamespace`](#fn-specsourceinlinevolumespecglusterfswithendpointsnamespace)  
[`fn spec.source.inlineVolumeSpec.glusterfs.withPath`](#fn-specsourceinlinevolumespecglusterfswithpath)  
[`fn spec.source.inlineVolumeSpec.glusterfs.withReadOnly`](#fn-specsourceinlinevolumespecglusterfswithreadonly)  
[`fn spec.source.inlineVolumeSpec.hostPath.withPath`](#fn-specsourceinlinevolumespechostpathwithpath)  
[`fn spec.source.inlineVolumeSpec.hostPath.withType`](#fn-specsourceinlinevolumespechostpathwithtype)  
[`fn spec.source.inlineVolumeSpec.iscsi.secretRef.withName`](#fn-specsourceinlinevolumespeciscsisecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.iscsi.secretRef.withNamespace`](#fn-specsourceinlinevolumespeciscsisecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.iscsi.withChapAuthDiscovery`](#fn-specsourceinlinevolumespeciscsiwithchapauthdiscovery)  
[`fn spec.source.inlineVolumeSpec.iscsi.withChapAuthSession`](#fn-specsourceinlinevolumespeciscsiwithchapauthsession)  
[`fn spec.source.inlineVolumeSpec.iscsi.withFsType`](#fn-specsourceinlinevolumespeciscsiwithfstype)  
[`fn spec.source.inlineVolumeSpec.iscsi.withInitiatorName`](#fn-specsourceinlinevolumespeciscsiwithinitiatorname)  
[`fn spec.source.inlineVolumeSpec.iscsi.withIqn`](#fn-specsourceinlinevolumespeciscsiwithiqn)  
[`fn spec.source.inlineVolumeSpec.iscsi.withIscsiInterface`](#fn-specsourceinlinevolumespeciscsiwithiscsiinterface)  
[`fn spec.source.inlineVolumeSpec.iscsi.withLun`](#fn-specsourceinlinevolumespeciscsiwithlun)  
[`fn spec.source.inlineVolumeSpec.iscsi.withPortals`](#fn-specsourceinlinevolumespeciscsiwithportals)  
[`fn spec.source.inlineVolumeSpec.iscsi.withReadOnly`](#fn-specsourceinlinevolumespeciscsiwithreadonly)  
[`fn spec.source.inlineVolumeSpec.iscsi.withTargetPortal`](#fn-specsourceinlinevolumespeciscsiwithtargetportal)  
[`fn spec.source.inlineVolumeSpec.local.withFsType`](#fn-specsourceinlinevolumespeclocalwithfstype)  
[`fn spec.source.inlineVolumeSpec.local.withPath`](#fn-specsourceinlinevolumespeclocalwithpath)  
[`fn spec.source.inlineVolumeSpec.nfs.withPath`](#fn-specsourceinlinevolumespecnfswithpath)  
[`fn spec.source.inlineVolumeSpec.nfs.withReadOnly`](#fn-specsourceinlinevolumespecnfswithreadonly)  
[`fn spec.source.inlineVolumeSpec.nfs.withServer`](#fn-specsourceinlinevolumespecnfswithserver)  
[`fn spec.source.inlineVolumeSpec.nodeAffinity.required.withNodeSelectorTerms`](#fn-specsourceinlinevolumespecnodeaffinityrequiredwithnodeselectorterms)  
[`fn spec.source.inlineVolumeSpec.photonPersistentDisk.withFsType`](#fn-specsourceinlinevolumespecphotonpersistentdiskwithfstype)  
[`fn spec.source.inlineVolumeSpec.photonPersistentDisk.withPdID`](#fn-specsourceinlinevolumespecphotonpersistentdiskwithpdid)  
[`fn spec.source.inlineVolumeSpec.portworxVolume.withFsType`](#fn-specsourceinlinevolumespecportworxvolumewithfstype)  
[`fn spec.source.inlineVolumeSpec.portworxVolume.withReadOnly`](#fn-specsourceinlinevolumespecportworxvolumewithreadonly)  
[`fn spec.source.inlineVolumeSpec.portworxVolume.withVolumeID`](#fn-specsourceinlinevolumespecportworxvolumewithvolumeid)  
[`fn spec.source.inlineVolumeSpec.quobyte.withGroup`](#fn-specsourceinlinevolumespecquobytewithgroup)  
[`fn spec.source.inlineVolumeSpec.quobyte.withReadOnly`](#fn-specsourceinlinevolumespecquobytewithreadonly)  
[`fn spec.source.inlineVolumeSpec.quobyte.withRegistry`](#fn-specsourceinlinevolumespecquobytewithregistry)  
[`fn spec.source.inlineVolumeSpec.quobyte.withTenant`](#fn-specsourceinlinevolumespecquobytewithtenant)  
[`fn spec.source.inlineVolumeSpec.quobyte.withUser`](#fn-specsourceinlinevolumespecquobytewithuser)  
[`fn spec.source.inlineVolumeSpec.quobyte.withVolume`](#fn-specsourceinlinevolumespecquobytewithvolume)  
[`fn spec.source.inlineVolumeSpec.rbd.secretRef.withName`](#fn-specsourceinlinevolumespecrbdsecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.rbd.secretRef.withNamespace`](#fn-specsourceinlinevolumespecrbdsecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.rbd.withFsType`](#fn-specsourceinlinevolumespecrbdwithfstype)  
[`fn spec.source.inlineVolumeSpec.rbd.withImage`](#fn-specsourceinlinevolumespecrbdwithimage)  
[`fn spec.source.inlineVolumeSpec.rbd.withKeyring`](#fn-specsourceinlinevolumespecrbdwithkeyring)  
[`fn spec.source.inlineVolumeSpec.rbd.withMonitors`](#fn-specsourceinlinevolumespecrbdwithmonitors)  
[`fn spec.source.inlineVolumeSpec.rbd.withPool`](#fn-specsourceinlinevolumespecrbdwithpool)  
[`fn spec.source.inlineVolumeSpec.rbd.withReadOnly`](#fn-specsourceinlinevolumespecrbdwithreadonly)  
[`fn spec.source.inlineVolumeSpec.rbd.withUser`](#fn-specsourceinlinevolumespecrbdwithuser)  
[`fn spec.source.inlineVolumeSpec.scaleIO.secretRef.withName`](#fn-specsourceinlinevolumespecscaleiosecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.scaleIO.secretRef.withNamespace`](#fn-specsourceinlinevolumespecscaleiosecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withFsType`](#fn-specsourceinlinevolumespecscaleiowithfstype)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withGateway`](#fn-specsourceinlinevolumespecscaleiowithgateway)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withProtectionDomain`](#fn-specsourceinlinevolumespecscaleiowithprotectiondomain)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withReadOnly`](#fn-specsourceinlinevolumespecscaleiowithreadonly)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withSslEnabled`](#fn-specsourceinlinevolumespecscaleiowithsslenabled)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withStorageMode`](#fn-specsourceinlinevolumespecscaleiowithstoragemode)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withStoragePool`](#fn-specsourceinlinevolumespecscaleiowithstoragepool)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withSystem`](#fn-specsourceinlinevolumespecscaleiowithsystem)  
[`fn spec.source.inlineVolumeSpec.scaleIO.withVolumeName`](#fn-specsourceinlinevolumespecscaleiowithvolumename)  
[`fn spec.source.inlineVolumeSpec.storageos.secretRef.withFieldPath`](#fn-specsourceinlinevolumespecstorageossecretrefwithfieldpath)  
[`fn spec.source.inlineVolumeSpec.storageos.secretRef.withName`](#fn-specsourceinlinevolumespecstorageossecretrefwithname)  
[`fn spec.source.inlineVolumeSpec.storageos.secretRef.withNamespace`](#fn-specsourceinlinevolumespecstorageossecretrefwithnamespace)  
[`fn spec.source.inlineVolumeSpec.storageos.secretRef.withResourceVersion`](#fn-specsourceinlinevolumespecstorageossecretrefwithresourceversion)  
[`fn spec.source.inlineVolumeSpec.storageos.secretRef.withUid`](#fn-specsourceinlinevolumespecstorageossecretrefwithuid)  
[`fn spec.source.inlineVolumeSpec.storageos.withFsType`](#fn-specsourceinlinevolumespecstorageoswithfstype)  
[`fn spec.source.inlineVolumeSpec.storageos.withReadOnly`](#fn-specsourceinlinevolumespecstorageoswithreadonly)  
[`fn spec.source.inlineVolumeSpec.storageos.withVolumeName`](#fn-specsourceinlinevolumespecstorageoswithvolumename)  
[`fn spec.source.inlineVolumeSpec.storageos.withVolumeNamespace`](#fn-specsourceinlinevolumespecstorageoswithvolumenamespace)  
[`fn spec.source.inlineVolumeSpec.vsphereVolume.withFsType`](#fn-specsourceinlinevolumespecvspherevolumewithfstype)  
[`fn spec.source.inlineVolumeSpec.vsphereVolume.withStoragePolicyID`](#fn-specsourceinlinevolumespecvspherevolumewithstoragepolicyid)  
[`fn spec.source.inlineVolumeSpec.vsphereVolume.withStoragePolicyName`](#fn-specsourceinlinevolumespecvspherevolumewithstoragepolicyname)  
[`fn spec.source.inlineVolumeSpec.vsphereVolume.withVolumePath`](#fn-specsourceinlinevolumespecvspherevolumewithvolumepath)  
[`fn spec.source.inlineVolumeSpec.withAccessModes`](#fn-specsourceinlinevolumespecwithaccessmodes)  
[`fn spec.source.inlineVolumeSpec.withCapacity`](#fn-specsourceinlinevolumespecwithcapacity)  
[`fn spec.source.inlineVolumeSpec.withMountOptions`](#fn-specsourceinlinevolumespecwithmountoptions)  
[`fn spec.source.inlineVolumeSpec.withPersistentVolumeReclaimPolicy`](#fn-specsourceinlinevolumespecwithpersistentvolumereclaimpolicy)  
[`fn spec.source.inlineVolumeSpec.withStorageClassName`](#fn-specsourceinlinevolumespecwithstorageclassname)  
[`fn spec.source.inlineVolumeSpec.withVolumeMode`](#fn-specsourceinlinevolumespecwithvolumemode)  
[`fn spec.source.withPersistentVolumeName`](#fn-specsourcewithpersistentvolumename)  
[`fn spec.withAttacher`](#fn-specwithattacher)  
[`fn spec.withNodeName`](#fn-specwithnodename)  

---


### `fn new`
new returns an instance of Volumeattachment
```jsonnet
{
  new(name):: {}
}
```

### `fn metadata.withAnnotations`
Annotations is an unstructured key value map stored with a resource that may be set by external tools to store and retrieve arbitrary metadata. They are not queryable and should be preserved when modifying objects. More info: http://kubernetes.io/docs/user-guide/annotations
```jsonnet
{
  withAnnotations(annotations):: {}
}
```

### `fn metadata.withClusterName`
The name of the cluster which the object belongs to. This is used to distinguish resources with same name and namespace in different clusters. This field is not set anywhere right now and apiserver is going to ignore it if set in create or update request.
```jsonnet
{
  withClusterName(clusterName):: {}
}
```

### `fn metadata.withCreationTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withCreationTimestamp(creationTimestamp):: {}
}
```

### `fn metadata.withDeletionGracePeriodSeconds`
Number of seconds allowed for this object to gracefully terminate before it will be removed from the system. Only set when deletionTimestamp is also set. May only be shortened. Read-only.
```jsonnet
{
  withDeletionGracePeriodSeconds(deletionGracePeriodSeconds):: {}
}
```

### `fn metadata.withDeletionTimestamp`
Time is a wrapper around time.Time which supports correct marshaling to YAML and JSON.  Wrappers are provided for many of the factory methods that the time package offers.
```jsonnet
{
  withDeletionTimestamp(deletionTimestamp):: {}
}
```

### `fn metadata.withFinalizers`
Must be empty before the object is deleted from the registry. Each entry is an identifier for the responsible component that will remove the entry from the list. If the deletionTimestamp of the object is non-nil, entries in this list can only be removed.
```jsonnet
{
  withFinalizers(finalizers):: {}
}
```

### `fn metadata.withGenerateName`
GenerateName is an optional prefix, used by the server, to generate a unique name ONLY IF the Name field has not been provided. If this field is used, the name returned to the client will be different than the name passed. This value will also be combined with a unique suffix. The provided value has the same validation rules as the Name field, and may be truncated by the length of the suffix required to make the value unique on the server.

If this field is specified and the generated name exists, the server will NOT return a 409 - instead, it will either return 201 Created or 500 with Reason ServerTimeout indicating a unique name could not be found in the time allotted, and the client should retry (optionally after the time indicated in the Retry-After header).

Applied only if Name is not specified. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#idempotency
```jsonnet
{
  withGenerateName(generateName):: {}
}
```

### `fn metadata.withGeneration`
A sequence number representing a specific generation of the desired state. Populated by the system. Read-only.
```jsonnet
{
  withGeneration(generation):: {}
}
```

### `fn metadata.withLabels`
Map of string keys and values that can be used to organize and categorize (scope and select) objects. May match selectors of replication controllers and services. More info: http://kubernetes.io/docs/user-guide/labels
```jsonnet
{
  withLabels(labels):: {}
}
```

### `fn metadata.withManagedFields`
ManagedFields maps workflow-id and version to the set of fields that are managed by that workflow. This is mostly for internal housekeeping, and users typically shouldn't need to set or understand this field. A workflow can be the user's name, a controller's name, or the name of a specific apply path like "ci-cd". The set of fields is always in the version that the workflow used when modifying the object.
```jsonnet
{
  withManagedFields(managedFields):: {}
}
```

### `fn metadata.withName`
Name must be unique within a namespace. Is required when creating resources, although some resources may allow a client to request the generation of an appropriate name automatically. Name is primarily intended for creation idempotence and configuration definition. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/identifiers#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn metadata.withNamespace`
Namespace defines the space within each name must be unique. An empty namespace is equivalent to the "default" namespace, but "default" is the canonical representation. Not all objects are required to be scoped to a namespace - the value of this field for those objects will be empty.

Must be a DNS_LABEL. Cannot be updated. More info: http://kubernetes.io/docs/user-guide/namespaces
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn metadata.withOwnerReferences`
List of objects depended by this object. If ALL objects in the list have been deleted, this object will be garbage collected. If this object is managed by a controller, then an entry in this list will point to this controller, with the controller field set to true. There cannot be more than one managing controller.
```jsonnet
{
  withOwnerReferences(ownerReferences):: {}
}
```

### `fn metadata.withResourceVersion`
An opaque value that represents the internal version of this object that can be used by clients to determine when objects have changed. May be used for optimistic concurrency, change detection, and the watch operation on a resource or set of resources. Clients must treat these values as opaque and passed unmodified back to the server. They may only be valid for a particular resource or set of resources.

Populated by the system. Read-only. Value must be treated as opaque by clients and . More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn metadata.withSelfLink`
SelfLink is a URL representing this object. Populated by the system. Read-only.

DEPRECATED Kubernetes will stop propagating this field in 1.20 release and the field is planned to be removed in 1.21 release.
```jsonnet
{
  withSelfLink(selfLink):: {}
}
```

### `fn metadata.withUid`
UID is the unique in time and space value for this object. It is typically generated by the server on successful creation of a resource and is not allowed to change on PUT operations.

Populated by the system. Read-only. More info: http://kubernetes.io/docs/user-guide/identifiers#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn spec.source.inlineVolumeSpec.awsElasticBlockStore.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.awsElasticBlockStore.withPartition`
The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty).
```jsonnet
{
  withPartition(partition):: {}
}
```

### `fn spec.source.inlineVolumeSpec.awsElasticBlockStore.withReadOnly`
Specify "true" to force and set the ReadOnly property in VolumeMounts to "true". If omitted, the default is "false". More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.awsElasticBlockStore.withVolumeID`
Unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureDisk.withCachingMode`
Host Caching mode: None, Read Only, Read Write.
```jsonnet
{
  withCachingMode(cachingMode):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureDisk.withDiskName`
The Name of the data disk in the blob storage
```jsonnet
{
  withDiskName(diskName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureDisk.withDiskURI`
The URI the data disk in the blob storage
```jsonnet
{
  withDiskURI(diskURI):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureDisk.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureDisk.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureFile.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureFile.withSecretName`
the name of secret that contains Azure Storage Account Name and Key
```jsonnet
{
  withSecretName(secretName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureFile.withSecretNamespace`
the namespace of the secret that contains Azure Storage Account Name and Key default is the same as the Pod
```jsonnet
{
  withSecretNamespace(secretNamespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.azureFile.withShareName`
Share Name
```jsonnet
{
  withShareName(shareName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cephfs.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cephfs.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cephfs.withMonitors`
Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withMonitors(monitors):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cephfs.withPath`
Optional: Used as the mounted root, rather than the full Ceph tree, default is /
```jsonnet
{
  withPath(path):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cephfs.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cephfs.withSecretFile`
Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withSecretFile(secretFile):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cephfs.withUser`
Optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withUser(user):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cinder.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cinder.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cinder.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cinder.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.cinder.withVolumeID`
volume id used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn spec.source.inlineVolumeSpec.claimRef.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn spec.source.inlineVolumeSpec.claimRef.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.claimRef.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.claimRef.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn spec.source.inlineVolumeSpec.claimRef.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.controllerExpandSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.controllerExpandSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.controllerPublishSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.controllerPublishSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.nodePublishSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.nodePublishSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.nodeStageSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.nodeStageSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.withDriver`
Driver is the name of the driver to use for this volume. Required.
```jsonnet
{
  withDriver(driver):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs".
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.withReadOnly`
Optional: The value to pass to ControllerPublishVolumeRequest. Defaults to false (read/write).
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.withVolumeAttributes`
Attributes of the volume to publish.
```jsonnet
{
  withVolumeAttributes(volumeAttributes):: {}
}
```

### `fn spec.source.inlineVolumeSpec.csi.withVolumeHandle`
VolumeHandle is the unique volume name returned by the CSI volume plugin’s CreateVolume to refer to the volume on all subsequent calls. Required.
```jsonnet
{
  withVolumeHandle(volumeHandle):: {}
}
```

### `fn spec.source.inlineVolumeSpec.fc.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.fc.withLun`
Optional: FC target lun number
```jsonnet
{
  withLun(lun):: {}
}
```

### `fn spec.source.inlineVolumeSpec.fc.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.fc.withTargetWWNs`
Optional: FC target worldwide names (WWNs)
```jsonnet
{
  withTargetWWNs(targetWWNs):: {}
}
```

### `fn spec.source.inlineVolumeSpec.fc.withWwids`
Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously.
```jsonnet
{
  withWwids(wwids):: {}
}
```

### `fn spec.source.inlineVolumeSpec.flexVolume.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.flexVolume.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.flexVolume.withDriver`
Driver is the name of the driver to use for this volume.
```jsonnet
{
  withDriver(driver):: {}
}
```

### `fn spec.source.inlineVolumeSpec.flexVolume.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.flexVolume.withOptions`
Optional: Extra command options if any.
```jsonnet
{
  withOptions(options):: {}
}
```

### `fn spec.source.inlineVolumeSpec.flexVolume.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.flocker.withDatasetName`
Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated
```jsonnet
{
  withDatasetName(datasetName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.flocker.withDatasetUUID`
UUID of the dataset. This is unique identifier of a Flocker dataset
```jsonnet
{
  withDatasetUUID(datasetUUID):: {}
}
```

### `fn spec.source.inlineVolumeSpec.gcePersistentDisk.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.gcePersistentDisk.withPartition`
The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty). More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withPartition(partition):: {}
}
```

### `fn spec.source.inlineVolumeSpec.gcePersistentDisk.withPdName`
Unique name of the PD resource in GCE. Used to identify the disk in GCE. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withPdName(pdName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.gcePersistentDisk.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.glusterfs.withEndpoints`
EndpointsName is the endpoint name that details Glusterfs topology. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withEndpoints(endpoints):: {}
}
```

### `fn spec.source.inlineVolumeSpec.glusterfs.withEndpointsNamespace`
EndpointsNamespace is the namespace that contains Glusterfs endpoint. If this field is empty, the EndpointNamespace defaults to the same namespace as the bound PVC. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withEndpointsNamespace(endpointsNamespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.glusterfs.withPath`
Path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withPath(path):: {}
}
```

### `fn spec.source.inlineVolumeSpec.glusterfs.withReadOnly`
ReadOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.hostPath.withPath`
Path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
```jsonnet
{
  withPath(path):: {}
}
```

### `fn spec.source.inlineVolumeSpec.hostPath.withType`
Type for HostPath Volume Defaults to "" More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
```jsonnet
{
  withType(type):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withChapAuthDiscovery`
whether support iSCSI Discovery CHAP authentication
```jsonnet
{
  withChapAuthDiscovery(chapAuthDiscovery):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withChapAuthSession`
whether support iSCSI Session CHAP authentication
```jsonnet
{
  withChapAuthSession(chapAuthSession):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#iscsi
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withInitiatorName`
Custom iSCSI Initiator Name. If initiatorName is specified with iscsiInterface simultaneously, new iSCSI interface <target portal>:<volume name> will be created for the connection.
```jsonnet
{
  withInitiatorName(initiatorName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withIqn`
Target iSCSI Qualified Name.
```jsonnet
{
  withIqn(iqn):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withIscsiInterface`
iSCSI Interface Name that uses an iSCSI transport. Defaults to 'default' (tcp).
```jsonnet
{
  withIscsiInterface(iscsiInterface):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withLun`
iSCSI Target Lun number.
```jsonnet
{
  withLun(lun):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withPortals`
iSCSI Target Portal List. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
```jsonnet
{
  withPortals(portals):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.iscsi.withTargetPortal`
iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
```jsonnet
{
  withTargetPortal(targetPortal):: {}
}
```

### `fn spec.source.inlineVolumeSpec.local.withFsType`
Filesystem type to mount. It applies only when the Path is a block device. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default value is to auto-select a fileystem if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.local.withPath`
The full path to the volume on the node. It can be either a directory or block device (disk, partition, ...).
```jsonnet
{
  withPath(path):: {}
}
```

### `fn spec.source.inlineVolumeSpec.nfs.withPath`
Path that is exported by the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withPath(path):: {}
}
```

### `fn spec.source.inlineVolumeSpec.nfs.withReadOnly`
ReadOnly here will force the NFS export to be mounted with read-only permissions. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.nfs.withServer`
Server is the hostname or IP address of the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withServer(server):: {}
}
```

### `fn spec.source.inlineVolumeSpec.nodeAffinity.required.withNodeSelectorTerms`
Required. A list of node selector terms. The terms are ORed.
```jsonnet
{
  withNodeSelectorTerms(nodeSelectorTerms):: {}
}
```

### `fn spec.source.inlineVolumeSpec.photonPersistentDisk.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.photonPersistentDisk.withPdID`
ID that identifies Photon Controller persistent disk
```jsonnet
{
  withPdID(pdID):: {}
}
```

### `fn spec.source.inlineVolumeSpec.portworxVolume.withFsType`
FSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.portworxVolume.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.portworxVolume.withVolumeID`
VolumeID uniquely identifies a Portworx volume
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn spec.source.inlineVolumeSpec.quobyte.withGroup`
Group to map volume access to Default is no group
```jsonnet
{
  withGroup(group):: {}
}
```

### `fn spec.source.inlineVolumeSpec.quobyte.withReadOnly`
ReadOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.quobyte.withRegistry`
Registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes
```jsonnet
{
  withRegistry(registry):: {}
}
```

### `fn spec.source.inlineVolumeSpec.quobyte.withTenant`
Tenant owning the given Quobyte volume in the Backend Used with dynamically provisioned Quobyte volumes, value is set by the plugin
```jsonnet
{
  withTenant(tenant):: {}
}
```

### `fn spec.source.inlineVolumeSpec.quobyte.withUser`
User to map volume access to Defaults to serivceaccount user
```jsonnet
{
  withUser(user):: {}
}
```

### `fn spec.source.inlineVolumeSpec.quobyte.withVolume`
Volume is a string that references an already created Quobyte volume by name.
```jsonnet
{
  withVolume(volume):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#rbd
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.withImage`
The rados image name. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withImage(image):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.withKeyring`
Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withKeyring(keyring):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.withMonitors`
A collection of Ceph monitors. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withMonitors(monitors):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.withPool`
The rados pool name. Default is rbd. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withPool(pool):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.rbd.withUser`
The rados user name. Default is admin. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withUser(user):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Default is "xfs"
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withGateway`
The host address of the ScaleIO API Gateway.
```jsonnet
{
  withGateway(gateway):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withProtectionDomain`
The name of the ScaleIO Protection Domain for the configured storage.
```jsonnet
{
  withProtectionDomain(protectionDomain):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withSslEnabled`
Flag to enable/disable SSL communication with Gateway, default false
```jsonnet
{
  withSslEnabled(sslEnabled):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withStorageMode`
Indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned.
```jsonnet
{
  withStorageMode(storageMode):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withStoragePool`
The ScaleIO Storage Pool associated with the protection domain.
```jsonnet
{
  withStoragePool(storagePool):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withSystem`
The name of the storage system as configured in ScaleIO.
```jsonnet
{
  withSystem(system):: {}
}
```

### `fn spec.source.inlineVolumeSpec.scaleIO.withVolumeName`
The name of a volume already created in the ScaleIO system that is associated with this volume source.
```jsonnet
{
  withVolumeName(volumeName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.secretRef.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.secretRef.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.secretRef.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.secretRef.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.secretRef.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.withVolumeName`
VolumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
```jsonnet
{
  withVolumeName(volumeName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.storageos.withVolumeNamespace`
VolumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
```jsonnet
{
  withVolumeNamespace(volumeNamespace):: {}
}
```

### `fn spec.source.inlineVolumeSpec.vsphereVolume.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn spec.source.inlineVolumeSpec.vsphereVolume.withStoragePolicyID`
Storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName.
```jsonnet
{
  withStoragePolicyID(storagePolicyID):: {}
}
```

### `fn spec.source.inlineVolumeSpec.vsphereVolume.withStoragePolicyName`
Storage Policy Based Management (SPBM) profile name.
```jsonnet
{
  withStoragePolicyName(storagePolicyName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.vsphereVolume.withVolumePath`
Path that identifies vSphere volume vmdk
```jsonnet
{
  withVolumePath(volumePath):: {}
}
```

### `fn spec.source.inlineVolumeSpec.withAccessModes`
AccessModes contains all ways the volume can be mounted. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes
```jsonnet
{
  withAccessModes(accessModes):: {}
}
```

### `fn spec.source.inlineVolumeSpec.withCapacity`
A description of the persistent volume's resources and capacity. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
```jsonnet
{
  withCapacity(capacity):: {}
}
```

### `fn spec.source.inlineVolumeSpec.withMountOptions`
A list of mount options, e.g. ["ro", "soft"]. Not validated - mount will simply fail if one is invalid. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#mount-options
```jsonnet
{
  withMountOptions(mountOptions):: {}
}
```

### `fn spec.source.inlineVolumeSpec.withPersistentVolumeReclaimPolicy`
What happens to a persistent volume when released from its claim. Valid options are Retain (default for manually created PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and Recycle (deprecated). Recycle must be supported by the volume plugin underlying this PersistentVolume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming
```jsonnet
{
  withPersistentVolumeReclaimPolicy(persistentVolumeReclaimPolicy):: {}
}
```

### `fn spec.source.inlineVolumeSpec.withStorageClassName`
Name of StorageClass to which this persistent volume belongs. Empty value means that this volume does not belong to any StorageClass.
```jsonnet
{
  withStorageClassName(storageClassName):: {}
}
```

### `fn spec.source.inlineVolumeSpec.withVolumeMode`
volumeMode defines if a volume is intended to be used with a formatted filesystem or to remain in raw block state. Value of Filesystem is implied when not included in spec. This is a beta feature.
```jsonnet
{
  withVolumeMode(volumeMode):: {}
}
```

### `fn spec.source.withPersistentVolumeName`
Name of the persistent volume to attach.
```jsonnet
{
  withPersistentVolumeName(persistentVolumeName):: {}
}
```

### `fn spec.withAttacher`
Attacher indicates the name of the volume driver that MUST handle this request. This is the name returned by GetPluginName().
```jsonnet
{
  withAttacher(attacher):: {}
}
```

### `fn spec.withNodeName`
The node that the volume should be attached to.
```jsonnet
{
  withNodeName(nodeName):: {}
}
```

