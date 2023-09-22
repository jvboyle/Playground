#!/bin/bash


# Simple script that can be run on sasfw or any tools server to check if running ipset / iptables
# dumps output in csv format
# ===============================================================================================
SHNAME=`hostname -s`
THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/')
SUCCESS="true" # default flag set at start - if any one test changes this to false then log ERROR for svr

ROOTUSED=$(df -h  |grep -w "/"|awk '{printf("%s",$5)}')
IPSETSTATE=$(sudo systemctl status ipset|grep "Active: "|awk '{print $2}')
IPSETENABLED=$(sudo systemctl status ipset|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
IPSETVALIDATE=$(sudo ls -tr /sasg/backup/ipset*|tail -1)
IPSETCURRCFG=$(sudo ls -l /etc/sysconfig/ipset|awk '{for(i=5;i<=NF;i++){printf("%s ",$i)}}'|tr ' ' '_')

IPTABLESSTATE=$(sudo systemctl status iptables|grep "Active: "|awk '{print $2}')
IPTABLESENABLED=$(sudo systemctl status iptables|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
IPTABLESVALIDATE=$(sudo ls -tr /sasg/backup/iptab*|tail -1)

echo $SHNAME|grep -qi "\-sasfw|\-vyos"
if [ "$?" -eq 0 ];then
  IPTABMATCH="SASFW_FW_"
else
  IPTABMATCH="SL_SERVICES"
fi

# Columns:
# Success/Error, Short Hostname, IP, Ipset Active, Ipset Enabled, Iptables Active, Iptables Enabled, SAS Iptables Running, Root Filesys %Used, Current Ipset Cfg File, Ipset Validate File, Iptables Validate File
[[ -z "$IPSETVALIDATE" ]] && IPSETVALIDATE="None"
[[ -z "$IPTABLESVALIDATE" ]] && IPTABLESVALIDATE="None"

# if iptables is up & we see our config string, mark as success though could also 
sudo iptables -L |grep -q "$IPTABMATCH"
if [ "$?" -ne 0 ];then
  SUCCESS="false"
fi

if [ "$IPSETSTATE" != "active" -o "$IPSETENABLED" != "enabled" ];then
  SUCCESS="false"
fi
if [ "$IPTABLESSTATE" != "active" -o "$IPTABLESENABLED" != "enabled" ];then
  SUCCESS="false"
fi

IPSETCURRCFGSZ=$(sudo ls -l /etc/sysconfig/ipset|awk '{print $5}')
if [ "$IPSETCURRCFGSZ" -eq 0 ];then
  SUCCESS="false"
fi

if [ "$SUCCESS" == "true" ];then
  echo -e "\nSUCCESS,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE"
else
  echo -e "\nERROR,$SHNAME,$THIS,$IPSETSTATE,$IPSETENABLED,$IPTABLESSTATE,$IPTABLESENABLED,$ROOTUSED,$IPSETCURRCFG,$IPSETVALIDATE,$IPTABLESVALIDATE"
fi
