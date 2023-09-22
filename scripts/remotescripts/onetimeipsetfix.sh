#!/bin/bash

# Simple script to add bpm admin port 9043 to accts at sas code < v4.11 which have a bpm svr.
# **ONLY A ONE TIME RUN **
#
# if sas version != 4.11
# if cebw/bpm has 9043 in running BPM_ADMIN_PORT ipset list, don't add/do anything
# if doesn't have the port in running ipset list then add to BPM_ADMIN_PORT in running
# ipset list & save to /etc/sysconfig/ipset
#
# History:  04FEB2019 - original script - SBraun
# ===============================================================================================
SHNAME=`hostname -s`
THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/')


#double check version - if not version starting with 4.  log err & exit
cat /sasg/bin/VERSION|grep -q "^4\."
if [ "$?" -ne 0 ];then
  echo -e "\nERROR,$SHNAME,$THIS,Not version 4"
  exit
fi


sudo ipset list BPM_ADMIN_PORT |grep 9043
if [ "$?" -ne 0 ];then
  DATE=`date +"%F_%H%M%S"`
  sudo su - root -c "cp -p /etc/sysconfig/ipset /etc/sysconfig/ipset.${DATE}"

  echo "port 9043 not found in BPM_ADMIN_PORT ipset list..adding..."
  sudo ipset add BPM_ADMIN_PORT 9043
  if [ "$?" -ne 0 ];then
     echo -e "\nERROR,$SHNAME,$THIS,failed adding 9043 to BPM_ADMIN_PORT"
  else
    sudo su - root -c "sudo ipset save >/etc/sysconfig/ipset"
    if [ "$?" -ne 0 ];then
       echo -e "\nERROR,$SHNAME,$THIS,failed saving runtime ipset config."
    else
       echo -e "\nSUCCESS,$SHNAME,$THIS,BPM_ADMIN_PORT ipset list updated"
    fi
  fi
else
  echo -e "\nSUCCESS,$SHNAME,$THIS,BPM_ADMIN_PORT ipset list already contained port 9043..no change made."
fi
