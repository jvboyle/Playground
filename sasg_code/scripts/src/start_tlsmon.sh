#!/bin/bash
#
# Simple script to be run via cron - starts up openvpn monitor script if not already
# running - prevents multiple instances.
# 
# cron example:
#  */5 * * * * /sasg/bin/start_tlsmon.sh &>/dev/null
#

TOSTART="/sasg/bin/tlsmon.sh"

ps -ef|grep -v grep|grep -qw "bash $TOSTART"
if [ $? -ne 0 ];then
  nohup ${TOSTART} &
fi
exit 0
