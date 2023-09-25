#!/bin/bash
#
# Description:
#    Simple script to check status of ipsec process and restart via systemctl if down
#    Set to run in infinite loop so checks can be done faster than every minute that cron allows.
#    Started via simple script run from cron which first checks if the script is already running &
#    if so, exits so as not to start multiple instances.
#
# History:
#    1-nov-2017: Initial script - SBraun - modified tlsmon.sh
#    12-feb-2018: SBraun - modified for bandwidth limiting.
#
#---------------------------------------------------------------------------------

#---------------------------------------------------------------------------------
source /sasg/bin/sasg_common.sh
    
SLEEP="30"  # secs between openvpn checks
LONGSLEEP="120" # long retry if openvpn restart doesnt work - avoid fast respawn
LOGDIR="/sasg/logs"
LOG="${LOGDIR}/ipsecmon.log"
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

log "$0 - initial ipsec monitor script startup..."
  
# infinite loop to monitor ipsec
while (true)
do
  # don't even try to start ipsec unless we see one of our sitesX.conf files
  SITES=$(ls $SAS_IPSECCONF_DIR/*.conf|wc -l | awk '{print $1}')
  if [ $SITES -ge 1 ];then
   IPSECSTATUS=$(systemctl status ipsec |grep "active (running)")
   if [ -z "$IPSECSTATUS" ];then
     # not in running status - issue restart
     systemctl restart ipsec
     log "ipsec service restarted via: systemctl restart ipsec"
   else
     VTISTATUS=$(/sbin/ip link|grep ": vti0")
     if [ ! -z "$VTISTATUS" ];then
     # ipsec running & have vti tunnel - check if traffic control is set if we have a config for it
       if [ -f "${SAS_CONFIG}/tc_vti0.conf" ];then
         qdisc=$(/sbin/tc qdisc show dev vti0|grep "noqueue 0")
         if [ ! -z "$qdisc" ];then
           log "IPSec running but no tc set, calling BwSetup.sh vti0 ..."
           ${SAS_BIN}/BwSetup.sh vti0
         else
           log "IPSec running, vti device defined, tc_vti0.conf found & tc qdisc show dev vti0 shows a config."
           sleep $LONGSLEEP
         fi
       fi
     fi

   fi
   sleep $SLEEP

  fi
done
