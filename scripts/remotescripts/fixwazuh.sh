#!/bin/bash
# fix wazuh permissions / restart services.
# ===============================================================================================
SHNAME=`hostname -s`
THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/')

AP="10.118.186.137"
EU="10.175.10.79"
NA="10.148.11.166"
GEO_MGMT="$NA"

sudo /var/ossec/bin/ossec-control stop
sudo chown -R root:ossec /var/ossec
if [ "$?" -ne 0 ];then
  echo -e "\nERROR,$SHNAME,$THIS,failed changing ownership on /var/ossec..exiting."
  exit 1
fi
sudo chmod -R 770 /var/ossec
sudo /var/ossec/bin/ossec-control start
STAT=$(sudo /var/ossec/bin/ossec-control status  |grep -i "not running")
if [ ! -z "$STAT" ];then
  echo -e "\nERROR,$SHNAME,$THIS,one or more ossec systems not running - $STAT"
else
  
  echo -e "\nSUCCESS,$SHNAME,$THIS,wazuh restarted and all processes running."
fi
