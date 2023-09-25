#!/bin/sh

if [ -z "${CLIENT_NAME}" ]; then
  echo "Environment variable \"CLIENT_NAME\" is not set. Aborting..."
  exit 1
fi

# Run every hour by default
CRON="* */1 * * *"
[ -n "${CUSTOM_CRON}" ] && CRON="${CUSTOM_CRON}"

echo "PARAMS:"
echo "* Client name:  \"${CLIENT_NAME}\""
echo "* Cron value:   \"${CRON}\""

# Run once to rotate/upload on start
/root/logrotate.sh

mkdir -p "/var/spool/cron/crontabs"
echo "${CRON} /root/logrotate.sh" | crontab - | crond -f -L /tmp/cron.out
