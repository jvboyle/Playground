#!/bin/bash

#simple script to save off root cronjob & comment out the sla_daily_run.sh on bpm & vyos's

THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/'|head -1)
SHNAME=`hostname -s`

TMPCRON="/tmp/rootcrontab"
[[ -f "$TMPCRON" ]] && mv $TMPCRON ${TMPCRON}.prev

sudo crontab -l | while read LINE
do
  echo "$LINE" | grep -w "sla_daily_run.sh" |grep -q "^[0-9]"
  if [ "$?" -eq 0 ];then
      echo "$LINE"|sed "s/^/#/g" >>$TMPCRON
  else
      echo "$LINE" >>$TMPCRON
   fi
done

echo -e "loading new root crontab with sla_daily_run.sh commented out..."
sudo su - root -c "crontab $TMPCRON"
if [ "$?" -ne 0 ];then
  echo -e "\nERROR,$SHNAME,$THIS,error updating root crontab."
else
  echo -e "\nSUCCESS,$SHNAME,$THIS,updated root crontab."
fi
