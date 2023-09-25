#!/usr/bin/env bash

function show_usage {
  echo "
  RESILIENCY WATCHDOG FOR SJHP CONTAINERS
  
  FLAGS:
  * -h/--help - this message

  Script is intended to be run by cron and restart SJHP containers if they are 
  still running but are no longer serving their function (e.g. if the internal 
  VPN tunnel cannot be established). 

  Container manipulation is performed via parametrized systemd unit 
  sjhp@.service with client being passed as parameter. Directories inside 
  \"${CLIENTS_DIR}\" represent all possible clients. E.g. the client stored 
  inside \"${CLIENTS_DIR}/clientA\" folder will be managed via 
  sjhp@clientA.service. 

  All clients inside \"${CLIENTS_DIR}\" will be checked. E.g. on this machine
  the following ones will be processed:
  $(ls "${CLIENTS_DIR}" 2>/dev/null | xargs -n 1 -Iclient echo "    * client")

  The client will NOT be checked if:
    * It is disabled (systemct disable sjhp@clientA.service) or just
      not enabled
    * It is stopped manually (systemct stop sjhp@clientA.service)
    * File \"${WATCHDOG_DISABLE_FILE_NAME}\" is present in the client root 
      folder (\"${CLIENTS_DIR}/clientA\")
  
  The following checks are performed:
    * VPN log is being updates (failure if no updates for > 1 hour)
    * VPN log contain message about successful connection
    * VPN log does not contain errors since successful connection
  
  If any check above fails, the container is restarted via command:

  systemct restart sjhp@clientA.service

  Watchdog logs are written to \"${LOG_DIR}/${LOG_NAME}\" and rotated when log
  becomes bigger then 1 Mb 
  "
}

LOG_DIR="/sasg/logs/HA-watchdog"
LOG_NAME="HA-watchdog.log"
CLIENTS_DIR="/sasg/clients"
SEPARATOR="$(for i in {1..80}; do echo -n "-"; done)"
WATCHDOG_DISABLE_FILE_NAME="HA-watchdog.disable"

if [[ "${1}" == "-h" ]] || [[ "${1}" == "--help" ]]; then
  show_usage
  exit 0
fi

RC_CLIENT_UP=0
RC_CLIENT_DOWN=1
RC_NO_CHECK=2

function logwrite {
  echo "$(date "+[ %Y-%m-%d %H:%M:%S ]") ${@}" >> "${LOG_DIR}/${LOG_NAME}"
}

function logrotate {
  if [[ "$(du --block-size=1M "${LOG_DIR}/${LOG_NAME}" | awk '{ print $1 }')" -gt 4 ]]; then
    cp "${LOG_DIR}/${LOG_NAME}" "${LOG_DIR}/${LOG_NAME}.$(date "+%Y%m%d_%H%M")"
    : > "${LOG_DIR}/${LOG_NAME}"
  fi
}

function check_client {
  CLIENT="${1}"
  CLIENT_SERVICE_STATUS="$(systemctl is-active "sjhp@${CLIENT}.service")"

  cd "${CLIENTS_DIR}/${CLIENT}"

  # Testing if we need to check at all
    if [ "${CLIENT_SERVICE_STATUS}" == "unknown" ]; then
      logwrite "Service for ${CLIENT} is not installed or not enabled"
      return $RC_NO_CHECK
    fi

    if [ "$(systemctl is-enabled "sjhp@${CLIENT}.service")" == "disabled" ]; then
      logwrite "Service for ${CLIENT} is disabled"
      return $RC_NO_CHECK
    fi

    if [ -f "${CLIENTS_DIR}/${CLIENT}/${WATCHDOG_DISABLE_FILE_NAME}" ]; then
      logwrite "File ${CLIENTS_DIR}/${CLIENT}/${WATCHDOG_DISABLE_FILE_NAME} found"
      return $RC_NO_CHECK
    fi
  # ---

  if [ "${CLIENT_SERVICE_STATUS}" != "active" ]; then
    logwrite "Service for ${CLIENT} is not active"
    return $RC_CLIENT_DOWN
  fi

  CONTAINER_ID="$(docker-compose ps -q)"
  if [ -z "${CONTAINER_ID}" ]; then
    logwrite
    return $RC_CLIENT_DOWN
  fi

  SAS_VPN_LOG="./logs/VPN/sasvpn01"
  # Checking VPN logs addition
    DATE_GRABBER_REGEX="[[:alpha:]]{3} [[:alpha:]]{3} [[:digit:]]{1,2} [[:digit:]]{2}:[[:digit:]]{2}:[[:digit:]]{2}"
    LAST_DATE=$(\
      tac "${SAS_VPN_LOG}" | \
      egrep --max-count=1 "${DATE_GRABBER_REGEX}" | \
      awk '{print $2, $3, $4}' \
    )
    LAST_DATE_SEC=$(date --date="${LAST_DATE}" --utc +%s)
    CUR_DATE_SEC=$(docker exec "${CONTAINER_ID}" date --utc +%s)
    DELTA=$(( ${CUR_DATE_SEC} - ${LAST_DATE_SEC} ))
    if [ $DELTA -gt 3700 ]; then # vpn connections are checked every hour and info is logged
      logwrite "VPN log update check              FAILED"
      return $RC_CLIENT_DOWN
    else
      logwrite "VPN log update check              PASSED"
    fi
  # ---
  # Parsing VPN logs
    LAST_INIT_LINE_NUM=$(\
      grep --line-number "Initialization Sequence Completed" "${SAS_VPN_LOG}" | \
      tail --lines=1 | \
      cut --delimiter=":" --fields=1 \
    )
    if [ -z "${LAST_INIT_LINE_NUM}" ]; then
      logwrite "VPN connection established check  FAILED"
      return $RC_CLIENT_DOWN
    else
      logwrite "VPN connection established check  PASSED"
    fi

    ERRORS_SINCE_LAST_INIT_COUNT=$(\
      tail --lines=+${LAST_INIT_LINE_NUM} "${SAS_VPN_LOG}" | \
      grep --ignore-case \
        --regexp="error" \
        --regexp="Connection reset" \
        --regexp="HTTP proxy returned bad status" \
      | \
      wc --lines
    )

    if [[ ${ERRORS_SINCE_LAST_INIT_COUNT} -gt 0 ]]; then
      logwrite "VPN connection errors check       FAILED"
      return $RC_CLIENT_DOWN
    else
      logwrite "VPN connection errors check       PASSED"
    fi
  # ---

  return $RC_CLIENT_UP
}

mkdir --parents "${LOG_DIR}"
mkdir --parents "${CLIENTS_DIR}"
touch "${LOG_DIR}/${LOG_NAME}"

clients="$(ls "${CLIENTS_DIR}")"

logrotate

logwrite "Checking clients:
$(
  for client in ${clients}; do
    echo -e "\t* ${client}"
  done
)"
for client in ${clients}; do
  logwrite "--- Checking client: ${client} ---"
  check_client "${client}"
  RC=$?
  case "${RC}" in
    $RC_CLIENT_UP) logwrite "${client} is up and running";;
    $RC_CLIENT_DOWN)
      logwrite "${client} has failed. Restarting..."
      systemctl restart "sjhp@${client}.service"
      ;;
    $RC_NO_CHECK) logwrite "Skipping ${client}";;
  esac
  logwrite "" # To visually separate clients one from another in the logs
done

logwrite "${SEPARATOR}"
