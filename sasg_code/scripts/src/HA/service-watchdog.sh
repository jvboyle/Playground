#!/bin/bash
# 
# Watches for HA-related services and restart them if needed

readonly SASG_CLIENTS_ROOT="/sasg/clients"
readonly SYSTEMD_LOG_APP_NAME="sasg-service-watcher"
readonly WATCHER_CHECK_INTERVAL=$(( 20 ))

#######################################
# Add a record under some identifier to journald log
# Globals:
#   SYSTEMD_LOG_APP_NAME - journald identifier for log message
# Arguments:
#   None
# Returns:
#   None
#######################################
function log() {
  echo "$*" | systemd-cat --identifier="${SYSTEMD_LOG_APP_NAME}"
}

cd /sasg/bin/

#######################################
# Identify systemd unit (i.e. service) to watch
# Globals:
#   SASG_CLIENTS_ROOT - root folder for all SASG folders
#   IS_MASTER - current service is HA master
# Arguments:
#   $1 - script's input line to parse for unit info
# Returns:
#   STDIN - outputs name of the systemd unit
#   0 - service was successfully identified
#   1 - service could not be properly identified
#######################################
function get_service_to_watch() {
  local input_line="$1"
  local customer="$(echo "${input_line}" | cut -f1 -d".")"
  local service="$(echo "${input_line}" | cut -f2 -d".")"
  local systemd_unit

  case "${service}" in
    "master") systemd_unit="sgha@${customer}.service";;
    "slave") systemd_unit="sgha-slave@${customer}.service";;
    "resiliency") systemd_unit="sgha-resilient@${customer}.service";;
    *)
      log "Service type "${service}" is not supported"
      return 1;;
  esac

  if ! ls "${SASG_CLIENTS_ROOT}" | grep -q "${customer}"; then
    log "Could not find customer ${customer}. Aborting"
    return 1
  fi

  echo "${systemd_unit}"
  return 0
}

#######################################
# Identify the SASFW Public VPN IP address and Port number
# Globals:
#   SASG_LOCATION_NUMBER - The number of the location (in case if there are many)
#   PUBLIC_SASFW_IP - Public IP address of VPN service on SASFW side allocated for this location (in case if there are many)
#   SASFW_VPN_PORT  - Port number of VPN service on SASFW side allocated for this location (in case if there are many)
# Arguments:
#   no arguments
# Returns:
#   STDIN - outputs the location, OpenVPN IP address and port on SASFW side for this location
#######################################

function get_sasfw_ip_port() {

  cd "/sasg/bin/"
  source "/sasg/clients/${customer}/vars"

  SASG_LOCATION_NUMBER=`cat /sasg/clients/${customer}/vars | grep ${DOCKER_HOST} | grep -v -i docker_host | cut -d "=" -f1 | cut -d"_" -f3 | cut -d "[" -f2 | sed -e 's/]//g'`
   
  if [ -z ${VTUN_PORT[$SASG_LOCATION_NUMBER]} ]; then
    SASFW_VPN_PORT=1194
  else
    SASFW_VPN_PORT=${VTUN_PORT[$SASG_LOCATION_NUMBER]}
  fi
         
  if [ "${SASG_LOCATION_NUMBER}" == "0" ]; then
    PUBLIC_SASFW_IP=${PUBLIC_VYOS_IP}
  else  
    PUBLIC_SASFW_IP=`echo ${PORTABLE_VTUN_CIDR[${SASG_LOCATION_NUMBER}]} | cut -d"/" -f1`
  fi
            
}


#######################################
# Checks if service is active
# Globals:
#   None
# Arguments:
#   $1 - service to check
# Returns:
#   0 - service is started
#   1 - service is not started
#######################################
function is_active_service() {
  local service="$1"
  local service_status

  # Checking is service is active
  if ! service_status="$(systemctl is-active "${service}")"; then
    log "Activity check shows that service "${service}" is in status "${service_status}""
    return 1
  fi

  # Testing service's status output
  if ! systemctl status "${service}" | grep -q "Active: active (running)"; then
    log "Could not ensure service "${service}" is fully active"
    return 1
  fi    

}

#######################################
# Checks if another JHP is available
# Globals:
#   JHP_SSH_RESPONSE - ssh reply when doing the checking agains the other JHP box
# Arguments:
#   $1 - service to check
# Returns:
#   0 - the other JHP box is reachable
#   1 - the other JHP box is not reachable
#######################################
function is_other_jhp_available() {
  local i

  log "Checking SSH connection against the other JHP box"
    #Checking SSH connection for another JHP box 3 times in a row with a sleep interval of 5 seconds.
  i=1
  while [ $i -le 3 ]
  do
    JHP_SSH_RESPONSE="$(nc -v -w1 -i1 ha-peer 22 2>&1 | egrep -i "connected")"
    i=$(( i+1 ))
    sleep 5
  done

  if [[  -z "${JHP_SSH_RESPONSE}"  ]]; then
    return 1
  fi
  
  log "SSH connection for other JHP box is fine"
  return 0
  
}

#######################################
# Checks if connection with SASFW is UP
# Globals:
#   SASFW_RESPONSE - OpenVPN service reply from SASFW.
#   i - used for loops
# Arguments:
#   $1 - customer
# Returns:
#   0 - connection is up
#   1 - connection is down
#######################################
function is_sasfw_connection_up() {
  local customer="$1"
  local container_id="$(podman ps -q --filter "ancestor=sasg_build")"

  cd "/sasg/clients/${customer}"
  source ./vars

  if [[ -n "${HTTPS_PROXY}"  ]]; then
    log "Checking OpenVPN flows against SASFW using curl as this account has Proxy server"
    SASFW_RESPONSE="$(\
      podman exec "${container_id}" \
        curl \
          --max-time 60 \
          --retry 2 \
          -k \
          "http://${PUBLIC_SASFW_IP}:${SASFW_VPN_PORT}" \
          --proxy "http://${HTTPS_PROXY}:${HTTPS_PROXY_PORT}" \
          2>&1 \
      | egrep -i "connection refused|zero sized reply|The requested URL could not be retrieved|サーバへの接続に失敗しました|サーバーから応答がありません" \
    )"

  else
   
  log "Checking OpenVPN flows against SASFW with netcat, as this account doesn't have a Proxy server"
  
    #Checking OpenVPN connection 3 times in a row with a sleep of 10 seconds.
    for i in {1..3}; do
      SASFW_RESPONSE="$(podman exec "${container_id}" \
        nc -v -w1 -i1 "${PUBLIC_SASFW_IP}" "${SASFW_VPN_PORT}" 2>&1 \
        | egrep -i "connected|connection refused|succeeded")"
      sleep 10
    done
  fi

  if [[  -z "${SASFW_RESPONSE}"  ]]; then
    return 1
  fi
   
  log "OpenVPN flows are UP."
  return 0
}

#######################################
# Script's entrypoint
# Globals:
#   WATCHER_CHECK_INTERVAL - amount of seconds to wait between checks
# Arguments:
#   $1 - input line in format: <CUSTOMER>.<SERVICE_TYPE>
# Returns:
#   None
#######################################
function main() {
  local input_line=$1
  local customer="$(echo "${input_line}" | cut -f1 -d".")"
  local service_type="$(echo "${input_line}" | cut -f2 -d".")"

  if ! service="$(get_service_to_watch "${input_line}")"; then
    log "Could not parse input ${input_line} to get required values. Aborting"
    exit 1
  fi

  log "Starting to watch service ${service}"

  while true; do
    sleep ${WATCHER_CHECK_INTERVAL}

    if ! is_active_service "${service}"; then
      log "Starting service ${service}"
      systemctl start "${service}"
      continue
    fi
    
    if [[ "${service_type}" == "master" ]]; then
      # We're here only if the service is up but not the tunnel. Something is wrong, hence we're
      # bringing it down to allow slave to take over (it will check VIP via ping and will become
      # master when the current service is down)
      
      get_sasfw_ip_port
      
      is_sasfw_connection_up "${customer}"
      is_sasfw_connection_up_result="$?"

      is_other_jhp_available
      is_jhp_available_result="$?"

      if [[ "${is_sasfw_connection_up_result}" != "0" ]] && [[ "${is_jhp_available_result}" == "0" ]]; then
        log "OpenVPN flows against SASFW are down and other JHP is reachable through SSH. Bringing service "${service}" down to switch to another machine"
        systemctl stop "${service}"
        exit
      elif [[ "${is_sasfw_connection_up_result}" != "0" ]] && [[ "${is_jhp_available_result}" != "0" ]]; then
        log "OpenVPN flows against SASFW are down and other JHP is not reachable. Not bringing down the "${service}" because the other one is down"
      else
        log "OpenVPN flows on SASFW is UP other JHP is reachable through SSH. Nothing to be done"
      fi
    fi
  done
}

main "$@"
