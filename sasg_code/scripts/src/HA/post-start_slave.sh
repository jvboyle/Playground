#!/bin/bash

readonly HA_LIB="$(dirname "$0")/lib/HA.sh"

if [ ! -f "${HA_LIB}" ]; then
  echo "Library file \"${HA_LIB}\" was not found"
  exit 1
fi
source "${HA_LIB}"

readonly CLIENT="$1"
readonly SLAVE_SERVICE="${SYSTEMD_TEMPLATE_SLAVE}@${CLIENT}.service"

service_enabled="$(systemctl is-enabled "${SLAVE_SERVICE}")"
service_active="$(systemctl is-active "${SLAVE_SERVICE}")"

logwrite "[ ${CLIENT} ][ SLAVE ] Slave service status: ${service_enabled} / ${service_active}"