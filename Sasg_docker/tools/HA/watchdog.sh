#!/bin/bash

readonly HA_LIB="$(dirname "$0")/lib/HA.sh"
readonly INITIAL_GRACE_PERIOD=$(( 60 * 3 ))
readonly RC_OMIT_CLIENT=1
readonly RC_CLIENT_FAILED=1
readonly SERVICE_STARTED_THRESHOLD_SECONDS=120
readonly SLEEP_INTERVAL_SECONDS=60

function check_client_health() {
  local client="$1"
  local sas_vpn_log="./logs/VPN/sasvpn01"
  local date_grabber_regex=(
    "[[:alpha:]]{3}" # day of week
    "[[:alpha:]]{3}" # month 
    "[ ]?[[:digit:]]{1,2}" # day (single or double digit)
    "[[:digit:]]{2}:[[:digit:]]{2}:[[:digit:]]{2}" # time
    "[[:digit:]]{4}" # year
  )
  date_grabber_regex="${date_grabber_regex[@]}" # Converting array to string

  cd "${CLIENTS_DIR}/${client}"

  local client_service_status="$(systemctl is-active "sjhp@${client}.service")"
  local container_id="$(docker-compose ps -q)"

  if [ "${client_service_status}" != "active" ]; then
    logwrite "[ ${client} ] Service is not active"
    return $RC_CLIENT_FAILED
  fi

  if [ -z "${container_id}" ]; then
    logwrite "[ ${client} ] Container ID was not found"
    return $RC_CLIENT_FAILED
  fi

  docker exec "${container_id}" ping -q -c 5 "${OPENVPN_SASFW_IP}"
  if [ $? != 0 ]; then
    logwrite "[ ${client} ] Could not reach remote OpenVPN IP ${OPENVPN_SASFW_IP} via container"
    return $RC_CLIENT_FAILED
  fi

  local last_date=$(\
    tac "${sas_vpn_log}" | \
    egrep --max-count=1 "${date_grabber_regex}" | \
    awk '{print $2, $3, $4, $5}' \
  )
  local last_date_sec=$(date --date="${last_date}" --utc +%s)
  local cur_date_sec=$(docker exec "${container_id}" date --utc +%s)
  local delta=$(( ${cur_date_sec} - ${last_date_sec} ))
  if [ $delta -gt 3700 ]; then # vpn connections are checked every hour and info is logged
    logwrite "[ ${client} ] VPN log is not updated"
    return $RC_CLIENT_FAILED
  fi
  local last_init_line_num=$(\
    grep --line-number "Initialization Sequence Completed" "${sas_vpn_log}" | \
    tail --lines=1 | \
    cut --delimiter=":" --fields=1 \
  )
  if [ -z "${last_init_line_num}" ]; then
    logwrite "[ ${client} ] VPN connection was not established"
    return $RC_CLIENT_FAILED
  fi

  local errors_since_last_init_count=$(\
    tail --lines=+${last_init_line_num} "${sas_vpn_log}" | \
    grep --ignore-case \
      --regexp="error" \
      --regexp="Connection reset" \
      --regexp="HTTP proxy returned bad status" \
    | \
    wc --lines
  )

  if [[ ${errors_since_last_init_count} -gt 0 ]]; then
    logwrite "[ ${client} ] VPN connection errors were found"
    return $RC_CLIENT_FAILED
  fi
}

function check_omit_client() {
  local client="$1"
  
  cd "${CLIENTS_DIR}/${client}"

  local client_service_status="$(systemctl is-active "sjhp@${client}.service")"

  if [ "${client_service_status}" == "unknown" ]; then
    logwrite "[ ${client} ][ WATCHDOG ] Master service for ${client} is not running"
    return $RC_OMIT_CLIENT
  fi

  if [ -f "${CLIENTS_DIR}/${client}/${WATCHDOG_DISABLE_FILE_NAME}" ]; then
    logwrite "[ ${client} ][ WATCHDOG ] File ${CLIENTS_DIR}/${client}/${WATCHDOG_DISABLE_FILE_NAME} found"
    return $RC_OMIT_CLIENT
  fi

  if [ -f "${CLIENTS_DIR}/${client}/${SERVICE_RECENTLY_STARTED_FILE}" ]; then
    logwrite "[ ${client} ][ WATCHDOG ] File ${CLIENTS_DIR}/${client}/${SERVICE_RECENTLY_STARTED_FILE} found. Skipping once"

    service_started_ts=$(stat --format="%X" "${CLIENTS_DIR}/${client}/${SERVICE_RECENTLY_STARTED_FILE}")
    now=$(date "+%s")
    logwrite "[ ${client} ][ MASTER ] Service started $(( now - service_started_ts )) seconds ago"
    if [[ $(( now - service_started_ts )) -lt ${SERVICE_STARTED_THRESHOLD_SECONDS} ]]; then
      logwrite "[ ${client} ][ MASTER ] Threshold ${SERVICE_STARTED_THRESHOLD_SECONDS} is not yet exceeded. Skipping the check"
      return $RC_OMIT_CLIENT
    fi
    rm --force "${CLIENTS_DIR}/${client}/${SERVICE_RECENTLY_STARTED_FILE}"
  fi
}

function main() {
  if [ ! -f "${HA_LIB}" ]; then
    echo "Library file \"${HA_LIB}\" was not found"
    exit 1
  fi
  source "${HA_LIB}"

  sleep "${INITIAL_GRACE_PERIOD}"

  while true; do

    for client in $(ls "${CLIENTS_DIR}"); do
      check_omit_client "${client}"
      [ $? == ${RC_OMIT_CLIENT} ] && continue

      flock --exclusive "${WATCHDOG_LOCK_FD}"
      check_client_health "${client}"
      RC=$?
      flock --unlock "${WATCHDOG_LOCK_FD}"

      if [ $RC == ${RC_CLIENT_FAILED} ]; then
        logwrite "[ ${client} ][ MASTER ] Client failed. Switching to another instance"
        systemctl --host="${SERVICES_USER}@${HA_PEER_HOST}" start "${SYSTEMD_TEMPLATE_MASTER}@${client}.service"
        systemctl start "${SYSTEMD_TEMPLATE_SLAVE}@${client}.service"
        continue
      fi

      logwrite "[ ${client} ][ MASTER ] Client is OK"
    done


    sleep ${SLEEP_INTERVAL_SECONDS}
  done
}

main "$@"
