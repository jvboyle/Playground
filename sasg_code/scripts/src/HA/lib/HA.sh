#!/bin/bash

readonly CLIENTS_DIR="/sasg/clients"
readonly HA_PEER_HOST="ha-peer"
readonly HA_PEER_PORT="22"
readonly LOG_DIR="/sasg/logs/HA-watchdog"
readonly LOG_NAME="HA-watchdog.log"
readonly OPENVPN_SASFW_IP="3.0.0.2"
readonly SEPARATOR="-------------------------------------------------------------------------------"
readonly SERVICE_RECENTLY_STARTED_FILE="service.started"
readonly SERVICES_USER="#SASG HA USER#"
readonly SYSTEMD_TEMPLATE_MASTER="sgha"
readonly SYSTEMD_TEMPLATE_SLAVE="sgha-slave"
readonly WATCHDOG_DISABLE_FILE_NAME="HA-watchdog.disable"
readonly WATCHDOG_LOCK_FD=224
readonly WATCHDOG_LOCK_FILE="/var/lock/HA-watchdog.lock"
readonly WATCHDOG_LOG_LOCK_FD=225
readonly WATCHDOG_LOG_LOCK_FILE="/var/lock/HA-log.lock"

export \
  CLIENTS_DIR \
  HA_PEER_HOST \
  HA_PEER_PORT \
  LOG_DIR \
  LOG_NAME \
  OPENVPN_SASFW_IP \
  SEPARATOR \
  SERVICE_RECENTLY_STARTED_FILE \
  SERVICES_USER \
  SYSTEMD_TEMPLATE_MASTER \
  SYSTEMD_TEMPLATE_SLAVE \
  WATCHDOG_DISABLE_FILE_NAME \
  WATCHDOG_LOCK_FD \
  WATCHDOG_LOCK_FILE \
  WATCHDOG_LOG_LOCK_FD \
  WATCHDOG_LOG_LOCK_FILE
# Export end

function logwrite() {
  flock --exclusive "${WATCHDOG_LOG_LOCK_FD}"

  [ -d "${LOG_DIR}" ] || mkdir --parent "${LOG_DIR}"

  logrotate
  echo "$(date "+[ %Y-%m-%d %H:%M:%S ]") ${@}" >> "${LOG_DIR}/${LOG_NAME}"

  flock --unlock "${WATCHDOG_LOG_LOCK_FD}"
}

function logrotate() {
  flock --exclusive "${WATCHDOG_LOG_LOCK_FD}"

  [ -d "${LOG_DIR}" ] || mkdir --parent "${LOG_DIR}"

  if [[ "$(du --block-size=1M "${LOG_DIR}/${LOG_NAME}" | awk '{ print $1 }')" -gt 4 ]]; then
    cp "${LOG_DIR}/${LOG_NAME}" "${LOG_DIR}/${LOG_NAME}.$(date "+%Y%m%d_%H%M")"
    : > "${LOG_DIR}/${LOG_NAME}"
  fi

  flock --unlock "${WATCHDOG_LOG_LOCK_FD}"
}

function is_openvpn_tunnel(){
  local client="$1"

  source "${CLIENTS_DIR}/${client}/vars" 2>/dev/null

  [[ "${TUNNEL_TYPE}" == "ipsec" ]]

  return $?
}

eval "exec ${WATCHDOG_LOG_LOCK_FD}>${WATCHDOG_LOG_LOCK_FILE}"
eval "exec ${WATCHDOG_LOCK_FD}>${WATCHDOG_LOCK_FILE}"
