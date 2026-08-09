##!/usr/bin/with-contenv bashio

bashio::log.info "Starting Signal API Receiver..."

# Extract options from /data/options.json using bashio
SIGNAL_ACCOUNT=$(bashio::config 'signal_account')
SIGNAL_API_URL=$(bashio::config 'signal_api_url')
LOG_LEVEL=$(bashio::config 'log_level' 'info')

echo "Account: $SIGNAL_ACCOUNT"
echo "Signal API URL: $SIGNAL_API_URL"
echo "Service Port: $SERVICE_PORT"
echo "Log Level: $LOG_LEVEL"

echo "found signal-api-receiver binary at $(which signal-api-receiver)"

exec /bin/signal-api-receiver \
    --signal-account "$SIGNAL_ACCOUNT" \
    --signal-api-url "$SIGNAL_API_URL" \
    --server-addr ":$SERVICE_PORT" \
    --log-level "$LOG_LEVEL" \


#!/usr/bin/with-contenv bashio

bashio::log.info "Starting Signal API Receiver..."

# Extract options from /data/options.json using bashio
SIGNAL_ACCOUNT=$(bashio::config 'signal_account')
SIGNAL_API_URL=$(bashio::config 'signal_api_url')
SERVICE_PORT=$(bashio::config 'service_port' 8105)
LOG_LEVEL=$(bashio::config 'log_level' 'info')

# Build command array
FLAGS=(
    "--signal-account" "${SIGNAL_ACCOUNT}"
    "--signal-api-url" "${SIGNAL_API_URL}"
    "--log-level" "${LOG_LEVEL}"
    "--server-addr" ":${SERVICE_PORT}"
)

# Optional MQTT configuration
# if bashio::config.has_value 'mqtt_broker'; then
#     bashio::log.info "Configuring MQTT Broker..."
#     FLAGS+=("--mqtt-broker" "$(bashio::config 'mqtt_broker')")
    
#     if bashio::config.has_value 'mqtt_topic'; then
#         FLAGS+=("--mqtt-topic" "$(bashio::config 'mqtt_topic')")
#     fi
#     if bashio::config.has_value 'mqtt_username'; then
#         FLAGS+=("--mqtt-username" "$(bashio::config 'mqtt_username')")
#     fi
#     if bashio::config.has_value 'mqtt_password'; then
#         FLAGS+=("--mqtt-password" "$(bashio::config 'mqtt_password')")
#     fi
# fi

# Execute binary
exec /usr/bin/signal-api-receiver "${FLAGS[@]}"