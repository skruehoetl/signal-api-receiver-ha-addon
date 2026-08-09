ARG BUILD_FROM=kalbasit/signal-api-receiver:latest
FROM ${BUILD_FROM}

# Installiere jq zum Auslesen der options.json
RUN apk add --no-cache jq bash || true

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]