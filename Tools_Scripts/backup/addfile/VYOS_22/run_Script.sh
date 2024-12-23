#!/bin/bash

# Generic script to run against list of ip's in a devices.csv file ouput by SoftLayer & run a simple script against each
# takes name of .csv file as first arg
#
# S Braun - 14MAR2017
#

THISSCRIPT=`basename $0`

if [[ -z $1 || $# -lt 2 ]];then
  echo -e "\nRun a script or list of commands in a file against a list of server IP's via ssh & &  automate id."
  echo -e "\nUSAGE:\n\t$THISSCRIPT <devices.csv> <file with commands to run>"
  echo -e "\n\t**Note - expects std devices.csv export format from SoftLayer interface:"
  echo -e "\t  \"Device Name\",\"Device Type\",Location,\"Public IP\",\"Private IP\",\"Start Date\",Username,Password,Notes,\"Active Transaction\""
  echo -e "\n\t**Note 2 - If it doesn't see this first line then assume it's just a file\n\t  with a list of IP's one IP per line, lines starting with # & blank lines ignored.\n"
  exit 1
fi 

CDS_IP_LIST="$1"
SCRIPT2RUN="$2"
DATE=`date +"%F_%T"`
LOG="./${THISSCRIPT}_${DATE}.log"
SSHFAILLOG="./${THISSCRIPT}_${DATE}.sshfail_log"
#USEPORT=2222  # set default port to try each time to 2222
USEPORT=22

if [[ -f $LOG ]];then
  echo "copying $LOG to $LOG.prev"
  mv $LOG $LOG.prev
fi


main(){

grep -q "\"Device Name\",\"Device Type\",Location,\"Public IP\",\"Private IP\"" $CDS_IP_LIST
if [[ $? -ne 0 ]];then
  # assume we just have a list of IP's, one IP per line.
  cat $CDS_IP_LIST|egrep -v "^$|#" >${CDS_IP_LIST}.temp
else
  # assume we just have a devices.csv from Softlayer with the right format & private ip in 5th column
  cat $CDS_IP_LIST|egrep -v "^$|#|Device Name" | awk -F',' '{print $5}' >${CDS_IP_LIST}.temp
fi

  for IP in `cat ${CDS_IP_LIST}.temp`
  do
    echo -e "\n---------------------------------------- $IP ----------------------------------------------------------\n"
    ssh -oStrictHostKeyChecking=no -p $USEPORT automate@$IP "bash -s" < $SCRIPT2RUN
    RET=$?
    if [[ $RET -ne 0 ]];then
      if [[ $RET -eq 255 ]];then
        echo -e "\nERROR - $IP ssh on port $USEPORT failed!" | tee -a $SSHFAILLOG
      else
        echo -e "\nERROR - $IP - $SCRIPT2RUN failure - manual intervention required." 
      fi
    fi
    echo -e "\n-------------------------------------------------------------------------------------------------------\n"
  done

} #main()

main 2>&1 | tee $LOG

rm -f ${CDS_IP_LIST}.temp
echo -e "\nDone..all output stored in:\n\t   $LOG \n"
echo -e "\nSSH Failures stored in:\n\t   $SSHFAILLOG \n"
