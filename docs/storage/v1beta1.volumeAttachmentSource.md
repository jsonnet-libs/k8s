
## volumeAttachmentSource
VolumeAttachmentSource represents a volume that should be attached. Right now only PersistenVolumes can be attached via external attacher, in future we may allow also inline volumes in pods. Exactly one member can be set.

**Functions:**

[`fn .withPersistentVolumeName`](#fn-withpersistentvolumename)  
[`fn inlineVolumeSpec.awsElasticBlockStore.withFsType`](#fn-inlinevolumespecawselasticblockstorewithfstype)  
[`fn inlineVolumeSpec.awsElasticBlockStore.withPartition`](#fn-inlinevolumespecawselasticblockstorewithpartition)  
[`fn inlineVolumeSpec.awsElasticBlockStore.withReadOnly`](#fn-inlinevolumespecawselasticblockstorewithreadonly)  
[`fn inlineVolumeSpec.awsElasticBlockStore.withVolumeID`](#fn-inlinevolumespecawselasticblockstorewithvolumeid)  
[`fn inlineVolumeSpec.azureDisk.withCachingMode`](#fn-inlinevolumespecazurediskwithcachingmode)  
[`fn inlineVolumeSpec.azureDisk.withDiskName`](#fn-inlinevolumespecazurediskwithdiskname)  
[`fn inlineVolumeSpec.azureDisk.withDiskURI`](#fn-inlinevolumespecazurediskwithdiskuri)  
[`fn inlineVolumeSpec.azureDisk.withFsType`](#fn-inlinevolumespecazurediskwithfstype)  
[`fn inlineVolumeSpec.azureDisk.withReadOnly`](#fn-inlinevolumespecazurediskwithreadonly)  
[`fn inlineVolumeSpec.azureFile.withReadOnly`](#fn-inlinevolumespecazurefilewithreadonly)  
[`fn inlineVolumeSpec.azureFile.withSecretName`](#fn-inlinevolumespecazurefilewithsecretname)  
[`fn inlineVolumeSpec.azureFile.withSecretNamespace`](#fn-inlinevolumespecazurefilewithsecretnamespace)  
[`fn inlineVolumeSpec.azureFile.withShareName`](#fn-inlinevolumespecazurefilewithsharename)  
[`fn inlineVolumeSpec.cephfs.secretRef.withName`](#fn-inlinevolumespeccephfssecretrefwithname)  
[`fn inlineVolumeSpec.cephfs.secretRef.withNamespace`](#fn-inlinevolumespeccephfssecretrefwithnamespace)  
[`fn inlineVolumeSpec.cephfs.withMonitors`](#fn-inlinevolumespeccephfswithmonitors)  
[`fn inlineVolumeSpec.cephfs.withPath`](#fn-inlinevolumespeccephfswithpath)  
[`fn inlineVolumeSpec.cephfs.withReadOnly`](#fn-inlinevolumespeccephfswithreadonly)  
[`fn inlineVolumeSpec.cephfs.withSecretFile`](#fn-inlinevolumespeccephfswithsecretfile)  
[`fn inlineVolumeSpec.cephfs.withUser`](#fn-inlinevolumespeccephfswithuser)  
[`fn inlineVolumeSpec.cinder.secretRef.withName`](#fn-inlinevolumespeccindersecretrefwithname)  
[`fn inlineVolumeSpec.cinder.secretRef.withNamespace`](#fn-inlinevolumespeccindersecretrefwithnamespace)  
[`fn inlineVolumeSpec.cinder.withFsType`](#fn-inlinevolumespeccinderwithfstype)  
[`fn inlineVolumeSpec.cinder.withReadOnly`](#fn-inlinevolumespeccinderwithreadonly)  
[`fn inlineVolumeSpec.cinder.withVolumeID`](#fn-inlinevolumespeccinderwithvolumeid)  
[`fn inlineVolumeSpec.claimRef.withFieldPath`](#fn-inlinevolumespecclaimrefwithfieldpath)  
[`fn inlineVolumeSpec.claimRef.withName`](#fn-inlinevolumespecclaimrefwithname)  
[`fn inlineVolumeSpec.claimRef.withNamespace`](#fn-inlinevolumespecclaimrefwithnamespace)  
[`fn inlineVolumeSpec.claimRef.withResourceVersion`](#fn-inlinevolumespecclaimrefwithresourceversion)  
[`fn inlineVolumeSpec.claimRef.withUid`](#fn-inlinevolumespecclaimrefwithuid)  
[`fn inlineVolumeSpec.csi.controllerExpandSecretRef.withName`](#fn-inlinevolumespeccsicontrollerexpandsecretrefwithname)  
[`fn inlineVolumeSpec.csi.controllerExpandSecretRef.withNamespace`](#fn-inlinevolumespeccsicontrollerexpandsecretrefwithnamespace)  
[`fn inlineVolumeSpec.csi.controllerPublishSecretRef.withName`](#fn-inlinevolumespeccsicontrollerpublishsecretrefwithname)  
[`fn inlineVolumeSpec.csi.controllerPublishSecretRef.withNamespace`](#fn-inlinevolumespeccsicontrollerpublishsecretrefwithnamespace)  
[`fn inlineVolumeSpec.csi.nodePublishSecretRef.withName`](#fn-inlinevolumespeccsinodepublishsecretrefwithname)  
[`fn inlineVolumeSpec.csi.nodePublishSecretRef.withNamespace`](#fn-inlinevolumespeccsinodepublishsecretrefwithnamespace)  
[`fn inlineVolumeSpec.csi.nodeStageSecretRef.withName`](#fn-inlinevolumespeccsinodestagesecretrefwithname)  
[`fn inlineVolumeSpec.csi.nodeStageSecretRef.withNamespace`](#fn-inlinevolumespeccsinodestagesecretrefwithnamespace)  
[`fn inlineVolumeSpec.csi.withDriver`](#fn-inlinevolumespeccsiwithdriver)  
[`fn inlineVolumeSpec.csi.withFsType`](#fn-inlinevolumespeccsiwithfstype)  
[`fn inlineVolumeSpec.csi.withReadOnly`](#fn-inlinevolumespeccsiwithreadonly)  
[`fn inlineVolumeSpec.csi.withVolumeAttributes`](#fn-inlinevolumespeccsiwithvolumeattributes)  
[`fn inlineVolumeSpec.csi.withVolumeHandle`](#fn-inlinevolumespeccsiwithvolumehandle)  
[`fn inlineVolumeSpec.fc.withFsType`](#fn-inlinevolumespecfcwithfstype)  
[`fn inlineVolumeSpec.fc.withLun`](#fn-inlinevolumespecfcwithlun)  
[`fn inlineVolumeSpec.fc.withReadOnly`](#fn-inlinevolumespecfcwithreadonly)  
[`fn inlineVolumeSpec.fc.withTargetWWNs`](#fn-inlinevolumespecfcwithtargetwwns)  
[`fn inlineVolumeSpec.fc.withWwids`](#fn-inlinevolumespecfcwithwwids)  
[`fn inlineVolumeSpec.flexVolume.secretRef.withName`](#fn-inlinevolumespecflexvolumesecretrefwithname)  
[`fn inlineVolumeSpec.flexVolume.secretRef.withNamespace`](#fn-inlinevolumespecflexvolumesecretrefwithnamespace)  
[`fn inlineVolumeSpec.flexVolume.withDriver`](#fn-inlinevolumespecflexvolumewithdriver)  
[`fn inlineVolumeSpec.flexVolume.withFsType`](#fn-inlinevolumespecflexvolumewithfstype)  
[`fn inlineVolumeSpec.flexVolume.withOptions`](#fn-inlinevolumespecflexvolumewithoptions)  
[`fn inlineVolumeSpec.flexVolume.withReadOnly`](#fn-inlinevolumespecflexvolumewithreadonly)  
[`fn inlineVolumeSpec.flocker.withDatasetName`](#fn-inlinevolumespecflockerwithdatasetname)  
[`fn inlineVolumeSpec.flocker.withDatasetUUID`](#fn-inlinevolumespecflockerwithdatasetuuid)  
[`fn inlineVolumeSpec.gcePersistentDisk.withFsType`](#fn-inlinevolumespecgcepersistentdiskwithfstype)  
[`fn inlineVolumeSpec.gcePersistentDisk.withPartition`](#fn-inlinevolumespecgcepersistentdiskwithpartition)  
[`fn inlineVolumeSpec.gcePersistentDisk.withPdName`](#fn-inlinevolumespecgcepersistentdiskwithpdname)  
[`fn inlineVolumeSpec.gcePersistentDisk.withReadOnly`](#fn-inlinevolumespecgcepersistentdiskwithreadonly)  
[`fn inlineVolumeSpec.glusterfs.withEndpoints`](#fn-inlinevolumespecglusterfswithendpoints)  
[`fn inlineVolumeSpec.glusterfs.withEndpointsNamespace`](#fn-inlinevolumespecglusterfswithendpointsnamespace)  
[`fn inlineVolumeSpec.glusterfs.withPath`](#fn-inlinevolumespecglusterfswithpath)  
[`fn inlineVolumeSpec.glusterfs.withReadOnly`](#fn-inlinevolumespecglusterfswithreadonly)  
[`fn inlineVolumeSpec.hostPath.withPath`](#fn-inlinevolumespechostpathwithpath)  
[`fn inlineVolumeSpec.hostPath.withType`](#fn-inlinevolumespechostpathwithtype)  
[`fn inlineVolumeSpec.iscsi.secretRef.withName`](#fn-inlinevolumespeciscsisecretrefwithname)  
[`fn inlineVolumeSpec.iscsi.secretRef.withNamespace`](#fn-inlinevolumespeciscsisecretrefwithnamespace)  
[`fn inlineVolumeSpec.iscsi.withChapAuthDiscovery`](#fn-inlinevolumespeciscsiwithchapauthdiscovery)  
[`fn inlineVolumeSpec.iscsi.withChapAuthSession`](#fn-inlinevolumespeciscsiwithchapauthsession)  
[`fn inlineVolumeSpec.iscsi.withFsType`](#fn-inlinevolumespeciscsiwithfstype)  
[`fn inlineVolumeSpec.iscsi.withInitiatorName`](#fn-inlinevolumespeciscsiwithinitiatorname)  
[`fn inlineVolumeSpec.iscsi.withIqn`](#fn-inlinevolumespeciscsiwithiqn)  
[`fn inlineVolumeSpec.iscsi.withIscsiInterface`](#fn-inlinevolumespeciscsiwithiscsiinterface)  
[`fn inlineVolumeSpec.iscsi.withLun`](#fn-inlinevolumespeciscsiwithlun)  
[`fn inlineVolumeSpec.iscsi.withPortals`](#fn-inlinevolumespeciscsiwithportals)  
[`fn inlineVolumeSpec.iscsi.withReadOnly`](#fn-inlinevolumespeciscsiwithreadonly)  
[`fn inlineVolumeSpec.iscsi.withTargetPortal`](#fn-inlinevolumespeciscsiwithtargetportal)  
[`fn inlineVolumeSpec.local.withFsType`](#fn-inlinevolumespeclocalwithfstype)  
[`fn inlineVolumeSpec.local.withPath`](#fn-inlinevolumespeclocalwithpath)  
[`fn inlineVolumeSpec.nfs.withPath`](#fn-inlinevolumespecnfswithpath)  
[`fn inlineVolumeSpec.nfs.withReadOnly`](#fn-inlinevolumespecnfswithreadonly)  
[`fn inlineVolumeSpec.nfs.withServer`](#fn-inlinevolumespecnfswithserver)  
[`fn inlineVolumeSpec.nodeAffinity.required.withNodeSelectorTerms`](#fn-inlinevolumespecnodeaffinityrequiredwithnodeselectorterms)  
[`fn inlineVolumeSpec.photonPersistentDisk.withFsType`](#fn-inlinevolumespecphotonpersistentdiskwithfstype)  
[`fn inlineVolumeSpec.photonPersistentDisk.withPdID`](#fn-inlinevolumespecphotonpersistentdiskwithpdid)  
[`fn inlineVolumeSpec.portworxVolume.withFsType`](#fn-inlinevolumespecportworxvolumewithfstype)  
[`fn inlineVolumeSpec.portworxVolume.withReadOnly`](#fn-inlinevolumespecportworxvolumewithreadonly)  
[`fn inlineVolumeSpec.portworxVolume.withVolumeID`](#fn-inlinevolumespecportworxvolumewithvolumeid)  
[`fn inlineVolumeSpec.quobyte.withGroup`](#fn-inlinevolumespecquobytewithgroup)  
[`fn inlineVolumeSpec.quobyte.withReadOnly`](#fn-inlinevolumespecquobytewithreadonly)  
[`fn inlineVolumeSpec.quobyte.withRegistry`](#fn-inlinevolumespecquobytewithregistry)  
[`fn inlineVolumeSpec.quobyte.withTenant`](#fn-inlinevolumespecquobytewithtenant)  
[`fn inlineVolumeSpec.quobyte.withUser`](#fn-inlinevolumespecquobytewithuser)  
[`fn inlineVolumeSpec.quobyte.withVolume`](#fn-inlinevolumespecquobytewithvolume)  
[`fn inlineVolumeSpec.rbd.secretRef.withName`](#fn-inlinevolumespecrbdsecretrefwithname)  
[`fn inlineVolumeSpec.rbd.secretRef.withNamespace`](#fn-inlinevolumespecrbdsecretrefwithnamespace)  
[`fn inlineVolumeSpec.rbd.withFsType`](#fn-inlinevolumespecrbdwithfstype)  
[`fn inlineVolumeSpec.rbd.withImage`](#fn-inlinevolumespecrbdwithimage)  
[`fn inlineVolumeSpec.rbd.withKeyring`](#fn-inlinevolumespecrbdwithkeyring)  
[`fn inlineVolumeSpec.rbd.withMonitors`](#fn-inlinevolumespecrbdwithmonitors)  
[`fn inlineVolumeSpec.rbd.withPool`](#fn-inlinevolumespecrbdwithpool)  
[`fn inlineVolumeSpec.rbd.withReadOnly`](#fn-inlinevolumespecrbdwithreadonly)  
[`fn inlineVolumeSpec.rbd.withUser`](#fn-inlinevolumespecrbdwithuser)  
[`fn inlineVolumeSpec.scaleIO.secretRef.withName`](#fn-inlinevolumespecscaleiosecretrefwithname)  
[`fn inlineVolumeSpec.scaleIO.secretRef.withNamespace`](#fn-inlinevolumespecscaleiosecretrefwithnamespace)  
[`fn inlineVolumeSpec.scaleIO.withFsType`](#fn-inlinevolumespecscaleiowithfstype)  
[`fn inlineVolumeSpec.scaleIO.withGateway`](#fn-inlinevolumespecscaleiowithgateway)  
[`fn inlineVolumeSpec.scaleIO.withProtectionDomain`](#fn-inlinevolumespecscaleiowithprotectiondomain)  
[`fn inlineVolumeSpec.scaleIO.withReadOnly`](#fn-inlinevolumespecscaleiowithreadonly)  
[`fn inlineVolumeSpec.scaleIO.withSslEnabled`](#fn-inlinevolumespecscaleiowithsslenabled)  
[`fn inlineVolumeSpec.scaleIO.withStorageMode`](#fn-inlinevolumespecscaleiowithstoragemode)  
[`fn inlineVolumeSpec.scaleIO.withStoragePool`](#fn-inlinevolumespecscaleiowithstoragepool)  
[`fn inlineVolumeSpec.scaleIO.withSystem`](#fn-inlinevolumespecscaleiowithsystem)  
[`fn inlineVolumeSpec.scaleIO.withVolumeName`](#fn-inlinevolumespecscaleiowithvolumename)  
[`fn inlineVolumeSpec.storageos.secretRef.withFieldPath`](#fn-inlinevolumespecstorageossecretrefwithfieldpath)  
[`fn inlineVolumeSpec.storageos.secretRef.withName`](#fn-inlinevolumespecstorageossecretrefwithname)  
[`fn inlineVolumeSpec.storageos.secretRef.withNamespace`](#fn-inlinevolumespecstorageossecretrefwithnamespace)  
[`fn inlineVolumeSpec.storageos.secretRef.withResourceVersion`](#fn-inlinevolumespecstorageossecretrefwithresourceversion)  
[`fn inlineVolumeSpec.storageos.secretRef.withUid`](#fn-inlinevolumespecstorageossecretrefwithuid)  
[`fn inlineVolumeSpec.storageos.withFsType`](#fn-inlinevolumespecstorageoswithfstype)  
[`fn inlineVolumeSpec.storageos.withReadOnly`](#fn-inlinevolumespecstorageoswithreadonly)  
[`fn inlineVolumeSpec.storageos.withVolumeName`](#fn-inlinevolumespecstorageoswithvolumename)  
[`fn inlineVolumeSpec.storageos.withVolumeNamespace`](#fn-inlinevolumespecstorageoswithvolumenamespace)  
[`fn inlineVolumeSpec.vsphereVolume.withFsType`](#fn-inlinevolumespecvspherevolumewithfstype)  
[`fn inlineVolumeSpec.vsphereVolume.withStoragePolicyID`](#fn-inlinevolumespecvspherevolumewithstoragepolicyid)  
[`fn inlineVolumeSpec.vsphereVolume.withStoragePolicyName`](#fn-inlinevolumespecvspherevolumewithstoragepolicyname)  
[`fn inlineVolumeSpec.vsphereVolume.withVolumePath`](#fn-inlinevolumespecvspherevolumewithvolumepath)  
[`fn inlineVolumeSpec.withAccessModes`](#fn-inlinevolumespecwithaccessmodes)  
[`fn inlineVolumeSpec.withCapacity`](#fn-inlinevolumespecwithcapacity)  
[`fn inlineVolumeSpec.withMountOptions`](#fn-inlinevolumespecwithmountoptions)  
[`fn inlineVolumeSpec.withPersistentVolumeReclaimPolicy`](#fn-inlinevolumespecwithpersistentvolumereclaimpolicy)  
[`fn inlineVolumeSpec.withStorageClassName`](#fn-inlinevolumespecwithstorageclassname)  
[`fn inlineVolumeSpec.withVolumeMode`](#fn-inlinevolumespecwithvolumemode)  

---


### `fn .withPersistentVolumeName`
Name of the persistent volume to attach.
```jsonnet
{
  withPersistentVolumeName(persistentVolumeName):: {}
}
```

### `fn inlineVolumeSpec.awsElasticBlockStore.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.awsElasticBlockStore.withPartition`
The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty).
```jsonnet
{
  withPartition(partition):: {}
}
```

### `fn inlineVolumeSpec.awsElasticBlockStore.withReadOnly`
Specify "true" to force and set the ReadOnly property in VolumeMounts to "true". If omitted, the default is "false". More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.awsElasticBlockStore.withVolumeID`
Unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn inlineVolumeSpec.azureDisk.withCachingMode`
Host Caching mode: None, Read Only, Read Write.
```jsonnet
{
  withCachingMode(cachingMode):: {}
}
```

### `fn inlineVolumeSpec.azureDisk.withDiskName`
The Name of the data disk in the blob storage
```jsonnet
{
  withDiskName(diskName):: {}
}
```

### `fn inlineVolumeSpec.azureDisk.withDiskURI`
The URI the data disk in the blob storage
```jsonnet
{
  withDiskURI(diskURI):: {}
}
```

### `fn inlineVolumeSpec.azureDisk.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.azureDisk.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.azureFile.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.azureFile.withSecretName`
the name of secret that contains Azure Storage Account Name and Key
```jsonnet
{
  withSecretName(secretName):: {}
}
```

### `fn inlineVolumeSpec.azureFile.withSecretNamespace`
the namespace of the secret that contains Azure Storage Account Name and Key default is the same as the Pod
```jsonnet
{
  withSecretNamespace(secretNamespace):: {}
}
```

### `fn inlineVolumeSpec.azureFile.withShareName`
Share Name
```jsonnet
{
  withShareName(shareName):: {}
}
```

### `fn inlineVolumeSpec.cephfs.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.cephfs.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.cephfs.withMonitors`
Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withMonitors(monitors):: {}
}
```

### `fn inlineVolumeSpec.cephfs.withPath`
Optional: Used as the mounted root, rather than the full Ceph tree, default is /
```jsonnet
{
  withPath(path):: {}
}
```

### `fn inlineVolumeSpec.cephfs.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.cephfs.withSecretFile`
Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withSecretFile(secretFile):: {}
}
```

### `fn inlineVolumeSpec.cephfs.withUser`
Optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withUser(user):: {}
}
```

### `fn inlineVolumeSpec.cinder.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.cinder.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.cinder.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.cinder.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.cinder.withVolumeID`
volume id used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn inlineVolumeSpec.claimRef.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn inlineVolumeSpec.claimRef.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.claimRef.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.claimRef.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn inlineVolumeSpec.claimRef.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn inlineVolumeSpec.csi.controllerExpandSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.csi.controllerExpandSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.csi.controllerPublishSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.csi.controllerPublishSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.csi.nodePublishSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.csi.nodePublishSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.csi.nodeStageSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.csi.nodeStageSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.csi.withDriver`
Driver is the name of the driver to use for this volume. Required.
```jsonnet
{
  withDriver(driver):: {}
}
```

### `fn inlineVolumeSpec.csi.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs".
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.csi.withReadOnly`
Optional: The value to pass to ControllerPublishVolumeRequest. Defaults to false (read/write).
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.csi.withVolumeAttributes`
Attributes of the volume to publish.
```jsonnet
{
  withVolumeAttributes(volumeAttributes):: {}
}
```

### `fn inlineVolumeSpec.csi.withVolumeHandle`
VolumeHandle is the unique volume name returned by the CSI volume plugin’s CreateVolume to refer to the volume on all subsequent calls. Required.
```jsonnet
{
  withVolumeHandle(volumeHandle):: {}
}
```

### `fn inlineVolumeSpec.fc.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.fc.withLun`
Optional: FC target lun number
```jsonnet
{
  withLun(lun):: {}
}
```

### `fn inlineVolumeSpec.fc.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.fc.withTargetWWNs`
Optional: FC target worldwide names (WWNs)
```jsonnet
{
  withTargetWWNs(targetWWNs):: {}
}
```

### `fn inlineVolumeSpec.fc.withWwids`
Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously.
```jsonnet
{
  withWwids(wwids):: {}
}
```

### `fn inlineVolumeSpec.flexVolume.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.flexVolume.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.flexVolume.withDriver`
Driver is the name of the driver to use for this volume.
```jsonnet
{
  withDriver(driver):: {}
}
```

### `fn inlineVolumeSpec.flexVolume.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.flexVolume.withOptions`
Optional: Extra command options if any.
```jsonnet
{
  withOptions(options):: {}
}
```

### `fn inlineVolumeSpec.flexVolume.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.flocker.withDatasetName`
Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated
```jsonnet
{
  withDatasetName(datasetName):: {}
}
```

### `fn inlineVolumeSpec.flocker.withDatasetUUID`
UUID of the dataset. This is unique identifier of a Flocker dataset
```jsonnet
{
  withDatasetUUID(datasetUUID):: {}
}
```

### `fn inlineVolumeSpec.gcePersistentDisk.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.gcePersistentDisk.withPartition`
The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty). More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withPartition(partition):: {}
}
```

### `fn inlineVolumeSpec.gcePersistentDisk.withPdName`
Unique name of the PD resource in GCE. Used to identify the disk in GCE. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withPdName(pdName):: {}
}
```

### `fn inlineVolumeSpec.gcePersistentDisk.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.glusterfs.withEndpoints`
EndpointsName is the endpoint name that details Glusterfs topology. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withEndpoints(endpoints):: {}
}
```

### `fn inlineVolumeSpec.glusterfs.withEndpointsNamespace`
EndpointsNamespace is the namespace that contains Glusterfs endpoint. If this field is empty, the EndpointNamespace defaults to the same namespace as the bound PVC. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withEndpointsNamespace(endpointsNamespace):: {}
}
```

### `fn inlineVolumeSpec.glusterfs.withPath`
Path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withPath(path):: {}
}
```

### `fn inlineVolumeSpec.glusterfs.withReadOnly`
ReadOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.hostPath.withPath`
Path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
```jsonnet
{
  withPath(path):: {}
}
```

### `fn inlineVolumeSpec.hostPath.withType`
Type for HostPath Volume Defaults to "" More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
```jsonnet
{
  withType(type):: {}
}
```

### `fn inlineVolumeSpec.iscsi.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.iscsi.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withChapAuthDiscovery`
whether support iSCSI Discovery CHAP authentication
```jsonnet
{
  withChapAuthDiscovery(chapAuthDiscovery):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withChapAuthSession`
whether support iSCSI Session CHAP authentication
```jsonnet
{
  withChapAuthSession(chapAuthSession):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#iscsi
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withInitiatorName`
Custom iSCSI Initiator Name. If initiatorName is specified with iscsiInterface simultaneously, new iSCSI interface <target portal>:<volume name> will be created for the connection.
```jsonnet
{
  withInitiatorName(initiatorName):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withIqn`
Target iSCSI Qualified Name.
```jsonnet
{
  withIqn(iqn):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withIscsiInterface`
iSCSI Interface Name that uses an iSCSI transport. Defaults to 'default' (tcp).
```jsonnet
{
  withIscsiInterface(iscsiInterface):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withLun`
iSCSI Target Lun number.
```jsonnet
{
  withLun(lun):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withPortals`
iSCSI Target Portal List. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
```jsonnet
{
  withPortals(portals):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.iscsi.withTargetPortal`
iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
```jsonnet
{
  withTargetPortal(targetPortal):: {}
}
```

### `fn inlineVolumeSpec.local.withFsType`
Filesystem type to mount. It applies only when the Path is a block device. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default value is to auto-select a fileystem if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.local.withPath`
The full path to the volume on the node. It can be either a directory or block device (disk, partition, ...).
```jsonnet
{
  withPath(path):: {}
}
```

### `fn inlineVolumeSpec.nfs.withPath`
Path that is exported by the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withPath(path):: {}
}
```

### `fn inlineVolumeSpec.nfs.withReadOnly`
ReadOnly here will force the NFS export to be mounted with read-only permissions. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.nfs.withServer`
Server is the hostname or IP address of the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withServer(server):: {}
}
```

### `fn inlineVolumeSpec.nodeAffinity.required.withNodeSelectorTerms`
Required. A list of node selector terms. The terms are ORed.
```jsonnet
{
  withNodeSelectorTerms(nodeSelectorTerms):: {}
}
```

### `fn inlineVolumeSpec.photonPersistentDisk.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.photonPersistentDisk.withPdID`
ID that identifies Photon Controller persistent disk
```jsonnet
{
  withPdID(pdID):: {}
}
```

### `fn inlineVolumeSpec.portworxVolume.withFsType`
FSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.portworxVolume.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.portworxVolume.withVolumeID`
VolumeID uniquely identifies a Portworx volume
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn inlineVolumeSpec.quobyte.withGroup`
Group to map volume access to Default is no group
```jsonnet
{
  withGroup(group):: {}
}
```

### `fn inlineVolumeSpec.quobyte.withReadOnly`
ReadOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.quobyte.withRegistry`
Registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes
```jsonnet
{
  withRegistry(registry):: {}
}
```

### `fn inlineVolumeSpec.quobyte.withTenant`
Tenant owning the given Quobyte volume in the Backend Used with dynamically provisioned Quobyte volumes, value is set by the plugin
```jsonnet
{
  withTenant(tenant):: {}
}
```

### `fn inlineVolumeSpec.quobyte.withUser`
User to map volume access to Defaults to serivceaccount user
```jsonnet
{
  withUser(user):: {}
}
```

### `fn inlineVolumeSpec.quobyte.withVolume`
Volume is a string that references an already created Quobyte volume by name.
```jsonnet
{
  withVolume(volume):: {}
}
```

### `fn inlineVolumeSpec.rbd.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.rbd.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.rbd.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#rbd
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.rbd.withImage`
The rados image name. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withImage(image):: {}
}
```

### `fn inlineVolumeSpec.rbd.withKeyring`
Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withKeyring(keyring):: {}
}
```

### `fn inlineVolumeSpec.rbd.withMonitors`
A collection of Ceph monitors. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withMonitors(monitors):: {}
}
```

### `fn inlineVolumeSpec.rbd.withPool`
The rados pool name. Default is rbd. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withPool(pool):: {}
}
```

### `fn inlineVolumeSpec.rbd.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.rbd.withUser`
The rados user name. Default is admin. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withUser(user):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Default is "xfs"
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withGateway`
The host address of the ScaleIO API Gateway.
```jsonnet
{
  withGateway(gateway):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withProtectionDomain`
The name of the ScaleIO Protection Domain for the configured storage.
```jsonnet
{
  withProtectionDomain(protectionDomain):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withSslEnabled`
Flag to enable/disable SSL communication with Gateway, default false
```jsonnet
{
  withSslEnabled(sslEnabled):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withStorageMode`
Indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned.
```jsonnet
{
  withStorageMode(storageMode):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withStoragePool`
The ScaleIO Storage Pool associated with the protection domain.
```jsonnet
{
  withStoragePool(storagePool):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withSystem`
The name of the storage system as configured in ScaleIO.
```jsonnet
{
  withSystem(system):: {}
}
```

### `fn inlineVolumeSpec.scaleIO.withVolumeName`
The name of a volume already created in the ScaleIO system that is associated with this volume source.
```jsonnet
{
  withVolumeName(volumeName):: {}
}
```

### `fn inlineVolumeSpec.storageos.secretRef.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn inlineVolumeSpec.storageos.secretRef.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn inlineVolumeSpec.storageos.secretRef.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn inlineVolumeSpec.storageos.secretRef.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn inlineVolumeSpec.storageos.secretRef.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn inlineVolumeSpec.storageos.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.storageos.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn inlineVolumeSpec.storageos.withVolumeName`
VolumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
```jsonnet
{
  withVolumeName(volumeName):: {}
}
```

### `fn inlineVolumeSpec.storageos.withVolumeNamespace`
VolumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
```jsonnet
{
  withVolumeNamespace(volumeNamespace):: {}
}
```

### `fn inlineVolumeSpec.vsphereVolume.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn inlineVolumeSpec.vsphereVolume.withStoragePolicyID`
Storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName.
```jsonnet
{
  withStoragePolicyID(storagePolicyID):: {}
}
```

### `fn inlineVolumeSpec.vsphereVolume.withStoragePolicyName`
Storage Policy Based Management (SPBM) profile name.
```jsonnet
{
  withStoragePolicyName(storagePolicyName):: {}
}
```

### `fn inlineVolumeSpec.vsphereVolume.withVolumePath`
Path that identifies vSphere volume vmdk
```jsonnet
{
  withVolumePath(volumePath):: {}
}
```

### `fn inlineVolumeSpec.withAccessModes`
AccessModes contains all ways the volume can be mounted. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes
```jsonnet
{
  withAccessModes(accessModes):: {}
}
```

### `fn inlineVolumeSpec.withCapacity`
A description of the persistent volume's resources and capacity. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
```jsonnet
{
  withCapacity(capacity):: {}
}
```

### `fn inlineVolumeSpec.withMountOptions`
A list of mount options, e.g. ["ro", "soft"]. Not validated - mount will simply fail if one is invalid. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#mount-options
```jsonnet
{
  withMountOptions(mountOptions):: {}
}
```

### `fn inlineVolumeSpec.withPersistentVolumeReclaimPolicy`
What happens to a persistent volume when released from its claim. Valid options are Retain (default for manually created PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and Recycle (deprecated). Recycle must be supported by the volume plugin underlying this PersistentVolume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming
```jsonnet
{
  withPersistentVolumeReclaimPolicy(persistentVolumeReclaimPolicy):: {}
}
```

### `fn inlineVolumeSpec.withStorageClassName`
Name of StorageClass to which this persistent volume belongs. Empty value means that this volume does not belong to any StorageClass.
```jsonnet
{
  withStorageClassName(storageClassName):: {}
}
```

### `fn inlineVolumeSpec.withVolumeMode`
volumeMode defines if a volume is intended to be used with a formatted filesystem or to remain in raw block state. Value of Filesystem is implied when not included in spec. This is a beta feature.
```jsonnet
{
  withVolumeMode(volumeMode):: {}
}
```

