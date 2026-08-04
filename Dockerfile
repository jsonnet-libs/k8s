FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b AS tools

RUN apk add --no-cache curl

RUN mkdir /mise
ENV MISE_DATA_DIR="/mise"
ENV MISE_CONFIG_DIR="/mise"
ENV MISE_CACHE_DIR="/mise/cache"
ENV MISE_INSTALL_PATH="/usr/local/bin/mise"
ENV PATH="/mise/shims:$PATH"

RUN curl https://mise.run | sh

COPY mise.toml .
# Resolve real binary paths via mise exec; version dirs unknown at author time.
RUN mise install -y \
    && mkdir /out \
    && cp "$(mise exec -- sh -c 'command -v yq')" /out/yq \
    && cp "$(mise exec -- sh -c 'command -v jsonnet')" /out/jsonnet \
    && cp "$(mise exec -- sh -c 'command -v docsonnet')" /out/docsonnet

FROM alpine:3.24.1@sha256:28bd5fe8b56d1bd048e5babf5b10710ebe0bae67db86916198a6eec434943f8b

ARG TARGETPLATFORM

WORKDIR /app

RUN apk add --no-cache bash git openssh diffutils

COPY --from=tools /out/yq /usr/local/bin/yq
COPY --from=tools /out/jsonnet /usr/local/bin/jsonnet
COPY --from=tools /out/docsonnet /usr/local/bin/docsonnet
COPY $TARGETPLATFORM/k8s-gen /usr/local/bin/

COPY scripts .
COPY jsonnet jsonnet
COPY LICENSE .

ENTRYPOINT ["./gen.sh"]
