#!/bin/bash

readonly LOG_INPUT=(
  "firewall;gunzip"
  "vpn;gunzip"
  "audit;gunzip"
  "secure;gunzip"
  "messages;gunzip"
)

# -= Major version timestamps =-
  # List of timestamps of major uploader checkpoints which break backward compatibility
  # (e.g. change uploaded files structure)
  readonly UPLOADER_TS_OPTIMIZE_FILE_STRUCTURE="20190422" # https://github.ibm.com/SASG-ORG/sasg-sidecar-checker/issues/5
# ------------------------

readonly ROOT_LOG_FOLDER="${LISTENER_ROOT}" # Should be provided via env
TEMP_LOG_FOLDER="$(mktemp -d)"

function log(){
#  echo "$*" | systemd-cat -t "${LISTENER_SYSTEMD_UNIT^^}-LOG" # In order to differentiate between the log and config check
  # RTC Issue 530 - pipe through pv to slow msg rate & prevent wazuh agent buffer overflows.
  echo "$*" | pv -L 2640k 2>/dev/null |systemd-cat -t "${LISTENER_SYSTEMD_UNIT^^}-LOG" # In order to differentiate between the log and config check
}

cd "${TEMP_LOG_FOLDER}"

for sasg_instance in $(ls "${ROOT_LOG_FOLDER}"); do
  unset UPLOADER_VERSION
  
  STARTUP_INFO_FILE="${ROOT_LOG_FOLDER}/${sasg_instance}/startup-info"
  [[ -f "${STARTUP_INFO_FILE}" ]] && source "${STARTUP_INFO_FILE}"

  # Optimized files structure processing
  if [[ $(( UPLOADER_VERSION )) -ge ${UPLOADER_TS_OPTIMIZE_FILE_STRUCTURE} ]]; then
    for input_line in "${LOG_INPUT[@]}"; do
      LOG_TYPE="$(echo "${input_line}" | cut -d";" -f1)"
      EXTRACT_COMMAND="$(echo "${input_line}" | cut -d";" -f2)"

      for sasg_log in $(find "${ROOT_LOG_FOLDER}"/*/*/logs/"${LOG_TYPE}" -type f); do
        TEMP_LOG="./$(basename "${sasg_log}")"
        SASG_VIP="$(echo "${sasg_log}" | cut -d"/" -f3)"
        HOST_IP="$(echo "${sasg_log}" | cut -d"/" -f4)"
        cp "${sasg_log}" "${TEMP_LOG}"
        if which "${EXTRACT_COMMAND}" > /dev/null 2>&1; then
          ${EXTRACT_COMMAND} "${TEMP_LOG}"
        fi
        TEMP_LOG="$(ls)" # Expecting to have only one file here
        while read -r log_line; do
          log "[ "${SASG_VIP}" ] [ "${HOST_IP}" ] [ ${LOG_TYPE^^} ] [ ${TEMP_LOG} ] ${log_line}"
        done < "${TEMP_LOG}"
        rm -f ./*
        rm -f "${sasg_log}"
      done
    done

    continue # Moving to the next sasg instance
  fi

  # Original files structure processing
  for input_line in "${LOG_INPUT[@]}"; do
    LOG_TYPE="$(echo "${input_line}" | cut -d";" -f1)"
    EXTRACT_COMMAND="$(echo "${input_line}" | cut -d";" -f2)"

    for sasg_log in $(find "${ROOT_LOG_FOLDER}"/*/logs/"${LOG_TYPE}" -type f); do
      TEMP_LOG="./$(basename "${sasg_log}")"
      SASG_FQDN="$(echo "${sasg_log}" | cut -d"/" -f3)"
      cp "${sasg_log}" "${TEMP_LOG}"
      if which "${EXTRACT_COMMAND}" > /dev/null 2>&1; then
        ${EXTRACT_COMMAND} "${TEMP_LOG}"
      fi
      TEMP_LOG="$(ls)" # Expecting to have only one file here
      while read -r log_line; do
        log "[ "${SASG_FQDN}" ] [ ${LOG_TYPE^^} ] [ ${TEMP_LOG} ] ${log_line}"
      done < "${TEMP_LOG}"
      rm -f ./*
      rm -f "${sasg_log}"
    done
  done
done

[[ -d "${TEMP_LOG_FOLDER}" ]] && rm -rf "${TEMP_LOG_FOLDER}"
