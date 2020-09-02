#!/usr/bin/env bashio

declare -a options

# Set custom server name if provided
if bashio::config.has_value 'host'; then
    options+=(--host $(bashio::config 'host'))
    bashio::log.info "Connecting to $(bashio::config 'host')"
else
    options+=(--host $(bashio::info.hostname))
    bashio::log.info "Connecting to HomeAssistant"
fi

# Set custom client name if provided
if bashio::config.has_value 'hostID'; then
    options+=(--hostID $(bashio::config 'hostID'))
    bashio::log.info "Connecting as $(bashio::config 'hostID')"
else
    options+=(--hostID HomeAssistant)
    bashio::log.info "Connecting as HomeAssistant"
fi

echo "Starting Snapclient..."
exec snapclient "${options[@]}"