FROM golang:1.18 as base

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

FROM golang:1.18-alpine3.16 as jsonnet

RUN apk add --no-cache git
RUN go install github.com/google/go-jsonnet/cmd/jsonnet@latest

FROM alpine:3.16

WORKDIR /app

RUN apk add --no-cache bash curl git openssh diffutils

COPY --from=mikefarah/yq:4.9.6 /usr/bin/yq /usr/local/bin/yq2
COPY --from=jsonnetlibs/docsonnet:0.0.3 /usr/local/bin/docsonnet /usr/local/bin/
COPY --from=builder /app/k8s-gen /usr/local/bin/
COPY --from=jsonnet /go/bin/jsonnet /usr/local/bin/

COPY scripts .
COPY jsonnet jsonnet
COPY LICENSE .

ENTRYPOINT ["./gen.sh"]
