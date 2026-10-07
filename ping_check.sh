#!/usr/bin/env bash
# ==============================================================================
# Script Name: ping_check.sh
# Description: Validates user input (domain, URL, or IP) and checks connectivity.
# ==============================================================================

# Guard clause
[[ -z "$1" ]] && { echo "Usage: $0 <Website or IP address>" >&2; exit 1; }
CHECK_HOST="$1"

# Valid domains, URLs (optional protocol, port, path), and IPv4 addresses
regex="^(https?://)?([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(:[0-9]+)?(/.*)?$|^([0-9]{1,3}\.){3}[0-9]{1,3}(:[0-9]+)?$"

[[ ! "$CHECK_HOST" =~ $regex ]] && { echo "Error: Please input a valid website or IP address." >&2; exit 1; }

# Strip protocol, path, and port so only the hostname is left for ping
CHECK_HOST="${CHECK_HOST#*://}"
CHECK_HOST="${CHECK_HOST%%/*}"
CHECK_HOST="${CHECK_HOST%%:*}"

test_connectivity() {
    if ping -c 2 "$CHECK_HOST" &> /dev/null; then
        echo "Network is UP ($CHECK_HOST is reachable)"
    else
        echo "Network is DOWN ($CHECK_HOST is unreachable)"
    fi
}

echo "Starting network check for: $CHECK_HOST..."
test_connectivity
