FROM bitnami/kubectl:1.21.1 as kubectl
FROM rancher/k3s:v1.21.1-k3s1 as k3s
FROM mikefarah/yq:4.9.3 as yq

FROM golang:1.15.2 as base

ENV GO111MODULE=on
WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY pkg pkg
COPY main.go main.go

FROM base AS builder
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o k8s-gen .

FROM golang:1.15.2-alpine3.12 as docsonnet

RUN apk update && apk add git
RUN go get github.com/jsonnet-libs/docsonnet
RUN go install github.com/sh0rez/docsonnet

FROM alpine:3.12

WORKDIR /app

ENV KUBECONFIG=/app/kubeconfig/kube-config.yaml
RUN chmod a+w /app

COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin
COPY --from=k3s /bin/k3s /usr/local/bin
COPY --from=yq /usr/bin/yq /usr/local/bin
COPY --from=builder /app/k8s-gen /usr/local/bin
COPY --from=docsonnet /go/bin/docsonnet /usr/local/bin
#
RUN apk update && apk add bash curl

COPY scripts .

ENTRYPOINT ["./gen.sh"]
