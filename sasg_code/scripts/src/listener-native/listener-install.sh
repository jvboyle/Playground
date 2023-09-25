#!/bin/bash

LISTENER_INSTALL_DIR="$(dirname "$0")"
LISTENER_DIR="/sasg/listener"
LISTENER_UPLOAD_DIR="/sasg/listener/uploads"
NGINX_SSL_CERTS_DIR="/etc/nginx/SSL"
NGINX_CONFIG="/etc/nginx/nginx.conf"
MIST_DIR="/sasg/logs"
LISTENER_SCRIPTS=(
  "listener-run.sh"
  "analyze-configs.sh"
  "write-logs.sh"
)
LISTENER_SSL_FILES=(
  "ca.crt"
  "server.crt"
  "server.key"
)
LISTENER_SSL_FULL_PACK_ROOT="/sasg/configs/auth-logpush"
LISTENER_SERVICE="sasg-listener"
NGINX_USER="sasauto"
VARS_FILE="/sasg/configs/client/vars"
LISTENER_ENV_FILE=".listener-env"

function allow_1sasg_vip_into_listener() {
  ALLOWED_HOSTS_MARKER="$(grep -n "# ALLOW HOSTS" "${NGINX_CONFIG}" | cut -d":" -f1)"
  ALLOWED_HOSTS_LINE_NUM=$(( ALLOWED_HOSTS_MARKER + 1 ))

  source "${VARS_FILE}" 2>/dev/null

  for sasg_vip1 in "${SASG_VIP1[@]}"; do
    if [[ "$(echo "${sasg_vip1}" | cut -d"." -f1)" == "10" ]]; then
      transformed_sasg_ip="1.$(echo "${sasg_vip1}" | cut -d"." -f2-4)"
    else
      transformed_sasg_ip="${sasg_vip1}"
    fi
    sed --in-place "${ALLOWED_HOSTS_LINE_NUM}i    allow                         ${transformed_sasg_ip};" "${NGINX_CONFIG}"
  done
}

function main() { 
  yum install nginx -y

  if ! rpm -q nginx 2>/dev/null; then
    echo "[ Listener Install ] [ ERROR ] Nginx was not installed"
    exit 1
  fi

  mkdir --parents "${LISTENER_DIR}"
  mkdir --parents "${LISTENER_UPLOAD_DIR}"
  mkdir --parents "${NGINX_SSL_CERTS_DIR}"

  # if the service already exists, stop the service before updating
  if [ -f "/usr/lib/systemd/system/${LISTENER_SERVICE}.service" ];then
    systemctl stop "${LISTENER_SERVICE}"
    systemctl stop nginx
  fi

  chown -R "${NGINX_USER}:${NGINX_USER}" "${LISTENER_DIR}"
  chown -R "${NGINX_USER}:${NGINX_USER}" "${LISTENER_UPLOAD_DIR}"

  cat "${LISTENER_INSTALL_DIR}/nginx.conf" > "${NGINX_CONFIG}"
  allow_1sasg_vip_into_listener

  for listener_script in "${LISTENER_SCRIPTS[@]}"; do
    echo "Copying \"${listener_script}\" to \"${LISTENER_DIR}\""
    cat "${LISTENER_INSTALL_DIR}/${listener_script}" > "${LISTENER_DIR}/${listener_script}"
    chmod +x "${LISTENER_DIR}/${listener_script}"
  done

  for listener_ssl_file in "${LISTENER_SSL_FILES[@]}"; do
    echo "Copying \"${listener_ssl_file}\" to \"${NGINX_SSL_CERTS_DIR}\""
    cp --force "${LISTENER_SSL_FULL_PACK_ROOT}/${listener_ssl_file}" "${NGINX_SSL_CERTS_DIR}"
  done

  echo "Copying variables from \"${LISTENER_ENV_FILE}\" to \"${LISTENER_DIR}\""
  if [[ ! -f "${LISTENER_DIR}/${LISTENER_ENV_FILE}" ]]; then
    # File does not exist - copy the entire file
    cp "${LISTENER_INSTALL_DIR}/${LISTENER_ENV_FILE}" "${LISTENER_DIR}"
  else
    # File exists - copy only missing variables
    while read -r new_env_file_line; do
      var_name="$(echo "${new_env_file_line}" | sed 's/^ *\(.*$\)/\1/' | cut -d"=" -f1)"
      if ! egrep -q "^ *${var_name}=" "${LISTENER_DIR}/${LISTENER_ENV_FILE}"; then
        # Variable does not exist in the existing file - remove heading spaces & add the whole line
        stripped_line="$(echo "${new_env_file_line}" | sed 's/^ *\(.*$\)/\1/')"
        echo "Adding line: ${stripped_line}"
        echo "${stripped_line}" >> "${LISTENER_DIR}/${LISTENER_ENV_FILE}"
      else
        # Variable exists in the existing file - do nothing
        echo "Variable \"${var_name}\" already exists: $(grep "${var_name}" "${LISTENER_DIR}/${LISTENER_ENV_FILE}")"
      fi
    done < <(egrep -v -e "^ *#" -e "^ *$" "${LISTENER_INSTALL_DIR}/${LISTENER_ENV_FILE}")
  fi

  echo "Copying \"${LISTENER_SERVICE}.service\" to \"/usr/lib/systemd/system\""
  cat "${LISTENER_INSTALL_DIR}/${LISTENER_SERVICE}.service" > "/usr/lib/systemd/system/${LISTENER_SERVICE}.service"

  systemctl daemon-reload
  systemctl enable "${LISTENER_SERVICE}"
  systemctl restart "${LISTENER_SERVICE}"

  sleep 5
  systemctl status "${LISTENER_SERVICE}"

  if ! LISTENER_STATUS="$(systemctl is-active "${LISTENER_SERVICE}")"; then
    echo "[ Listener Install ] [ ERROR ] ${LISTENER_SERVICE} status is ${LISTENER_STATUS}. Aborting"
    exit 1
  fi
}

main "$@"






