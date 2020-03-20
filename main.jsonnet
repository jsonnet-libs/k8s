local k = import "./k8s/main.libsonnet";

{
  svc: k.core.v1.service.new("grafana"),
  dep: k.apps.v1.deployment.new(name="grafana", containers=[
     k.core.v1.container.new("grafana", "grafana/grafana")
  ])
}
