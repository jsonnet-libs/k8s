local config = import 'jsonnet/config.jsonnet';

local versions = [
  {
    version: '2.6.4',
    tags: {
      source_controller: '1.6.2',
      kustomize_controller: '1.6.1',
      helm_controller: '1.3.0',
      notification_controller: '1.6.0',
      image_reflector_controller: '0.35.2',
      image_automation_controller: '0.41.2',
    },
  },
  {
    version: '2.6.3',
    tags: {
      source_controller: '1.6.2',
      kustomize_controller: '1.6.0',
      helm_controller: '1.3.0',
      notification_controller: '1.6.0',
      image_reflector_controller: '0.35.2',
      image_automation_controller: '0.41.2',
    },
  },
  {
    version: '2.6.2',
    tags: {
      source_controller: '1.6.1',
      kustomize_controller: '1.6.0',
      helm_controller: '1.3.0',
      notification_controller: '1.6.0',
      image_reflector_controller: '0.35.2',
      image_automation_controller: '0.41.1',
    },
  },
  {
    version: '2.6.1',
    tags: {
      source_controller: '1.6.0',
      kustomize_controller: '1.6.0',
      helm_controller: '1.3.0',
      notification_controller: '1.6.0',
      image_reflector_controller: '0.35.1',
      image_automation_controller: '0.41.0',
    },
  },
  {
    version: '2.6.0',
    tags: {
      source_controller: '1.6.0',
      kustomize_controller: '1.6.0',
      helm_controller: '1.3.0',
      notification_controller: '1.6.0',
      image_reflector_controller: '0.35.0',
      image_automation_controller: '0.41.0',
    },
  },
  {
    version: '2.5.1',
    tags: {
      source_controller: '1.5.0',
      kustomize_controller: '1.5.1',
      helm_controller: '1.2.0',
      notification_controller: '1.5.0',
      image_reflector_controller: '0.34.0',
      image_automation_controller: '0.40.0',
    },
  },
  {
    version: '2.4.0',
    tags: {
      source_controller: '1.4.1',
      kustomize_controller: '1.4.0',
      helm_controller: '1.1.0',
      notification_controller: '1.4.0',
      image_reflector_controller: '0.33.0',
      image_automation_controller: '0.39.0',
    },
  },
  {
    version: '2.3.0',
    tags: {
      source_controller: '1.3.0',
      kustomize_controller: '1.3.0',
      helm_controller: '1.0.1',
      notification_controller: '1.3.0',
      image_reflector_controller: '0.32.0',
      image_automation_controller: '0.38.0',
    },
  },
  {
    version: '2.2.2',
    tags: {
      source_controller: '1.2.3',
      kustomize_controller: '1.2.1',
      helm_controller: '0.37.2',
      notification_controller: '1.2.3',
      image_reflector_controller: '0.31.1',
      image_automation_controller: '0.37.0',
    },
  },
  {
    version: '2.2.1',
    tags: {
      source_controller: '1.2.3',
      kustomize_controller: '1.2.1',
      helm_controller: '0.37.1',
      notification_controller: '1.2.3',
      image_reflector_controller: '0.31.1',
      image_automation_controller: '0.37.0',
    },
  },
  {
    version: '2.0.1',
    tags: {
      source_controller: '1.0.1',
      kustomize_controller: '1.0.1',
      helm_controller: '0.35.0',
      notification_controller: '1.0.0',
      image_reflector_controller: '0.29.1',
      image_automation_controller: '0.35.0',
    },
  },
  {
    version: '0.41.2',
    tags: {
      source_controller: '0.36.1',
      kustomize_controller: '0.35.1',
      helm_controller: '0.31.2',
      notification_controller: '0.33.0',
      image_reflector_controller: '0.26.1',
      image_automation_controller: '0.31.0',
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
        'https://github.com/fluxcd/source-controller/releases/download/v%s/source-controller.crds.yaml' % [v.tags.source_controller],
        'https://github.com/fluxcd/kustomize-controller/releases/download/v%s/kustomize-controller.crds.yaml' % [v.tags.kustomize_controller],
        'https://github.com/fluxcd/helm-controller/releases/download/v%s/helm-controller.crds.yaml' % [v.tags.helm_controller],
        'https://github.com/fluxcd/notification-controller/releases/download/v%s/notification-controller.crds.yaml' % [v.tags.notification_controller],
        'https://github.com/fluxcd/image-reflector-controller/releases/download/v%s/image-reflector-controller.crds.yaml' % [v.tags.image_reflector_controller],
        'https://github.com/fluxcd/image-automation-controller/releases/download/v%s/image-automation-controller.crds.yaml' % [v.tags.image_automation_controller],
      ],
      localName: 'fluxcd',
    }
    for v in versions
  ]
)
