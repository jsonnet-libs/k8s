local config = import 'jsonnet/config.jsonnet';

config.new(
  name='fluxcd',
  specs=[
    {
      // CRDs retrieved from https://github.com/fluxcd/flux2/blob/v0.17.2/manifests/crds/kustomization.yaml
      output: '0.17.2',
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/source-controller/releases/download/v0.15.4/source-controller.crds.yaml',
        'https://github.com/fluxcd/kustomize-controller/releases/download/v0.14.1/kustomize-controller.crds.yaml',
        'https://github.com/fluxcd/helm-controller/releases/download/v0.11.2/helm-controller.crds.yaml',
        'https://github.com/fluxcd/notification-controller/releases/download/v0.16.0/notification-controller.crds.yaml',
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v0.11.1/image-reflector-controller.crds.yaml',
        'https://github.com/fluxcd/image-automation-controller/releases/download/v0.14.1/image-automation-controller.crds.yaml',
      ],
      localName: 'fluxcd',
    }
  ]
)
