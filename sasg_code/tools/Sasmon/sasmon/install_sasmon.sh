#!/bin/bash

# simple installer to create /sasg/bin/sasmon dir if not there, copy over all monitoring scripts, check if 
# sasmon service file is same as one in current dir, if not, overwrite it & restart sasmon service.

TOP="/sasg"
MONTOP="${TOP}/bin/sasmon"
LOGTOP="${TOP}/logs"
LOG="${LOGTOP}/sasmon.log"
SVCNAME="sasmon.service"
OLDSVCDIR="/etc/systemd/system"
SVCDIR="/usr/lib/systemd/system"
PWD=$(pwd)
THISSCRIPT=$(basename $0)
THIS=$(/usr/sbin/ip addr show dev eth0 |grep "inet "|awk '{print $2}'|cut -f1 -d'/')
LASTRUNDIR="/sasg/bin/sasmon/.lastrun"
SHNAME=$(hostname -s)

LOG(){
  DATE=$(date +%Y_%m_%d_%H:%M:%S)
  echo -e "$1" |tee -a $LOG
  if [ "$?" -ne 0 ];then
    # set permissions on log dir & try again
    sudo chown -R sasauto.sasauto $LOGTOP
    sudo chmod -R 754 $LOGTOP
    echo -e "$1" |tee -a $LOG
  fi
}

CheckOldSasmon(){
  if [ -f "/etc/systemd/system/sasmon.service" ];then
    LOG "Found old /etc/systemd/system/sasmon.service...removing."
    sudo systemctl stop sasmon.service
    sudo systemctl disable sasmon.service
    sudo rm -f /etc/systemd/system/sasmon.service
  fi

} # CheckOldSasmon(){

StartSasmon(){
    sudo systemctl enable sasmon 2>&1
    RET=$(sudo systemctl start sasmon 2>&1)
    if [ "$?" -ne 0 ];then
      LOG "ERROR: Problem starting sasmon - $RET"
      exit 2
    else
      # double check - if script errs out or permissions are bad, systemctl returns ok from start
      # but later status can show something like activating (auto-restart)
      RET=$(sudo systemctl status sasmon|grep "Active: active" 2>&1)
      if [ "$?" -eq 0 ];then
        RET=$(ps -ef|grep -v grep|grep "${MONTOP}/sasmon.sh")
        LOG "SUCCESS,$SHNAME,$THIS,sasmon started: $RET"
        exit 0
      else
        LOG "ERROR,$SHNAME,$THIS,sasmon start failed: $RET"
        exit 2
      fi
    fi
}

StopSasmon(){
   sudo systemctl disable sasmon 2>&1
   sudo systemctl stop sasmon 2>&1
   RET=$(ps -ef|grep -v grep|grep "${MONTOP}/sasmon.sh")
   if [ ! -z "$RET" ];then
     LOG "problem stopping sasmon: $RET"
   else
     LOG "sasmon stopped."
   fi
} # StopSasmon()

if [ ! -f "$PWD/sasmon.version" ];then
  SASMONVER="unknown"
else
  SASMONVER=$(cat $PWD/sasmon.version)
fi
LOG "$THISSCRIPT - Starting sasmon install, version: $SASMONVER"

sudo chown -R sasauto.sasauto $TOP
if [ ! -d "$LOGTOP" ];then
  sudo mkdir -p $LOGTOP
  LOG "$LOGTOP did not exist...created."
fi
if [ ! -d "$MONTOP" ];then
  LOG "$MONTOP did not exist...created."
  mkdir -p $MONTOP
fi

diff ${PWD}/sasmon.version $MONTOP/sasmon.version >/dev/null 2>&1
if [ "$?" -eq 0 ];then

  LOG "sasmon.version in new code same as existing $MONTOP/sasmon.version...skipping install"
  RET=$(sudo systemctl status sasmon|grep "Active: active" 2>&1)
  if [ "$?" -eq 0 ];then
    LOG "SUCCESS,$SHNAME,$THIS,no version change; no new code installed; service already running."
    exit 0
  else
    LOG "sasmon service not running; making sure ownership and permissions are correct & attempting start."
    chmod -R 754 $MONTOP
    StartSasmon
  fi
else
  # check if old /etc/systemd/system/sasmon.service file exists, if so stop sasmon, delete
  CheckOldSasmon
fi 

LOG "copying sasmon code, setting ownership & permissions..."
# only copy over specific scripts to TOP dir
cp sasmon.common $MONTOP
cp sasmon.service $MONTOP
cp sasmon.version $MONTOP
cp sasmon.sh $MONTOP
cp README.sasmon $MONTOP
cp -r ./scripts $MONTOP
chmod -R 754 $MONTOP
# copied over new scripts, check if LASTDIR exists then remove any files in there
if [ -d "$LASTRUNDIR" ];then
  LOG "clearing any files in $LASTRUNDIR so monitors will run again without delay."
  rm -f ${LASTRUNDIR}/* >/dev/null 2>&1
fi

CopyNewSvcFile(){
  RET=$(sudo su - root -c "cp ${MONTOP}/${SVCNAME} $SVCDIR;chown root.root ${SVCDIR}/${SVCNAME};chmod 755 ${SVCDIR}/${SVCNAME}")
  if [ "$?" -ne 0 ];then
    LOG "Error copying $SVCNAME to $SVCDIR and setting permissions. - $RET"
  else
    RET=$(sudo su - root -c "ls -l ${SVCDIR}/${SVCNAME} 2>&1")
    LOG "$SVCNAME file copied: $RET"

    # stop and restart the service if the service is already running since we've alredy copied over
    # sasmon.sh, even if it hasn't changed, systemd will detect a change & will show warning:
    # Warning: sasmon.service changed on disk. Run 'systemctl daemon-reload' to reload units.
    # so just stop & start the service (not restart) then the error will clear.
    RET=$(sudo systemctl status sasmon|grep "Active: active" 2>&1)
    if [ "$?" -eq 0 ];then
       StopSasmon
    fi
    StartSasmon
  fi #if [ "$?" -ne 0 ];

} # CopyNewSvcFile(){


RET=$(sudo su - root -c "ls -l ${SVCDIR}/${SVCNAME} 2>&1")
if [ "$?" -eq 0 ];then
  LOG "$SVCNAME already exists: $RET"
  # do diff on service file in place vs what we have - if different copy new one into place
  sudo /usr/bin/diff ${SVCDIR}/${SVCNAME} ${MONTOP}/${SVCNAME} >/dev/null 2>&1
  if [ "$?" -ne 0 ];then
    # stop sasmon before changing the service file
    StopSasmon
    LOG "$SVCNAME different than what's installed in $SVCDIR, copying $SVCDIR/$SVCNAME to $MONTOP/$SVCNAME.prev"
    sudo cp ${SVCDIR}/${SVCNAME} ${MONTOP}/${SVCNAME}.prev
    CopyNewSvcFile
  else
    LOG "$SVCNAME already exists and is unchanged from this build..just checking restarting sasmon service and checking status."
    sudo systemctl restart sasmon
    RET=$(sudo systemctl status sasmon|grep "Active: active" 2>&1)
    if [ "$?" -eq 0 ];then
      RET=$(ps -ef|grep -v grep|grep "${MONTOP}/sasmon.sh")
      LOG "SUCCESS,$SHNAME,$THIS,Install complete; sasmon service already running - $RET"
      exit 0
    else
      LOG "sasmon service not running, attempting start."
      StartSasmon
    fi
    

  fi
else
  LOG "$SVCNAME not found, adding..."
  CopyNewSvcFile

fi #if [ "$?" -ne 0 ];then
