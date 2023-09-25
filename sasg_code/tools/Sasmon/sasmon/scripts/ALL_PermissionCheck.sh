#!/bin/bash
#
# Simple script that can be run on sasfw or any tools server to set /sasg
# permissions properly
#
# History - orig - 29apr2019 - SBraun
# ===============================================================================================
RUNINTERVAL=300  # Run every 5 min.  Note - RUNINTERVAL must come before sourcing in sasmon.common!

source /sasg/bin/sasmon/sasmon.common

# since we run on every box, add chown & chmod here to ensure permissions are still correct on /sasg, /sasg/bin, /sasg/logs
sudo chown -R ${SASID}.${SASID} /sasg
sudo chmod -R 755 /sasg
sudo chown -R ${SASID}.${SASID} /sasg/bin
sudo chmod -R 754 /sasg/bin
sudo chmod 755 /sasg/bin
echo "$SHNAME"|egrep -qi "\-sasfw|\-vyos"
[[ "$?" -eq 0 ]] && sudo chmod 755 /sasg/bin/sasfwcheck
sudo chown -R ${SASID}.${SASID} /sasg/logs
sudo chmod -R 754 /sasg/logs
sudo chmod 755 /sasg/logs
if [ -d "/sasg/logs/VPN" ];then
  sudo chmod 755 /sasg/logs/VPN
fi

