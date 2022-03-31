{
  new(
    name,
    specs
  ):: {
    local this = self,

    suffix:: '-libsonnet',

    name:: name,
    description:: this.name + ' jsonnet library',
    repository:: 'github.com/jsonnet-libs/' + this.name + this.suffix,
    branch:: 'main',
    site_url:: 'https://jsonnet-libs.github.io/' + this.name + this.suffix,

    'skel/LICENSE': importstr '../LICENSE',

    'config.yml': std.manifestYamlDoc({
      repository: this.repository,
      specs: [
        local proxy_port = 8001 + i;
        { proxy_port: proxy_port, openapi: 'http://localhost:%s/openapi/v2' % proxy_port, repository: this.repository }
        + specs[i]
        for i in std.range(0, std.length(specs) - 1)
      ],
    }, true),

    readme_template(name, data):: |||
      # %s Jsonnet library

      This library is generated with [`k8s`](https://github.com/jsonnet-libs/k8s).

      %s
    ||| % [name, data],

    'skel/README.md': this.readme_template(
      name=name,
      data='[Docs](' + this.site_url + ')',
    ),

    'skel/docs/README.md': this.readme_template(
      name=name,
      data=std.join('\n', [
        '- [%(output)s](%(output)s/README.md)' % spec
        for spec in specs
      ]),
    ),

    local mkdocs = import './mkdocs.jsonnet',
    mkdocs_config:: mkdocs.config {
      site_name: this.description,
      site_url: this.site_url,
      repo_url: 'https://' + this.repository,
    },

    mkdocs_github_action:: mkdocs.action {
      branch:: this.branch,
    },

    'skel/mkdocs.yml': std.manifestYamlDoc(this.mkdocs_config, true),

    'skel/.github/workflows/main.yml': std.manifestYamlDoc(this.mkdocs_github_action, true),
    'skel/docs/stylesheets/extra.css': |||
      .md-nav__link:first-letter { text-transform: lowercase; }
    |||,

    'skel/requirements.txt': |||
      # mkdocs
      mkdocs>=1.3.0

      # To limit search to a subset
      mkdocs-exclude-search>=0.5

      # To minify the HTML
      mkdocs-minify-plugin>=0.3

      # Include the theme
      mkdocs-material>=7.1.6
    |||,
  },
}
