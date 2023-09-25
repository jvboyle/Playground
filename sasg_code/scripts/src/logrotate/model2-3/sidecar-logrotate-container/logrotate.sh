#!/bin/sh

# -- Constants ------------------------
  readonly HTTP_RESPONSE_TEMP="http-response"
  readonly LOGROTATE_CONFIG="/etc/logrotate.conf"
  readonly LOGROTATE_LOG="/var/log/logrotate/logrotate.log"
  readonly SSL_CLIENT_CERT="/root/client.crt"
  readonly SSL_CLIENT_KEY="/root/client.key"
  readonly UPLOAD_PORT=3443
  readonly SEPARATOR="--------------------------------------------------------------"  
  readonly VARS_FILE="/root/vars"
  readonly TS="$(date "+%Y%m%d-%H%M")"
# -------------------------------------

# -- Functions ------------------------
  function logwrite() {
    local message="$@"

    touch "${LOGROTATE_LOG}"
    echo "[ $(date "+%Y-%m-%d %H:%M:%S") ]: ${message}" | tee -a "${LOGROTATE_LOG}"
  }
# -------------------------------------

mkdir -p "$(dirname "${LOGROTATE_LOG}")"

# -- Rotate logs ---------------
  chmod 644 "${LOGROTATE_CONFIG}"
  logrotate -v "${LOGROTATE_CONFIG}" 2>&1 | tee -a "${LOGROTATE_LOG}"
  logwrite "${SEPARATOR}"
# -------------------------------------

# To ensure files are there even if rotated
touch "/var/log/Firewall/sasgfw"
touch "/var/log/VPN/sasvpn01"
touch "/var/log/Nginx/access.log"
touch "/var/log/Nginx/error.log"
touch "${LOGROTATE_LOG}"

# $CLIENT_NAME must be provided via compose environment
logwrite "-= Uploading logs for \"${CLIENT_NAME}\"=-"

# -- Upload client log archives -------
  logwrite ""
  eval $(grep "^EE_IP=" "${VARS_FILE}") 

  if [ -z "${EE_IP}" ]; then
    logwrite "Variable EE_IP was not initialized. Checking the value in ${VARS_FILE}:"
    logwrite
    grep EE_IP ${VARS_FILE} | tee -a "${LOGROTATE_LOG}"
    logwrite "Aborting..."
    exit 1
  fi
  # EE address should be translated to 2.x.x.x network in order to be 
  # routed through openvpn tunnel
  upload_target_host="2.$(echo "${EE_IP}" | cut -d"." -f2-4)"

  for archive_file in $(
    find "/var/log" -type f -name "*.gz" -print0 \
      | grep -v "${LOGROTATE_LOG}" \
      | xargs -n 1 -0
  ); do
    # Adding timestamp to avoid overwriting files with the same name
    target_URL="https://${upload_target_host}:${UPLOAD_PORT}/${CLIENT_NAME}/$(basename "${archive_file}.${TS}")"
    logwrite "Uploading \"${archive_file}\" to ${target_URL}"
    rm -f "./${HTTP_RESPONSE_TEMP}"
    curl \
      --insecure \
      --retry 3 \
      --max-time 30 \
      --silent \
      --cert "${SSL_CLIENT_CERT}" \
      --key "${SSL_CLIENT_KEY}" \
      --upload-file "${archive_file}" \
      "${target_URL}" \
    > "./${HTTP_RESPONSE_TEMP}"
    if [ "$?" != "0" ]; then 
      logwrite "ERROR: \"${archive_file}\" was not uploaded to ${target_URL} (connection could not be established)"
      continue
    fi
    if [ -s "./${HTTP_RESPONSE_TEMP}" ]; then
      logwrite "ERROR: \"${archive_file}\" was not uploaded to ${target_URL} (target server response shown below)"
      cat "./${HTTP_RESPONSE_TEMP}" | tee -a "${LOGROTATE_LOG}"
      continue
    fi
    logwrite "\"${archive_file}\" was successfully uploaded to ${target_URL}"
    rm -f "${archive_file}"
  done
# -------------------------------------

logwrite
logwrite "${SEPARATOR}"; logwrite "${SEPARATOR}" # Twice to visually separate from the next iteration
logwrite
