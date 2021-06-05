FROM bitnami/kubectl:1.21.1 as kubectl
FROM rancher/k3s:v1.21.1-k3s1 as k3s
FROM mikefarah/yq:4.9.3 as yq2
FROM jsonnetlibs/docsonnet:0.0.1 as docsonnet

FROM golang:1.16.4 as base

ENV GO111MODULE=on
WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY pkg pkg
COPY main.go main.go

FROM base AS builder
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
        go build \
        -ldflags='-s -w -extldflags "-static"' \
        -o k8s-gen .

FROM golang:1.16.4-alpine3.12 as jsonnet

RUN apk add --no-cache git
RUN go get github.com/google/go-jsonnet/cmd/jsonnet

FROM alpine:3.12

WORKDIR /app

ENV KUBECONFIG=/app/kubeconfig/kube-config.yaml
RUN chmod a+w /app

COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/
COPY --from=k3s /bin/k3s /usr/local/bin/
COPY --from=yq2 /usr/bin/yq /usr/local/bin/yq2
COPY --from=docsonnet /usr/local/bin/docsonnet /usr/local/bin/
COPY --from=builder /app/k8s-gen /usr/local/bin/
COPY --from=jsonnet /go/bin/jsonnet /usr/local/bin/

RUN apk add --no-cache bash curl

COPY scripts .
COPY jsonnet jsonnet
COPY LICENSE .

ENTRYPOINT ["./gen.sh"]
