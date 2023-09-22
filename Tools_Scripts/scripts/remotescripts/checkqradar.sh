#!/bin/bash
# show err if qradar /etc/ssl/certs/qradar-syslog-tls.cert cert file doesn't exist
# ===============================================================================================
SHNAME=`hostname -s`
THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/')

CERTFILE="/etc/ssl/certs/qradar-syslog-tls.cert"
CERTFILELS=$(ls -l $CERTFILE)
if [[ -f "$CERTFILE" ]];then
  echo -e "\nSUCCESS,$SHNAME,$THIS,$CERTFILELS"
else
  CERTFILELS=$(ls -l /etc/ssl/certs)
  echo -e "\nERROR,$SHNAME,$THIS,$CERTFILELS"
fi

