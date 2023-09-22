#!/bin/bash
#
# Simple script to be run by RunScript.sh
# Add bpm mgmt port 9043 to ipset list on bpm servers that were upgraded and don't already
# have this port set in the running ipset list.  Prevents having to upgrade all existing
# accts < v4.11 to the version 4.11 code to get this port.
#
if [ -z "$1" ];then
  echo -e "\nUSAGE:  $0 <ip to run against>\n"
  exit 1
fi

IP=$(echo "$1"|awk '{print $1}')
SHNAME=$(echo "$1"|awk '{print $2}'|cut -f1 -d'.')
TOP="/home/sasauto/Tools/reporting/scripts/remotescripts"
SCRIPT2RUN="onetimeipsetfix.sh"
THISSCRIPT=$(basename $0)


if [ -f "$LOG" ];then
  mv $LOG ${LOG}.prev
fi

LOG(){
   echo -e "$1"
}

USEPORT=2222
DATE=$(date +%Y_%m_%d_%H:%M:%S)
LOG "$DATE,$THISSCRIPT,Running $SCRIPT2RUN on $IP:$SHNAME"
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o BatchMode=yes -p $USEPORT sasauto@$IP "bash -s" <${TOP}/${SCRIPT2RUN}
RET=$?
if [ "$RET" -eq 255 ];then
  # try again but with port 22
  USEPORT=22
  LOG "connection failed on port 2222, trying port 22"
  ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o BatchMode=yes -p $USEPORT sasauto@$IP "bash -s" <${TOP}/${SCRIPT2RUN}
  if [ "$?" -ne 0 ];then
    LOG "ERROR,$SHNAME,$IP,ssh_failed to both 22 and 2222"
    exit 1
  fi
elif [ "$RET" -ne 0 ];then
  LOG "ERROR,$SHNAME,$IP,ssh_failed with $RET"
  exit 1
fi


