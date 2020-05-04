{
  core+: {
    v1+: {
      configMap+: {
        new(name, data)::
          super.new()
          + super.metadata.withName(name)
          + super.withData(data),
      },

      container+: {
        new(name, image):: super.withName(name) + super.withImage(image),
      },

      containerPort+: {
        new(containerPort):: super.withContainerPort(containerPort),
        newNamed(containerPort, name):: self.new(containerPort) + super.withName(name),
      },

      envVar+: {
        new(name, value):: super.withName(name) + super.withValue(value),
        fromSecretRef(name, secretRefName, secretRefKey)::
          super.withName(name)
          + super.valueFrom.secretKeyRef.withName(secretRefName)
          + super.valueFrom.secretKeyRef.withKey(secretRefKey),
        fromFieldPath(name, fieldPath)::
          super.withName(name)
          + super.valueFrom.fieldRef.withFieldPath,
      },

      keyToPath+:: {
        new(key, path):: super.withKey(key) + super.withPath(path),
      },

      secret+:: {
        new(name, data, type='Opaque')::
          super.new(name)
          + super.withData(data)
          + super.withType(type),
      },

      service+:: {
        new(name, selector, ports)::
          super.new(name)
          + super.spec.withSelector(selector)
          + super.spec.withPorts(ports),
      },

      servicePort+:: {
        new(port, targetPort):: super.withPort(port) + super.withTargetPort(targetPort),
        newNamed(name, port, targetPort):: self.new(port, targetPort) + super.withName(name),
      },

      volume+:: {
        fromConfigMap(name, configMapName, configMapItems)::
          super.withName(name)
          + super.configMap.withName(configMapName) + super.configMap.withItems(configMapItems),
        fromEmptyDir(name, emptyDir)::
          super.withName(name) + { emptyDir: emptyDir },
        fromPersistentVolumeClaim(name, claimName)::
          super.withName(name) + super.persistentVolumeClaim.withClaimName(claimName),
        fromHostPath(name, hostPath)::
          super.withName(name) + super.hostPath.withPath(hostPath),
        fromSecret(name, secretName)::
          super.withName(name) + super.secret.withSecretName(secretName),
      },

      volumeMount+:: {
        new(name, mountPath, readOnly)::
          super.withName(name) + super.withMountPath(mountPath) + super.withReadOnly(readOnly),
      },
    },
  },
}
