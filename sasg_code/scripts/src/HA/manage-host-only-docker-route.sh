#!/bin/bash

readonly CLIENT="${1}"
readonly OPERATION="${2}"

readonly CLIENT_PATH="/sasg/clients/${CLIENT}"
readonly COMPOSE_ENV_FILE=".env"

function route_present() {
  local route="$1"

  ip route | grep --quiet "${route}"

  return $?
}

function route_add() {
  local route="$1"

  ip route add ${route}

  return $?
}

function route_remove() {
  local route="$1"

  ip route del ${route}

  return $?
}

# --- Neccessary checks -------------------
  if [[ ! -d "${CLIENT_PATH}" ]]; then
    echo "Path to client \"${CLIENT_PATH}\" was not found. Pls ensure initialization is correct"
    exit 1
  fi
  if [[ ! -f "${CLIENT_PATH}/${COMPOSE_ENV_FILE}" ]]; then
    echo "Docker compose env file \"${CLIENT_PATH}/${COMPOSE_ENV_FILE}\" was not found"
    exit 1
  fi
# ----------------------------------------

# Getting values from compose env file ---
source "${CLIENT_PATH}/${COMPOSE_ENV_FILE}"
CONTAINER_IP="${IP}" 
CONTAINER_IP_IAMaaS="${IP_IAMaaS}"
CONTAINER_HOST_ONLY_GW="${HOST_ONLY_GW}"
# ----------------------------------------

ROUTE="${CONTAINER_IP} via ${CONTAINER_HOST_ONLY_GW}"
ROUTE_IAMaaS="${CONTAINER_IP_IAMaaS} via ${CONTAINER_HOST_ONLY_GW}"
case "${OPERATION}" in
  "del")
    echo "Removing route \"${ROUTE}\""
    if route_present "${ROUTE}"; then
      if ! route_remove "${ROUTE}"; then
        echo "Could not remove ip route: ${ROUTE}"
        exit 1
      fi
    else
      echo "Route \"${ROUTE}\" is not present"
    fi
    # --- IAMaaS ---
    if [[ -n "${CONTAINER_IP_IAMaaS}" ]]; then
      echo "Removing route \"${ROUTE_IAMaaS}\""
      if route_present "${ROUTE_IAMaaS}"; then
        if ! route_remove "${ROUTE_IAMaaS}"; then
          echo "Could not remove ip route: ${ROUTE_IAMaaS}"
          exit 1
        fi
      else
        echo "Route \"${ROUTE_IAMaaS}\" is not present"
      fi
    fi
    ;;
  "add")
    echo "Adding route \"${ROUTE}\""
    if ! route_present "${ROUTE}"; then
      if ! route_add "${ROUTE}"; then
        echo "Could not add ip route: ${ROUTE}"
        exit 1
      fi
    else
      echo "Route \"${ROUTE}\" is already present"
    fi
    # --- IAMaaS ---
    if [[ -n "${CONTAINER_IP_IAMaaS}" ]]; then
      echo "Adding route \"${ROUTE_IAMaaS}\""
      if ! route_present "${ROUTE_IAMaaS}"; then
        if ! route_add "${ROUTE_IAMaaS}"; then
          echo "Could not add ip route: ${ROUTE_IAMaaS}"
          exit 1
        fi
      else
        echo "Route \"${ROUTE_IAMaaS}\" is already present"
      fi
    fi
    ;;
  *)
    echo "Unknown operation requested: \"${OPERATION}\""
    exit 1
  ;;
esac
