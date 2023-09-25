#!/bin/bash
# ####################################################################################################
# SASFW log rotate config script - slightly different from one run on sasg's
# - no nginx, no reading vars file.  Run via sudo from sasg_main.sh
# ####################################################################################################

# --- Simple output setup ---
  function log() {
    echo "[ $(basename "${0}") ] [ $(date "+%Y-%m-%d %H:%M:%S") ] $*"
  }

  function log_info() {
    echo "[ INFO ] $(log "$*")"
  }

  function log_error() {
    echo "[ ERROR ] $(log "$*")"
  }
# ---

LOGROTATEDIR="/etc/logrotate.d"
LOGROTATE_SASGFW="$LOGROTATEDIR/sasgfw"
LOGROTATE_SASGVPN="$LOGROTATEDIR/sasgvpn"
SASG_CLIENTS_DIR="/sasg/clients"

DEFAULT_CONFIG=(
  "{"
  "  missingok"
  "  daily"
  "  dateext"
  "  rotate 10"
  "  compress"
  "}"
)

log_info "Setting up logrotate for dockerized SASG"
log_info

for client in $(ls "${SASG_CLIENTS_DIR}"); do
  [[ ! -d "${SASG_CLIENTS_DIR}/${client}/logs" ]] && continue
  for log_settings in "sasgfw;Firewall/sasgfw" "sasvpn;VPN/sasvpn01"; do
    logrotate_config="${LOGROTATEDIR}/$(echo "${log_settings}" | cut -d";" -f1)-${client}"
    logrotate_log="${SASG_CLIENTS_DIR}/${client}/logs/$(echo "${log_settings}" | cut -d";" -f2)"

    log_info "Setting config \"${logrotate_config}\" for log file \"${logrotate_log}\""
    : > "${logrotate_config}"
    for config_line in "${logrotate_log}" "${DEFAULT_CONFIG[@]}"; do
      echo "${config_line}" >> "${logrotate_config}"
    done
  done
done

log_info
log_info "Finishing logrotate for dockerized SASG"
log_info "-----------------------------------------"
