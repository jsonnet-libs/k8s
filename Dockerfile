FROM grafana/tanka:0.15.1 as tanka
FROM rancher/k3s:v1.21.1-k3s1 as k3s
FROM mikefarah/yq:4.9.3 as yq

FROM golang:1.15.2 as base

ENV GO111MODULE=on
WORKDIR /app

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

FROM base AS builder
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o k8s-gen .


FROM alpine:3.12

WORKDIR /app

ENV KUBECONFIG=/app/kubeconfig/kube-config.yaml
RUN chmod a+w /app

COPY --from=tanka /usr/local/bin/tk /usr/local/bin/jb /usr/local/bin/kubectl /usr/local/bin/
COPY --from=k3s /bin/k3s /usr/local/bin
COPY --from=yq /usr/bin/yq /usr/local/bin
COPY --from=builder /app/k8s-gen /usr/local/bin

RUN apk update && apk add bash curl

COPY crds .

ENTRYPOINT ["./gen.sh"]
