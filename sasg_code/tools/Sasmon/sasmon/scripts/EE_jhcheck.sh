#!/bin/bash
#
# Simple script to be run on EE servers to nc to any jumphosts listed in the
# /home/sasauto/Puller/sasg_serverlist on the ee server
#
# only alert if we fail on the 2nd check.
#
# History - orig - 09Nov2018 - SBraun
# ===============================================================================================
RUNINTERVAL=300  # Run every 5 min
source /sasg/bin/sasmon/sasmon.common

TMPERR="/sasg/logs/temp.jhnetcat"

# fix to only count lines with ip addresses not line with just port num
JHCOUNT=$(cat $SERVERLIST |egrep -v "^$|^#"|grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}"|wc -l|awk '{print $1}')
if [ $JHCOUNT -gt 0 ];then
  
  JHIPS=$(cat $SERVERLIST|egrep -v "^$|^#"|awk '{printf("%s;",$2)}'|sed "s/;$//")
  for JH in `echo "$JHIPS"|sed "s/;/ /g"`
  do
#      ping -c1 -W2 $JH  >/dev/null 2>&1
      nc -v -i2 -w2 $JH 22 2>&1 | grep -i "Connected to"
      if [ "$?" -ne 0 ];then
        JHNCFAIL="$JHNCFAIL;$JH"
      fi
   done

  if [ -z "$JHNCFAIL" ];then
    # if no errs connecting to jumphosts, clear any error & temp error files
    CLEARALERT "ERROR" "jhnetcat"
    rm -f $TMPERR
  else
    if [ -f "$TMPERR" ];then
       # already have a temp file so error from last check & this check - write error file
       #get rid of any leading semicolons in case only one JH configured
       rm -f $TMPERR
       JHNCFAIL=$(echo "$JHNCFAIL"|sed "s/^;//g")
       LOGALERT "ERROR" "jhnetcat" "NC Failed to port 22 on jumphost(s): $JHNCFAIL"
       LOG "Netcat failed to port 22 on jumphost(s): $JHNCFAIL"
    else
      # no temp err file but we have new alerts - write temp err file so we can alert on next check
      echo "NC Failed to port 22 on jumphost(s): $JHNCFAIL" > $TMPERR
    fi
  fi
fi
