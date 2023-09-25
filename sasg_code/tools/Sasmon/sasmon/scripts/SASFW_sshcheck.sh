#!/bin/bash
#
# Simple script to run on sasfw to check sshd_config & if ListenAddress is not
# set to the private ip then change it and restart sshd.  Copy old file back and
# restart sshd if there are any errors..log a msg in /sasg/logs so mist can 
# pick up the err and generate an alert
#
# History - orig - 22may2019 - SBraun
# ===============================================================================================
RUNINTERVAL=300  # Run every five minutes
#RUNINTERVAL=60  # Run every minute
#RUNINTERVAL=0  # Run every minute
source /sasg/bin/sasmon/sasmon.common
ALERTMSG=""
ALERTNAME="sshd_issue"
WARNMSG=""
WARNNAME="sshd_issue"

THIS=$(/usr/sbin/ip addr show dev eth0 |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/'|head -1)
SHNAME=`hostname -s`

LISTEN=$(sudo cat /etc/ssh/sshd_config|grep "ListenAddress"|grep -v "^#")
if [ -z "$LISTEN" ];then
  DATE=$(date +"%d%m%Y")
  sudo su - root -c "cp -p /etc/ssh/sshd_config /etc/ssh/sshd_config.${DATE}"
  if [ "$?" -ne 0 ];then
    MSG="Failed backing up sshd_config prior to updating ListenAddress- manual intervention required!"
    echo "$MSG"
    LOGALERT "ERROR" "$ALERTNAME" "$MSG"
  else
    sudo sed --in-place "s/^#ListenAddress 0.0.0.0/ListenAddress ${THIS}/g" /etc/ssh/sshd_config
    if [ "$?" -ne 0 ];then
      sudo su - root -c "cp -p /etc/ssh/sshd_config.${DATE} /etc/ssh/sshd_config"
      MSG="Failed changing ListenAddress in sshd_config - original sshd_config restored and no sshd restart done - manual intervention required!"
      echo "$MSG"
      LOGALERT "ERROR" "$ALERTNAME" "$MSG"
    else
      sudo systemctl restart sshd
      if [ "$?" -ne 0 ];then
        sudo su - root -c "cp -p /etc/ssh/sshd_config.${DATE} /etc/ssh/sshd_config"
        sudo systemctl restart sshd
        MSG="Error on sshd restart after updating ListenAddress in sshd_config - original sshd_config restored and sshd restarted - manual update of ListenAddress <private_ip> required!"
        echo "$MSG"
        LOGALERT "ERROR" "$ALERTNAME" "$MSG"
      else
        SSHFILE=(sudo cat /etc/ssh/sshd_config)
        echo "Update of sshd_config successful, original: /etc/ssh/sshd_config.${DATE}"
        CLEARALERT "ERROR" "$ALERTNAME"
      fi
    fi
  fi

else
  echo "ListenAddress already set in sshd_config"
  CLEARALERT "ERROR" "$ALERTNAME"
fi
