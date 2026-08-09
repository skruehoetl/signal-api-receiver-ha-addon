ARG SIGNAL_API_RECEIVER_IMAGE=kalbasit/signal-api-receiver:sha-e52df2d

FROM ${SIGNAL_API_RECEIVER_IMAGE} AS signal-api-receiver

FROM ghcr.io/home-assistant/base:latest

COPY --from=signal-api-receiver /bin/signal-api-receiver /usr/bin/signal-api-receiver

COPY run.sh /run.sh

RUN chmod a+x /run.sh /usr/bin/signal-api-receiver

CMD ["/run.sh"]