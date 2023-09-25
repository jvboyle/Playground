#!/bin/bash

CLIENT="$1"
UPDATE_DIR="/sasg/clients/${CLIENT}/update-info"
UPDATE_LOG="${UPDATE_DIR}/update.log"
SERVICE_MASTER="sgha@${CLIENT}.service"
SERVICE_SLAVE="sgha-slave@${CLIENT}.service"
SERVICE_RESILIENCY="sgha-slave@${CLIENT}.service"
SERVICE_NONE=""

SASG_SERVICE="$(
  systemctl is-active "${SERVICE_MASTER}" > /dev/null 2>&1 && echo "${SERVICE_MASTER}"
  systemctl is-active "${SERVICE_SLAVE}" > /dev/null 2>&1 && echo "${SERVICE_SLAVE}"
  systemctl is-active "${SERVICE_RESILIENCY}" > /dev/null 2>&1 && echo "${SERVICE_RESILIENCY}"
)"

function log() {
  echo "$*" | tee -a "${UPDATE_LOG}" | systemd-cat -t "SASG UPDATE"
}

function init_log() {
  mkdir -p "$(dirname "${UPDATE_LOG}")"
  : > "${UPDATE_LOG}"
}

function set_container_runtime_vars() {
  if which docker >/dev/null 2>&1; then
    CONTAINER_CMD="docker"
    SASG_CONTAINER_NAME="${CLIENT,,}_sasgc_1"
    CHECKER_CONTAINER_NAME="${CLIENT,,}_checker_1"
  fi
  if which podman >/dev/null 2>&1; then
    CONTAINER_CMD="podman" # If both are present podman will be used
    SASG_CONTAINER_NAME="sasgc"
    CHECKER_CONTAINER_NAME="checker"
  fi

  if [[ -z "${CONTAINER_CMD}" ]]; then
    log "Container runtime was not found. Aborting..."
    exit 1
  fi

  log "Found container runtime: ${CONTAINER_CMD}"
  log "Container names:"
  log " * SASG container:     ${SASG_CONTAINER_NAME}"
  log " * Checker container:  ${CHECKER_CONTAINER_NAME}"
}

function set_python_interpreter() {
  for python_cmds in python python2 python3; do
    if which "${python_cmds}" >/dev/null 2>&1; then
      PYTHON_CMD="${python_cmds}"
      log "Python interpreter:  ${python_cmds}"
      return
    fi
  done
  log "Python interpreter not found"
  exit 1
}

# is_upgrade_needed - check if upgrade trigger file is present
function is_upgrade_needed() {
  local upgrade_needed=1 # Will be used as a return value hence 1 means "False"
  local pycmd_get_image_tag="import json; import sys; print(json.load(sys.stdin)[0]['Config']['Image'].split(':')[1])"
  local current_image
  local update_image

 
  [[ ! -f "${UPDATE_DIR}/do-upgrade" ]] && return ${upgrade_needed}

  log "-= UPGRADING SASG =-"
  log "Found upgrade trigger file. Upgrade will be initiated"

  if [[ "${SASG_SERVICE}" == "${SERVICE_NONE}" ]]; then
    log "No active services found. Aborting..."
    return ${upgrade_needed}
  fi
  
  if [[ "${SASG_SERVICE}" == "${SERVICE_SLAVE}" ]]; then
    log "Slave does not get upgraded"
    return ${upgrade_needed}
  fi

  # Check if containers are actually running
  for container in "${SASG_CONTAINER_NAME}" "${CHECKER_CONTAINER_NAME}"; do
    if ! "${CONTAINER_CMD}" ps | grep -q "${container}"; then
      log "Container \"${container}\" is not running. Cannot determine if the upgrade is needed. Aborting..."
      return ${upgrade_needed}
    fi
  done

  # Check if requested images are already running
  for container in "${SASG_CONTAINER_NAME}" "${CHECKER_CONTAINER_NAME}"; do
    current_image="$("${CONTAINER_CMD}" inspect "${container}" | "${PYTHON_CMD}" -c "${pycmd_get_image_tag}")"
    [[ "${container}" == "${SASG_CONTAINER_NAME}" ]] && service_type="sasgc"
    [[ "${container}" == "${CHECKER_CONTAINER_NAME}" ]] && service_type="checker"
    update_image="$(cat "${UPDATE_DIR}/docker-container.${service_type}.tgz.label")"

    if [[ "${current_image}" != "${update_image}" ]]; then
      log "Found newer image \"${update_image}\" for \"${service_type}\" (current: \"${current_image}\")"
      upgrade_needed=0
      continue
    fi

    log "No new image for \"${service_type}\" (both current and new are \"${current_image}\")"
  done

  return ${upgrade_needed}
}

# notify_start - # TODO use checker to notify about upgrade status
function notify() {
  local notification_command="$1"
  log "Sending notification about ${notification_command}"
  if ! "${CONTAINER_CMD}" exec "${CHECKER_CONTAINER_NAME}" /root/notify-update.sh "${notification_command}"; then
    log "Notification failed"
    return 1
  fi

  log "Notification succeeded"
}

# import_images - load new docker images
function import_images() {
  log "Loading images:"
  log "$(sha256sum "${UPDATE_DIR}/docker-container."*".tgz")"
  log
  for image_file in $(ls "${UPDATE_DIR}/docker-container."*".tgz"); do
    log "$("${CONTAINER_CMD}" load --input "${image_file}")"
  done
}

# is_upgrade_possible - check if all pre-reqs are fullfilled
function is_upgrade_possible() {
  # Value will be returned hence 0 is True
  local upgrade_possible=0
  local checker_image="gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg-sidecar-checker"
  local sasgc_image="gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg_build"
  local sasgc_label="$(cat "${UPDATE_DIR}/docker-container.sasgc.tgz.label")"
  local checker_label="$(cat "${UPDATE_DIR}/docker-container.checker.tgz.label")"

  log "Checking upgrade pre-requisites..."

  if ! "${CONTAINER_CMD}" image inspect "${sasgc_image}:${sasgc_label}" >/dev/null 2>&1; then
    log "${sasgc_image}:${sasgc_label} is not present"
    upgrade_possible=1
  fi
  if ! "${CONTAINER_CMD}" image inspect "${checker_image}:${checker_label}" >/dev/null 2>&1; then
    log "${checker_image}:${checker_label} is not present."
    upgrade_possible=1
  fi

  return "${upgrade_possible}"
}

# set_images - update docker compose env file with new values
function set_images() {
  local sasgc_label="$(cat "${UPDATE_DIR}/docker-container.sasgc.tgz.label")"
  local checker_label="$(cat "${UPDATE_DIR}/docker-container.checker.tgz.label")"
  local env_file="/sasg/clients/${CLIENT}/.env"

  log "Updating environment file..."
  log "Original images versions:"
  log "$(grep -e "^SASGC_VERSION=" -e "^CHECKER_VERSION=" "${env_file}")"
  if ! cat "/sasg/clients/${CLIENT}/.env" > "/sasg/clients/${CLIENT}/.env.bak"; then
    log "Could not take backup copy of environment file. Aborting"
    return 1
  fi

  if ! sed --in-place \
    --expression="s/^\(SASGC_VERSION\)=.*$/\1=${sasgc_label}/" \
    --expression="s/^\(CHECKER_VERSION\)=.*$/\1=${checker_label}/" \
    "${env_file}" \
  ; then
    log "Could not update environment file with new values. Aborting"
    return 1
  fi

  log "New images versions:"
  log "$(grep -e "^SASGC_VERSION=" -e "^CHECKER_VERSION=" "${env_file}")"

  return 0
}

# manage_remote_slave
function manage_remote_slave() {
  local command="${1,,}"

  [[ "${SASG_SERVICE}" == "${SERVICE_RESILIENCY}" ]] && return 0

  log "Sending command \"${command}\" to slave service on HA peer"
  if ! echo "start stop" | grep -wq "${command}"; then
    echo "Unknown command \"${command}\" for slave service. Aborting"
    return 1
  fi

  if ! systemctl --host="sgadm@ha-peer" "${command}" "${SERVICE_SLAVE}"; then
    log "Could not ${command} slave service"
    return 1
  fi

  log "Slave service ${command} was successfully executed"
}

# manage_remote_master
function manage_remote_master() {
  local command="${1,,}"

  [[ "${SASG_SERVICE}" == "${SERVICE_RESILIENCY}" ]] && return 0

  log "Sending command \"${command}\" to master service on HA peer"
  if ! echo "start stop" | grep -wq "${command}"; then
    echo "Unknown command \"${command}\" for master service. Aborting"
    return 1
  fi

  if ! systemctl --host="sgadm@ha-peer" "${command}" "${SERVICE_MASTER}"; then
    log "Could not ${command} master service"
    return 1
  fi

  log "Master service ${command} was successfully executed"
}

# restart_service
function restart_service() {
  log "Restarting SASG service \"${SASG_SERVICE}\""
  systemctl restart "${SASG_SERVICE}"
  sleep 30
}

# is_service_started
function is_service_started() {
  local vars_file="/sasg/clients/${CLIENT}/vars"
  local current_vip="$(grep "^IP=" "/sasg/clients/${CLIENT}/.env" | cut -d"=" -f2)"
  local sasfw_vpn_ip
  local sasfw_vpn_port

  source "${vars_file}"

  for (( sasg_index=0; sasg_index<${#SASG_VIP1[*]}; sasg_index++ )); do
    [[ "${SASG_VIP1[${sasg_index}]}" == "${current_vip}" ]] && break
  done
  log "Location index: ${sasg_index}"

  sasfw_vpn_port="${VTUN_PORT[$sasg_index]:-1194}"
            
  if [[ "${sasg_index}" == "0" ]]; then
    sasfw_vpn_ip="${PUBLIC_VYOS_IP}"
  else
    sasfw_vpn_ip="$(echo "${PORTABLE_VTUN_CIDR[${sasg_index}]}" | cut -d"/" -f1)"
  fi
            
  if [[ -n "${HTTPS_PROXY}"  ]]; then
    log "Testing SASG health reaching ${sasfw_vpn_ip}:${sasfw_vpn_port} via ${HTTPS_PROXY}:${HTTPS_PROXY_PORT}..."
    if ! "${CONTAINER_CMD}" exec "${SASG_CONTAINER_NAME}" \
          curl \
            --max-time 60 \
            -k \
            "http://${sasfw_vpn_ip}:${sasfw_vpn_port}" \
            --proxy "http://${HTTPS_PROXY}:${HTTPS_PROXY_PORT}" \
            2>/dev/null \
          | egrep -iq "connection refused|zero sized reply" \
    ; then
      log "Connection unsuccessful"
      return 1
    fi

    log "Connection successful"
    return 0
  fi

  log "Testing SASG health reaching ${sasfw_vpn_ip}:${sasfw_vpn_port} 3 times..."
  for i in {1..3}; do
    log "Attempt ${i}..."
    if nc -v -w1 -i1 "${sasfw_vpn_ip}" "${sasfw_vpn_port}" 2>&1 \
      | egrep -iq "connected|connection refused|succeeded" \
    ; then
      log "Connection successful"
      return 0
    fi
    log "Connection unsuccessful"
    sleep 10
  done

  log "Could not connect"
  return 1
}

# backout_upgrade
function backout_upgrade() {
  local env_file="/sasg/clients/${CLIENT}/.env"

  log "Restoring original environment file from backup"
  if ! mv --force "/sasg/clients/${CLIENT}/.env.bak" "/sasg/clients/${CLIENT}/.env"; then
    "Could not restore environment file"
  fi

  log "Images versions after backout:"
  log "$(grep -e "^SASGC_VERSION=" -e "^CHECKER_VERSION=" "${env_file}")"
}

function main() {

  init_log

  set_container_runtime_vars

  set_python_interpreter

  is_upgrade_needed || return

  notify "start"

  import_images

  is_upgrade_possible || { notify "failure" && return; }

  set_images || { notify "failure" && return; }

  manage_remote_slave "stop" || { notify "failure" && return; }

  restart_service
  
  if is_service_started; then
    notify "success"
    manage_remote_master "start"
    return
  fi

  backout_upgrade

  restart_service

  manage_remote_slave "start"

  notify "failure"

}

while true; do
  main "$*"
  sleep $(( 15 * 60 ))
done