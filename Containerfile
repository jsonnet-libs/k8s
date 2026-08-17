FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

ARG TARGETPLATFORM

WORKDIR /app

RUN apk add --no-cache ca-certificates git

COPY $TARGETPLATFORM/k8s-gen /usr/local/bin/

ENTRYPOINT ["k8s-gen"]
