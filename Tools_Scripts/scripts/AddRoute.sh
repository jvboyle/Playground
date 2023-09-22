#!/bin/bash
#
# Simple script to be run by RunScript.sh
# run remotescripts/add_route.sh on the ip passed - should only be run on tools servers, asb, bpm,chef, ee, rcp-bpm, rcp-ror, rcp-proxy
# adds route(s) to ip/subnets listed in NEW_SUBNETS array in the script. Typically a one-time run to fix an issue on multiple tools
# servers with missing routes, ie to add a route to a new portable subnet needed by all tools servers for a specific geo.
# expects input to be either single ip or ip followed by space then SHNAME of the server.
#
if [ -z "$1" ];then
  echo -e "\nUSAGE:  $0 <ip to run against>\n"
  exit 1
fi

IP=$(echo "$1"|awk '{print $1}')
SHNAME=$(echo "$1"|awk '{print $2}'|cut -f1 -d'.')
FHNAME=$(echo "$1"|awk '{print $2}')
TOP="/home/sasauto/Tools/reporting/scripts/remotescripts"
SCRIPT2RUN="add_route.sh"
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
    LOG "ERROR,$SHNAME,$IP,ssh_failed on both port 2222 and 22"
    exit 1
  fi
fi


