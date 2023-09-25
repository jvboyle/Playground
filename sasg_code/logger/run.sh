#!/bin/sh

LOG_FILE="/sasg-logs/log.out"

mkdir -p "$(dirname "${LOG_FILE}")"
touch "${LOG_FILE}"
tail -f "${LOG_FILE}"
