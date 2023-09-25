#!/bin/bash

CONFIG_ROOT="/sasg/listener/uploads"
MIST_DIR="/sasg/logs"
WARN_FILE_PREFIX="warnings"
ERR_FILE_PREFIX="errors"
FLAG_WARNING="--warning-only"
CHECKER_LEVEL_FILE="checker.level"
CHECKER_LEVEL_0="0" # Initial value. Introducing checker level. Marks new upload structure
LISTENER_ENV_FILE="$(dirname "$0")/.listener-env"
VPN_LOG="/sasg/logs/VPN/sasvpn01"
VPN_START_MESSAGE="Initialization Sequence Completed"
NOW="$(date "+%s")" # Unixtime
ONE_HOUR=3600

[[ -f "${LISTENER_ENV_FILE}" ]] && source "${LISTENER_ENV_FILE}"

CONFIG_FILES=(
  "ipset"
  "iptables"
  "vpn.conf"
  #! SSHD config will be treated separately for now.
  #! Pls check issue #3 for details: https://github.ibm.com/SASG-ORG/chef-sidecar-config-analyzer/issues/3
  # "sshd_config" 
)
LOG_UPLOAD_FAILURE_INFO="logs.upload.failed"

function log() {
  echo "$*" | systemd-cat -t "${LISTENER_SYSTEMD_UNIT^^}"
}

function raise_alert() {
  local alert_file="${1}"
  local alert_text="${2}"
  local only_warning_flag="${3}"

  [[ "${WARNINGS_ONLY}" == "1" ]] && only_warning_flag="${FLAG_WARNING}"

  if [[ -f "${MIST_DIR}/${ERR_FILE_PREFIX}.${alert_file}" ]]; then
    log "Error for ${alert_file} already present. Doing nothing"
    return 0
  fi

  if \
    [[ -f "${MIST_DIR}/${WARN_FILE_PREFIX}.${alert_file}" ]] \
    && [[ "${only_warning_flag}" != "${FLAG_WARNING}" ]] \
  ; then
    log "Warning for ${alert_file} already present. Raising error"
    rm -f "${MIST_DIR}/${WARN_FILE_PREFIX}.${alert_file}"
    echo "${alert_text}" > "${MIST_DIR}/${ERR_FILE_PREFIX}.${alert_file}"
    return 0
  fi

  log "Creating warning for ${alert_file}"
  echo "${alert_text}" > "${MIST_DIR}/${WARN_FILE_PREFIX}.${alert_file}"
}

function raise_warning() {
  raise_alert "$1" "$2" "${FLAG_WARNING}"
}

function remove_alert() {
  local alert_file="${1}"
  local warnings_alert_file="${MIST_DIR}/${WARN_FILE_PREFIX}.${alert_file}"

  # Removing only warnings, errors should be removed manually
  if [[ -f "${warnings_alert_file}" ]]; then
    log "Removing warning for ${alert_file}"
    rm -f "${warnings_alert_file}"
  fi
}

function remove_error() {
  local alert_file="${1}"
  local warnings_alert_file="${MIST_DIR}/${WARN_FILE_PREFIX}.${alert_file}"
  local errors_alert_file="${MIST_DIR}/${ERR_FILE_PREFIX}.${alert_file}"

  if [[ -f "${warnings_alert_file}" ]]; then
    log "Removing warning for ${alert_file}"
    rm -f "${warnings_alert_file}"
  fi
  if [[ -f "${errors_alert_file}" ]]; then
    log "Removing error for ${alert_file}"
    rm -f "${errors_alert_file}"
  fi
}

function get_default_alert_function() {

  local checker_level_file="$(find "${CONFIG_ROOT}" -name "${CHECKER_LEVEL_FILE}" | tail -1)"
    
  if [[ -z "${checker_level_file}" ]]; then
    echo "raise_warning"
    return
  fi

  checker_level="$(cat "${checker_level_file}")"
  if [[ $(( checker_level )) -ge ${CHECKER_LEVEL_0} ]]; then
    echo "raise_alert"
    return
  fi
}

default_alert_function="$(get_default_alert_function)"

# Configs, log upload
for sasg_instance in $(ls "${CONFIG_ROOT}"); do
  [[ "${sasg_instance}" == "autoupdate" ]] && continue
  [[ ! -d "${CONFIG_ROOT}/${sasg_instance}" ]] && continue
  log "Processing configs for ${sasg_instance}"

  if [[ ! -d "${CONFIG_ROOT}/${sasg_instance}/configs/current" ]]; then
    log "Could not find current configs for ${sasg_instance}"
    remove_error "${sasg_instance}.config-not-found"
  else
    remove_error "${sasg_instance}.config-not-found"
  fi

  cd "${CONFIG_ROOT}/${sasg_instance}/configs/current"

  for config_file in "${CONFIG_FILES[@]}"; do
    if [[ -f "${config_file}" ]]; then
      log "${config_file} config was changed for ${sasg_instance}"
      remove_error "${sasg_instance}.${config_file}"
    else
      remove_error "${sasg_instance}.${config_file}"
    fi
  done

  if [[ -f "${LOG_UPLOAD_FAILURE_INFO}" ]]; then
    log "Logs upload error was registered for ${sasg_instance}"
    remove_error "${sasg_instance}.${LOG_UPLOAD_FAILURE_INFO}"
  else
    remove_error "${sasg_instance}.${LOG_UPLOAD_FAILURE_INFO}"
  fi

  log "---"
done

# --- SSHD processing ------------------------
#! SSHD config will be treated separately for now.
#! Pls check issue #3 for details: https://github.ibm.com/SASG-ORG/chef-sidecar-config-analyzer/issues/3
for sasg_instance in $(ls "${CONFIG_ROOT}"); do
  [[ "${sasg_instance}" == "autoupdate" ]] && continue
  [[ ! -d "${CONFIG_ROOT}/${sasg_instance}" ]] && continue
  cd "${CONFIG_ROOT}/${sasg_instance}/configs/current"
  if [[ -f "sshd_config" ]]; then
    log "Raising warning regarding sshd_config for ${sasg_instance}"
    remove_error "${sasg_instance}.sshd_config"
  else
    remove_error "${sasg_instance}.sshd_config"
  fi
done
# --------------------------------------------

# Startup
for sasg_instance in $(ls "${CONFIG_ROOT}"); do
  [[ "${sasg_instance}" == "autoupdate" ]] && continue
  [[ ! -d "${CONFIG_ROOT}/${sasg_instance}" ]] && continue
  if [[ -f "${CONFIG_ROOT}/${sasg_instance}/startup-info" ]]; then
    source "${CONFIG_ROOT}/${sasg_instance}/startup-info" # Getting $HOST_IP & LOCAL_DT
    log "${sasg_instance} SASG has started on ${HOST_IP} at ${LOCAL_DT}"
    rm -f "${CONFIG_ROOT}/${sasg_instance}/startup-info"
  fi
done

# Heartbeat
for sasg_instance in $(ls "${CONFIG_ROOT}"); do
  [[ "${sasg_instance}" == "autoupdate" ]] && continue
  [[ ! -d "${CONFIG_ROOT}/${sasg_instance}" ]] && continue
  # heartbeat file exists, everything's ok
  if [[ -f "${CONFIG_ROOT}/${sasg_instance}/heartbeat" ]]; then
    log "heartbeat file found for ${sasg_instance}. Removing hearbeat files"
    rm -f "${CONFIG_ROOT}/${sasg_instance}"/heartbeat*
    continue
  fi
  # No heartbeat and no indicator that heartbeat was not found last time
  if [[ ! -f "${CONFIG_ROOT}/${sasg_instance}/heartbeat-missing" ]]; then
    log "heartbeat file not found for ${sasg_instance}. Creating hearbeat-missing file"
    rm -f "${CONFIG_ROOT}/${sasg_instance}"/heartbeat*
    continue
  fi
  # No heartbeat and missing heartbeat indicator is there 
  log "heartbeat file not found for ${sasg_instance} for the second time. Raising alert"
  rm -f "${CONFIG_ROOT}/${sasg_instance}"/heartbeat*
done

base_upgrade_file="${CONFIG_ROOT}/autoupdate/upgrade"
for upgrade_log in $(ls "${base_upgrade_file}".* 2>/dev/null); do
  raise_warning "$(basename "${upgrade_log}")" "$(cat "${upgrade_log}")" "${FLAG_WARNING}"
  rm -f "${upgrade_log}"
done

# No checks if openvpn is not running
if pgrep openvpn > /dev/null; then
  if [[ -f "${LISTENER_ENV_FILE}" ]]; then

    last_hour_init_count=0

    while read -r log_line; do
      log_line_date="$(echo "${log_line}" | awk '{ print $2" "$3" "$4" "$5 }')"
      log_line_unix_time="$(date -d "${log_line_date}" "+%s")"
      diff_time=$(( NOW - log_line_unix_time ))
      if [[ $diff_time -le $ONE_HOUR ]]; then
        echo "Log line was created less then 1 hour ago: ${log_line}"
        last_hour_init_count=$(( last_hour_init_count + 1 ))
      fi
    done < <(grep "${VPN_START_MESSAGE}" "${VPN_LOG}")

    alert_file_name="openvpn.multiple-initialization"
    # INIT_COUNT_LAST_HOUR_THRESHOLD is taken from env file
    if [[ $last_hour_init_count -ge $INIT_COUNT_LAST_HOUR_THRESHOLD ]]; then

      log "Found ${last_hour_init_count} cases of OpenVPN tunnel initialization during last hour. Raising error"

      "${default_alert_function}" \
        "${alert_file_name}" \
        "OpenVPN tunnel is constanly being reestablished"
    else
      remove_error "${alert_file_name}"
    fi
  fi 
fi

# GCM
for sasg_vip in $(ls "${CONFIG_ROOT}"); do
  [[ "${sasg_vip}" == "autoupdate" ]] && continue
  [[ ! -d "${CONFIG_ROOT}/${sasg_vip}" ]] && continue
  [[ -f "${CONFIG_ROOT}/${sasg_vip}/disable.gcm.check" ]] && continue
  for sasg_ip in $(ls "${CONFIG_ROOT}/${sasg_vip}"); do

    [[ "${sasg_ip}" == "configs" ]] && continue

    sasg_ip_path="${CONFIG_ROOT}/${sasg_vip}/${sasg_ip}"

    [[ ! -d "${sasg_ip_path}" ]] && continue

    for report in "policy_OS_result.xml" "policy_docker_result.xml"; do
      policy_report_path="${sasg_ip_path}/gcm/${report}"

      if [[ ! -f "${policy_report_path}" ]]; then
        log "${report} report is missing for ${sasg_ip} machine (${sasg_vip} instance)"
        remove_error "${sasg_vip}-${sasg_ip}.gcm.${report}-violation"
        continue
      else
        remove_error "${sasg_vip}-${sasg_ip}.gcm.${report}-missing"
      fi

      if grep -q "<violation>" "${policy_report_path}"; then
        log "Violations found for ${sasg_ip} machine (${sasg_vip} instance)"
        remove_error "${sasg_vip}-${sasg_ip}.gcm.${report}-violation"
      else
        remove_error "${sasg_vip}-${sasg_ip}.gcm.${report}-violation"
      fi
    done
  done
done
