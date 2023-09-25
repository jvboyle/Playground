#!/bin/bash
#
# Description:
#    Simple script to check status of openvpn process and static route - if openvpn
#    not running, restart.  If route not added, re-add.   Set to run in infinite loop
#    so checks can be done faster than every minute that cron allows.   Started via
#    simple script run from cron which first checks if the script is already running &
#    if so, exits so as not to start multiple instances.
#
# History:
#    7-aug-2017: Initial script - sbraun@us.ibm.com
#
#---------------------------------------------------------------------------------
source /sasg/bin/sasg_common.sh

#---------------------------------------------------------------------------------
    
SLEEP="30"  # secs between openvpn checks
LONGSLEEP="300" # long retry if openvpn restart doesnt work - avoid fast respawn
LOGDIR="/sasg/logs"
LOG="${LOGDIR}/tlsmon.log"
#---------------------------------------------------------------------------------

if [ ! -d ${LOGDIR} ];then
  mkdir -p $LOGDIR
  chmod 754 $LOGDIR
fi

log(){
  TOLOG=$1
  DATE=$(date +"%F_%T")
  #echo "$DATE - $TOLOG" >> $LOG
  echo "$DATE - $TOLOG" |tee -a $LOG
}

log "$0 - initial openvpn monitor script startup..."
  
# infinite loop to monitor openvpn
while (true)
do
  for conf_file in $(ls ${SAS_CONFIG} |  egrep "server_vtun[0-9]{1,}.conf")
  do
      OPS="/usr/sbin/openvpn --config ${SAS_CONFIG}/$conf_file --log-append ${SAS_VPNLOG_DIR}/sasvpn01"
      ps -ef|grep -v grep |grep -q "$OPS"
      if [ $? -ne 0 ];then
         # openvpn process not found - restart
         # if we get an err on start, sleep for long duration to avoid trying to restart
         # openvpn too often
         log "openvpn process $conf_file not found...restarting."
         RET=$($OPS &)
      fi
  done 
  sleep $LONGSLEEP
  #check to make sure openvpn really started & is still up
  for conf_file in $(ls ${SAS_CONFIG} |  egrep "server_vtun[0-9]{1,}.conf")
  do
     OPS="/usr/sbin/openvpn --config ${SAS_CONFIG}/$conf_file --log-append ${SAS_VPNLOG_DIR}/sasvpn01"
     RET=$(ps -ef|grep -v grep |grep "$OPS")
     if [ $? -ne 0 ];then
        log "Restarted openvpn $conf_file but process down again immediately after..sleeping $SLEEP seconds and will retry."
     else
        log "openvpn $conf_file started: $RET"
     fi
  done 
  # sleep for defined time
  sleep $SLEEP
done
