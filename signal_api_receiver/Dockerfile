# syntax=docker/dockerfile:1

ARG SIGNAL_API_RECEIVER_VERSION=v0.4.0

FROM --platform=$BUILDPLATFORM golang:1.25.8-alpine AS builder

ARG TARGETOS
ARG TARGETARCH
ARG SIGNAL_API_RECEIVER_VERSION

WORKDIR /src

RUN apk add --no-cache git ca-certificates

RUN git clone \
      --branch "${SIGNAL_API_RECEIVER_VERSION}" \
      --depth 1 \
      https://github.com/kalbasit/signal-api-receiver.git \
      .

RUN go mod download

RUN CGO_ENABLED=0 \
      GOOS="${TARGETOS}" \
      GOARCH="${TARGETARCH}" \
      go build \
        -trimpath \
        -ldflags="-s -w" \
        -o /signal-api-receiver \
        .


FROM ghcr.io/home-assistant/base:latest

COPY --from=builder /signal-api-receiver /usr/bin/signal-api-receiver
COPY run.sh /run.sh

RUN chmod a+x \
      /usr/bin/signal-api-receiver \
      /run.sh

CMD ["/run.sh"]