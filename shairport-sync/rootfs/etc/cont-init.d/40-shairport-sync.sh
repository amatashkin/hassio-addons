#!/usr/bin/with-contenv bashio
# ==============================================================================
# Home Assistant Community Add-on: Spotify Connect
# Sets up the configuration file for spotifyd
# ==============================================================================
declare pipe
declare metadata_pipe

if bashio::config.has_value 'pipe'; then
    pipe=$(bashio::config 'pipe')
    {
        echo ""
        echo "pipe ="
        echo "{"
        echo "  name = \"${pipe}\""
        echo "};"
    } >> /usr/local/etc/shairport-sync.conf
fi

if bashio::config.has_value 'metadata_pipe'; then
    pipe=$(bashio::config 'metadata_pipe')
    {
        echo ""
        echo "metadata ="
        echo "{"
        echo "	enabled = \"yes\";"
        echo "	include_cover_art = \"yes\";"
        echo "	pipe_name = \"${metadata_pipe}\";"
        echo "	pipe_timeout = 5000;"
        echo "};"
    } >> /usr/local/etc/shairport-sync.conf
fi