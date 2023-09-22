#!/bin/bash
#
# Simple script to scp the sasmon installer script to each server listed in an ip list & run it to install/update 
# sasmon on the server.
# parallel -P10 ./GetSasdata.sh < iplist
# to start 10 instances of GetSasdata.sh reading from list of IP addresses to run against (iplist)
#
# expects input to be either single ip or ip followed by space then SHNAME of the server.
#

if [ -z "$1" ];then
  echo -e "\nUSAGE:  $0 <ip to run against>\n"
  exit 1
fi

IP=$(echo "$1"|awk '{print $1}')
SHNAME=$(echo "$1"|awk '{print $2}'|cut -f1 -d'.')
TOP="/home/sasauto/Tools/reporting"
SCRIPT2RUN="sasmon.sh"
THISSCRIPT=$(basename $0)


if [ -f "$LOG" ];then
  mv $LOG ${LOG}.prev
fi

LOG(){
   echo -e "$1"
}

USEPORT=2222
DATE=$(date +%Y_%m_%d_%H:%M:%S)
LOG "$DATE,$THISSCRIPT,Copying $SCRIPT2RUN to $IP:$SHNAME"
scp -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o BatchMode=yes -P $USEPORT ${TOP}/${SCRIPT2RUN} sasauto@$IP:/tmp/${SCRIPT2RUN}
RET=$?
if [ "$RET" -eq 255 ];then
  # try again but with port 22
  USEPORT=22
  LOG "connection failed on port 2222, trying port 22"
  scp -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o BatchMode=yes -P $USEPORT ${TOP}/${SCRIPT2RUN} sasauto@$IP:/tmp/${SCRIPT2RUN}
  if [ "$?" -ne 0 ];then
    LOG "ERROR,$SHNAME,$IP,scp_failed"
    exit 1
  fi
elif [ "$RET" -ne 0 ];then
  LOG "ERROR,$SHNAME,$IP,scp_failed"
  exit 1
fi


# if we get here then scp was good, now try to run the self-extracting executable to install sasmon
DATE=$(date +%Y_%m_%d_%H:%M:%S)
LOG "$DATE,$THISSCRIPT,Executing $SCRIPT2RUN on $IP:$SHNAME"
ssh -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o BatchMode=yes -p $USEPORT sasauto@$IP "/tmp/${SCRIPT2RUN}"

