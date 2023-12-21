local config = import 'jsonnet/config.jsonnet';

config.new(
  name='fluxcd',
  specs=[
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v2.2.2/manifests/crds/kustomization.yaml
      output: '2.2.2',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v1.2.3/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v1.2.1/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.37.2/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v1.2.3/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.31.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.37.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v2.2.1/manifests/crds/kustomization.yaml
      output: '2.2.1',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v1.2.3/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v1.2.1/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.37.1/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v1.2.3/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.31.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.37.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v2.0.1/manifests/crds/kustomization.yaml
      output: '2.0.1',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v1.0.1/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v1.0.1/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.35.0/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v1.0.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.29.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.35.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.30.2/manifests/crds/kustomization.yaml
      output: '0.30.2',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.24.4/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.25.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.21.0/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.23.5/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.18.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.22.1/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.31.1/manifests/crds/kustomization.yaml
      output: '0.31.1',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.25.5/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.26.1/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.22.1/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.24.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.19.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.23.2/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.32.0/manifests/crds/kustomization.yaml
      output: '0.32.0',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.26.1/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.27.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.22.2/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.25.1/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.20.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.24.1/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.33.0/manifests/crds/kustomization.yaml
      output: '0.33.0',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.28.0/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.27.1/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.23.1/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.25.2/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.20.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.24.2/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.34.0/manifests/crds/kustomization.yaml
      output: '0.34.0',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.29.0/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.28.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.24.0/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.26.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.21.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.25.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.35.0/manifests/crds/kustomization.yaml
      output: '0.35.0',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.30.0/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.29.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.25.0/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.27.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.22.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.26.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.36.0/manifests/crds/kustomization.yaml
      output: '0.36.0',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.31.0/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.30.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.26.0/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.28.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.22.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.26.1/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.37.0/manifests/crds/kustomization.yaml
      output: '0.37.0',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.32.1/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.31.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.27.0/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.29.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.23.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.27.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.38.3/manifests/crds/kustomization.yaml
      output: '0.38.3',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.33.0/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.32.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.28.1/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.30.2/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.23.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.28.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.41.1/manifests/crds/kustomization.yaml
      output: '0.41.1',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.36.0/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.35.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.31.1/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.33.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.26.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.31.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
  ]
)
