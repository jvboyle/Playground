#!/bin/bash


# Simple script to check if docker0 interface is set to 4.0.0* ip or 172* default ip
# ===============================================================================================
SHNAME=`hostname -s`
THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/')
SUCCESS="true" # default flag set at start - if any one test changes this to false then log ERROR for svr

ROOTUSED=$(df -h  |grep -w "/"|awk '{printf("%s",$5)}')
/usr/sbin/ip addr show dev docker0 >/dev/null
if [ "$?" -ne 0 ];then
   rpm -qa|grep -qi "docker-ce"
   if [ "$?" -ne 0 ];then
       echo -e "ERROR,$SHNAME,$THIS,Docker_Not_Installed"
   else
       #docker installed but no docker0 interface found
       echo -e "ERROR,$SHNAME,$THIS,Docker_Installed_No_docker0_interface_found"
   fi
   exit 0
fi

DOCKADDR=$(/usr/sbin/ip addr show dev docker0|grep -w inet |awk '{print $2}')
DOCKOCT1=$(echo "$DOCKADDR"|cut -f1 -d'.')
if [ "$DOCKOCT1" != "4" ];then
  echo -e "ERROR,$SHNAME,$THIS,$DOCKADDR"
else
  echo -e "SUCCESS,$SHNAME,$THIS,$DOCKADDR"
fi
