# TODO: Additional CRD libraries

Priority order: small/stable first, then high-impact operators.

## High priority (small, stable CRDs)

- [ ] Sealed Secrets
  - repo: `bitnami-labs/sealed-secrets`
  - config: `specGenerator` (GitHub releases)
  - notes: `SealedSecret` CRD only; version tag matches chart release.

- [ ] Reloader
  - repo: `stakater/Reloader`
  - config: `specGenerator` (GitHub releases)
  - notes: `Reloader` CRD only; simple, stable.

## Medium priority (popular operators)

- [ ] OpenTelemetry Operator
  - repo: `open-telemetry/opentelemetry-operator`
  - config: `specGenerator` (GitHub releases)
  - notes: Uses `opentelemetry.io` API group.

- [ ] Velero
  - repo: `vmware-tanzu/velero`
  - config: `specGenerator` (GitHub releases)
  - notes: CRDs in `config/crd/v1`; API group `velero.io`.

- [ ] Jaeger Operator
  - repo: `jaegertracing/jaeger-operator`
  - config: `specGenerator` (GitHub releases)
  - notes: API group `jaegertracing.io`.

- [ ] NGINX Ingress Controller
  - repo: `kubernetes/ingress-nginx`
  - config: `specGenerator` (GitHub releases)
  - notes: CRDs in `charts/ingress-nginx/crds`; may need path adjustment.

- [ ] Kpack
  - repo: `buildpacks-community/kpack`
  - config: `specGenerator` (GitHub releases)
  - notes: API group `kpack.io`.

- [ ] Argo Events
  - repo: `argoproj/argo-events`
  - config: `specGenerator` (GitHub releases)
  - notes: Follows same Argo pattern as Argo CD / Workflows.

## Lower priority / larger projects

- [ ] Linkerd
  - repo: `linkerd/linkerd2`
  - config: `specGenerator` (GitHub releases)
  - notes: Many CRDs; may need `prefix` filter.

- [ ] Kong Ingress Controller
  - repo: `Kong/kubernetes-ingress-controller`
  - config: `specGenerator` (GitHub releases)
  - notes: API group `configuration.konghq.com`.

- [ ] Rook
  - repo: `rook/rook`
  - config: `specGenerator` (GitHub releases)
  - notes: Large CRD set; API group `ceph.rook.io`.

- [ ] KubeVirt
  - repo: `kubevirt/kubevirt`
  - config: `specGenerator` (GitHub releases)
  - notes: Large CRD set; API group `kubevirt.io`.

- [ ] Redis Operator (Spotahome)
  - repo: `spotahome/redis-operator`
  - config: `specGenerator` (GitHub releases)
  - notes: API group `databases.spotahome.com`.

- [ ] MongoDB Community Operator
  - repo: `mongodb/mongodb-kubernetes-operator`
  - config: `specGenerator` (GitHub releases)
  - notes: API group `mongodbcommunity.mongodb.com`.

- [ ] Kiali
  - repo: `kiali/kiali-operator`
  - config: `specGenerator` (GitHub releases)
  - notes: Often used alongside Istio.

- [ ] Trivy Operator
  - repo: `aquasecurity/trivy-operator`
  - config: `specGenerator` (GitHub releases)
  - notes: API group `aquasecurity.github.io`.

- [ ] Kubecost
  - repo: `kubecost/cost-analyzer-helm-chart`
  - config: `specGenerator` (GitHub releases)
  - notes: CRDs may be in Helm chart; might need manual spec.

- [ ] Gloo Edge
  - repo: `solo-io/gloo`
  - config: likely `specs` (manual) because CRDs are spread across repo

- [ ] HAProxy Ingress
  - repo: `jcmoraisjr/haproxy-ingress`
  - config: `specGenerator` (GitHub releases)
  - notes: API group `ingress.haproxy.org`.

## Process for adding each

1. Add `libs/<name>/config.json` with `specGenerator` (or manual `specs` if needed).
2. Run `./k8s-gen --config libs/<name>/config.json`.
3. Verify generated output and `git status`.
4. Add to `Makefile` target list if a top-level shortcut is desired.
5. Update this file to mark the item done.
