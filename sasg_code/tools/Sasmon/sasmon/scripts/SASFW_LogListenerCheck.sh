#!/bin/bash
#
# Simple script to run on sasfw to check vpn (if configured) to Jumphosts & to IAM Vyattas
#
# History - orig - 24apr2019 - SBraun
#                - 26jul2019 - added check & enabling of service
# ===============================================================================================
RUNINTERVAL=300  # Run every five minutes
#RUNINTERVAL=60  # Run every minute
#RUNINTERVAL=0  # Run every minute
source /sasg/bin/sasmon/sasmon.common
ALERTMSG=""
ALERTNAME="loglistener"
MAXCHECKS=2 # max times vpn check can fail before generating alert file for MIST
VARS="/sasg/configs/client/vars"
SERVICE_NAME="sasg-listener.service"
LISTENER_SERVICE="/usr/lib/systemd/system/${SERVICE_NAME}"

# if log listener service isn't installed on this sasfw, just exit.
if [ ! -f "$LISTENER_SERVICE" ];then
  LOG "$SERVICE_NAME not configured on this server, exiting."
  exit 0
fi

#set -x  # for debug

LISTENER_STATE=$(sudo systemctl is-active $SERVICE_NAME)
LISTENER_ENABLED=$(sudo systemctl is-enabled $SERVICE_NAME)

if [ "$LISTENER_ENABLED" != "enabled" ];then
   LOG "$SERVICE_NAME not enabled, enabling service."
   sudo systemctl enable $SERVICE_NAME
fi


if [ "$LISTENER_STATE" != "active" ];then
   LOG "$SERVICE_NAME not active.... restarting."
   sudo systemctl start $SERVICE_NAME
   sleep 2
   LISTENER_STATE=$(sudo systemctl is-active $SERVICE_NAME)
   if [ "$LISTENER_STATE" != "active" ];then
      LOGALERT "ERROR" "$ALERTNAME" "$SHNAME $THIS: $SERVICE_NAME not active, restart attempt failed."
      ALERTMSG="${ALERTMSG};$SERVICE_NAME not active"
   else
      LOG "$SERVICE_NAME restarted and now active."
      CLEARALERT "ERROR" "$ALERTNAME"
   fi
else
      LOG "$SERVICE_NAME service is active."
      CLEARALERT "ERROR" "$ALERTNAME"
fi
