#!/bin/bash
#
# Simple script that can be run on sasfw or any tools server to check if running ipset / iptables 
# contains expected config strings - if not, log alert
#
# History - orig - 09Nov2018 - SBraun
# ===============================================================================================
RUNINTERVAL=120  # Run every two minutes - must come before sourcing in sasmon.common
source /sasg/bin/sasmon/sasmon.common
ALERTMSG=""
ALERTNAME="fwissue"
WARNMSG=""
WARNNAME="fwissue"

# since we're appending all alerts in this monitor, clear the existing alerts and warnings files before we run
# so we don't just keep adding on to an existing file with the same messages repeated.
CLEARALERT "ERROR" "$ALERTNAME"
CLEARALERT "WARNING" "$WARNNAME"


# check some other params like are ipset and iptables active & set to enabled so they start on reboot
IPSETSTATE=$(sudo systemctl is-active ipset)
IPSETENABLED=$(sudo systemctl is-enabled ipset)
#IPSETVALIDATE=$(sudo ls -tr /sasg/backup/ipset*|tail -1)
IPSETCURRCFGSZ=$(sudo ls -l /etc/sysconfig/ipset|awk '{print $5}')

IPTABLESSTATE=$(sudo systemctl is-active iptables)
IPTABLESENABLED=$(sudo systemctl is-enabled iptables)
IPTABLESVALIDATE=$(sudo ls -tr /sasg/backup/iptab*|tail -1)
IPTABLESCURRCFGSZ=$(sudo ls -l /etc/sysconfig/iptables|awk '{print $5}')


if [ "$IPSETSTATE" != "active" ];then
  LOG "ipset not active..restarting" 
  sudo systemctl start ipset
  IPSETSTATE=$(sudo systemctl is-active ipset)
  if [ "$IPSETSTATE" != "active" ];then
    LOGALERT "ERROR" "$ALERTNAME" "$SHNAME $THIS: Ipset not active" "APPEND"
    ALERTMSG="${ALERTMSG};Ipset not active"
  else
    LOG "ipset restarted and now active."
  fi
fi

if [ "$IPTABLESSTATE" != "active" ];then
  LOG "iptables not active..restarting" 
  sudo systemctl start iptables
  IPTABLESSTATE=$(sudo systemctl is-active iptables)
  if [ "$IPTABLESSTATE" != "active" ];then
    LOGALERT "ERROR" "$ALERTNAME" "$SHNAME $THIS: Iptables not active" "APPEND"
    ALERTMSG="${ALERTMSG};Iptables not active"
  else
    LOG "iptables restarted and now active."
  fi
fi

if [ "$IPSETENABLED" != "enabled" ];then
  LOG "ipset not set to enabled..updating."
  sudo systemctl enable ipset
  IPSETENABLED=$(sudo systemctl is-enabled ipset)
  if [ "$IPSETENABLED" != "enabled" ];then
    LOGALERT "WARNING" "$WARNNAME" "$SHNAME $THIS: Ipset not set to enabled." "APPEND"
    WARNMSG="${WARNMSG};Ipset not enabled"
  else
    LOG "ipset service set to enabled."
  fi
fi

if [ "$IPTABLESENABLED" != "enabled" ];then
  LOG "iptables not set to enabled..updating."
  sudo systemctl enable iptables
  IPTABLESENABLED=$(sudo systemctl is-enabled iptables)
  if [ "$IPTABLESENABLED" != "enabled" ];then
    LOGALERT "WARNING" "$WARNNAME" "$SHNAME $THIS: Iptables not set to enabled." "APPEND"
    WARNMSG="${WARNMSG};Iptables not enabled"
  else
    LOG "iptables service set to enabled."
  fi
fi

if [ "$IPSETCURRCFGSZ" -eq 0 ];then
  LOGALERT "ERROR" "$ALERTNAME" "$SHNAME $THIS: zero length /etc/sysconfig/ipset file" "APPEND"
  ALERTMSG="${ALERTMSG};Ipset zero length cfg"
fi
if [ "$IPTABLESCURRCFGSZ" -eq 0 ];then
  LOGALERT "ERROR" "$ALERTNAME" "$SHNAME $THIS: zero length /etc/sysconfig/iptables file" "APPEND"
  ALERTMSG="${ALERTMSG};Iptables zero length cfg"
fi

IP6TABLESSTATE=$(sudo systemctl is-active ip6tables)
IP6TABLESENABLED=$(sudo systemctl is-enabled ip6tables)
RET=$(sudo ip6tables -L |grep "policy ACCEPT")
if [ ! -z "$RET" ];then
  NEWRET=$(echo "$RET" | sed "s/^M/_/g")
  ALERTMSG="${ALERTMSG};ip6tables config incorrect - 1 or more ipv6 filter policy set to ACCEPT but should drop all: $NEWRET"
fi

if [ "$IP6TABLESSTATE" != "active" ];then
  LOG "ip6tables not active..restarting" 
  sudo systemctl start ip6tables
  if [ "$IP6TABLESSTATE" != "enabled" ];then
    LOGALERT "ERROR" "$ALERTNAME" "$SHNAME $THIS: Ip6tables not active" "APPEND"
    ALERTMSG="${ALERTMSG};ip6tables not active"
  else
    LOG "ip6tables restarted and active."
  fi
fi
if [ "$IP6TABLESENABLED" != "enabled" ];then
  LOG "ip6tables not set to enabled..updating."
  sudo systemctl enable ip6tables
  IP6TABLESENABLED=$(sudo systemctl is-enabled ip6tables)
  if [ "$IP6TABLESENABLED" != "enabled" ];then
    LOGALERT "WARNING" "$WARNNAME" "$SHNAME $THIS: Ip6tables not set to enabled." "APPEND"
    WARNMSG="${WARNMSG};ip6tables not enabled"
  else
    LOG "ip6tables set to enabled."
  fi
fi


#echo -e "ALERTMSG=<$ALERTMSG>"
if [ -z "$ALERTMSG" ];then
  CLEARALERT "ERROR" "$ALERTNAME"
fi

#echo -e "WARNMSG=<$WARNMSG>"
if [ -z "$WARNMSG" ];then
  CLEARALERT "WARNING" "$WARNNAME"
fi
