#!/usr/bin/with-contenv bashio

# =============================================================================
# ring-mqtt run script for s6-init               #
#
# This script automatically detects if it is running as the Home Assistant 
# addon or a standard docker environment and takes actions as appropriate 
# for the detected environment.
# ==============================================================================

# Short delay to keep log messages from overlapping with s6 logs
sleep .5

# If options.json exist we are running as addon
if [ -f /data/options.json ]; then
    echo "-------------------------------------------------------"
    echo "| Ring-MQTT with Video Streaming                      |"
    echo "| Addon for Home Assistant                            |"
    echo "|                                                     |"
    echo "| Report issues at:                                   |"
    echo "| https://github.com/tsightler/ring-mqtt-hassio-addon |"
    echo "-------------------------------------------------------"
    # Use bashio to get configured branch
    export BRANCH=$(bashio::config "branch")
else
    # No options.json found, assume we are in running in standard Docker
    echo "-------------------------------------------------------"
    echo "| Ring-MQTT with Video Streaming                      |"
    echo "| Docker Edition                                      |"
    echo "|                                                     |"
    echo "| Report issues at:                                   |"
    echo "| https://github.com/tsightler/ring-mqtt              |"
    echo "-------------------------------------------------------"
fi

if [ -v BRANCH ]; then
    if [ "${BRANCH}" = "latest" ] || [ "${BRANCH}" = "dev" ]; then
        /app/ring-mqtt/scripts/update2branch.sh
    fi
fi
