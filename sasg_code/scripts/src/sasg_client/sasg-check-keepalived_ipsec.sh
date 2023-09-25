#!/bin/bash

source /sasg/bin/sasg_common.sh

###########################################
#Checking the status Master for Keepalived and Status of IPSEC services
master_status=`tail -1 /etc/keepalived/COUNTER | grep MASTER`
ipsec_status=`ps aux | grep /usr/libexec/ipsec/pluto | grep -v grep`
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

###########################################
#In case if connections towards VyOS is OK then the following conditions will be checked and executed accordingly
if [ ! -z "$RST_FLAG" ]
then
        # if keepalive is master & ipsec is up, check globalstatus - if ike.authenticated
        # shows 0 then restart ipsec
        if [ ! -z "$master_status" ] && [ ! -z "$ipsec_status" ];then
          JH_VIP1=$(grep -A1 "virtual_ipaddress" /etc/keepalived/keepalived.conf |grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}")
          CHEFNC=$(nc -v -w1 -i1 $JH_VIP1 8443)  # generate outbound vti traffic
          OUTBYTES=$(/usr/sbin/ipsec whack --trafficstatus | grep -vi "outBytes=0,")  # blank if ipsec tunnel not incrementing output bytes due to "hung" ipsec
          if [ -z "$OUTBYTES" ];then
            echo "$DATE: IPSec all tunnels show outBytes=0, restarting IPSec" >>$keepalive_log_file
            $RESTART_IPSEC
          fi
        fi

	#Checking if Keepalived is Master and IPSEC is down then restarting IPSEC service
	if [ ! -z "$master_status" ] && [ -z "$ipsec_status" ]
	then
          # start then restart to clear any stale SAs and prevent long wait for SA_REPLACE timer to expire
          # before data starts flowing again upon ha failover.
          echo "$DATE: Starting IPSec" >>$keepalive_log_file
          $STOP_IPSEC
          sleep 5
          $START_IPSEC
	fi

	#Checking if Keepalived is not Master and IPSEC is UP then IPSEC service is stopped
	if [ -z "$master_status" ]  &&  [ ! -z "$ipsec_status" ]
	then
          $STOP_IPSEC
	fi

	#Checking if Iptables service is stopped when Keepalived is MASTER, if Yes then service is started up
	if [ ! -z "$master_status" ] && [ ! -z "$iptables_status" ]
        then
          $START_IPTABLES
        fi
else
	#If SSH connection towards VyOS fails then Keepalived must switch to FAULT state	
	exit 1		
fi

