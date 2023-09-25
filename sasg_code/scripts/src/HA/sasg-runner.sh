#!/usr/bin/env bash

TIMEOUT_INITIAL=$(( 3 * 60 ))
INTERVAL_CHECK=30
DEFAULT_UNIT_TAG="sasg"
PID_FILE_NAME="sasg.pid"
SASG_POD="sasg"
SASG_CONTAINER="sasgc"
CHECKER_CONTAINER="checker"

function log_message() {
  echo "$*" | systemd-cat -t "${DEFAULT_UNIT_TAG}"
}

function get_pid_file_name() {
  echo "${SYSTEMD_ENV_CLIENT_PATH}/${PID_FILE_NAME}"
}

function check_if_started() {
  pid_file="$(get_pid_file_name)"
  if [[ -f "${pid_file}" ]]; then
    log_message "SASG is already running (runner pid: $(cat ${pid_file}))"
    exit 0
  fi
}

function get_env_values() {
  source "${SYSTEMD_ENV_CLIENT_PATH}/.env"
  CLIENT_ENV_SASG_VERSION="${SASGC_VERSION}"
  CLIENT_ENV_CHECKER_VERSION="${CHECKER_VERSION}"

  log_message "Environment:
  SYSTEMD_ENV_CLIENT_PATH=${SYSTEMD_ENV_CLIENT_PATH}
  CLIENT_ENV_SASG_VERSION=${CLIENT_ENV_SASG_VERSION}
  CLIENT_ENV_CHECKER_VERSION=${CLIENT_ENV_CHECKER_VERSION}"
}

function start_sasg() {
  log_message "Starting SASG"
  get_env_values
  check_if_started
  echo "$$" > "$(get_pid_file_name)"

  mkdir -p "${SYSTEMD_ENV_CLIENT_PATH}/keys"
  mkdir -p "${SYSTEMD_ENV_CLIENT_PATH}/logs"
  mkdir -p "${SYSTEMD_ENV_CLIENT_PATH}/logs/Firewall"
  mkdir -p "${SYSTEMD_ENV_CLIENT_PATH}/logs/VPN"
  mkdir -p "${SYSTEMD_ENV_CLIENT_PATH}/Nginx"
  mkdir -p "${SYSTEMD_ENV_CLIENT_PATH}/gcm"
  touch "${SYSTEMD_ENV_CLIENT_PATH}/update-info"
  touch "${SYSTEMD_ENV_CLIENT_PATH}/upload-hashes"

  podman pod create --name "${SASG_POD}"

  podman run \
    --pod=sasg \
    --cap-add=NET_ADMIN \
    --device /dev/net/tun \
    --detach \
    --env-file="${SYSTEMD_ENV_CLIENT_PATH}/.env" \
    --name="${SASG_CONTAINER}" \
    --net=host-only,ipvlan \
    --read-only=true \
    --security-opt label=disable \
    --tmpfs=/etc/nginx/conf.d:exec \
    --tmpfs=/run:exec \
    --tmpfs=/sasg:exec \
    --tmpfs=/tmp:exec \
    --tmpfs=/tmp/log:exec \
    --tmpfs=/var:exec \
    --volume=/etc/resolv.conf:/etc/resolv.conf \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/keys:/opt/sasg/sasg_install/keys" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/logs:/sasg/logs" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/Nginx:/sasg/Nginx" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/vars:/opt/sasg/sasg_install/vars" \
    --volume=ipset:/etc/ipset.d \
    --volume=iptables:/etc/iptables \
    --volume=sasg-configs:/sasg/configs \
    \
    "gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg_build:${CLIENT_ENV_SASG_VERSION}"
  
  [ $? -eq 0 ] && /sasg/bin/HA/manage-host-only-docker-route.sh ${SYSTEMD_ENV_CLIENT_PATH##*/} add
  
  podman run \
    --pod=sasg \
    --detach \
    --env-file=${SYSTEMD_ENV_CLIENT_PATH}/.env \
    --read-only=true \
    --name="${CHECKER_CONTAINER}" \
    --net=container:sasgc \
    --security-opt label=disable \
    --tmpfs=/tmp \
    --tmpfs=/var/spool/cron \
    --volume=/etc/pam.d/system-auth:/host/configs/system-auth:ro \
    --volume=/etc/ssh/sshd_config:/host/configs/sshd_config:ro \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/certs/client.crt:/certs/client.cert:ro" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/certs/client.key:/certs/client.key:ro" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/gcm:/sasg/gcm" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/logs/Firewall:/host/logs/fw" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/logs/VPN:/host/logs/vpn" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/update-info:/host/update-info" \
    --volume="${SYSTEMD_ENV_CLIENT_PATH}/upload-hashes:/root/upload-hashes" \
    --volume=/var/log:/host/logs \
    --volume=ipset:/sasg/ipset:ro \
    --volume=iptables:/sasg/iptables:ro \
    --volume=sasg-configs:/sasg/configs:ro \
    \
    "gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg-sidecar-checker:${CLIENT_ENV_CHECKER_VERSION}"
}

function watch_sasg_health() {
  healthcheck_status="$(
    podman inspect sasgc \
    | grep -A2 -i healthcheck \
    | grep -i status \
    | tr -d "," | tr -d " " | tr -d "\"" \
    | cut -d":" -f2)"
  log_message "Healthcheck status: ${healthcheck_status}"
  echo ${healthcheck_status}
}

function stop_sasg() {
  pid_file="$(get_pid_file_name)"

  if [[ -f "${pid_file}" ]]; then
    runner_pid="$(cat "${pid_file}")"
    log_message "Stopping SASG (runner pid: ${runner_pid})"
    
    kill "${runner_pid}" 2>/dev/null
    rm -f "$(get_pid_file_name)"
  fi  

  for container in "${CHECKER_CONTAINER}" "${SASG_CONTAINER}"; do
    podman inspect "${container}" >/dev/null 2>&1 && podman stop "${container}" >/dev/null
  done
  for container in "${CHECKER_CONTAINER}" "${SASG_CONTAINER}"; do
    podman inspect "${container}" >/dev/null 2>&1 && podman rm "${container}" >/dev/null
  done
  podman pod inspect "${SASG_POD}" >/dev/null 2>&1 && podman pod rm "${SASG_POD}" >/dev/null

  exit 0
}

function main() {
 
  if echo "$@" | grep -qi -e "stop" -e "kill"; then
    stop_sasg
  else
    start_sasg
    sleep "${TIMEOUT_INITIAL}"

    while true; do
      status=$(watch_sasg_health)
      if [ "${status}" == "unhealthy" ]; then
        systemctl stop  sgha@${SYSTEMD_ENV_CLIENT_PATH##*/}.service 
      fi

      sleep "${INTERVAL_CHECK}"
    done
  fi
}

if [[ ! -d "${SYSTEMD_ENV_CLIENT_PATH}" ]]; then
  log_message "Start failed. Client path \"${SYSTEMD_ENV_CLIENT_PATH}\" is incorrect"
  exit 1
fi

main "$@"
