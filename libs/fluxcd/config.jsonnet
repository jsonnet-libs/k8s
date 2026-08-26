local config = import 'jsonnet/config.jsonnet';

local versions = [
  {
    version: '2.9.4',
    tags: {
      'source-watcher': '2.2.3',
      'source-controller': '1.9.4',
      'kustomize-controller': '1.9.4',
      'helm-controller': '1.6.3',
      'notification-controller': '1.9.3',
      'image-reflector-controller': '1.2.4',
      'image-automation-controller': '1.2.4',
    },
  },
  {
    version: '2.6.4',
    tags: {
      'source-controller': '1.6.2',
      'kustomize-controller': '1.6.1',
      'helm-controller': '1.3.0',
      'notification-controller': '1.6.0',
      'image-reflector-controller': '0.35.2',
      'image-automation-controller': '0.41.2',
    },
  },
  {
    version: '2.6.3',
    tags: {
      'source-controller': '1.6.2',
      'kustomize-controller': '1.6.0',
      'helm-controller': '1.3.0',
      'notification-controller': '1.6.0',
      'image-reflector-controller': '0.35.2',
      'image-automation-controller': '0.41.2',
    },
  },
  {
    version: '2.6.2',
    tags: {
      'source-controller': '1.6.1',
      'kustomize-controller': '1.6.0',
      'helm-controller': '1.3.0',
      'notification-controller': '1.6.0',
      'image-reflector-controller': '0.35.2',
      'image-automation-controller': '0.41.1',
    },
  },
  {
    version: '2.6.1',
    tags: {
      'source-controller': '1.6.0',
      'kustomize-controller': '1.6.0',
      'helm-controller': '1.3.0',
      'notification-controller': '1.6.0',
      'image-reflector-controller': '0.35.1',
      'image-automation-controller': '0.41.0',
    },
  },
  {
    version: '2.6.0',
    tags: {
      'source-controller': '1.6.0',
      'kustomize-controller': '1.6.0',
      'helm-controller': '1.3.0',
      'notification-controller': '1.6.0',
      'image-reflector-controller': '0.35.0',
      'image-automation-controller': '0.41.0',
    },
  },
  {
    version: '2.5.1',
    tags: {
      'source-controller': '1.5.0',
      'kustomize-controller': '1.5.1',
      'helm-controller': '1.2.0',
      'notification-controller': '1.5.0',
      'image-reflector-controller': '0.34.0',
      'image-automation-controller': '0.40.0',
    },
  },
  {
    version: '2.4.0',
    tags: {
      'source-controller': '1.4.1',
      'kustomize-controller': '1.4.0',
      'helm-controller': '1.1.0',
      'notification-controller': '1.4.0',
      'image-reflector-controller': '0.33.0',
      'image-automation-controller': '0.39.0',
    },
  },
  {
    version: '2.3.0',
    tags: {
      'source-controller': '1.3.0',
      'kustomize-controller': '1.3.0',
      'helm-controller': '1.0.1',
      'notification-controller': '1.3.0',
      'image-reflector-controller': '0.32.0',
      'image-automation-controller': '0.38.0',
    },
  },
  {
    version: '2.2.2',
    tags: {
      'source-controller': '1.2.3',
      'kustomize-controller': '1.2.1',
      'helm-controller': '0.37.2',
      'notification-controller': '1.2.3',
      'image-reflector-controller': '0.31.1',
      'image-automation-controller': '0.37.0',
    },
  },
  {
    version: '2.2.1',
    tags: {
      'source-controller': '1.2.3',
      'kustomize-controller': '1.2.1',
      'helm-controller': '0.37.1',
      'notification-controller': '1.2.3',
      'image-reflector-controller': '0.31.1',
      'image-automation-controller': '0.37.0',
    },
  },
  {
    version: '2.0.1',
    tags: {
      'source-controller': '1.0.1',
      'kustomize-controller': '1.0.1',
      'helm-controller': '0.35.0',
      'notification-controller': '1.0.0',
      'image-reflector-controller': '0.29.1',
      'image-automation-controller': '0.35.0',
    },
  },
  {
    version: '0.41.2',
    tags: {
      'source-controller': '0.36.1',
      'kustomize-controller': '0.35.1',
      'helm-controller': '0.31.2',
      'notification-controller': '0.33.0',
      'image-reflector-controller': '0.26.1',
      'image-automation-controller': '0.31.0',
    },
  },
];

config.new(
  name='fluxcd',
  specs=[
    {
      output: v.version,
      prefix: '^io\\.fluxcd\\.toolkit\\..*',
      crds: [
        'https://github.com/fluxcd/%(component)s/releases/download/v%(tag)s/%(component)s.crds.yaml'
        % { component: component, tag: v.tags[component] }
        for component in std.objectFields(v.tags)
      ],
      localName: 'fluxcd',
    }
    for v in versions
  ]
)
