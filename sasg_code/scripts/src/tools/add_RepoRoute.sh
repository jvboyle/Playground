#!/bin/bash
###########################################################################
# Description: Add static route for RedHat Repository
# Author: Stan Braun
# Date: 2017.24.02
# Standalone Usage: ./addRepoRoute.sh

# History:
#    2017.24.02 - Original script.
#    2017.05.19 - Updated for automation (so can be called by CDS_tools_setup.sh)
#               - if ip in existing redhat.repo found in one of the datacenter repo server variables
#               - add routes to just those ips in that datacenter, otherwise add route entries for all
#    2017.07.18 - Updated CDS_IPS subnet list per jvboyle
#    2017.07.26 - Pulled out CDS subnet list to separate file, updated loop to read in file - allows
#               - for same script but different lists to be utilized in test vs prod
#    2018.12.03 - Updated grep in add_route - wasn't processing comments in subnet_list file properly
#    2019.01.09 - updated grep to grab NIC to user more std [a-zA-Z] regular expression vs [a-Z] as some grep versions don't support this.
# Notes:
#    
###########################################################################
#source ./vars
#set +e
THISSCRIPT=`basename $0`
LOG="/tmp/$THISSCRIPT.log"
if [[ -f $LOG ]];then
  mv ${LOG} ${LOG}.prev
fi

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
DEBUGONLY=0  # If set to 1 will only echo commands that will make changes - won't actually change anything.  Set to 0 to actually run cmds.

THISHOST=`hostname`
THISHOSTIP=""
REPOCFG="/etc/yum.repos.d/redhat.repo"
apiFQDN="api.service.softlayer.com"


ROUTEDIR="/etc/sysconfig/network-scripts"
CDS_IPS="./subnet_list"

YUMCMD="yum -y install nmap-ncat"
YUMOUT="/tmp/yum.out"
YUMSLEEP=6  # number of seconds to sleep between checks for yum still running.
YUMLOOPS=10  # number of times to loop and check if yum's still running before issuing kill

RHN_ALL=("# SL RHN Servers - TOK02" "10.3.65.129" "172.24.129.160" "10.3.65.126" "172.17.1.22" "# SL RHN Servers - LON02" "10.1.209.230" "172.28.1.160" "10.1.209.126" "172.17.1.22" "# SL RHN Servers - SEA01" "10.3.177.129" "172.26.1.160" "10.1.77.24" "172.17.1.22" "# SL RHN Servers - DAL09" "10.2.113.230" "172.19.129.160" "10.2.113.126" "172.17.1.22")
RHN_TOK=("# SL RHN Servers - TOK02" "10.3.65.129" "172.24.129.160" "10.3.65.126" "172.17.1.22")
RHN_LON=("# SL RHN Servers - LON02" "10.1.209.230" "172.28.1.160" "10.1.209.126" "172.17.1.22")
RHN_SEA=("# SL RHN Servers - SEA01" "10.3.177.129" "172.26.1.160" "10.1.77.24" "172.17.1.22")
RHN_DAL=("# SL RHN Servers - DAL09" "10.2.113.230" "172.19.129.160" "10.2.113.126" "172.17.1.22")

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# grab 10. ip and associated NIC name to set ROUTEFILE variable
NIC=`/usr/sbin/ip addr |grep -n2 "inet 10." |grep ": [a-zA-Z]"|awk -F': ' '{print $2}'`
ROUTEFILE="$ROUTEDIR/route-${NIC}"
THISHOSTIP=`/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'`
THISIP=$(echo $THISHOSTIP | awk -F"/" '{print $1}')
THIS_SDS=$(grep -w "$THISIP" ./vars|grep -v "^#"|tail -1|awk -F'_IP' '{print $1}')

# Log function - write msgs to log not to output
log(){
  echo -e "$1" |tee -a $LOG
}
# Write error - write err msgs to log & stdout with hostname
logerr(){
  echo -e "\n***ERROR: $1\n" |tee -a $LOG
  echo -e "ERROR: ${THISHOST} (${THISHOSTIP}): $1"
}
# Write error - write err msgs to log & stdout with hostname
logsuccess(){
  echo -e "SUCCESS: ${THISHOST} (${THISHOSTIP}): $1" | tee -a $LOG
}

# test if we can run sudo ip address - should be able to but if not log err.
sudo ip address 2>/dev/null
if [ "$?" -ne 0 ];then
  logerr "Error running sudo."
  exit 1
fi


# function to add routes via ip route & add to the proper /etc/sysconfig/network-scripts/route-xxx file
# if the route doesn't already exist in that file.
add_route(){
  ip2add=$1
  rfile=$2

  # check if ip2add is comment string
  echo "$ip2add"|grep -q "^#"
  if [[ $? -eq 0 ]];then
    # got a string - check if in route file already, if not, add it
    sudo grep -q "$ip2add" $rfile
    if [ $? -eq 0 ];then
      log " $ip2add already exists in $rfile"
    else
      log "  ..adding $ip2add to $rfile"
      if [[ $DEBUGONLY == 1 ]];then
        log "  ..DebugMode: normally would run:\n      echo -e \"$ip2add\" >> $rfile \n"
      else
       echo -e "$ip2add" | sudo tee -a $rfile
       if [ $? -ne 0 ];then
         logerr "Failed to append $ip2add to $rfile - exiting"
         exit 1
       fi
      fi
    fi

  return 0
  fi

  ROUTETOADD="$ip2add via $BCR_IP"
  if [[ $DEBUGONLY == 1 ]];then
    log "\n  ..DebugMode: normally would run:\n      ip route add $ip2add via $BCR_IP"
  else
    log "\n  ..running: ip route add $ip2add via $BCR_IP"
    RET=`sudo ip route add $ROUTETOADD 2>&1`
    if [ $? -ne 0 ];then
      echo $RET|grep -qi "file exists"
      if [ $? -eq 0 ];then
        log "    ..route already exists:  $RET  \n"
      else
        logerr "ip route add $ip2add via $BCR_IP failed with: $RET"
      fi
    fi
  fi

  # check if route already exists in routefile before trying to add it.
  #
  sudo grep -q "$ROUTETOADD" $rfile
  if [ $? -eq 0 ];then
    log "  ..route ($ROUTETOADD) already exists in $rfile"
  else
    log "  ..Adding route ($ROUTETOADD) to $rfile"
    if [[ $DEBUGONLY == 1 ]];then
      log "  ..DebugMode: normally would run:\n      echo -e \"$ip2add via $BCR_IP\" >> $rfile \n"
    else
       echo -e "$ROUTETOADD" | sudo tee -a $rfile
       if [ $? -ne 0 ];then
         logerr "Failed to append route to $rfile - exiting"
#         exit 1
       fi
    fi

  fi
  
}



addrhnsite(){
  rhnsite=$1
  rfile=$2

  log "\nIn addrhnsite. rhnsite=$rhnsite, rfile=$rfile\n-------------------------------------"
  case $rhnsite in

    "TOK")
       log "adding routes for TOK repos"
       for RHNIP in "${RHN_TOK[@]}"
       do
         add_route "$RHNIP" "$rfile"
       done
       ;;
    "LON")
       log "adding routes for LON repos"
       for RHNIP in "${RHN_LON[@]}"
       do
         add_route "$RHNIP" "$rfile"
       done
       ;;
    "SEA")
       log "adding routes for SEA repos"
       for RHNIP in "${RHN_SEA[@]}"
       do
         add_route "$RHNIP" "$rfile"
       done
       ;;
    "DAL")
       log "adding routes for DAL repos"
       for RHNIP in "${RHN_DAL[@]}"
       do
         add_route "$RHNIP" "$rfile"
       done
       ;;
    *)
       log "adding routes for ALL repos"
       for RHNIP in "${RHN_ALL[@]}"
       do
         add_route "$RHNIP" "$rfile"
       done
       ;;
  esac
} #addrhnsite(){

determineID() {
   if [ -z ${id} ]; then
      id=$(curl -s -k --connect-timeout 15 https://${apiFQDN}/rest/v3/SoftLayer_Resource_Metadata/getId)
      echo ${id} | grep -q 'Access Denied'
      if [ $? -eq 0 ]; then
         for ip in $(ip addr | grep 'inet 10.' | awk '{ print $2 }' | cut -d/ -f1)
         do
            id=$(curl --interface ${ip} -s -k --connect-timeout 15 https://${apiFQDN}/rest/v3/SoftLayer_Resource_Metadata/getId)
            echo ${id} | grep -q 'Access Denied'
            if [ $? -ne 0 ]; then
               serviceIP=${ip}
               break
            fi
         done
      fi
   fi
}
determineDatacenter() {
   if [ -z ${serviceIP} ]; then
      dc=$(curl -s https://api.service.softlayer.com/rest/v3/SoftLayer_Resource_Metadata/getDatacenter | tr '[:upper:]' '[:lower:]' | sed -e 's/"//g')
   else
      dc=$(curl --interface ${serviceIP} -s https://api.service.softlayer.com/rest/v3/SoftLayer_Resource_Metadata/getDatacenter | tr '[:upper:]' '[:lower:]' | sed -e 's/"//g')
   fi

   if [ -z "${dc}" ]; then
      echo "Unable to detect datacenter for this server.  Please contact support."
      exit
   else
      echo "Datacenter for this server...${dc}"
   fi

   case ${dc} in
      'ams01')
         cap='rhncapams0102'
         ;;
      'ams03')
         cap='rhncapams0301'
         ;;         
      'che01')
         cap='rhncapche0102'
         ;;
      'dal01')
         cap='rhncapdal0901'
         ;;
      'dal05')
         cap='rhncapdal0502'
         ;;
      'dal06')
         cap='rhncapdal0601'
         ;;
      'dal07')
         cap='rhncapdal0701'
         ;;
      'dal09')
         cap='rhncapdal0901'
         ;;
      'dal10')
         cap='rhncapdal1001'
         ;;
      'dal12')
         cap='rhncapdal1201'
         ;;
      'dal13')
         cap='rhncapdal1301'
         ;;
      'fra02')
         cap='rhncapfra0201'
         ;;
      'fra04')
         cap='rhncapfra0401'
         ;;
      'fra05')
         cap='rhncapfra0501'
         ;;
      'hkg02')
         cap='rhncaphkg0201'
         ;;
      'hou02')
         cap='rhncaphou0201'
         ;;
      'lon02')
         cap='rhncaplon0201'
         ;;
      'lon04')
         cap='rhncaplon0401'
         ;;
      'lon05')
         cap='rhncaplon0501'
         ;;
      'lon06')
         cap='rhncaplon0601'
         ;;
      'mel01')
         cap='rhncapmel0101'
         ;;
      'mex01')
         cap='rhncapmex0102'
         ;;
      'mil01')
         cap='rhncapmil0102'
         ;;
      'mon01')
         cap='rhncapmon0102'
         ;;
      'osl01')
         cap='rhncaposl0102'
         ;;
      'par01')
         cap='rhncappar0101'
         ;;
      'sao01')
         cap='rhncapsao0103'
         ;;
      'sea01')
         cap='rhncapsea0101'
         ;;
      'seo01')
         cap='rhncapseo0102'
         ;;
      'sjc01')
         cap='rhncapsjc0102'
         ;;
      'sjc03')
         cap='rhncapsjc0301'
         ;;
      'sjc04')
         cap='rhncapsjc0401'
         ;;
      'sng01')
         cap='rhncapsng0102'
         ;;
      'syd01')
         cap='rhncapsyd0102'
         ;;
      'syd04')
         cap='rhncapsyd0401'
         ;;
      'syd05')
         cap='rhncapsyd0501'
         ;;
      'tok02')
         cap='rhncaptok0201'
         ;;
      'tok04')
         cap='rhncaptok0401'
         ;;
      'tok05')
         cap='rhncaptok0501'
         ;;
      'tor01')
         cap='rhncaptor0101'
         ;;
      'wdc01')
         cap='rhncapwdc0102'
         ;;
      'wdc04')
         cap='rhncapwdc0401'
         ;;
      'wdc06')
         cap='rhncapwdc0601'
         ;;
      'wdc07')
         cap='rhncapwdc0701'
         ;;
   esac
   capsule="${cap}.service.networklayer.com"
}

getBCR(){
# see if we have more than one default 10. in the route file or an incorrect entry:
BCRCOUNT=`grep "^10" ${ROUTEFILE} |awk -F'via ' '{print $2}' | sort -u |wc -l|awk '{print $1}'`
if [[ $BCRCOUNT -gt 1 ]];then
  for bip in `grep "^10" ${ROUTEFILE} |awk -F'via ' '{print $2}' | sort -u`
  do
    if [[ $bip != 10* ]];then
     badroute=`grep -w "$bip" $ROUTEFILE`
      logerr "Incorrect route ($badroute) in $ROUTEFILE ... ignoring."
    else
      logerr "More than one BCR in $ROUTEFILE -using: $bip"
      BCR_IP="$bip"
      break
   fi
  done
else
  BCR_IP=`grep "^10" ${ROUTEFILE} |awk -F'via ' '{print $2}' | sort -u`
  if [[ -z $BCR_IP ]];then
    logerr "Unable to find ^10 in $ROUTEFILE for gateway IP - exiting"
    exit 1
  fi
fi

echo "BCR_IP=$BCR_IP"
} # getBCR()


# run yum in function so we can monitor progress & kill it if it hangs
#
run_yum(){
  log "..running $YUMCMD > $YUMOUT 2>&1 ..will display all output in log file after completion"
  sudo $YUMCMD > $YUMOUT 2>&1
}


# Main loop - all within gets logged to $LOG
#
main(){
DATE=`date +"%F_%T"`
log "---------------  $DATE  ---------------------------"

# dont run this on any server with vyos or sasfw in the name - only runs on asb, chef, ee, bpm, rcp-bpm, rcp-ror, rcp-proxy
echo "$THISHOST" | egrep "\-vyos\-|\-sasfw\-"
if [[ "$?" -eq 0 ]];then
  echo -e  "  ** on sasfw - not adding routes."
  logsuccess "on sasfw - not adding routes."
  exit 0
fi

# if no vars in current dir, run getBCR routine to determine BCR from current route table
if [ -f ./vars ];then
  source ./vars
  echo "BCR_IP in vars $BCR_IP"
  CURRENT_BCR_IP=$(ip route get 10.149.99.229 | head -1 | awk '{print $3}')
  echo "Current BCR_IP $CURRENT_BCR_IP"
  if [ ! -z ${CURRENT_BCR_IP} ]; then
     BCR_IP=${CURRENT_BCR_IP}
  fi
  echo "Using $BCR_IP to add routing"
else
   getBCR
fi


if [[ ! -f $ROUTEFILE ]];then
   logerr "$ROUTEFILE does not exist."
   exit 1
else
   log "..Creating backup of $ROUTEFILE"
   if [[ $DEBUGONLY == 1 ]];then
     log "..DebugMode: normally would run:  cp -p $ROUTEFILE $ROUTEFILE.$DATE"
   else
     sudo cp -p $ROUTEFILE $ROUTEFILE.$DATE
     if [[ $? -ne 0 ]];then
       logerr "failed to create backup of $ROUTEFILE - exiting"
       exit 1
     fi
   fi
fi

# make sure we have a route to the apiFQDN ip through bcr, if not add one
if [ ! -z "$BCR_IP" ];then
  apiIP=$(getent hosts $apiFQDN | awk '{print $1}')
  if [ ! -z "$apiIP" ];then
     add_route "#Route for SL API Server $apiFQDN - $apiIP" "$ROUTEFILE"
     add_route "$apiIP" "$ROUTEFILE"
  else
     logerr "Failed to get ip address for $apiFQDN."
#     exit 1
  fi
else
  logerr "BCR_IP is blank...exiting."
  exit 1
fi

determineID
determineDatacenter

CAPIP=$(getent hosts $capsule | awk '{print $1}')
if [ ! -z "$CAPIP" ];then
  echo "capsule=$capsule, $CAPIP"
  # have an ip for the rhncap server - add route for it
   add_route "#Route for RHN Repo  Server $capsule - $CAPIP" "$ROUTEFILE"
   add_route "$CAPIP" "$ROUTEFILE"
else
  logerr "capsule=$capsule, ip_unknown"
fi

if [ ! -f $CDS_IPS ];then
  logsuccess "$CDS_IPS not found - just main repo $capsule $CAPIP added."
  exit 0
fi
# grab dns name of each repo server from baseurl in redhat.repo
REPODNS=`grep "^baseurl" $REPOCFG |awk -F'/' '{print $3}'|sort|uniq`


# Add standard routes added to every CDS
# note - if route is already added, it won't be added twice.
log "\nAdding std CDS routes...."
log "--------------------------------------------------------"
# old loop:  for CDSIP in "${CDS_IPS[@]}"
cat $CDS_IPS | while read CDSIP
do
  add_route "$CDSIP" "$ROUTEFILE"
done

#Add Static route for LoadBalancer on both Proxy RCP Servers
if [ "${THIS_SDS}" == "RCP_PROXY" ]; then
   log "Adding route for LoadBalancer - RCP Shared HA"
   add_route "#Route for LoadBalancer - RCP Shared HA" "$ROUTEFILE"
   add_route "$RCP_PROXY_LB_IP" "$ROUTEFILE"
fi
# 29mar2017 - change requested to add static host routes to every softlayer repo, proxy server/capsule server on every tools server vm.

log "\n..Getting repo server hostname/ip from baseurl in $REPOCFG"

grep -q "^baseurl" $REPOCFG
if [[ $? -ne 0 ]];then
  logerr "$REPOCFG config error - no baseurls adding routes for all SL Repos"
  addrhnsite "ALL" "$ROUTEFILE"
  # don't exit - just add all the repo routes
fi

# loop through each redhat repository server dns name
# get ip for the dns name, add static route for the repo via BCR ip found in ip route file for NIC
#
log "\nLooping thru each repo dns, getting ip & adding route..."
log "--------------------------------------------------------"
for RDNS in $REPODNS
do
  log "\nFound repo: $RDNS"
  getent hosts $RDNS
  if [ $? -ne 0 ];then
    logerr "Couldn't find ip for Redhat Repo:  $RDNS - exiting"
    addrhnsite "ALL" "$ROUTEFILE"
  # don't exit - just add all the repo routes
    # if we cant find specific repo ip addr, just add all repos
  fi
  RDNSIP=`getent hosts $RDNS | awk '{print $1}'`
  # check which SL datacenter the repo is in and add routes for the appropriate SL repo servers for that center
  log "  checking <$RDNSIP> to see which repo sites to add"
  echo "${RHN_TOK[@]}" | grep  "$RDNSIP"
  if [[ $? -eq 0 ]];then
    addrhnsite "TOK" "$ROUTEFILE"
  fi
  echo "${RHN_LON[@]}" | grep -q "$RDNSIP"
  if [[ $? -eq 0 ]];then
    addrhnsite "LON" "$ROUTEFILE"
  fi
  echo "${RHN_SEA[@]}" | grep -q "$RDNSIP"
  if [[ $? -eq 0 ]];then
    addrhnsite "SEA" "$ROUTEFILE"
  fi
  echo "${RHN_DAL[@]}" | grep -q "$RDNSIP"
  if [[ $? -eq 0 ]];then
    addrhnsite "DAL" "$ROUTEFILE"
  fi



  # now test if we can get to repo
  log "  ..running: ping $RDNSIP ...."
  if ($( ping $RDNSIP -c1 >/dev/null )) ;then
    log "  ..Ping ok - $RDNSIP"
    PINGOK="$PINGOK $RDNS"
  else
    log "  ..Ping Fail - $RDNSIP"
    PINGFAIL="$PINGFAIL $RDNS"
  fi

done  # for RDNS... loop
# check if rhsm.conf exists & if so get ip of server listed there - may be different than ones listed in RHN_*** arrays - call add_route in case it's not already added.
if [[ -f /etc/rhsm/rhsm.conf ]];then
  RHSM=`grep ^hostname /etc/rhsm/rhsm.conf|awk '{print $NF}'`
  RHSMIP=`getent hosts $RHSM | awk '{print $1}'`
  log "  ..Found host in rhsm.conf - seeing if route to $RHSM ($RHSMIP) is already added or not."
  add_route "$RHSMIP" "$ROUTEFILE"
else
    logerr "  ../etc/rhsm/rhsm.conf not found."
fi

log "------------------------------------------\n"
log "..done looping through repository names.\n"



  if [[ ! -z $PINGFAIL ]];then
    logerr "Repo Ping Failure.\n"
  fi
    
  # Do initial check to see if someone's already running yum - if so, sleep 1 min, check again..if still running, just exit with err.
  #
  YUMPID=`ps -ef|grep "yum "|grep -v grep | awk '{print $2}'`
  if [[ ! -z $YUMPID ]];then
    log "..Found yum process already running...sleeping 60 seconds and checking again..if there's still a process running, will exit...\n"
    sleep 60
    YUMPID=`ps -ef|grep "$YUMCMD"|grep -v grep | awk '{print $2}'`
    if [[ ! -z $YUMPID ]];then
       logerr "Yum already running - unable to test repo."
       exit 1
    fi
  fi
  # Run final yum to test repos connectivity
  #
  if [[ $DEBUGONLY == 1 ]];then
    log "  ..DebugMode: normally would run: $YUMCMD and monitor & kill it if it hangs.\n"
   # since in debug mode we don't actually run yum - set to ok and simulate yum output
   # if we've gotten this far, things are working - just wont do actual yum test in debug mode
    YUMSTOPPEDOK=1
    echo -e "Nothing to do\n" > $YUMOUT
  else

    # call run_yum function in the background so we can monitor & kill it if it hangs.
    #
    run_yum &

    count=0
    while [[ $count -lt $YUMLOOPS ]]
    do
      count=$(( $count + 1 ))

      YUMPID=`ps -ef|grep "$YUMCMD"|grep -v grep | awk '{print $2}'`
      if [[ -z $YUMPID ]];then
        # yum not running anymore..break out of loop
        log "  ..Yum process no longer running."
        YUMSTOPPEDOK=1
        count=$YUMLOOPS
      else
        if [[ $count -eq $YUMLOOPS ]];then
          # max count reached, kill yum process.
          YUMPID=`ps -ef|grep "$YUMCMD"|grep -v grep | awk '{print $2}'`
          log "  ..Yum process $YUMPID still running...issuing kill..."
          sudo kill $YUMPID
          YUMSTOPPEDOK=0
          count=$YUMLOOPS
        else
          # yum still running but max sleep hasn't been reached..echo msg & sleep
          log "..yum still running...sleeping & checking again..."
          sleep $YUMSLEEP
        fi
      fi

    done
      
  fi # if [[ $DEBUG....

    # add yum output to the log file
    log "\n----------------------- YUM Output -------------------------"
    cat $YUMOUT |tee -a $LOG
    log "\n------------------------------------------------------------"

    if [[ $YUMSTOPPEDOK == 1 ]];then
      egrep -qi "Nothing to do|Complete!" $YUMOUT
      if [ $? -eq 0 ];then
        logsuccess "yum test successful!"
      else
        logerr "Yum stopped on it's own but didn't find the normal \"Nothing to do\" or \"Complete!\" messages - possible problem."
      fi
    else
        logerr "Yum test failure"
    fi


  log "------------------------------------------\n"
}
main   
exit 0
