#!/bin/bash
#
# Run specifed script from scripts directory on every SDS server (not vyattas, sla-p-ms, -restored, etc servers)
# listed in a specified device.csv or ip list file.  
# The ip list provided will be broken into multiple separate files with max # of ip addresses per file dependent
# on the total # of IP's in the original list.  This is to prevent too many concurrent threads from starting.
# Output will be written to multiple log files under LOGS directory, prefixed by the script name run.
# Watch script will run showing progress of the jobs.
# At end, logs will be parsed & # of successes, errors & total devices listed.

USAGE(){
  echo -e "USAGE: $0 <ip list or devices.csv file> [script from scripts dir to run]"
  echo -e "     if specifying vmlist created via nightly job pulled from sl portal then will parse properly."
  echo -e "     if specifying custom list of ip's pulled from vmlist created via nightly job pulled from sl portal then make sure to specify a 3rd argument - can be anything"
  echo -e "          ie: $0 myvmlist.csv InstallSasmon.sh vmlist"
  exit 1
}

TOP="/home/sasauto/jvboyle/Tools"
SCRIPTDIR="${TOP}/scripts"
IPLISTSDIR="${TOP}/IPLISTS"
LOGDIR="$TOP/LOGS"
LOGDIRPREV="$TOP/LOGS/Previous"
#MAXIPSPERFILE=4  #max ips to have in each ip list - if running against all sds's suggest 500
MAXIPSPERFILE=4  #max ips to have in each ip list - if running against all sds's suggest 500
MAXTHREADS=4  #max num of parallel jobs to run per ip list
WATCHSCRIPT="$TOP/WatchRunScriptProgress.sh"
LOGSTATSSCRIPT="$TOP/ShowLogStats.sh"
DATE=$(date +%Y_%m_%d_%H:%M:%S)

[[ -z "$1" ]] && USAGE
CDS_IP_LIST="$1"
if [ ! -f "$CDS_IP_LIST" ];then
  echo -e "\nFile specified <$CDS_IP_LIST> was not found!"
  USAGE
fi

if [ ! -z "$2" ];then
  INSTSCRIPT="$2"
  if [ ! -f "${SCRIPTDIR}/${INSTSCRIPT}" ];then
    echo -e "\nFile specified <${SCRIPTDIR}/${INSTSCRIPT}> was not found!"
    USAGE
  else
    echo -e "\nRunning script $INSTSCRIPT."
  fi
else
  INSTSCRIPT="InstallSasmon.sh"
  echo -e "\nRunning default script $INSTSCRIPT."
fi
INSTSCRIPT_NOPREFIX=$(echo "$INSTSCRIPT"|awk -F'.' '{print $1}')

[[ ! -z "$3" ]] && VMLISTFORMAT="true"

echo -e "\nrunning install script $INSTSCRIPT"

if [ -d "$IPLISTSDIR" ];then
  echo -e "removing any existing ip list files in $IPLISTSDIR"
  rm -f ${IPLISTSDIR}/*
fi
if [ ! -d "$IPLISTSDIR" ];then
  mkdir $IPLISTSDIR
fi
if [ ! -d "$LOGDIR" ];then
  mkdir $LOGDIR
fi
if [ ! -d "$LOGDIRPREV" ];then
  mkdir $LOGDIRPREV
fi

# if any old logs for this app, move them to the prev logdir
ls $LOGDIR/${INSTSCRIPT_NOPREFIX}* >/dev/null
if [ "$?" -eq 0 ];then
  echo -e "\nCreating tar of old logs, $LOGDIR/${INSTSCRIPT_NOPREFIX}*  - ${LOGDIRPREV}/${INSTSCRIPT_NOPREFIX}_${DATE}.tar.gz \n"
  tar -zcvf ${LOGDIRPREV}/${INSTSCRIPT_NOPREFIX}_${DATE}.tar.gz $LOGDIR/${INSTSCRIPT_NOPREFIX}*
  rm -f $LOGDIR/${INSTSCRIPT_NOPREFIX}*
fi

IPLISTBASE=$(basename $CDS_IP_LIST)
if [ "$IPLISTBASE" == "vmlist" -o "$VMLISTFORMAT" == "true" ];then
  # assume using vmlist pulled from Softlayer api
  cat $CDS_IP_LIST|egrep "sla-p|aas-p"|egrep -vi "^$|#|Device Name|sla-p-ms|\-restored|^iamaas|os-image|p-ec0|p-icds|p-ras|p-sla|p-win|p-sep" | awk '{printf("%s %s\n",$4,$2)}'|egrep -vi "^[a-Z]" >${IPLISTSDIR}/${IPLISTBASE}.temp
else

  egrep -qv "Device Name|," $CDS_IP_LIST
  if [[ $? -eq 0 ]];then
    # assume we just have a list of IP's, one IP per line.
    cat $CDS_IP_LIST|egrep -v "^$|#" >${IPLISTSDIR}/${IPLISTBASE}.temp
  else
    # assume we have a devices.csv listing from SL Portal
    # create single file with just private ip's
    # pull out any not na, emea, la or shared
  #  cat $CDS_IP_LIST|egrep -v "^$|#|Device Name" | awk -F',' '{print $5}' >${IPLISTSDIR}/${CDS_IP_LIST}.temp
    echo -e "\nOnly running against sla-p* & aas-p servers - no vyattas, no -restored systems, no sla-p-ms*"
    # changed to output private ip then hostname - each script will have to parse & get just ip but then can 
    # print out both fqdn and ip address in error msgs re ssh connection failures, etc.
    cat $CDS_IP_LIST|egrep "sla-p|aas-p"|egrep -vi "^$|#|Device Name|sla-p-ms|\-restored|^iamaas|os-image|p-ec0|p-icds|p-ras|p-sla|p-win|p-sep" | awk -F',' '{printf("%s %s\n",$5,$1)}'|egrep -vi "^[a-Z]" >${IPLISTSDIR}/${IPLISTBASE}.temp
  fi
fi # if [ "$IPLISTBASE" == "vmlist" ]

IPTOT=$(wc -l ${IPLISTSDIR}/${IPLISTBASE}.temp | awk '{print $1}')

echo -e "IPTOT=$IPTOT\n"
#if [ $IPTOT -gt 2500 ];then
#  MAXIPSPERFILE=500
#  MAXTHREADS=3
#elif [ $IPTOT -gt 900 ];then
#  MAXIPSPERFILE=400
#  MAXTHREADS=3
#elif [ $IPTOT -gt 100 ];then
#  MAXIPSPERFILE=100
#  MAXTHREADS=3
#elif [ $IPTOT -gt 5 ];then
#  MAXIPSPERFILE=20
#  MAXTHREADS=4
#elif [ $IPTOT -gt 1 ];then
#  MAXIPSPERFILE=5
#  MAXTHREADS=2
#else
#  MAXIPSPERFILE=1
#  MAXTHREADS=1
#fi
#echo "\n$IPTOT IPs listed, splitting into files with maximum of $MAXIPSPERFILE, running $MAXTHREADS per file."

#cd $IPLISTSDIR
#  split -l $MAXIPSPERFILE ${IPLISTSDIR}/${CDS_IP_LIST}.temp
#cd $TOP

#for IPLIST in `ls ${IPLISTSDIR}/x*`
#do
# SPLITFILE=$(echo "$IPLIST"|awk -F'/' '{print $NF}')
IPLIST=${IPLISTSDIR}/${IPLISTBASE}.temp
MAXTHREADS=20
 nohup /home/sasauto/bin/parallel -j${MAXTHREADS} ${SCRIPTDIR}/${INSTSCRIPT} < $IPLIST >${LOGDIR}/${INSTSCRIPT_NOPREFIX}.log 2>&1 &
#done
#
echo -e "\n================\nStarted multiple threads running ${INSTSCRIPT} - check ${LOGDIR}/${INSTSCRIPT_NOPREFIX}.log files.\n==========\n"
sleep 5

# run the watch script to monitor progress
$WATCHSCRIPT 
$LOGSTATSSCRIPT $INSTSCRIPT

