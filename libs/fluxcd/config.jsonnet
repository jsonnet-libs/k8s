local config = import 'jsonnet/config.jsonnet';

config.new(
  name='fluxcd',
  specs=[
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.24.1/manifests/crds/kustomization.yaml
      output: '0.24.1',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.19.2/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.18.2/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.14.1/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.19.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.14.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.18.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.25.3/manifests/crds/kustomization.yaml
      output: '0.25.3',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.20.1/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.19.1/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.15.0/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.20.1/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.15.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.19.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.26.0/manifests/crds/kustomization.yaml
      output: '0.26.0',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.21.1/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.20.0/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.16.0/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.21.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.16.0/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.20.0/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.28.5/manifests/crds/kustomization.yaml
      output: '0.28.5',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.22.5/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.22.3/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.18.2/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.23.2/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.17.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.21.3/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    },
  ]
)
