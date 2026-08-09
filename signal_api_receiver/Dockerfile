# Stage 1: Offizielles Go-SDK nutzen, um den Quellcode frisch zu kompilieren
FROM golang:1.22-alpine AS builder

RUN apk add --no-cache git

WORKDIR /app

# Repository direkt klonen und bauen
RUN git clone https://github.com/kalbasit/signal-api-receiver.git . \
    && go mod download \
    && CGO_ENABLED=0 GOOS=linux go build -o /signal-api-receiver .

# Stage 2: Das fertige Alpine-Add-on
FROM alpine:latest

RUN apk add --no-cache jq bash ca-certificates

# Das frisch kompilierte Binary aus Stage 1 übernehmen
COPY --from=builder /signal-api-receiver /usr/bin/signal-api-receiver

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]