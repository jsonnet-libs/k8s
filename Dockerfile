FROM golang:1.23-alpine AS jsonnet

RUN apk add --no-cache git
RUN go install github.com/google/go-jsonnet/cmd/jsonnet@v0.21.0

FROM alpine:3.20

ARG TARGETPLATFORM

WORKDIR /app

RUN apk add --no-cache bash curl git openssh diffutils

COPY --from=mikefarah/yq:4.34.1 /usr/bin/yq /usr/local/bin/yq
COPY --from=ghcr.io/jsonnet-libs/docsonnet:0.0.5 /usr/bin/docsonnet /usr/local/bin/
COPY --from=jsonnet /go/bin/jsonnet /usr/local/bin/
COPY $TARGETPLATFORM/k8s-gen /usr/local/bin/

COPY scripts .
COPY jsonnet jsonnet
COPY LICENSE .

ENTRYPOINT ["./gen.sh"]
