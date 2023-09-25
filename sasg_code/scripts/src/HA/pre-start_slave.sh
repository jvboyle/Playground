#!/bin/bash

readonly HA_LIB="$(dirname "$0")/lib/HA.sh"
if [ ! -f "${HA_LIB}" ]; then
  echo "Library file \"${HA_LIB}\" was not found"
  exit 1
fi
source "${HA_LIB}"

readonly CLIENT="$1"
readonly MASTER_SERVICE="${SYSTEMD_TEMPLATE_MASTER}@${CLIENT}.service"

flock --exclusive "${WATCHDOG_LOCK_FD}"

logwrite "[ ${CLIENT} ][ SLAVE ] Preparing to start as a slave"
logwrite "[ ${CLIENT} ][ SLAVE ] Stopping master service \"${MASTER_SERVICE}\""

systemctl stop "${MASTER_SERVICE}"

service_enabled="$(systemctl is-enabled "${MASTER_SERVICE}")"
service_active="$(systemctl is-active "${MASTER_SERVICE}")"

logwrite "[ ${CLIENT} ][ SLAVE ] Master service status: ${service_enabled} / ${service_active}"

systemctl is-active "${MASTER_SERVICE}" > /dev/null \
  && {
    logwrite "[ ${CLIENT} ][ SLAVE ] Master service \"${MASTER_SERVICE}\" was not stopped"
    exit 1
  }

logwrite "[ ${CLIENT} ][ SLAVE ] Master service \"${MASTER_SERVICE}\" was stopped"
logwrite "[ ${CLIENT} ][ SLAVE ] Preparations to start as a slave are finished. About to start"

flock --unlock "${WATCHDOG_LOCK_FD}"
