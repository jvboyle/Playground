#!/bin/bash

readonly HA_LIB="$(dirname "$0")/lib/HA.sh"
readonly INITIAL_GRACE_PERIOD=$(( 60 * 3 ))
readonly SLEEP_INTERVAL_SECONDS=10
readonly CLIENT="${1}"
readonly VARS_FILE="./vars"
readonly MASTER_DISCONNECT_SEMAPHORE_FILE="disconnect-semaphore.${CLIENT}"
readonly SEMAPHORE_THRESHOLD_SECONDS=60
readonly PING_RETRIES=5
readonly WRITE_EVERY_N_CHECKS=5

if [ ! -f "${HA_LIB}" ]; then
  echo "Library file \"${HA_LIB}\" was not found"
  exit 1
fi
source "${HA_LIB}"

sleep ${INITIAL_GRACE_PERIOD}

cd "${CLIENTS_DIR}/${CLIENT}"
[ -f "${MASTER_DISCONNECT_SEMAPHORE_FILE}" ] && rm --force "${MASTER_DISCONNECT_SEMAPHORE_FILE}"

log_counter=0

while true; do

  disconnect_found=0
  source "${VARS_FILE}" 2>/dev/null

  SASG_VIP="$(cat .env | grep "^IP=" | sed "s/^IP=\(.*\)$/\1/")"

  sasg_ips=( "${SASG_VIP}" )

  for sasg_ip in "${sasg_ips[@]}"; do
    if [ -n "${sasg_ip}" ]; then
      ping -c "${PING_RETRIES}" "${sasg_ip}" > /dev/null 2>&1
      if [ $? != 0 ]; then
        [ -f "${MASTER_DISCONNECT_SEMAPHORE_FILE}" ] \
          || touch "${MASTER_DISCONNECT_SEMAPHORE_FILE}"
        disconnect_found=1
        logwrite "[ ${CLIENT} ][ SLAVE ] Could not connect to ${sasg_ip}"
      fi
    fi

    if [ -f "${MASTER_DISCONNECT_SEMAPHORE_FILE}" ]; then
      semaphore_raised_ts=$(stat --format="%X" "${MASTER_DISCONNECT_SEMAPHORE_FILE}")
      now=$(date "+%s")
      logwrite "[ ${CLIENT} ][ SLAVE ] Problem with connection for $(( now - semaphore_raised_ts )) seconds"

      if [[ $(( now - semaphore_raised_ts )) -gt ${SEMAPHORE_THRESHOLD_SECONDS} ]]; then
        logwrite "[ ${CLIENT} ][ SLAVE ] Connection problems length has exceeded threshold. Grabbing master"
        rm --force "${MASTER_DISCONNECT_SEMAPHORE_FILE}"
        systemctl start "${SYSTEMD_TEMPLATE_MASTER}@${CLIENT}.service"
        exit
      fi
    fi
  done

  if [ "${disconnect_found}" == "0" ]; then
    rm --force "${MASTER_DISCONNECT_SEMAPHORE_FILE}"
  fi
  
  if [[ $((${log_counter})) -ge $((${WRITE_EVERY_N_CHECKS})) ]]; then
    logwrite "[ ${CLIENT} ][ SLAVE ] Master is OK"
    log_counter=0
  fi

  log_counter=$((log_counter + 1))

  sleep ${SLEEP_INTERVAL_SECONDS}

done