#!/usr/bin/env bashio

declare -a options

# Set custom server name if provided
if bashio::config.has_value 'snapserver'; then
    options+=(-h $(bashio::config 'snapserver'))
    bashio::log.info "Connecting to $(bashio::config 'snapserver')"
else
    options+=(-h $(bashio::info.hostname))
    bashio::log.info "Connecting to HomeAssistant"
fi

echo "Starting Snapclient..."
exec snapclient "${options[@]}"