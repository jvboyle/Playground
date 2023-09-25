#!/bin/bash

readonly HA_LIB="$(dirname "$0")/lib/HA.sh"
readonly CLIENT="$1"

if [ ! -f "${HA_LIB}" ]; then
  echo "Library file \"${HA_LIB}\" was not found"
  exit 1
fi
source "${HA_LIB}"

readonly MASTER_SERVICE="${SYSTEMD_TEMPLATE_MASTER}@${CLIENT}.service"
readonly SLAVE_SERVICE="${SYSTEMD_TEMPLATE_SLAVE}@${CLIENT}.service"

function main(){

  flock --exclusive "${WATCHDOG_LOCK_FD}"

  touch "${CLIENTS_DIR}/${CLIENT}/${SERVICE_RECENTLY_STARTED_FILE}"
  logwrite "[ ${CLIENT} ][ MASTER ] Preparing to start as a master"

  stop_local_slave_service
  stop_remote_master_service
  start_remote_slave_service


  logwrite "[ ${CLIENT} ][ MASTER ] Preparations to start as a master are finished. About to start"

  flock --unlock "${WATCHDOG_LOCK_FD}"
}

function start_remote_slave_service(){
  logwrite "[ ${CLIENT} ][ MASTER ] Trying to start remote slave service \"${SLAVE_SERVICE}\""

  systemctl --host="${SERVICES_USER}@${HA_PEER_HOST}" start "${SLAVE_SERVICE}"

  local service_enabled="$(systemctl --host="${SERVICES_USER}@${HA_PEER_HOST}" is-enabled "${SLAVE_SERVICE}")"
  local service_active="$(systemctl --host="${SERVICES_USER}@${HA_PEER_HOST}" is-active "${SLAVE_SERVICE}")"

  logwrite "[ ${CLIENT} ][ MASTER ] Remote slave service status: ${service_enabled} / ${service_active}"  
}

function stop_local_slave_service(){
  logwrite "[ ${CLIENT} ][ MASTER ] Stopping local slave service \"${SLAVE_SERVICE}\""

  systemctl stop "${SLAVE_SERVICE}"

  local service_enabled="$(systemctl is-enabled "${SLAVE_SERVICE}")"
  local service_active="$(systemctl is-active "${SLAVE_SERVICE}")"

  logwrite "[ ${CLIENT} ][ MASTER ] Slave service status: ${service_enabled} / ${service_active}"

  systemctl is-active "${SLAVE_SERVICE}" > /dev/null \
    && {
      logwrite "[ ${CLIENT} ][ MASTER ] Local slave service \"${SLAVE_SERVICE}\" was not stopped"
      exit 1
    }
  
  logwrite "[ ${CLIENT} ][ MASTER ] Local slave service \"${SLAVE_SERVICE}\" was stopped"
}

function stop_remote_master_service(){
  logwrite "[ ${CLIENT} ][ MASTER ] Stopping remote master service \"${MASTER_SERVICE}\""

  systemctl --host="${SERVICES_USER}@${HA_PEER_HOST}" stop "${MASTER_SERVICE}"

  systemctl --host="${SERVICES_USER}@${HA_PEER_HOST}" is-active "${MASTER_SERVICE}" > /dev/null \
    && {
      logwrite "[ ${CLIENT} ][ MASTER ] Remote master service \"${MASTER_SERVICE}\" was not stopped"
      exit 1
    }
}

main "$@"