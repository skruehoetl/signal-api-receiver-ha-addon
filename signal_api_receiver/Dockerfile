# Stage 1: Original-Binary aus dem kalbasit-Image extrahieren
FROM kalbasit/signal-api-receiver:latest AS binary-source

# Stage 2: Alpine als saubere Basis mit Shell und Paketmanager
FROM alpine:latest

# Benötigte Tools für Home Assistant Add-ons installieren
RUN apk add --no-cache jq bash ca-certificates

# Das kompilierte Go-Binary aus Stage 1 kopieren
COPY --from=binary-source /bin/signal-api-receiver /usr/bin/signal-api-receiver

# run.sh Skript hineinkopieren und ausführbar machen
COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]