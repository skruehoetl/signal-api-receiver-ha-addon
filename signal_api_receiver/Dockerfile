# Stage 1: Grab binary from upstream
FROM kalbasit/signal-api-receiver:latest AS binary-source

# Stage 2: Dynamic Home Assistant Debian base image matching target architecture
FROM ghcr.io/home-assistant/base:latest

# Copy binary directly to /usr/bin/
COPY --from=binary-source /bin/signal-api-receiver /usr/bin/signal-api-receiver
RUN chmod +x /usr/bin/signal-api-receiver

# Copy run script
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD [ "/run.sh" ]