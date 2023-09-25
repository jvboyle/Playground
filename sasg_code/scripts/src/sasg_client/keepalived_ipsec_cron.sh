#!/bin/bash

source /sasg/bin/sasg_common.sh

#Initializing the current statuses for Keepalived and OpenVPN services
ipsec_status=`ps aux | grep /usr/libexec/ipsec/pluto | grep -v grep`
keepalived_status=`ps aux | grep "/usr/sbin/keepalived" | grep -v grep`

#If Keepalived service is dead and IPSec session for VyOS is UP then script will kill the session 
if [ -z "$keepalived_status" ] && [ ! -z "$ipsec_status" ];then
  echo "$DATE: Stopping IPSEC service as Keepalived Service is down" >> $keepalive_log_file
  $STOP_IPSEC
fi
