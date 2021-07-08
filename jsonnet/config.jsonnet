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
        spec { repository: this.repository }
        for spec in specs
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
      # For mkdocs

      # Use newer mkdocs so indexing can be done on titles only
      git+https://github.com/mkdocs/mkdocs.git@57b5ccd7d63e5b7067d37d0433111e9a5278fb6d

      # To limit search to a subset
      mkdocs-exclude-search>=0.5

      # To minify the HTML
      mkdocs-minify-plugin>=0.3

      # Include the theme
      mkdocs-material>=7.1.6
    |||,
  },
}
