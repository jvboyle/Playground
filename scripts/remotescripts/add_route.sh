#!/bin/bash
#
# add route to CCI tools servers
# run for all existing NA CCI's.  Required to fix connectivity to RCP hub which was moved
# to new portable subnet.

THISHOST=`hostname`
THISHOSTIP=""
# grab 10. ip and associated NIC name to set ROUTEFILE variable
NIC=`/usr/sbin/ip addr |grep -n2 "inet 10." |grep ": [a-zA-Z]"|awk -F': ' '{print $2}'`
ROUTEDIR="/etc/sysconfig/network-scripts"
ROUTEFILE="$ROUTEDIR/route-${NIC}"
THISHOSTIP=`/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'`

#####################################
# Put in subnet(s) to add to tools servers here!
#
NEW_SUBNETS=("10.148.250.192/26")

#####################################

# Write error - write err msgs to log & stdout with hostname
logerr(){
#  echo -e "\n***ERROR: $1\n" |tee -a $LOG
  echo -e "ERROR: ${THISHOST},${THISHOSTIP},$1"
}
# Write error - write err msgs to log & stdout with hostname
logsuccess(){
  echo -e "SUCCESS: ${THISHOST},${THISHOSTIP},$1"
}


GetBCRIP(){
# see if we have more than one default 10. in the route file or an incorrect entry:
BCRCOUNT=`grep "^10" ${ROUTEFILE} |awk -F'via ' '{print $2}' | sort -u |wc -l|awk '{print $1}'`
if [[ $BCRCOUNT -gt 1 ]];then
  for bip in `grep "^10" ${ROUTEFILE} |awk -F'via ' '{print $2}' | sort -u`
  do
    if [[ $bip != 10* ]];then
      badroute=`grep -w "$bip" $ROUTEFILE`
      echo "  ** Incorrect route ($badroute) in $ROUTEFILE ... ignoring."
    else
      echo "  ** More than one BCR in $ROUTEFILE -using: $bip"
      BCR_IP="$bip"
      break
   fi
  done
else
  BCR_IP=`grep "^10" ${ROUTEFILE} |awk -F'via ' '{print $2}' | sort -u`
  if [[ -z $BCR_IP ]];then
    logerr "Unable to find ^10 in $ROUTEFILE for gateway IP - exiting"
#    exit 1
  fi
fi

} #GetBCRIP

add_route(){
  ip2add=$1
  rfile=$2
  SUCCESS="no"
  MESSAGE=""

  # check if ip2add is comment string
  echo "$ip2add"|grep -q "^#"
  if [[ $? -eq 0 ]];then
    # got a comment string - check if in route file already, if not, add it
    sudo grep -q "$ip2add" $rfile
    if [ $? -eq 0 ];then
      echo -e " ** $ip2add already exists in $rfile"
    else
      echo -e "  ** ..adding $ip2add to $rfile"
      if [[ $DEBUGONLY == 1 ]];then
        echo -e "  ** ..DebugMode: normally would run:\n      echo -e \"$ip2add\" >> $rfile \n"
      else
       echo -e "$ip2add" | sudo tee -a $rfile
       if [ $? -ne 0 ];then
         logerr "Failed to append ip/subnet to $rfile"
       fi
      fi
    fi

  return 0
  fi

  ROUTETOADD="$ip2add via $BCR_IP"
  if [[ $DEBUGONLY == 1 ]];then
    echo -e "\n  ** ..DebugMode: normally would run:\n      ip route add $ip2add via $BCR_IP"
  else
    echo -e "\n  ** ..running: ip route add $ip2add via $BCR_IP"
    RET=`sudo ip route add $ROUTETOADD 2>&1`
    if [ $? -ne 0 ];then
      echo $RET|grep -qi "file exists"
      if [ $? -eq 0 ];then
        echo -e "  ** route already exists in route table"
        MESSAGE="route already exists in route table"
        SUCCESS="yes"
      else
        echo -e "  ** ip route add $ROUTETOADD failed with: $RET"
        MESSAGE="ip route add failed"
        SUCCESS="no"
      fi
    else
      echo -e "  ** ip route add $ip2add via $BCR_IP added to running route table"
      MESSAGE="ip route successfully added to running route table"
      SUCCESS="yes"
    fi
  fi

  # check if route already exists in routefile before trying to add it.
  #
  sudo grep -q "$ROUTETOADD" $rfile
  if [ $? -eq 0 ];then
    echo -e "   ** route ($ROUTETOADD) already exists in $rfile"
    MESSAGE="$MESSAGE;route already exists in $rfile"
    SUCCESS="yes"
  else
    echo -e "  ** ..Adding route ($ROUTETOADD) to $rfile"
    if [[ $DEBUGONLY == 1 ]];then
      echo -e "  ** ..DebugMode: normally would run:\n      echo -e \"$ip2add via $BCR_IP\" >> $rfile \n"
    else
       echo -e "$ROUTETOADD" | sudo tee -a $rfile
       if [ $? -ne 0 ];then
         echo -e " ** Failed to append route $ip2add via $BCR_IP to $rfile"
         MESSAGE="$MESSAGE;Failed to append route to $rfilre"
         SUCCESS="no"
       else
         echo -e "  ** Appended route $ip2add via $BCR_IP to $rfile"
         MESSAGE="$MESSAGE;Successfully appended route to $rfile"
         SUCCESS="yes"
       fi
    fi

  fi

  [[ "$SUCCESS" == "yes" ]] && logsuccess "$MESSAGE"
  [[ "$SUCCESS" == "no" ]] && logsuccess "$MESSAGE"
}

# dont run this on any server with vyos or sasfw in the name - only runs on asb, chef, ee, bpm, rcp-bpm, rcp-ror, rcp-proxy
echo "$THISHOST" | egrep "\-vyos\-|\-sasfw\-"
if [[ "$?" -eq 0 ]];then
  echo -e  "  ** on sasfw - not adding routes."
  logsuccess "not needed on sasfw"
else
  GetBCRIP
  for NEWSUB in "${NEW_SUBNETS[@]}"
  do
    add_route "$NEWSUB" "$ROUTEFILE"
  done
fi
