#!/usr/bin/env bash

# -- Constants ------------------------
  readonly LOGROTATE_RHEL_PACKAGE="logrotate"
  readonly LOGROTATE_ROOT="/sasg/bin/logrotate"
  readonly LOGROTATE_UPLOADER="/sasg/bin/logrotate/upload.py"
  readonly LOGROTATE_LOG="/sasg/bin/logrotate/logs/logrotate.log"
  readonly LOGROTATE_LOG_TEMP="${LOGROTATE_LOG}.temp"
  readonly LOGROTATE_CONFIG_CLIENTS="/sasg/bin/logrotate/conf.d/logrotate-clients.conf"
  readonly LOGROTATE_CONFIG_OWN="/sasg/bin/logrotate/conf.d/logrotate-own.conf"
  readonly SASG_CLIENTS_ROOT="/sasg/clients"
  readonly SASG_VARS_FILE="vars"
  readonly SSL_CLIENT_KEY="${LOGROTATE_ROOT}/cert/client.key"
  readonly SSL_CLIENT_CERT="${LOGROTATE_ROOT}/cert/client.crt"
  readonly TRIGGER_FILE_DISABLE_LOG_UPLOAD="archived-log-upload.disable"
  readonly UPLOAD_PORT="3443"
  readonly SEPARATOR="--------------------------------------------------------------"
# -------------------------------------

# -- Functions ------------------------
  function logwrite() {
    local message="$@"

    touch "${LOGROTATE_LOG}"
    echo "[ $(date "+%Y-%m-%d %H:%M:%S") ]: ${message}" | tee --append "${LOGROTATE_LOG}"
  }
# -------------------------------------

# -- Self-check -----------------------
  logwrite "Performing self-check"
  for ssl_file in "${SSL_CLIENT_KEY}" "${SSL_CLIENT_CERT}"; do
    if [ ! -f "${ssl_file}" ]; then
      logwrite "File \"${ssl_file}\" required for establishing SSL connection to listener was not found. Aborting..."
      exit 1
    fi
    logwrite "File \"$(sha256sum ${ssl_file})\" found"
  done
  logwrite "${SEPARATOR}"
# -------------------------------------

logwrite "-= Rotating logs =-"

# -- Rotate own log -------------------
  logwrite "Rotating own log"

  touch "${LOGROTATE_LOG_TEMP}"
  chmod 644 "${LOGROTATE_CONFIG_CLIENTS}"

  # Need to rotate first and write the message second to avoid 
  # situation when first message is in one log (before rotate)
  # and the body is in another one (after rotate)
  logrotate -v "${LOGROTATE_CONFIG_OWN}" 2>&1 | tee --append "${LOGROTATE_LOG_TEMP}"
  cat "${LOGROTATE_LOG_TEMP}" >> "${LOGROTATE_LOG}"
  
  rm --force "${LOGROTATE_LOG_TEMP}"
  logwrite "${SEPARATOR}"
# -------------------------------------

# -- Rotate client logs ---------------
  logwrite "Rotating client files"
  logwrite ""
  chmod 644 "${LOGROTATE_CONFIG_OWN}" 
  logrotate -v "${LOGROTATE_CONFIG_CLIENTS}" 2>&1 | tee --append "${LOGROTATE_LOG}"
  logwrite "${SEPARATOR}"
# -------------------------------------

for client in $(ls "${SASG_CLIENTS_ROOT}"); do
  touch "${SASG_CLIENTS_ROOT}/${client}/logs/Firewall/sasgfw"
done
logwrite "-= Uploading logs =-"

# -- Upload client log archives -------
  for client in $(ls "${SASG_CLIENTS_ROOT}"); do
    logwrite ""
    logwrite "Uploading logs for client ${client}"
    cd "${SASG_CLIENTS_ROOT}/${client}"
    if [ -f "./${TRIGGER_FILE_DISABLE_LOG_UPLOAD}" ]; then
      logwrite "Logs upload disabled for \"${client}\""
      continue
    fi
    source "${SASG_VARS_FILE}"
    upload_target_host="${EE_IP}" # taken from vars file sourced above

    for archive_file in $(
      find "$(pwd)/logs" -type f -name "*.gz" -print0 | xargs --max-args=1 --null
    ); do
      target_URL="https://${upload_target_host}:${UPLOAD_PORT}/${client}/$(basename "${archive_file}")"
      logwrite "Uploading \"${archive_file}\" to ${target_URL}"
      upload_result="$(
        "${LOGROTATE_UPLOADER}" \
          --target-server "${upload_target_host}" \
          --cert "${SSL_CLIENT_CERT}" \
          --key "${SSL_CLIENT_KEY}" \
          --payload "${archive_file}" \
          --name "${client}/$(basename "${archive_file}")" \
      )"
      # http_response="$(
      #   curl \
      #     --insecure \
      #     --retry 3 \
      #     --max-time 30 \
      #     --silent \
      #     --key "${SSL_CLIENT_KEY}" \
      #     --cert "${SSL_CLIENT_CERT}" \
      #     --upload-file "${archive_file}" \
      #     "${target_URL}"
      # )"
      # if [ "$?" != "0" ]; then 
      #   logwrite "ERROR: \"${archive_file}\" was not uploaded to ${target_URL} (connection could not be established)"
      #   continue
      # fi
      if [ "$?" != "0" ]; then 
        logwrite "ERROR: ${upload_result}"
        continue
      fi
      logwrite "${upload_result}"
      # if [ -n "${http_response}" ]; then
      #   logwrite "ERROR: \"${archive_file}\" was not uploaded to ${target_URL} (target server response shown below)"
      #   echo "${http_response[@]}" | tee --append "${LOGROTATE_LOG}"
      #   continue
      # fi
      # logwrite "\"${archive_file}\" was successfully uploaded to ${target_URL}"
      rm --force "${archive_file}"
    done
  done
  logwrite
  logwrite "${SEPARATOR}"; logwrite "${SEPARATOR}" # Twice to visually separate from the next iteration
  logwrite
# -------------------------------------
