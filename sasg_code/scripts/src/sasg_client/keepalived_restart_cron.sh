#!/bin/bash

source /sasg/bin/sasg_common.sh

keepalived_status=`ps aux | grep "/usr/sbin/keepalived" | grep -v grep`
keepalived_status_ctl=`$STATUS_KEEPALIVED | egrep -i "inactive|stopped|dead"`

#If Keepalived service is dead then trying to start it every 5 min
if [ -z "$keepalived_status" ];then
  echo "$DATE: Trying to bring up Keepalived service" >> $keepalive_log_file
  $START_KEEPALIVED
fi

if [ ! -z "$keepalived_status" ] && [ ! -z "$keepalived_status_ctl" ];then
  echo "$DATE: Trying to bring up Keepalived service" >> $keepalive_log_file
  $RESTART_KEEPALIVED
fi
