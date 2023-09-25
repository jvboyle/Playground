#!/bin/bash
#
# Simple script to configure ip6tables on an SDS to drop all ipv6 packets inbound & outbound
# History:  11/15/18 - SBraun - orig script
#
# ===============================================================================================
SHNAME=`hostname -s`
THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/')
SUCCESS="true" # default flag set at start - if any one test changes this to false then log ERROR for svr


IP6TABLESSTATE=$(sudo systemctl status ip6tables|grep "Active: "|awk '{print $2}')
IP6TABLESENABLED=$(sudo systemctl status ip6tables|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")

# Success/Error, Short Hostname, IP, Ipset Active, Ipset Enabled, Iptables Active, Iptables Enabled, SAS Iptables Running, Root Filesys %Used, Current Ipset Cfg File, Ipset Validate File, Iptables Validate File

# check if ip6tables filter table shows any policies with ALLOW - if so 
# do filter table clear, set filters, restart ip6tables service

RET=$(sudo ip6tables -L |grep "policy ACCEPT")
if [ ! -z "$RET" ];then
  NEWRET=$(echo "$RET" | sed "s/^M/_/g")
  echo "$SHNAME $IP - one or more policies set to accept ($NEWRET)"
  echo "$SHNAME $IP - updating ip6tables filter rules."
  sudo ip6tables -F
  sudo ip6tables --policy INPUT DROP
  sudo ip6tables --policy FORWARD DROP
  sudo ip6tables --policy OUTPUT DROP
  sudo su - root -c "ip6tables-save > /etc/sysconfig/ip6tables"
  sudo systemctl enable ip6tables
  sudo systemctl restart ip6tables

else
  # just check that ip6tables service is runing & enabled
  if [ "$IP6TABLESSTATE" != "active" ];then
    echo "$SHNAME $IP - ip6tables service not active...starting."
    sudo systemctl start ip6tables
  fi
  if [ "$IP6TABLESENABLED" != "enabled" ];then
    echo "$SHNAME $IP - ip6tables service not set to enabled on reboot...updating.."
    sudo systemctl enable ip6tables
  fi
fi

# run through checks again to make sure all looks good - if so log success otherwise err.
ALERT=""
IP6TABLESSTATE=$(sudo systemctl status ip6tables|grep "Active: "|awk '{print $2}')
IP6TABLESENABLED=$(sudo systemctl status ip6tables|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
RET=$(sudo ip6tables -L |grep "policy ACCEPT")
if [ ! -z "$RET" ];then
  NEWRET=$(echo "$RET" | sed "s/^M/_/g")
  ALERT="Policie(s) set to ACCEPT: $NEWRET"
fi
if [ "$IP6TABLESSTATE" != "active" ];then
  ALERT="$ALERT;ip6tables not active"
fi
if [ "$IP6TABLESENABLED" != "enabled" ];then
  ALERT="$ALERT;ip6tables not enabled"
fi

if [ -z "$ALERT" ];then
  echo -e "\nSUCCESS,$SHNAME,$THIS,$IP6TABLESSTATE,$IP6TABLESENABLED"
  exit 0
else
  echo -e "\nERROR,$SHNAME,$THIS,$IP6TABLESSTATE,$IP6TABLESENABLED"
  exit 1
fi

