local d = import 'doc-util/main.libsonnet';

local endpoint = {
  '#':: d.pkg(name='endpoint', url='', help='Endpoint is a helper to create endpoint configurations in ServiceMonitors. An endpoint defines a scrapeable endpoint serving Prometheus metrics.'),

  '#authorization':: d.obj(help='Authorization section for this endpoint'),
  authorization: {

    '#withType':: d.fn('Set the authentication type. Defaults to Bearer, Basic will cause an error', [d.arg('type', d.T.string)]),
    withType(type): { authorization+: { type: type } },

    '#credentials':: d.obj(help="The secret's key that contains the credentials of the request"),
    credentials: {

      '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
      withKey(key): { authorization+: { credentials+: { key: key } } },

      '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
      withName(name): { authorization+: { credentials+: { name: name } } },

      '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
      withOptional(is_optional): { authorization+: { credentials+: { optional: is_optional } } },
    },
  },

  '#withPort':: d.fn('Name of the service port this endpoint refers to. Mutually exclusive with withTargetPort.', [d.arg('port', d.T.string)]),
  withPort(port): { port: port },

  '#withTargetPort':: d.fn('Name or number of the target port of the Pod behind the Service, the port must be specified with container port property. Mutually exclusive with withPort.', [d.arg('port', d.T.int)]),
  withTargetPort(port): { targetPort: port },

  '#withPath':: d.fn('HTTP path to scrape for metrics.', [d.arg('path', d.T.string)]),
  withPath(path): { path: path },

  '#withScheme':: d.fn('HTTP scheme to use for scraping.', [d.arg('scheme', d.T.string)]),
  withScheme(scheme): { scheme: scheme },

  '#withParams':: d.fn('Optional HTTP URL parameters.', [d.arg('params', d.T.object)]),
  withParams(params): { params: params },

  '#withInterval':: d.fn('Interval at which metrics should be scraped.', [d.arg('interval', d.T.string)]),
  withInterval(interval): { interval: interval },

  '#withScrapeTimeout':: d.fn('Timeout after which the scrape is ended.', [d.arg('timeout', d.T.string)]),
  withScrapeTimeout(timeout): { scrapeTimeout: timeout },

  '#tlsConfig':: d.obj('TLS configuration to use when scraping the endpoint'),
  tlsConfig: {
    '#ca':: d.obj('Struct containing the CA cert to use for the targets.'),
    ca: {
      '#secret':: d.obj('Secret containing data to use for the targets. Mutually exclusive with configMap.'),
      secret: {
        '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
        withKey(key): { tlsConfig+: { ca+: { secret+: { key: key } } } },

        '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
        withName(name): { tlsConfig+: { ca+: { secret+: { name: name } } } },

        '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
        withOptional(is_optional): { tlsConfig+: { ca+: { secret+: { optional: is_optional } } } },
      },

      '#configMap':: d.obj('ConfigMap containing data to use for the targets. Mutually exclusive with secret.'),
      configMap: {
        '#withKey':: d.fn('The key to select.', [d.arg('key', d.T.string)]),
        withKey(key): { tlsConfig+: { ca+: { configMap+: { key: key } } } },

        '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
        withName(name): { tlsConfig+: { ca+: { configMap+: { name: name } } } },

        '#withOptional':: d.fn('Specify whether the ConfigMap or its key must be defined.', [d.arg('is_optional', d.T.bool)]),
        withOptional(is_optional): { tlsConfig+: { ca+: { configMap+: { optional: is_optional } } } },
      },
    },

    '#cert':: d.obj('Struct containing the client cert file for the targets.'),
    cert: {
      '#secret':: d.obj('Secret containing data to use for the targets. Mutually exclusive with configMap.'),
      secret: {
        '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
        withKey(key): { tlsConfig+: { cert+: { secret+: { key: key } } } },

        '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
        withName(name): { tlsConfig+: { cert+: { secret+: { name: name } } } },

        '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
        withOptional(is_optional): { tlsConfig+: { cert+: { secret+: { optional: is_optional } } } },
      },

      '#configMap':: d.obj('ConfigMap containing data to use for the targets. Mutually exclusive with secret.'),
      configMap: {
        '#withKey':: d.fn('The key to select.', [d.arg('key', d.T.string)]),
        withKey(key): { tlsConfig+: { cert+: { configMap+: { key: key } } } },

        '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
        withName(name): { tlsConfig+: { cert+: { configMap+: { name: name } } } },

        '#withOptional':: d.fn('Specify whether the ConfigMap or its key must be defined.', [d.arg('is_optional', d.T.bool)]),
        withOptional(is_optional): { tlsConfig+: { cert+: { configMap+: { optional: is_optional } } } },
      },
    },

    '#keySecret':: d.obj('Secret containing the client key file for the targets.'),
    keySecret: {
      '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
      withKey(key): { tlsConfig+: { keySecret+: { key: key } } },

      '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
      withName(name): { tlsConfig+: { keySecret+: { name: name } } },

      '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
      withOptional(is_optional): { tlsConfig+: { keySecret+: { optional: is_optional } } },
    },

    '#withServerName':: d.fn('Used to verify the hostname for the targets.', [d.arg('name', d.T.string)]),
    withServerName(name): { tlsConfig+: { serverName: name } },

    '#withInsecureSkipVerify':: d.fn('Disable target certificate validation.', [d.arg('skip_verify', d.T.bool)]),
    withInsecureSkipVerify(skip_verify): { tlsConfig+: { insecureSkipVerify: skip_verify } },

    '#withCaFile':: d.fn('Path to the CA cert in the Prometheus container to use for the targets.', [d.arg('path', d.T.string)]),
    withCaFile(path): { tlsConfig+: { caFile: path } },

    '#withCertFile':: d.fn('Path to the client cert file in the Prometheus container for the targets.', [d.arg('path', d.T.string)]),
    withCertFile(path): { tlsConfig+: { certFile: path } },

    '#withKeyFile':: d.fn('Path to the client key file in the Prometheus container for the targets.', [d.arg('path', d.T.string)]),
    withKeyFile(path): { tlsConfig+: { keyFile: path } },
  },

  '#withBearerTokenFile':: d.fn('File to read bearer token for scraping targets.', [d.arg('path', d.T.string)]),
  withBearerTokenFile(path): { bearerTokenFile: path },

  '#bearerTokenSecret':: d.obj('Secret to mount to read bearer token for scraping targets. The secret needs to be in the same namespace as the service monitor and accessible by the Prometheus Operator.'),
  bearerTokenSecret: {
    '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
    withKey(key): { bearerTokenSecret+: { key: key } },

    '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
    withName(name): { bearerTokenSecret+: { name: name } },

    '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
    withOptional(is_optional): { bearerTokenSecret+: { optional: is_optional } },
  },

  '#withHonorLabels':: d.fn('HonorLabels chooses the metric’s labels on collisions with target labels.', [d.arg('honor_labels', d.T.bool)]),
  withHonorLabels(honor_labels): { honorLabels: honor_labels },

  '#withHonorTimestamps':: d.fn('HonorTimestamps controls whether Prometheus respects the timestamps present in scraped data.', [d.arg('honor_timestamps', d.T.bool)]),
  withHonorTimestamps(honor_timestamps): { honorTimestamps: honor_timestamps },

  '#basicAuth':: d.obj('BasicAuth allow an endpoint to authenticate over basic authentication More info: https://prometheus.io/docs/operating/configuration/#endpoints'),
  basicAuth: {
    '#username':: d.obj('The secret in the service monitor namespace that contains the username for authentication.'),
    username: {
      '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
      withKey(key): { basicAuth+: { username+: { key: key } } },

      '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
      withName(name): { basicAuth+: { username+: { name: name } } },

      '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
      withOptional(is_optional): { basicAuth+: { username+: { optional: is_optional } } },
    },

    '#password':: d.obj('The secret in the service monitor namespace that contains the password for authentication.'),
    password: {
      '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
      withKey(key): { basicAuth+: { password+: { key: key } } },

      '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
      withName(name): { basicAuth+: { password+: { name: name } } },

      '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
      withOptional(is_optional): { basicAuth+: { password+: { optional: is_optional } } },
    },
  },

  '#oauth2':: d.obj('OAuth2 for the URL. Only valid in Prometheus versions 2.27.0 and newer.'),
  oauth2: {
    '#clientId':: d.obj('The secret or configmap containing the OAuth2 client id.'),
    clientId: {
      '#secret':: d.obj('Secret containing data to use for the targets. Mutually exclusive with configMap.'),
      secret: {
        '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
        withKey(key): { oauth2+: { clientId+: { secret+: { key: key } } } },

        '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
        withName(name): { oauth2+: { clientId+: { secret+: { name: name } } } },

        '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
        withOptional(is_optional): { oauth2+: { clientId+: { secret+: { optional: is_optional } } } },
      },

      '#configMap':: d.obj('ConfigMap containing data to use for the targets. Mutually exclusive with secret.'),
      configMap: {
        '#withKey':: d.fn('The key to select.', [d.arg('key', d.T.string)]),
        withKey(key): { oauth2+: { clientId+: { configMap+: { key: key } } } },

        '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
        withName(name): { oauth2+: { clientId+: { configMap+: { name: name } } } },

        '#withOptional':: d.fn('Specify whether the ConfigMap or its key must be defined.', [d.arg('is_optional', d.T.bool)]),
        withOptional(is_optional): { oauth2+: { clientId+: { configMap+: { optional: is_optional } } } },
      },
    },

    '#clientSecret':: d.obj('The secret containing the OAuth2 client secret.'),
    clientSecret: {
      '#withKey':: d.fn('The key of the secret to select from.  Must be a valid secret key.', [d.arg('key', d.T.string)]),
      withKey(key): { oauth2+: { clientSecret+: { key: key } } },

      '#withName':: d.fn('Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names', [d.arg('name', d.T.string)]),
      withName(name): { oauth2+: { clientSecret+: { name: name } } },

      '#withOptional':: d.fn('Specify whether the Secret or its key must be defined', [d.arg('is_optional', d.T.bool)]),
      withOptional(is_optional): { oauth2+: { clientSecret+: { optional: is_optional } } },
    },

    '#withTokenUrl':: d.fn('The URL to fetch the token from.', [d.arg('url', d.T.string)]),
    withTokenUrl(url): { oauth2+: { tokenUrl: url } },

    '#withScopes':: d.fn('OAuth2 scopes used for the token request.', [d.arg('scopes', d.T.array)]),
    withScopes(scopes): { oauth2+: { scopes: scopes } },

    '#withEndpointParams':: d.fn('Parameters to append to the token URL', [d.arg('params', d.T.object)]),
    withEndpointParams(params): { oauth2+: { endpointParams: params } },
  },

  '#withMetricRelabelings':: d.fn('MetricRelabelConfigs to apply to samples before ingestion.', [d.arg('relabelings', d.T.array)]),
  withMetricRelabelings(relabelings): { metricRelabelings: relabelings },

  '#withRelabelings':: d.fn('RelabelConfigs to apply to samples before scraping. Prometheus Operator automatically adds relabelings for a few standard Kubernetes fields and replaces original scrape job name with __tmp_prometheus_job_name. More info: https://prometheus.io/docs/prometheus/latest/configuration/configuration/#relabel_config', [d.arg('relabelings', d.T.array)]),
  withRelabelings(relabelings): { relabelings: relabelings },

  '#withProxyUrl':: d.fn('ProxyURL eg http://proxyserver:2195 Directs scrapes to proxy through this endpoint.', [d.arg('url', d.T.string)]),
  withProxyUrl(url): { proxyUrl: url },

  '#mixin': 'ignore',
  mixin: self,
};

{
  monitoring+:: {
    v1+: {
      endpoint: endpoint,
    },
    v1alpha1+: {
      endpoint: endpoint,
    },
  },
}
