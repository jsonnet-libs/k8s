FROM golang:1.20 as base

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

FROM golang:1.20-alpine3.18 as jsonnet

RUN apk add --no-cache git
RUN go install github.com/google/go-jsonnet/cmd/jsonnet@latest

FROM alpine:3.18

WORKDIR /app

RUN apk add --no-cache bash curl git openssh diffutils

COPY --from=mikefarah/yq:4.34.1 /usr/bin/yq /usr/local/bin/yq2
COPY --from=ghcr.io/jsonnet-libs/docsonnet:0.0.5 /usr/bin/docsonnet /usr/local/bin/
COPY --from=builder /app/k8s-gen /usr/local/bin/
COPY --from=jsonnet /go/bin/jsonnet /usr/local/bin/

COPY scripts .
COPY jsonnet jsonnet
COPY LICENSE .

ENTRYPOINT ["./gen.sh"]
