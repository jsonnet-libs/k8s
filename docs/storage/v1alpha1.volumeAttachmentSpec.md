
## volumeAttachmentSpec
VolumeAttachmentSpec is the specification of a VolumeAttachment request.

**Functions:**

[`fn .withAttacher`](#fn-withattacher)  
[`fn .withNodeName`](#fn-withnodename)  
[`fn source.inlineVolumeSpec.awsElasticBlockStore.withFsType`](#fn-sourceinlinevolumespecawselasticblockstorewithfstype)  
[`fn source.inlineVolumeSpec.awsElasticBlockStore.withPartition`](#fn-sourceinlinevolumespecawselasticblockstorewithpartition)  
[`fn source.inlineVolumeSpec.awsElasticBlockStore.withReadOnly`](#fn-sourceinlinevolumespecawselasticblockstorewithreadonly)  
[`fn source.inlineVolumeSpec.awsElasticBlockStore.withVolumeID`](#fn-sourceinlinevolumespecawselasticblockstorewithvolumeid)  
[`fn source.inlineVolumeSpec.azureDisk.withCachingMode`](#fn-sourceinlinevolumespecazurediskwithcachingmode)  
[`fn source.inlineVolumeSpec.azureDisk.withDiskName`](#fn-sourceinlinevolumespecazurediskwithdiskname)  
[`fn source.inlineVolumeSpec.azureDisk.withDiskURI`](#fn-sourceinlinevolumespecazurediskwithdiskuri)  
[`fn source.inlineVolumeSpec.azureDisk.withFsType`](#fn-sourceinlinevolumespecazurediskwithfstype)  
[`fn source.inlineVolumeSpec.azureDisk.withReadOnly`](#fn-sourceinlinevolumespecazurediskwithreadonly)  
[`fn source.inlineVolumeSpec.azureFile.withReadOnly`](#fn-sourceinlinevolumespecazurefilewithreadonly)  
[`fn source.inlineVolumeSpec.azureFile.withSecretName`](#fn-sourceinlinevolumespecazurefilewithsecretname)  
[`fn source.inlineVolumeSpec.azureFile.withSecretNamespace`](#fn-sourceinlinevolumespecazurefilewithsecretnamespace)  
[`fn source.inlineVolumeSpec.azureFile.withShareName`](#fn-sourceinlinevolumespecazurefilewithsharename)  
[`fn source.inlineVolumeSpec.cephfs.secretRef.withName`](#fn-sourceinlinevolumespeccephfssecretrefwithname)  
[`fn source.inlineVolumeSpec.cephfs.secretRef.withNamespace`](#fn-sourceinlinevolumespeccephfssecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.cephfs.withMonitors`](#fn-sourceinlinevolumespeccephfswithmonitors)  
[`fn source.inlineVolumeSpec.cephfs.withPath`](#fn-sourceinlinevolumespeccephfswithpath)  
[`fn source.inlineVolumeSpec.cephfs.withReadOnly`](#fn-sourceinlinevolumespeccephfswithreadonly)  
[`fn source.inlineVolumeSpec.cephfs.withSecretFile`](#fn-sourceinlinevolumespeccephfswithsecretfile)  
[`fn source.inlineVolumeSpec.cephfs.withUser`](#fn-sourceinlinevolumespeccephfswithuser)  
[`fn source.inlineVolumeSpec.cinder.secretRef.withName`](#fn-sourceinlinevolumespeccindersecretrefwithname)  
[`fn source.inlineVolumeSpec.cinder.secretRef.withNamespace`](#fn-sourceinlinevolumespeccindersecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.cinder.withFsType`](#fn-sourceinlinevolumespeccinderwithfstype)  
[`fn source.inlineVolumeSpec.cinder.withReadOnly`](#fn-sourceinlinevolumespeccinderwithreadonly)  
[`fn source.inlineVolumeSpec.cinder.withVolumeID`](#fn-sourceinlinevolumespeccinderwithvolumeid)  
[`fn source.inlineVolumeSpec.claimRef.withFieldPath`](#fn-sourceinlinevolumespecclaimrefwithfieldpath)  
[`fn source.inlineVolumeSpec.claimRef.withName`](#fn-sourceinlinevolumespecclaimrefwithname)  
[`fn source.inlineVolumeSpec.claimRef.withNamespace`](#fn-sourceinlinevolumespecclaimrefwithnamespace)  
[`fn source.inlineVolumeSpec.claimRef.withResourceVersion`](#fn-sourceinlinevolumespecclaimrefwithresourceversion)  
[`fn source.inlineVolumeSpec.claimRef.withUid`](#fn-sourceinlinevolumespecclaimrefwithuid)  
[`fn source.inlineVolumeSpec.csi.controllerExpandSecretRef.withName`](#fn-sourceinlinevolumespeccsicontrollerexpandsecretrefwithname)  
[`fn source.inlineVolumeSpec.csi.controllerExpandSecretRef.withNamespace`](#fn-sourceinlinevolumespeccsicontrollerexpandsecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.csi.controllerPublishSecretRef.withName`](#fn-sourceinlinevolumespeccsicontrollerpublishsecretrefwithname)  
[`fn source.inlineVolumeSpec.csi.controllerPublishSecretRef.withNamespace`](#fn-sourceinlinevolumespeccsicontrollerpublishsecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.csi.nodePublishSecretRef.withName`](#fn-sourceinlinevolumespeccsinodepublishsecretrefwithname)  
[`fn source.inlineVolumeSpec.csi.nodePublishSecretRef.withNamespace`](#fn-sourceinlinevolumespeccsinodepublishsecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.csi.nodeStageSecretRef.withName`](#fn-sourceinlinevolumespeccsinodestagesecretrefwithname)  
[`fn source.inlineVolumeSpec.csi.nodeStageSecretRef.withNamespace`](#fn-sourceinlinevolumespeccsinodestagesecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.csi.withDriver`](#fn-sourceinlinevolumespeccsiwithdriver)  
[`fn source.inlineVolumeSpec.csi.withFsType`](#fn-sourceinlinevolumespeccsiwithfstype)  
[`fn source.inlineVolumeSpec.csi.withReadOnly`](#fn-sourceinlinevolumespeccsiwithreadonly)  
[`fn source.inlineVolumeSpec.csi.withVolumeAttributes`](#fn-sourceinlinevolumespeccsiwithvolumeattributes)  
[`fn source.inlineVolumeSpec.csi.withVolumeHandle`](#fn-sourceinlinevolumespeccsiwithvolumehandle)  
[`fn source.inlineVolumeSpec.fc.withFsType`](#fn-sourceinlinevolumespecfcwithfstype)  
[`fn source.inlineVolumeSpec.fc.withLun`](#fn-sourceinlinevolumespecfcwithlun)  
[`fn source.inlineVolumeSpec.fc.withReadOnly`](#fn-sourceinlinevolumespecfcwithreadonly)  
[`fn source.inlineVolumeSpec.fc.withTargetWWNs`](#fn-sourceinlinevolumespecfcwithtargetwwns)  
[`fn source.inlineVolumeSpec.fc.withWwids`](#fn-sourceinlinevolumespecfcwithwwids)  
[`fn source.inlineVolumeSpec.flexVolume.secretRef.withName`](#fn-sourceinlinevolumespecflexvolumesecretrefwithname)  
[`fn source.inlineVolumeSpec.flexVolume.secretRef.withNamespace`](#fn-sourceinlinevolumespecflexvolumesecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.flexVolume.withDriver`](#fn-sourceinlinevolumespecflexvolumewithdriver)  
[`fn source.inlineVolumeSpec.flexVolume.withFsType`](#fn-sourceinlinevolumespecflexvolumewithfstype)  
[`fn source.inlineVolumeSpec.flexVolume.withOptions`](#fn-sourceinlinevolumespecflexvolumewithoptions)  
[`fn source.inlineVolumeSpec.flexVolume.withReadOnly`](#fn-sourceinlinevolumespecflexvolumewithreadonly)  
[`fn source.inlineVolumeSpec.flocker.withDatasetName`](#fn-sourceinlinevolumespecflockerwithdatasetname)  
[`fn source.inlineVolumeSpec.flocker.withDatasetUUID`](#fn-sourceinlinevolumespecflockerwithdatasetuuid)  
[`fn source.inlineVolumeSpec.gcePersistentDisk.withFsType`](#fn-sourceinlinevolumespecgcepersistentdiskwithfstype)  
[`fn source.inlineVolumeSpec.gcePersistentDisk.withPartition`](#fn-sourceinlinevolumespecgcepersistentdiskwithpartition)  
[`fn source.inlineVolumeSpec.gcePersistentDisk.withPdName`](#fn-sourceinlinevolumespecgcepersistentdiskwithpdname)  
[`fn source.inlineVolumeSpec.gcePersistentDisk.withReadOnly`](#fn-sourceinlinevolumespecgcepersistentdiskwithreadonly)  
[`fn source.inlineVolumeSpec.glusterfs.withEndpoints`](#fn-sourceinlinevolumespecglusterfswithendpoints)  
[`fn source.inlineVolumeSpec.glusterfs.withEndpointsNamespace`](#fn-sourceinlinevolumespecglusterfswithendpointsnamespace)  
[`fn source.inlineVolumeSpec.glusterfs.withPath`](#fn-sourceinlinevolumespecglusterfswithpath)  
[`fn source.inlineVolumeSpec.glusterfs.withReadOnly`](#fn-sourceinlinevolumespecglusterfswithreadonly)  
[`fn source.inlineVolumeSpec.hostPath.withPath`](#fn-sourceinlinevolumespechostpathwithpath)  
[`fn source.inlineVolumeSpec.hostPath.withType`](#fn-sourceinlinevolumespechostpathwithtype)  
[`fn source.inlineVolumeSpec.iscsi.secretRef.withName`](#fn-sourceinlinevolumespeciscsisecretrefwithname)  
[`fn source.inlineVolumeSpec.iscsi.secretRef.withNamespace`](#fn-sourceinlinevolumespeciscsisecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.iscsi.withChapAuthDiscovery`](#fn-sourceinlinevolumespeciscsiwithchapauthdiscovery)  
[`fn source.inlineVolumeSpec.iscsi.withChapAuthSession`](#fn-sourceinlinevolumespeciscsiwithchapauthsession)  
[`fn source.inlineVolumeSpec.iscsi.withFsType`](#fn-sourceinlinevolumespeciscsiwithfstype)  
[`fn source.inlineVolumeSpec.iscsi.withInitiatorName`](#fn-sourceinlinevolumespeciscsiwithinitiatorname)  
[`fn source.inlineVolumeSpec.iscsi.withIqn`](#fn-sourceinlinevolumespeciscsiwithiqn)  
[`fn source.inlineVolumeSpec.iscsi.withIscsiInterface`](#fn-sourceinlinevolumespeciscsiwithiscsiinterface)  
[`fn source.inlineVolumeSpec.iscsi.withLun`](#fn-sourceinlinevolumespeciscsiwithlun)  
[`fn source.inlineVolumeSpec.iscsi.withPortals`](#fn-sourceinlinevolumespeciscsiwithportals)  
[`fn source.inlineVolumeSpec.iscsi.withReadOnly`](#fn-sourceinlinevolumespeciscsiwithreadonly)  
[`fn source.inlineVolumeSpec.iscsi.withTargetPortal`](#fn-sourceinlinevolumespeciscsiwithtargetportal)  
[`fn source.inlineVolumeSpec.local.withFsType`](#fn-sourceinlinevolumespeclocalwithfstype)  
[`fn source.inlineVolumeSpec.local.withPath`](#fn-sourceinlinevolumespeclocalwithpath)  
[`fn source.inlineVolumeSpec.nfs.withPath`](#fn-sourceinlinevolumespecnfswithpath)  
[`fn source.inlineVolumeSpec.nfs.withReadOnly`](#fn-sourceinlinevolumespecnfswithreadonly)  
[`fn source.inlineVolumeSpec.nfs.withServer`](#fn-sourceinlinevolumespecnfswithserver)  
[`fn source.inlineVolumeSpec.nodeAffinity.required.withNodeSelectorTerms`](#fn-sourceinlinevolumespecnodeaffinityrequiredwithnodeselectorterms)  
[`fn source.inlineVolumeSpec.photonPersistentDisk.withFsType`](#fn-sourceinlinevolumespecphotonpersistentdiskwithfstype)  
[`fn source.inlineVolumeSpec.photonPersistentDisk.withPdID`](#fn-sourceinlinevolumespecphotonpersistentdiskwithpdid)  
[`fn source.inlineVolumeSpec.portworxVolume.withFsType`](#fn-sourceinlinevolumespecportworxvolumewithfstype)  
[`fn source.inlineVolumeSpec.portworxVolume.withReadOnly`](#fn-sourceinlinevolumespecportworxvolumewithreadonly)  
[`fn source.inlineVolumeSpec.portworxVolume.withVolumeID`](#fn-sourceinlinevolumespecportworxvolumewithvolumeid)  
[`fn source.inlineVolumeSpec.quobyte.withGroup`](#fn-sourceinlinevolumespecquobytewithgroup)  
[`fn source.inlineVolumeSpec.quobyte.withReadOnly`](#fn-sourceinlinevolumespecquobytewithreadonly)  
[`fn source.inlineVolumeSpec.quobyte.withRegistry`](#fn-sourceinlinevolumespecquobytewithregistry)  
[`fn source.inlineVolumeSpec.quobyte.withTenant`](#fn-sourceinlinevolumespecquobytewithtenant)  
[`fn source.inlineVolumeSpec.quobyte.withUser`](#fn-sourceinlinevolumespecquobytewithuser)  
[`fn source.inlineVolumeSpec.quobyte.withVolume`](#fn-sourceinlinevolumespecquobytewithvolume)  
[`fn source.inlineVolumeSpec.rbd.secretRef.withName`](#fn-sourceinlinevolumespecrbdsecretrefwithname)  
[`fn source.inlineVolumeSpec.rbd.secretRef.withNamespace`](#fn-sourceinlinevolumespecrbdsecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.rbd.withFsType`](#fn-sourceinlinevolumespecrbdwithfstype)  
[`fn source.inlineVolumeSpec.rbd.withImage`](#fn-sourceinlinevolumespecrbdwithimage)  
[`fn source.inlineVolumeSpec.rbd.withKeyring`](#fn-sourceinlinevolumespecrbdwithkeyring)  
[`fn source.inlineVolumeSpec.rbd.withMonitors`](#fn-sourceinlinevolumespecrbdwithmonitors)  
[`fn source.inlineVolumeSpec.rbd.withPool`](#fn-sourceinlinevolumespecrbdwithpool)  
[`fn source.inlineVolumeSpec.rbd.withReadOnly`](#fn-sourceinlinevolumespecrbdwithreadonly)  
[`fn source.inlineVolumeSpec.rbd.withUser`](#fn-sourceinlinevolumespecrbdwithuser)  
[`fn source.inlineVolumeSpec.scaleIO.secretRef.withName`](#fn-sourceinlinevolumespecscaleiosecretrefwithname)  
[`fn source.inlineVolumeSpec.scaleIO.secretRef.withNamespace`](#fn-sourceinlinevolumespecscaleiosecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.scaleIO.withFsType`](#fn-sourceinlinevolumespecscaleiowithfstype)  
[`fn source.inlineVolumeSpec.scaleIO.withGateway`](#fn-sourceinlinevolumespecscaleiowithgateway)  
[`fn source.inlineVolumeSpec.scaleIO.withProtectionDomain`](#fn-sourceinlinevolumespecscaleiowithprotectiondomain)  
[`fn source.inlineVolumeSpec.scaleIO.withReadOnly`](#fn-sourceinlinevolumespecscaleiowithreadonly)  
[`fn source.inlineVolumeSpec.scaleIO.withSslEnabled`](#fn-sourceinlinevolumespecscaleiowithsslenabled)  
[`fn source.inlineVolumeSpec.scaleIO.withStorageMode`](#fn-sourceinlinevolumespecscaleiowithstoragemode)  
[`fn source.inlineVolumeSpec.scaleIO.withStoragePool`](#fn-sourceinlinevolumespecscaleiowithstoragepool)  
[`fn source.inlineVolumeSpec.scaleIO.withSystem`](#fn-sourceinlinevolumespecscaleiowithsystem)  
[`fn source.inlineVolumeSpec.scaleIO.withVolumeName`](#fn-sourceinlinevolumespecscaleiowithvolumename)  
[`fn source.inlineVolumeSpec.storageos.secretRef.withFieldPath`](#fn-sourceinlinevolumespecstorageossecretrefwithfieldpath)  
[`fn source.inlineVolumeSpec.storageos.secretRef.withName`](#fn-sourceinlinevolumespecstorageossecretrefwithname)  
[`fn source.inlineVolumeSpec.storageos.secretRef.withNamespace`](#fn-sourceinlinevolumespecstorageossecretrefwithnamespace)  
[`fn source.inlineVolumeSpec.storageos.secretRef.withResourceVersion`](#fn-sourceinlinevolumespecstorageossecretrefwithresourceversion)  
[`fn source.inlineVolumeSpec.storageos.secretRef.withUid`](#fn-sourceinlinevolumespecstorageossecretrefwithuid)  
[`fn source.inlineVolumeSpec.storageos.withFsType`](#fn-sourceinlinevolumespecstorageoswithfstype)  
[`fn source.inlineVolumeSpec.storageos.withReadOnly`](#fn-sourceinlinevolumespecstorageoswithreadonly)  
[`fn source.inlineVolumeSpec.storageos.withVolumeName`](#fn-sourceinlinevolumespecstorageoswithvolumename)  
[`fn source.inlineVolumeSpec.storageos.withVolumeNamespace`](#fn-sourceinlinevolumespecstorageoswithvolumenamespace)  
[`fn source.inlineVolumeSpec.vsphereVolume.withFsType`](#fn-sourceinlinevolumespecvspherevolumewithfstype)  
[`fn source.inlineVolumeSpec.vsphereVolume.withStoragePolicyID`](#fn-sourceinlinevolumespecvspherevolumewithstoragepolicyid)  
[`fn source.inlineVolumeSpec.vsphereVolume.withStoragePolicyName`](#fn-sourceinlinevolumespecvspherevolumewithstoragepolicyname)  
[`fn source.inlineVolumeSpec.vsphereVolume.withVolumePath`](#fn-sourceinlinevolumespecvspherevolumewithvolumepath)  
[`fn source.inlineVolumeSpec.withAccessModes`](#fn-sourceinlinevolumespecwithaccessmodes)  
[`fn source.inlineVolumeSpec.withCapacity`](#fn-sourceinlinevolumespecwithcapacity)  
[`fn source.inlineVolumeSpec.withMountOptions`](#fn-sourceinlinevolumespecwithmountoptions)  
[`fn source.inlineVolumeSpec.withPersistentVolumeReclaimPolicy`](#fn-sourceinlinevolumespecwithpersistentvolumereclaimpolicy)  
[`fn source.inlineVolumeSpec.withStorageClassName`](#fn-sourceinlinevolumespecwithstorageclassname)  
[`fn source.inlineVolumeSpec.withVolumeMode`](#fn-sourceinlinevolumespecwithvolumemode)  
[`fn source.withPersistentVolumeName`](#fn-sourcewithpersistentvolumename)  

---


### `fn .withAttacher`
Attacher indicates the name of the volume driver that MUST handle this request. This is the name returned by GetPluginName().
```jsonnet
{
  withAttacher(attacher):: {}
}
```

### `fn .withNodeName`
The node that the volume should be attached to.
```jsonnet
{
  withNodeName(nodeName):: {}
}
```

### `fn source.inlineVolumeSpec.awsElasticBlockStore.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.awsElasticBlockStore.withPartition`
The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty).
```jsonnet
{
  withPartition(partition):: {}
}
```

### `fn source.inlineVolumeSpec.awsElasticBlockStore.withReadOnly`
Specify "true" to force and set the ReadOnly property in VolumeMounts to "true". If omitted, the default is "false". More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.awsElasticBlockStore.withVolumeID`
Unique ID of the persistent disk resource in AWS (Amazon EBS volume). More info: https://kubernetes.io/docs/concepts/storage/volumes#awselasticblockstore
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn source.inlineVolumeSpec.azureDisk.withCachingMode`
Host Caching mode: None, Read Only, Read Write.
```jsonnet
{
  withCachingMode(cachingMode):: {}
}
```

### `fn source.inlineVolumeSpec.azureDisk.withDiskName`
The Name of the data disk in the blob storage
```jsonnet
{
  withDiskName(diskName):: {}
}
```

### `fn source.inlineVolumeSpec.azureDisk.withDiskURI`
The URI the data disk in the blob storage
```jsonnet
{
  withDiskURI(diskURI):: {}
}
```

### `fn source.inlineVolumeSpec.azureDisk.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.azureDisk.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.azureFile.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.azureFile.withSecretName`
the name of secret that contains Azure Storage Account Name and Key
```jsonnet
{
  withSecretName(secretName):: {}
}
```

### `fn source.inlineVolumeSpec.azureFile.withSecretNamespace`
the namespace of the secret that contains Azure Storage Account Name and Key default is the same as the Pod
```jsonnet
{
  withSecretNamespace(secretNamespace):: {}
}
```

### `fn source.inlineVolumeSpec.azureFile.withShareName`
Share Name
```jsonnet
{
  withShareName(shareName):: {}
}
```

### `fn source.inlineVolumeSpec.cephfs.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.cephfs.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.cephfs.withMonitors`
Required: Monitors is a collection of Ceph monitors More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withMonitors(monitors):: {}
}
```

### `fn source.inlineVolumeSpec.cephfs.withPath`
Optional: Used as the mounted root, rather than the full Ceph tree, default is /
```jsonnet
{
  withPath(path):: {}
}
```

### `fn source.inlineVolumeSpec.cephfs.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.cephfs.withSecretFile`
Optional: SecretFile is the path to key ring for User, default is /etc/ceph/user.secret More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withSecretFile(secretFile):: {}
}
```

### `fn source.inlineVolumeSpec.cephfs.withUser`
Optional: User is the rados user name, default is admin More info: https://examples.k8s.io/volumes/cephfs/README.md#how-to-use-it
```jsonnet
{
  withUser(user):: {}
}
```

### `fn source.inlineVolumeSpec.cinder.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.cinder.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.cinder.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.cinder.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.cinder.withVolumeID`
volume id used to identify the volume in cinder. More info: https://examples.k8s.io/mysql-cinder-pd/README.md
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn source.inlineVolumeSpec.claimRef.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn source.inlineVolumeSpec.claimRef.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.claimRef.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.claimRef.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn source.inlineVolumeSpec.claimRef.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn source.inlineVolumeSpec.csi.controllerExpandSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.csi.controllerExpandSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.csi.controllerPublishSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.csi.controllerPublishSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.csi.nodePublishSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.csi.nodePublishSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.csi.nodeStageSecretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.csi.nodeStageSecretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.csi.withDriver`
Driver is the name of the driver to use for this volume. Required.
```jsonnet
{
  withDriver(driver):: {}
}
```

### `fn source.inlineVolumeSpec.csi.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs".
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.csi.withReadOnly`
Optional: The value to pass to ControllerPublishVolumeRequest. Defaults to false (read/write).
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.csi.withVolumeAttributes`
Attributes of the volume to publish.
```jsonnet
{
  withVolumeAttributes(volumeAttributes):: {}
}
```

### `fn source.inlineVolumeSpec.csi.withVolumeHandle`
VolumeHandle is the unique volume name returned by the CSI volume plugin’s CreateVolume to refer to the volume on all subsequent calls. Required.
```jsonnet
{
  withVolumeHandle(volumeHandle):: {}
}
```

### `fn source.inlineVolumeSpec.fc.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.fc.withLun`
Optional: FC target lun number
```jsonnet
{
  withLun(lun):: {}
}
```

### `fn source.inlineVolumeSpec.fc.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.fc.withTargetWWNs`
Optional: FC target worldwide names (WWNs)
```jsonnet
{
  withTargetWWNs(targetWWNs):: {}
}
```

### `fn source.inlineVolumeSpec.fc.withWwids`
Optional: FC volume world wide identifiers (wwids) Either wwids or combination of targetWWNs and lun must be set, but not both simultaneously.
```jsonnet
{
  withWwids(wwids):: {}
}
```

### `fn source.inlineVolumeSpec.flexVolume.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.flexVolume.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.flexVolume.withDriver`
Driver is the name of the driver to use for this volume.
```jsonnet
{
  withDriver(driver):: {}
}
```

### `fn source.inlineVolumeSpec.flexVolume.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default filesystem depends on FlexVolume script.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.flexVolume.withOptions`
Optional: Extra command options if any.
```jsonnet
{
  withOptions(options):: {}
}
```

### `fn source.inlineVolumeSpec.flexVolume.withReadOnly`
Optional: Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.flocker.withDatasetName`
Name of the dataset stored as metadata -> name on the dataset for Flocker should be considered as deprecated
```jsonnet
{
  withDatasetName(datasetName):: {}
}
```

### `fn source.inlineVolumeSpec.flocker.withDatasetUUID`
UUID of the dataset. This is unique identifier of a Flocker dataset
```jsonnet
{
  withDatasetUUID(datasetUUID):: {}
}
```

### `fn source.inlineVolumeSpec.gcePersistentDisk.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.gcePersistentDisk.withPartition`
The partition in the volume that you want to mount. If omitted, the default is to mount by volume name. Examples: For volume /dev/sda1, you specify the partition as "1". Similarly, the volume partition for /dev/sda is "0" (or you can leave the property empty). More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withPartition(partition):: {}
}
```

### `fn source.inlineVolumeSpec.gcePersistentDisk.withPdName`
Unique name of the PD resource in GCE. Used to identify the disk in GCE. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withPdName(pdName):: {}
}
```

### `fn source.inlineVolumeSpec.gcePersistentDisk.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#gcepersistentdisk
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.glusterfs.withEndpoints`
EndpointsName is the endpoint name that details Glusterfs topology. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withEndpoints(endpoints):: {}
}
```

### `fn source.inlineVolumeSpec.glusterfs.withEndpointsNamespace`
EndpointsNamespace is the namespace that contains Glusterfs endpoint. If this field is empty, the EndpointNamespace defaults to the same namespace as the bound PVC. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withEndpointsNamespace(endpointsNamespace):: {}
}
```

### `fn source.inlineVolumeSpec.glusterfs.withPath`
Path is the Glusterfs volume path. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withPath(path):: {}
}
```

### `fn source.inlineVolumeSpec.glusterfs.withReadOnly`
ReadOnly here will force the Glusterfs volume to be mounted with read-only permissions. Defaults to false. More info: https://examples.k8s.io/volumes/glusterfs/README.md#create-a-pod
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.hostPath.withPath`
Path of the directory on the host. If the path is a symlink, it will follow the link to the real path. More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
```jsonnet
{
  withPath(path):: {}
}
```

### `fn source.inlineVolumeSpec.hostPath.withType`
Type for HostPath Volume Defaults to "" More info: https://kubernetes.io/docs/concepts/storage/volumes#hostpath
```jsonnet
{
  withType(type):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withChapAuthDiscovery`
whether support iSCSI Discovery CHAP authentication
```jsonnet
{
  withChapAuthDiscovery(chapAuthDiscovery):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withChapAuthSession`
whether support iSCSI Session CHAP authentication
```jsonnet
{
  withChapAuthSession(chapAuthSession):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#iscsi
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withInitiatorName`
Custom iSCSI Initiator Name. If initiatorName is specified with iscsiInterface simultaneously, new iSCSI interface <target portal>:<volume name> will be created for the connection.
```jsonnet
{
  withInitiatorName(initiatorName):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withIqn`
Target iSCSI Qualified Name.
```jsonnet
{
  withIqn(iqn):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withIscsiInterface`
iSCSI Interface Name that uses an iSCSI transport. Defaults to 'default' (tcp).
```jsonnet
{
  withIscsiInterface(iscsiInterface):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withLun`
iSCSI Target Lun number.
```jsonnet
{
  withLun(lun):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withPortals`
iSCSI Target Portal List. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
```jsonnet
{
  withPortals(portals):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.iscsi.withTargetPortal`
iSCSI Target Portal. The Portal is either an IP or ip_addr:port if the port is other than default (typically TCP ports 860 and 3260).
```jsonnet
{
  withTargetPortal(targetPortal):: {}
}
```

### `fn source.inlineVolumeSpec.local.withFsType`
Filesystem type to mount. It applies only when the Path is a block device. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". The default value is to auto-select a fileystem if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.local.withPath`
The full path to the volume on the node. It can be either a directory or block device (disk, partition, ...).
```jsonnet
{
  withPath(path):: {}
}
```

### `fn source.inlineVolumeSpec.nfs.withPath`
Path that is exported by the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withPath(path):: {}
}
```

### `fn source.inlineVolumeSpec.nfs.withReadOnly`
ReadOnly here will force the NFS export to be mounted with read-only permissions. Defaults to false. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.nfs.withServer`
Server is the hostname or IP address of the NFS server. More info: https://kubernetes.io/docs/concepts/storage/volumes#nfs
```jsonnet
{
  withServer(server):: {}
}
```

### `fn source.inlineVolumeSpec.nodeAffinity.required.withNodeSelectorTerms`
Required. A list of node selector terms. The terms are ORed.
```jsonnet
{
  withNodeSelectorTerms(nodeSelectorTerms):: {}
}
```

### `fn source.inlineVolumeSpec.photonPersistentDisk.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.photonPersistentDisk.withPdID`
ID that identifies Photon Controller persistent disk
```jsonnet
{
  withPdID(pdID):: {}
}
```

### `fn source.inlineVolumeSpec.portworxVolume.withFsType`
FSType represents the filesystem type to mount Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.portworxVolume.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.portworxVolume.withVolumeID`
VolumeID uniquely identifies a Portworx volume
```jsonnet
{
  withVolumeID(volumeID):: {}
}
```

### `fn source.inlineVolumeSpec.quobyte.withGroup`
Group to map volume access to Default is no group
```jsonnet
{
  withGroup(group):: {}
}
```

### `fn source.inlineVolumeSpec.quobyte.withReadOnly`
ReadOnly here will force the Quobyte volume to be mounted with read-only permissions. Defaults to false.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.quobyte.withRegistry`
Registry represents a single or multiple Quobyte Registry services specified as a string as host:port pair (multiple entries are separated with commas) which acts as the central registry for volumes
```jsonnet
{
  withRegistry(registry):: {}
}
```

### `fn source.inlineVolumeSpec.quobyte.withTenant`
Tenant owning the given Quobyte volume in the Backend Used with dynamically provisioned Quobyte volumes, value is set by the plugin
```jsonnet
{
  withTenant(tenant):: {}
}
```

### `fn source.inlineVolumeSpec.quobyte.withUser`
User to map volume access to Defaults to serivceaccount user
```jsonnet
{
  withUser(user):: {}
}
```

### `fn source.inlineVolumeSpec.quobyte.withVolume`
Volume is a string that references an already created Quobyte volume by name.
```jsonnet
{
  withVolume(volume):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.withFsType`
Filesystem type of the volume that you want to mount. Tip: Ensure that the filesystem type is supported by the host operating system. Examples: "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified. More info: https://kubernetes.io/docs/concepts/storage/volumes#rbd
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.withImage`
The rados image name. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withImage(image):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.withKeyring`
Keyring is the path to key ring for RBDUser. Default is /etc/ceph/keyring. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withKeyring(keyring):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.withMonitors`
A collection of Ceph monitors. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withMonitors(monitors):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.withPool`
The rados pool name. Default is rbd. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withPool(pool):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.withReadOnly`
ReadOnly here will force the ReadOnly setting in VolumeMounts. Defaults to false. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.rbd.withUser`
The rados user name. Default is admin. More info: https://examples.k8s.io/volumes/rbd/README.md#how-to-use-it
```jsonnet
{
  withUser(user):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.secretRef.withName`
Name is unique within a namespace to reference a secret resource.
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.secretRef.withNamespace`
Namespace defines the space within which the secret name must be unique.
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Default is "xfs"
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withGateway`
The host address of the ScaleIO API Gateway.
```jsonnet
{
  withGateway(gateway):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withProtectionDomain`
The name of the ScaleIO Protection Domain for the configured storage.
```jsonnet
{
  withProtectionDomain(protectionDomain):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withSslEnabled`
Flag to enable/disable SSL communication with Gateway, default false
```jsonnet
{
  withSslEnabled(sslEnabled):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withStorageMode`
Indicates whether the storage for a volume should be ThickProvisioned or ThinProvisioned. Default is ThinProvisioned.
```jsonnet
{
  withStorageMode(storageMode):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withStoragePool`
The ScaleIO Storage Pool associated with the protection domain.
```jsonnet
{
  withStoragePool(storagePool):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withSystem`
The name of the storage system as configured in ScaleIO.
```jsonnet
{
  withSystem(system):: {}
}
```

### `fn source.inlineVolumeSpec.scaleIO.withVolumeName`
The name of a volume already created in the ScaleIO system that is associated with this volume source.
```jsonnet
{
  withVolumeName(volumeName):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.secretRef.withFieldPath`
If referring to a piece of an object instead of an entire object, this string should contain a valid JSON/Go field access statement, such as desiredState.manifest.containers[2]. For example, if the object reference is to a container within a pod, this would take on a value like: "spec.containers{name}" (where "name" refers to the name of the container that triggered the event) or if no container name is specified "spec.containers[2]" (container with index 2 in this pod). This syntax is chosen only to have some well-defined way of referencing a part of an object.
```jsonnet
{
  withFieldPath(fieldPath):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.secretRef.withName`
Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names
```jsonnet
{
  withName(name):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.secretRef.withNamespace`
Namespace of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/namespaces/
```jsonnet
{
  withNamespace(namespace):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.secretRef.withResourceVersion`
Specific resourceVersion to which this reference is made, if any. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#concurrency-control-and-consistency
```jsonnet
{
  withResourceVersion(resourceVersion):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.secretRef.withUid`
UID of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#uids
```jsonnet
{
  withUid(uid):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.withReadOnly`
Defaults to false (read/write). ReadOnly here will force the ReadOnly setting in VolumeMounts.
```jsonnet
{
  withReadOnly(readOnly):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.withVolumeName`
VolumeName is the human-readable name of the StorageOS volume.  Volume names are only unique within a namespace.
```jsonnet
{
  withVolumeName(volumeName):: {}
}
```

### `fn source.inlineVolumeSpec.storageos.withVolumeNamespace`
VolumeNamespace specifies the scope of the volume within StorageOS.  If no namespace is specified then the Pod's namespace will be used.  This allows the Kubernetes name scoping to be mirrored within StorageOS for tighter integration. Set VolumeName to any name to override the default behaviour. Set to "default" if you are not using namespaces within StorageOS. Namespaces that do not pre-exist within StorageOS will be created.
```jsonnet
{
  withVolumeNamespace(volumeNamespace):: {}
}
```

### `fn source.inlineVolumeSpec.vsphereVolume.withFsType`
Filesystem type to mount. Must be a filesystem type supported by the host operating system. Ex. "ext4", "xfs", "ntfs". Implicitly inferred to be "ext4" if unspecified.
```jsonnet
{
  withFsType(fsType):: {}
}
```

### `fn source.inlineVolumeSpec.vsphereVolume.withStoragePolicyID`
Storage Policy Based Management (SPBM) profile ID associated with the StoragePolicyName.
```jsonnet
{
  withStoragePolicyID(storagePolicyID):: {}
}
```

### `fn source.inlineVolumeSpec.vsphereVolume.withStoragePolicyName`
Storage Policy Based Management (SPBM) profile name.
```jsonnet
{
  withStoragePolicyName(storagePolicyName):: {}
}
```

### `fn source.inlineVolumeSpec.vsphereVolume.withVolumePath`
Path that identifies vSphere volume vmdk
```jsonnet
{
  withVolumePath(volumePath):: {}
}
```

### `fn source.inlineVolumeSpec.withAccessModes`
AccessModes contains all ways the volume can be mounted. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#access-modes
```jsonnet
{
  withAccessModes(accessModes):: {}
}
```

### `fn source.inlineVolumeSpec.withCapacity`
A description of the persistent volume's resources and capacity. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#capacity
```jsonnet
{
  withCapacity(capacity):: {}
}
```

### `fn source.inlineVolumeSpec.withMountOptions`
A list of mount options, e.g. ["ro", "soft"]. Not validated - mount will simply fail if one is invalid. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes/#mount-options
```jsonnet
{
  withMountOptions(mountOptions):: {}
}
```

### `fn source.inlineVolumeSpec.withPersistentVolumeReclaimPolicy`
What happens to a persistent volume when released from its claim. Valid options are Retain (default for manually created PersistentVolumes), Delete (default for dynamically provisioned PersistentVolumes), and Recycle (deprecated). Recycle must be supported by the volume plugin underlying this PersistentVolume. More info: https://kubernetes.io/docs/concepts/storage/persistent-volumes#reclaiming
```jsonnet
{
  withPersistentVolumeReclaimPolicy(persistentVolumeReclaimPolicy):: {}
}
```

### `fn source.inlineVolumeSpec.withStorageClassName`
Name of StorageClass to which this persistent volume belongs. Empty value means that this volume does not belong to any StorageClass.
```jsonnet
{
  withStorageClassName(storageClassName):: {}
}
```

### `fn source.inlineVolumeSpec.withVolumeMode`
volumeMode defines if a volume is intended to be used with a formatted filesystem or to remain in raw block state. Value of Filesystem is implied when not included in spec. This is a beta feature.
```jsonnet
{
  withVolumeMode(volumeMode):: {}
}
```

### `fn source.withPersistentVolumeName`
Name of the persistent volume to attach.
```jsonnet
{
  withPersistentVolumeName(persistentVolumeName):: {}
}
```

