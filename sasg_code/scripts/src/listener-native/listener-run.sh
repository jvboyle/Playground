#!/bin/bash

export LISTENER_ROOT="/sasg/listener/uploads"
export LISTENER_SYSTEMD_UNIT="sasg-listener"
CUR_DIR="$(dirname "$0")"
SLEEP_SECONDS="$(( 10 * 60 ))"

function log() {
  echo "$*" | systemd-cat -t "${LISTENER_SYSTEMD_UNIT^^}"
}

function main() {
  mkdir -p "${LISTENER_ROOT}"
  while true; do
    sleep ${SLEEP_SECONDS}

    "${CUR_DIR}/analyze-configs.sh"
    "${CUR_DIR}/write-logs.sh"
  done
}

main "$@"