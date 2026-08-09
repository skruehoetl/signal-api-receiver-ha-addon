ARG BUILD_FROM=golang:1.22-alpine
FROM ${BUILD_FROM} AS builder

WORKDIR /build
RUN apk add --no-cache git
RUN git clone https://github.com/kalbasit/signal-api-receiver.git .
RUN go build -o signal-api-receiver .

FROM alpine:latest
WORKDIR /app
COPY --from=builder /build/signal-api-receiver /app/
COPY run.sh /app/
RUN chmod +x /app/run.sh

CMD ["/app/run.sh"]