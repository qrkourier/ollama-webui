#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail
set -o xtrace

export HOST_GATEWAY=$(ip route | grep 'default' | awk '{print $3}' | head -1)
echo "DEBUG: running ${*}"
exec "${@}"