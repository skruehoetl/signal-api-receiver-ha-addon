#!/usr/bin/env sh
set -e

echo "Starting Signal API Receiver"

exec /app/signal-api-receiver serve \
  --signal-account "$SIGNAL_ACCOUNT" \
  --signal-api-url "$SIGNAL_API_URL" \
  --log-level "$LOG_LEVEL" \
  --server-addr ":$SERVICE_PORT"
