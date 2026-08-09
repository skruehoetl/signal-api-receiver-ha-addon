#!/usr/bin/with-contenv bashio

bashio::log.info "Starting Signal API Receiver"

export SIGNAL_ACCOUNT="$(bashio::config 'signal_account')"
export SIGNAL_API_URL="$(bashio::config 'signal_api_url')"
export LOG_LEVEL="$(bashio::config 'log_level')"
export SERVER_ADDR="$(bashio::config 'server_addr')"
export REPEAT_LAST_MESSAGE="$(bashio::config 'repeat_last_message')"

if bashio::config.has_value 'mqtt_server'; then
    export MQTT_SERVER="$(bashio::config 'mqtt_server')"
fi

if bashio::config.has_value 'mqtt_user'; then
    export MQTT_USER="$(bashio::config 'mqtt_user')"
fi

if bashio::config.has_value 'mqtt_password'; then
    export MQTT_PASSWORD="$(bashio::config 'mqtt_password')"
fi

if bashio::config.has_value 'mqtt_client_id'; then
    export MQTT_CLIENT_ID="$(bashio::config 'mqtt_client_id')"
fi

if bashio::config.has_value 'mqtt_topic_prefix'; then
    export MQTT_TOPIC_PREFIX="$(bashio::config 'mqtt_topic_prefix')"
fi

if bashio::config.has_value 'mqtt_qos'; then
    export MQTT_QOS="$(bashio::config 'mqtt_qos')"
fi

export MQTT_RETAIN="$(bashio::config 'mqtt_retain')"
export MQTT_INSECURE_SKIP_VERIFY="$(bashio::config 'mqtt_insecure_skip_verify')"

exec /usr/bin/signal-api-receiver serve