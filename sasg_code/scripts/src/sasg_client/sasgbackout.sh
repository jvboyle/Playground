#!/bin/bash
# Description: Restore iptables, keepalived, vpn configs from sasg backup.
# Author: Stan Braun
# Standalone Usage: Run as root
# History:
#    2017.06.09 - Original script.
#    2017.09.13 - v2.6 - deleted rm of config files so if we restore & are on JH+, we don't wipe out ipcenter vpn configs
######################################################################################

SASGDIR="/sasg"
SASGBKPS="$SASGDIR/backup"

WHO=$(id -u)
if [ "$WHO" -ne 0 ];then
  echo -e "\nYou must run this script as root\n"
  exit 1
fi

echo -e "\n###################################################################################"
echo -e "\nThis utility simplifies restoring the SASG iptables, keepalived, vpn (ipsec/openvpn)"
echo -e "configuration from a previous backup.\nAre you sure you want to do this ? <n>"
read RESP
if [ "$RESP" != "y" ];then
  echo -e "\nNo changes made.  Exiting...\n"
  exit 0
fi


echo -e "\nRestore most recent (r) backup or select a file (s) ? <r>"
read RESP

# grab most recent 10 backups
BKPFILES=($(ls -t $SASGBKPS | head -10))

if [ "$RESP" == "s" ];then
  echo -e "\n--------------------------------------------------------"
  for ((INDEX=0; INDEX<${#BKPFILES[@]}; INDEX++))
  do
   echo -e "$INDEX  - ${BKPFILES[$INDEX]}"
  done
  echo -e "\n--------------------------------------------------------"

  BKPFILECOUNT=$(( ${#BKPFILES[@]} - 1 ))
  echo -e "\nPlease select a file (0 - $BKPFILECOUNT) from the list above"
  read SELECTED
  echo -e "\nYou selected $RESP - ${BKPFILES[$SELECTED]}"
else
  # just pick most recent backup.
  SELECTED=0
  echo -e "\nMost recent backup file - ${BKPFILES[$SELECTED]}"
fi


  echo -e "\n*****************************************************"
  echo -e "Are you sure you wish to remove all current SASG "
  echo -e "VPN, iptables, keepalived configuration files and"
  echo -e "restore from backup file:\n\t ${BKPFILES[$SELECTED]}\n ? <n>"
  echo -e "\n*****************************************************"
  read RESP
  if [ "$RESP" != "y" ];then
    echo -e "\nexiting without changes."
    exit 0
  fi


#  echo "\nRemoving any existing configuration files..."
#  rm -f /etc/keepalived/*
#  rm -rf /etc/openvpn
#  rm -f /etc/ipsec.conf
#  rm -f /etc/ipsec.secrets
#  rm -f /etc/sysconfig/iptables
#  rm -f /usr/libexec/keepalived/master-backup.sh
#  rm -f /var/lib/keepalived/keepalived.conf
#  rm -f /var/lib/keepalived/COUNTER
  # get any current cronjobs running that stat keepalived & remove them.
  echo "\nRemoving any existing sasg cron entries but keeping any others that might exist..."
  crontab -l |grep -v "/sasg/bin" > /tmp/root.cron
  crontab /tmp/root.cron
  #now remove this temp crontab file
  rm -f /tmp/root.cron

  # note - this restore script expects all config files to be backed up with relative path names
  # starting from /  but without the /  - hence have to have -C /    flag on tar command to extract 
  tar -zxvf ${SASGBKPS}/${BKPFILES[$SELECTED]} -C /
  if [ "$?" -ne 0 ];then
    echo "\nError restoring"
    exit 1
  else
    echo "\nFiles restore successfully ..."
    if [ -s "/tmp/root.cron" ];then
      echo "\nfound previous sasg cron entries - appending to existing crontab entries"
      crontab -l >/tmp/cron.new
      cat /tmp/root.cron >>/tmp/cron.new
      crontab /tmp/cron.new
      rm -f /tmp/cron.new /tmp/root.cron
    fi
    echo -e "\nManual restart of iptables & keepalived required."
    exit 0
  fi

