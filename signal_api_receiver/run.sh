#!/bin/sh
set -e

CONFIG_PATH=/data/options.json

SIGNAL_ACCOUNT=$(jq --raw-output '.signal_account // empty' $CONFIG_PATH)
SIGNAL_API_URL=$(jq --raw-output '.signal_api_url // empty' $CONFIG_PATH)
SERVICE_PORT=$(jq --raw-output '.service_port // 8105' $CONFIG_PATH)
LOG_LEVEL=$(jq --raw-output '.log_level // "info"' $CONFIG_PATH)


echo "Starting signal-api-receiver..."
echo "Account: $SIGNAL_ACCOUNT"
echo "Signal API URL: $SIGNAL_API_URL"

exec /usr/bin/signal-api-receiver \
    --signal-account "$SIGNAL_ACCOUNT" \
    --signal-api-url "$SIGNAL_API_URL" \
    --server-addr ":$SERVICE_PORT" \
    --log-level "$LOG_LEVEL" \
