#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Add-on: Librespot
# Starts the Librespot service
# ==============================================================================
# shellcheck disable=SC1091

declare -a options

# Are we running in debug mode?
if bashio::debug; then
  options+=(--verbose)
fi

# Set custom name if provided
if bashio::config.has_value 'librespot_name'; then
    options+=(-n $(bashio::config 'librespot_name'))
else
    options+=(-n $(bashio::info.hostname))
fi

options+=(--backend pipe --device $(bashio::config 'pipe'))

# Run librespot
bashio::log.info 'Starting Librespot...'

# Are we running in debug mode?
if bashio::config.true 'verbose'; then
  options+=(--verbose)
  bashio::log.info "with options: ${options[@]}"
fi

exec librespot "${options[@]}"