#!/bin/bash

source /sasg/bin/sasg_common.sh
keepalived_status=`ps aux | grep "/usr/sbin/keepalived" | grep -v grep`
openvpn_status=`ps aux | grep "${SAS_CONFIG} --config client.conf" | grep -v grep`

#If Keepalived service is dead and OpenVPN session for VyOS is UP then script will kill the session     
 if [ -z "$keepalived_status" ] && [ ! -z "$openvpn_status" ] 
 then
    echo "$DATE: Killing VyOS OpenVPN session as Keepalived Service is down" >> $keepalive_log_file
    ps aux|grep "${SAS_CONFIG}"|grep "config client.conf"|grep -v grep | awk '{print $2}'|xargs kill -9
    
 fi

# set permissions on sasg logs and directories - should be set by sasg install and logrotate but covers 
# inadvertant ownership/permission changes from affecting automate id access to sasg logs (compliance requirement).
chmod 755 /sasg
chmod -R 755 /sasg/logs
