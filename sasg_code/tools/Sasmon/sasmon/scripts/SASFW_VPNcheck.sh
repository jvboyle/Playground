#!/bin/bash
#
# Simple script to run on sasfw to check vpn (if configured) to Jumphosts & to IAM Vyattas
#
# History - orig - 24apr2019 - SBraun
#                  10may2019 - SBraun - fixed counter for multi-sasg checks
# ===============================================================================================
#RUNINTERVAL=300  # Run every five minutes
#RUNINTERVAL=60  # Run every minute
RUNINTERVAL=0  # Run every minute
source /sasg/bin/sasmon/sasmon.common
ALERTMSG=""
ALERTNAME="vpnissue"
WARNMSG=""
WARNNAME="vpnissue"
MAXCHECKS=2 # max times vpn check can fail before generating alert file for MIST
VARS="/sasg/configs/client/vars"

if [ ! -f "$VARS" ];then
   LOGALERT "WARNING" "$ALERTNAME" "$VARS file not found - unable to monitor vpns."
   exit 0
else
   #RET=$(source $VARS)
   source $VARS
fi

#set -x  # for debug

# no jumphost - no vpns to check- just exit
[[ -z "$SASG_IP_1" ]] && exit 0

# since we're appending all alerts in this monitor, clear the existing alerts and warnings files before we run
# so we don't just keep adding on to an existing file with the same messages repeated.
#CLEARALERT "ERROR" "$ALERTNAME"
#CLEARALERT "WARNING" "$WARNNAME"

CHECKSDIR="$LOGDIR/.sasmon_checks"
if [ ! -d "$CHECKSDIR" ];then
  LOG "creating $CHECKSDIR"
  mkdir -p $CHECKSDIR
fi

CLEARJHVPNERR(){
  IP=$1
  [[ -f "$CHECKSDIR/jh_$IP" ]] && mv $CHECKSDIR/jh_$IP $CHECKSDIR/jh_${IP}.previous
  CLEARALERT "ERROR" "jhvpn_${IP}"
} # CLEARVPNERR

JHVPNERR(){
  IP=$1
  MSG="$2"
  DATE=$(date +%Y_%m_%d_%H:%M:%S)

  if [ -f "$CHECKSDIR/jh_$IP" ];then
    echo "$DATE,$MSG" >> $CHECKSDIR/jh_$IP
    NUMFAILS=$(wc -l $CHECKSDIR/jh_$IP | awk '{printf("%d",$1)}')
    if [ "$NUMFAILS" -ge $MAXCHECKS ];then
      # more than two consecutive vpn check fails - log err on tunnel.
      LOG "$MSG,check $NUMFAILS > max"
      LOGALERT "ERROR" "jhvpn_${IP}" "$MSG - $NUMFAILS consecutive checks."
      mv $CHECKSDIR/jh_$IP $CHECKSDIR/jh_${IP}.previous
    fi
  else
    # file doesnt exist yet - check fails - if MAXCHECKS > 1 then create file
    # otherwise if maxchecks =1 alert right away
    if [ $MAXCHECKS -gt 1 ];then
         echo "$DATE,$MSG" > $CHECKSDIR/jh_$IP
         LOG "$MSG,check 1."
    else
      LOGALERT "ERROR" "jhvpn_${IP}" "$MSG"
    fi
  fi
} #JHVPNERR


if [ "$TUNNEL_TYPE" != "ipsec" ];then
  # openvpn - check if one or more tunnels, ping ip for each.
  
  VPNPEER=1
  for((i=0;i<${#SASG_IP_1[@]};i++)){
    VPNPEER=$((VPNPEER + 1))
    RET=$(ping -c1 3.0.0.${VPNPEER} | grep " 0% packet")
    if [ "$?" -ne 0 ];then
      JHVPNERR "3.0.0.${VPNPEER}" "Ping of openvpn tunnel ip 3.0.0.${VPNPEER} failed."
    else
      CLEARJHVPNERR "3.0.0.${VPNPEER}"
    fi
  }
else
  # ipsec tunnel to jumphost(s) - check ipsec status
  VPNPEER=0
  for((i=0;i<${#SASG_IP_1[@]};i++)){
    RET=$(sudo ipsec whack --trafficstatus | grep "peer-peer${VPNPEER}")
    if [ "$?" -ne 0 ];then
      JHVPNERR "peer.${VPNPEER}" "No ipsec tunnel found for peer-peer${VPNPEER}"
    else
      CLEARJHVPNERR "peer.${VPNPEER}"
    fi
    VPNPEER=$((VPNPEER + 1))
  }

fi # if [ "$TUNNEL_TYPE" 

if [[ ! -z "$IAMAAS_PRIMARY_SUBNET" && ! -z "$IAMAAS_PORTABLE_SUBNET" ]]; then
   # IAM defined - check for iam tunnel status to PUBLIC_VYATTA_VIP
   VPNPEER=$PUBLIC_VYATTA_VIP
   RET=$(sudo ipsec whack --trafficstatus | grep -w "${VPNPEER}")
    if [ "$?" -ne 0 ];then
      JHVPNERR "peer.${VPNPEER}" "No IAM ipsec tunnel found for peer ${VPNPEER}"
    else
      CLEARJHVPNERR "peer.${VPNPEER}"
    fi
   VPNPEER=$PUBLIC_JUNIPER_VIP
   RET=$(sudo ipsec whack --trafficstatus | grep -w "${VPNPEER}")
    if [ "$?" -ne 0 ];then
      JHVPNERR "peer.${VPNPEER}" "No IAM ipsec tunnel found for peer ${VPNPEER}"
    else
      CLEARJHVPNERR "peer.${VPNPEER}"
    fi
fi

