#!/bin/bash

# Generic script to run against list of ip's in a devices.csv file ouput by SoftLayer & run a simple script against each
# takes name of .csv file as first arg
#
# S Braun - 14MAR2017
#

THISSCRIPT=`basename $0`

if [[ -z $1 || $# -lt 2 ]];then
  echo -e "\nRun a script or list of commands in a file against a list of server IP's via ssh & &  sasauto id."
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
    USEPORT=2222  # set default port to try each time to 2222
    echo -e "\n---------------------------------------- $IP ----------------------------------------------------------\n"
    ssh -oStrictHostKeyChecking=no -p $USEPORT sasauto@$IP "bash -s" < $SCRIPT2RUN
    if [[ $? -eq 255 ]];then
      # try sssh again but with port 22
      echo -e "\nssh error to $IP on $USEPORT, trying port 22 ...\n"
      ssh -oStrictHostKeyChecking=no -p 22 sasauto@$IP "bash -s" < $SCRIPT2RUN
      if [[ $? -eq 255 ]];then
        echo -e "\nERROR - $IP - ssh failed on both $USEPORT and port 22 .\n"
      fi
    fi

    echo -e "\n-------------------------------------------------------------------------------------------------------\n"
  done

} #main()

main 2>&1 | tee $LOG

rm -f ${CDS_IP_LIST}.temp
echo -e "\nDone..all output stored in:\n\t   $LOG \n"
echo -e "\nSSH Failures stored in:\n\t   $SSHFAILLOG \n"
