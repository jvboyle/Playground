#!/bin/bash

readonly HA_LIB="$(dirname "$0")/lib/HA.sh"
readonly SLEEP_THRESHOLD=10
readonly SERVICE_ACTIVE_STATUS="active"

if [ ! -f "${HA_LIB}" ]; then
  echo "Library file \"${HA_LIB}\" was not found"
  exit 1
fi
source "${HA_LIB}"

readonly CLIENT="$1"
readonly MASTER_SERVICE="${SYSTEMD_TEMPLATE_MASTER}@${CLIENT}.service"

service_enabled="$(systemctl is-enabled "${MASTER_SERVICE}")"
service_active="$(systemctl is-active "${MASTER_SERVICE}")"

logwrite "[ ${CLIENT} ][ MASTER ] Master service status: ${service_enabled} / ${service_active}"
