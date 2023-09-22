#!/bin/bash

# Simple script to fix iptables/ipset errors and restart containers - 
# **ONLY A ONE TIME RUN AGAINST SERVER LIST WHERE THERE WERE ERRORS NOTED by the CheckIptables.sh !!!!  ***
#
# Does have checks however so if run against a server where all is fine, it'll exit with a success
# & show iptables status, ipset status, etc & indicate nothing was restarted.
#
# This script does the following:
# if root filesys percent used=100%  exit with err
# if /etc/sysconfig/ipset size=0
#      if have backup, copy backup to normal config, update MANAGEMENT_SEGMENT to add .236 vrrp ip if needed.
#      if no backup - exit with err
# if /etc/sysconfig/ipset size > 0 don't overwrite with a backup
#
# stop iptables then ipset
# set ipset and iptables services to enabled so they start on reboot
# start ipset - log err & exit if start fails
# start iptables - log err & exit if start fails
# 
# do another check of MANAGMENT_SEGMENT ipset list & add .236 vrrp ip if not there using ipset add command in case existing
# config wasn't updated properly
# restart docker containers
# double check ipset & iptables state - make sure still active, if not exit with err.
# run systemctl restart docker  - log err & exit if start failed
# if start ok, check runtime nat tables (iptables -t nat -L) for to:4.0.0* ips - if not there
#   exit with possible err
# if 4.0.0 container nats exist, log success.
#
# History:  15NOV2018 - original script - SBraun
# ===============================================================================================
SHNAME=`hostname -s`
THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/')
SUCCESS="true" # default flag set at start - if any one test changes this to false then log ERROR for svr

ROOTUSED=$(df -h  |grep -w "/"|awk '{printf("%s",$5)}'|sed "s/%//g")
IPSETSTATE=$(sudo systemctl status ipset|grep "Active: "|awk '{print $2}')
IPSETENABLED=$(sudo systemctl status ipset|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
IPSETVALIDATE=$(sudo ls -tr /sasg/backup/ipset*|tail -1)
IPSETCURRCFG=$(sudo ls -l /etc/sysconfig/ipset|awk '{for(i=5;i<=NF;i++){printf("%s ",$i)}}'|tr ' ' '_')
IPSETCURRCFGSZ=$(sudo ls -l /etc/sysconfig/ipset|awk '{print $5}')

IPTABLESSTATE=$(sudo systemctl status iptables|grep "Active: "|awk '{print $2}')
IPTABLESENABLED=$(sudo systemctl status iptables|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
IPTABLESVALIDATE=$(sudo ls -tr /sasg/backup/iptab*|tail -1)

echo $SHNAME|grep -qi "\-sasfw|\-vyos"
if [ "$?" -eq 0 ];then
  IPTABMATCH="SASFW_FW_"
else
  IPTABMATCH="SL_SERVICES"
fi
# do quick check in case some server sneaks in that everything is working on:
ALERTMSG=""
sudo iptables -L |grep -q "$IPTABMATCH"
if [ "$?" -ne 0 ];then
  ALERTMSG="${ALERTMSG};IPTABMATCH"
fi
if [ "$IPSETSTATE" != "active" ];then
  ALERTMSG="${ALERTMSG};Ipset not active"
fi

if [ "$IPTABLESSTATE" != "active" ];then
  ALERTMSG="${ALERTMSG};Iptables not active"
fi

if [ "$IPSETENABLED" != "enabled" ];then
  ALERTMSG="${ALERTMSG};Ipset not enabled"
fi

if [ "$IPTABLESENABLED" != "enabled" ];then
  ALERTMSG="${ALERTMSG};Iptables not enabled"
fi

if [ "$IPSETCURRCFGSZ" -eq 0 ];then
  ALERTMSG="${ALERTMSG};Ipset zero length cfg"
fi
if [ -z "$ALERTMSG" ];then
  # no err here - mark as success & no changes/restarts done
  echo -e "\nSUCCESS,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,No issues found on this server - no ipset/iptables/docker changes or restarts done."
  exit 0
fi


# if no filesys space, just exit - manual intervention required
if [ "$ROOTUSED" -eq 100 ];then
  echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,Manual Intervention Required Due to Disk Space"
  exit 1
fi


# check ipset config - if 0 length then copy over validate file
if [ "$IPSETCURRCFGSZ" -eq 0 ];then
  #if no backup ipset file then exit with err
  if [ -z "$IPSETVALIDATE" ];then
    IPSETVALIDATE="None"
    echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,Manual Intervention Required -No Ipset Config Backup"
    exit 1
  fi
  echo "Current ipset config size zero <$IPSETCURRCFGSZ>, copying over most recent backup file."
  echo "checking if backup ipset file has new 10.149.99.236 vrrp ip"
  sudo grep "MANAGEMENT_SEGMENT 10.149.99.236" $IPSETVALIDATE
  if [ "$?" -ne 0 ];then
    echo "updating management segment list to .236 ip"
    sudo su - root -c "cat $IPSETVALIDATE | sed \"s/MANAGEMENT_SEGMENT 10.149.99.238/MANAGEMENT_SEGMENT 10.149.99.236/g\" > /etc/sysconfig/ipset"
   
  else
    echo "MANAGEMENT_SEGMENT 10.149.99.236 found in backup ipset file ... just copying over."
    sudo cp $IPSETVALIDATE /etc/sysconfig/ipset
  fi
  sudo chmod 640 /etc/sysconfig/ipset
else
  echo "Current ipset config size wasnt zero <$IPSETCURRCFGSZ>, NOT copying over backup file."
fi

# 

# we're here because we know we had iptables/ipset issues so now just top iptables, ipset,
# start back up ipset - if ok, start iptables, if ok restart docker.
echo -e "Stopping iptables ..."
sudo systemctl stop iptables
echo -e "Stopping ipset .."
sudo systemctl stop ipset

echo -e "Setting ipset and iptables to enabled state so they start on reboot."
sudo systemctl enable ipset
sudo systemctl enable iptables

echo -e "Starting ipset and iptables"
RET=$(sudo systemctl start ipset 2>&1)
if [ "$?" -ne 0 ];then
  NEWRET=$(echo "$RET" | sed "s/,/_/g" | sed "s//_/g")
  echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,Manual Intervention Required - ipset start failed with <$NEWRET>"
  exit 1
fi
RET=$(sudo systemctl start iptables 2>&1)
if [ "$?" -ne 0 ];then
  NEWRET=$(echo "$RET" | sed "s/,/_/g" | sed "s//_/g")
  echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,Manual Intervention Required - iptables start failed with <$NEWRET>"
  exit 1
fi
RET=$(sudo ipset list MANAGEMENT_SEGMENT |grep "10.149.99.236")
if [ -z "$RET" ];then
  echo "MANAGEMENT_SEGMENT 10.149.99.236 not found in new running ipset list..running ipset add MANAGEMENT_SEGMENT 10.149.99.236"
  sudo ipset add MANAGEMENT_SEGMENT 10.149.99.236
  if [ "$?" -ne 0 ];then
    echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,Manual Intervention Required - error trying to add MANAGEMENT_SEGMENT 10.149.99.236 to ipset list."
    exit 1
  else
    echo "ipset add ok..now saving new config."
    sudo su - root -c "sudo ipset save >/etc/sysconfig/ipset"
  fi
fi
    
# so if we get here, means we set ipset & iptables state to enabled, copied in a backup ipset config if needed, 
# now double check ipset MANAGEMENT_SEGMENT ipset list & make sure NA .236 ip is added

# now double check ipset state, iptables state - make sure both are enabled & our SAS string found in iptables output
# if all's good, then restart docker containers.

IPSETSTATE=$(sudo systemctl status ipset|grep "Active: "|awk '{print $2}')
IPSETENABLED=$(sudo systemctl status ipset|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
IPTABLESSTATE=$(sudo systemctl status iptables|grep "Active: "|awk '{print $2}')
IPTABLESENABLED=$(sudo systemctl status iptables|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
IPSETCURRCFG=$(sudo ls -l /etc/sysconfig/ipset|awk '{for(i=5;i<=NF;i++){printf("%s ",$i)}}'|tr ' ' '_')

if [ "$IPSETSTATE" != "active" -o "$IPTABLESSTATE" != "active" ];then
  # exit out - should not get in here since we shouldve exited if previous svc start failed
  echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,services had started without err but are down again -manual intervention required"
  exit 1
fi

#if we get here, should be good to restart docker
echo -e "$SHNAME $IP - Running sudo systemctl restart docker"
RET=$(sudo systemctl restart docker 2>&1)
if [ "$?" -ne 0 ];then
  echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,error on docker restart: <$RET>"
  exit 1
fi

# if we get here - means we should be good - now check iptables nat list - make sure 4.x nats are there.
NATS=$(sudo iptables -t nat -L |grep "to.4.0.0")
if [ -z "$NATS" ];then
  echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,Docker service restarted without error but no dynamic NATs found for 4.0.0.x container IPs. Possible issue?"
  exit 1
else
  echo -e "\nSUCCESS,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE,Docker service restarted without error and NATs for 4.0.0.x container IPs found."
  exit 0
fi

