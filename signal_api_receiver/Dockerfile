# Stage 1: Go-SDK zum Bauen
FROM golang:1.22-alpine AS builder

# Git und CA-Zertifikate installieren
RUN apk add --no-cache git ca-certificates

WORKDIR /src

# Source Code separat in den Ordner clonen
RUN git clone https://github.com/kalbasit/signal-api-receiver.git .

# Dependencies laden
RUN go mod download

# Binary kompilieren (statisch verlinkt)
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-w -s" -o /signal-api-receiver .

# Stage 2: Schlankes Alpine Runtime Image
FROM alpine:latest

RUN apk add --no-cache jq bash ca-certificates

# Das frisch gebaute Binary kopieren
COPY --from=builder /signal-api-receiver /usr/bin/signal-api-receiver

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]