#!/bin/bash

DFILE="/sasg/logs/sasdata.xml"

if [ -f "$DFILE" ];then
  if [ -s "$DFILE" ];then
    cat $DFILE
  else
    THIS=$(sudo cat /etc/sysconfig/network-scripts/ifcfg-eth0 |grep -w IPADDR|awk -F'=' '{printf("%s\n",$2)}'|head -1)
    if [ -z "$THIS" ];then
      THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/'|head -1)
    fi
    HNAME=$(hostname)
    echo -e "<server id=\"$THIS\">\n   <fqdn>$HNAME</fqdn>\n   <sasversion>BlankFile: $DFILE</sasversion>\n</server>"
  fi
else
  THIS=$(sudo cat /etc/sysconfig/network-scripts/ifcfg-eth0 |grep -w IPADDR|awk -F'=' '{printf("%s\n",$2)}'|head -1)
  if [ -z "$THIS" ];then
    THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/'|head -1)
  fi
  HNAME=$(hostname)
  echo -e "<server id=\"$THIS\">\n   <fqdn>$HNAME</fqdn>\n   <sasversion>FileNotFound: $DFILE</sasversion>\n</server>"
fi
