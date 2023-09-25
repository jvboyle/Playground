#!/bin/bash

source /sasg/bin/sasg_common.sh

#Checking the status Master for Keepalived and Status of OpenVPN services
master_status=`tail -1 /etc/keepalived/COUNTER | grep MASTER`
openvpn_status=`ps aux|grep "${SAS_CONFIG}"|grep "config client.conf"|grep -v grep | awk '{print $2}'`
iptables_status=`$STATUS_IPTABLES | egrep -i "inactive|not running"`

############################################
if [ -f "/tmp/sasgdebug" ];then
  DEBUG="True"
  DEBUGOUT="/tmp/sasgdebug.out"
fi

case $1 in
  "nc")
    [ ! -z "$DEBUG" ] && echo -e "\nrunning: nc -v -w1 -i1 $VYOS_PUB_IP $VYOS_BPM_PORT" >>$DEBUGOUT
    RST_FLAG=$(nc -v -w1 -i1 $VYOS_PUB_IP $VYOS_BPM_PORT 2>&1 | egrep -i "connected|connection refused|succeeded")
    ;;
  "wget")
    [ ! -z "$DEBUG" ] && echo -e "\nrunning wget --timeout=2 --connect-timeout=2 --tries=1 \"https://$VYOS_PUB_IP\"" >>$DEBUGOUT
    if [ -z "$HTTPS_PROXY" ];then
      # in case called with wget arg but no HTTPS_PROXY was set
      RST_FLAG=$(wget --timeout=2 --connect-timeout=2 --tries=1 "https://${VYOS_PUB_IP}:${VYOS_BPM_PORT}" --no-check-certificate 2>&1 | egrep -i "connected|connection refused|succeeded|Unable to establish SSL connection")
    else
      RST_FLAG=$(wget --timeout=2 --connect-timeout=2 --tries=1 "https://${VYOS_PUB_IP}:${VYOS_BPM_PORT}" -e https_proxy=${HTTPS_PROXY}:${HTTPS_PROXY_PORT} --no-check-certificate 2>&1 | egrep -i "connected|connection refused|succeeded|Unable to establish SSL connection")
    fi
    ;;
  *)
    [ ! -z "$DEBUG" ] && echo -e "\nrunning: timeout 1 tcpdump -n -i any src $VYOS_PUB_IP" >>$DEBUGOUT
    timeout 1 `cat < /dev/null > /dev/tcp/$VYOS_PUB_IP/$VYOS_BPM_PORT` &
    export TCP_RST_CATCH="$(timeout 1 tcpdump -n -i any src $VYOS_PUB_IP)"
    RST_FLAG=$(echo "$TCP_RST_CATCH" | grep $VYOS_PUB_IP)
    ;;
esac

[ ! -z "$DEBUG" ] && echo -e "\nRST_FLAG=<$RST_FLAG>" >>$DEBUGOUT


############################################

if [ ! -z "$RST_FLAG" ]
then
    #Checking if Keepalived is Master and OpenVPN is down then restarting OpenVPN service
    if [ ! -z "$master_status" ] && [ -z "$openvpn_status" ]
    then
      if [ ! -d "/var/run/openvpn" ];then
        mkdir /var/run/openvpn
      fi
      /usr/sbin/openvpn --daemon --writepid /var/run/openvpn/client.pid --cd ${SAS_CONFIG} --config client.conf --log-append $VPNLOG
    fi
    
    #Checking if Keepalived is not Master and OpenVPN is UP then OpenVPN service is stopped
    if [ -z "$master_status" ]  &&  [ ! -z "$openvpn_status" ]
    then
        ps aux|grep "${SAS_CONFIG}"|grep "config client.conf"|grep -v grep | awk '{print $2}'|xargs kill -9
    fi    
    
    #Checking if Iptables service is stopped, if Yes then service is started up
    if [ ! -z "$iptables_status" ]
    then
       $START_IPTABLES
    fi
else
    #If VyOS is not reachable then Keepalived must switch to FAULT state    
    exit 1        
fi
