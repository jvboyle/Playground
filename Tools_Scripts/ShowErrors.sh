#!/bin/bash
#
# After RunScript.sh was run & output is pulled for each server, run this to pull all lines with ERROR strings
# from the LOGS/*.log and compile it all into one output stream written to a file.  Only one input - which script
# was run so we can query the right logs.
# 
# Also run is a pull of all the SDS IPs from all the vars files in SASGaaS in order to get an account name when all we have is an ip.

#TOP="/home/sasauto/Tools/reporting"
TOP="/home/sasauto/jvboyle/Tools"
SCRIPTDIR="${TOP}/scripts"
LOGSDIR="${TOP}/LOGS"
DATE=$(date +%Y_%m_%d_%H%M%S)
SASGAAS="${TOP}/.SASGaaS_sds_ips_per_account"

if [ -z "$1" ];then
  echo -e "\nUSAGE:  $0 <Script Name from $SCRIPTDIR which was run using RunScript.sh>\n"
  exit 1
else
  INSTSCRIPT="$1"
fi

INSTSCRIPT_NOSUFFIX=$(echo "$INSTSCRIPT"|awk -F'.' '{print $1}')
OUT="${LOGSDIR}/${INSTSCRIPT_NOSUFFIX}_${DATE}.csv"
OUTTMP="${LOGSDIR}/errors_temp"

if [ -f "$SASGAAS" ];then
  AGE=$(($(date +%s)-$(date -r ${SASGAAS} +%s)))
  if [ "$AGE" -ge 3600 ];then
    #list of sasgaas account names & ips exists and is older than an hour - create new one
    echo -e "** Creating new list of SASGaaS account names and SDS IP's, current list >1hr old ...\n"
    sleep 3
    mv $SASGAAS $SASGAAS.prev
    ${TOP}/GetAcctSdsIpList.pl >$SASGAAS 2>/dev/null
  else
    echo -e "** Using existing list of SASGaaS account names and SDS IP's, current list is less than 1hr old ...\n"
    sleep 3
  fi #if [ "$AGE" -ge 3600 ];then
else
    #list of sasgaas account names & ips doesnt exist - create it
    echo -e "** Creating new list of SASGaaS account names and SDS IP's ...\n"
    sleep 3
    ${TOP}/GetAcctSdsIpList.pl >$SASGAAS 2>/dev/null
fi #if [ -f "$SASGAAS" ];then

echo -e "\nProcessing errors in $LOGSDIR/$INSTSCRIPT_NOSUFFIX logs...\n"
grep "ERROR" ${LOGSDIR}/${INSTSCRIPT_NOSUFFIX}_*.log | awk -F'ERROR,' '{printf("ERROR,%s\n",$2)}' >${OUTTMP}
#chgd & add pull of successes too
grep "SUCCESS" ${LOGSDIR}/${INSTSCRIPT_NOSUFFIX}_*.log | awk -F'SUCCESS,' '{printf("SUCCESS,%s\n",$2)}' >>${OUTTMP}
cat $OUTTMP | while read LINE
do
  IP=$(echo "$LINE"|awk -F',' '{print $3}')
  ACCT=$(grep -w "$IP" $SASGAAS | awk -F',' '{print $1}')
  if [ -z "$ACCT" ];then
    ACCT="unknown"
  fi
  echo "${ACCT},${LINE}" |tee -a $OUT
done
rm -f $OUTTMP
echo "\n\n** Finished - look for output in: $OUT"
