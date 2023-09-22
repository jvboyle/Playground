#!/bin/bash
#
# show count of # of servers where script returned SUCCESS and # showing ERROR
# show total count of ones with ssh errors
# show total overall & compare with device.csv/ip list file count
TOP="/home/sasauto/jvboyle/Tools"
LOGDIR="${TOP}/LOGS"

if [ "$#" -lt 1 ];then
  echo -e "USAGE: $0 <Script Name Run>"
  echo -e "  Note - will use already parsed IPLISTS/*.temp file for device count so it"
  echo -e "         expected this will be run immediately after the RunScript.sh so the"
  echo -e "         device list is current."
  exit 1
fi

INSTSCRIPT="$1"

SCRIPT_PREFIX=$(echo "$INSTSCRIPT"|awk -F'.' '{print $1}')

SUCCESSCOUNT=$(egrep "SUCCESS" ${LOGDIR}/${SCRIPT_PREFIX}*.log |grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}" |wc -l|awk '{print $1}')
TOTERRORCOUNT=$(egrep "ERROR" ${LOGDIR}/${SCRIPT_PREFIX}*.log |grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}" |wc -l|awk '{print $1}')
SSHERRORCOUNT=$(egrep "ERROR" ${LOGDIR}/${SCRIPT_PREFIX}*.log |grep -i "ssh_failed" |wc -l|awk '{print $1}')
IPLIST=$(ls -tr ${TOP}/IPLISTS/*.temp|tail -1)
TOTALDEVICEIPS=$(wc -l $IPLIST |awk '{print $1}')

ERRORCOUNT=$(($TOTERRORCOUNT - $SSHERRORCOUNT))
SUCCESSANDERROR=$(($SUCCESSCOUNT + $ERRORCOUNT + $SSHERRORCOUNT))
echo -e "Success:          $SUCCESSCOUNT"
echo -e "Non--ssh Errors:  $ERRORCOUNT"
echo -e "Ssh Errors:       $SSHERRORCOUNT"
echo -e "----------------  ----------------"
echo -e "Total:            $SUCCESSANDERROR"

echo -e "\nTOTAL Devices:  $TOTALDEVICEIPS"
echo -e "\ntotal successes + all errors should match up with total # of\nvalid private device ips found in the device list."


