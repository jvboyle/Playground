#!/bin/bash
###########################################################################
# Description: Add static route for RedHat Repository
# Author: Stan Braun
# Date: 2017.24.02
# Standalone Usage: ./addRepoRoute.sh

# History:
#    2017.24.02 - Original script.
# Notes:
#    
###########################################################################
#source ./vars
#set -e
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

ROUTEDIR="/etc/sysconfig/network-scripts"

YUMCMD="yum -y install nmap-ncat"
YUMOUT="/tmp/yum.out"
YUMSLEEP=15  # number of seconds to sleep between checks for yum still running. (Note - 15x18=270 sec = 4.5 min - some systems take forever for yum to run).
YUMLOOPS=18  # number of times to loop and check if yum's still running before issuing kill

# std ips routes are added for on each CDS server
CDS_IPS=("# Route to Mgmt Segment Vyatta masquerading Mgmt Segment to Ded Segment flows" "10.149.99.238/32" "10.175.8.24/32" "10.118.186.71/32" "# Routes to SL private network DNS" "10.0.80.11/32" "10.0.80.12/32" "# Routes to NA Portable IP Range" "10.148.80.0/26" "10.148.211.48/28" "# Routes to EU Portable IP Range" "10.175.6.64/26" "10.175.18.0/26" "# Routes to AP Portable IP Range" "10.118.39.192/26" "10.118.187.0/26" "# Routes to NA Mgmt IP Range" "10.148.11.128/26" "# Routes to EU Mgmt IP Range" "10.175.61.168/29" "# Routes to AP Mgmt IP Range" "10.118.186.128/26")
RHN_ALL=("# SL RHN Servers - TOK02" "10.3.65.129" "172.24.129.160" "10.3.65.126" "172.17.1.22" "# SL RHN Servers - LON02" "10.1.209.230" "172.28.1.160" "10.1.209.126" "172.17.1.22" "# SL RHN Servers - SEA01" "10.3.177.129" "172.26.1.160" "10.1.77.24" "172.17.1.22" "# SL RHN Servers - DAL09" "10.2.113.230" "172.19.129.160" "10.2.113.126" "172.17.1.22")
RHN_TOK=("# SL RHN Servers - TOK02" "10.3.65.129" "172.24.129.160" "10.3.65.126" "172.17.1.22")
RHN_LON=("# SL RHN Servers - LON02" "10.1.209.230" "172.28.1.160" "10.1.209.126" "172.17.1.22")
RHN_SEA=("# SL RHN Servers - SEA01" "10.3.177.129" "172.26.1.160" "10.1.77.24" "172.17.1.22")
RHN_DAL=("# SL RHN Servers - DAL09" "10.2.113.230" "172.19.129.160" "10.2.113.126" "172.17.1.22")

#---------------------------------------------------------------------------------------------------------------------------------------------------------------------------


# grab 10. ip and associated NIC name to set ROUTEFILE variable
NIC=`/usr/sbin/ip addr |grep -n2 "inet 10." |grep ": [a-Z]"|awk -F': ' '{print $2}'`
ROUTEFILE="$ROUTEDIR/route-${NIC}"
THISHOSTIP=`/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'`

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
  echo "$ip2add"|grep -q [0-9].[0-9]
  if [[ $? -ne 0 ]];then
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
         exit 1
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


# grab dns name of each repo server from baseurl in redhat.repo
REPODNS=`grep "^baseurl" $REPOCFG |awk -F'/' '{print $3}'|sort|uniq`


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

# Add standard routes added to every CDS
# note - if route is already added, it won't be added twice.
#log "\nAdding std CDS routes...."
#log "--------------------------------------------------------"
#for CDSIP in "${CDS_IPS[@]}"
#do
#  add_route "$CDSIP" "$ROUTEFILE"
#done

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
  add_route "$RHSMIP" "$rfile"
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
