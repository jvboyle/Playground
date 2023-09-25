#!/bin/bash
#VERSION:1.1
LOG="/sasg/logs/sasmon.log"
SCRIPTDIR="/sasg/bin/sasmon/scripts"
LASTRUN="/sasg/bin/sasmon/.lastrun"
SHNAME=`hostname -s`
SLEEPTIME=60  # sleep time between run of each monitor script

# on initial startup, clear all last run data for each monitor so everything will run initially
# if system was rebooted or sasmon service was restarted
rm -f ${LASTRUN}/*

# set monitor script prefix we'll be running besides the ones that are generic & should be run on every box
echo "$SHNAME"|egrep -qi "\-sasfw|\-vyos"
[[ "$?" -eq 0 ]] && SDSTYPE="SASFW"

echo "$SHNAME"|egrep -q "\-ee|\-cebw"
[[ "$?" -eq 0 ]] && SDSTYPE="EE"

echo "$SHNAME"|grep -q "\-rcp-bpm"
[[ "$?" -eq 0 ]] && SDSTYPE="RCP-BPM"

echo "$SHNAME"|grep -q "\-rcp-ror"
[[ "$?" -eq 0 ]] && SDSTYPE="RCP-ROR"

echo "$SHNAME"|grep -q "\-rcp-proxy"
[[ "$?" -eq 0 ]] && SDSTYPE="RCP-PROXY"

echo "$SHNAME"|grep -q "\-chef"
[[ "$?" -eq 0 ]] && SDSTYPE="CHEF"

echo "$SHNAME"|grep -q "\-bpm-" | grep -v "rcp-"
[[ "$?" -eq 0 ]] && SDSTYPE="BPM"

echo "$SHNAME"|grep -q "\-asb"
[[ "$?" -eq 0 ]] && SDSTYPE="ASB"


while(true)
do

  SASGBINCHECK=$(sudo ls -ld /sasg/bin | grep root)
  if [[ ! -z "$SASGBINCHECK" ]];then
    echo -e "/sasg/bin ownership incorrect, updating to sasauto.sasauto" >>$LOG
    sudo chown -R sasauto.sasauto /sasg/bin
    sudo chmod -R 754 /sasg/bin
    sudo chmod 755 /sasg
  else
    echo -e "/sasg/bin ownership correct." >>$LOG
  fi

  TORUN=$(ls $SCRIPTDIR/ALL_* 2>/dev/null)
  if [ ! -z "$TORUN" ];then
    for MON in ${TORUN}
    do
      echo $(date +%Y_%m_%d_%H:%M:%S)": running $MON" >>$LOG
      $MON >> $LOG 2>&1
    done
  fi
  # run all the monitors that are specific for the server we're running on - ie EE_, RCP_, SASFW_ ...
  TORUN=$(ls $SCRIPTDIR/${SDSTYPE}_* 2>/dev/null)
  if [ ! -z "$TORUN" ];then
    for MON in ${TORUN}
    do
      echo $(date +%Y_%m_%d_%H:%M:%S)": running $MON" >>$LOG
      $MON >> $LOG 2>&1
    done
  fi
  
  sleep $SLEEPTIME

  # check log we write to - if over 500Mb, rotate to .prev
  LOGSZ=$(stat $LOG|grep -i "Size:"|awk '{print $2}')
  if [ "$LOGSZ" -gt 500000000 ];then
    mv $LOG $LOG.prev
  fi
done

