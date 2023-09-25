############################################################
#!/bin/bash
# v3.1.07 - added iptables commands to add/delete output rules to enable on-boarding of 
#           jumphosts not currently running as master
STATE=$1
source /sasg/bin/sasg_common.sh
SASGVIP=$(grep -A1 "virtual_ipaddress" /etc/keepalived/keepalived.conf |grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}")
#CHEF2IP=$(grep "dport 443" /etc/sysconfig/iptables|grep -i to-destination|grep PREROUTING|grep -E -o "2[.]([0-9]{1,3}[.]){2}[0-9]{1,3}")
CHEF2IP=$(grep "dport 443" /etc/sysconfig/iptables|grep -i to-destination|grep PREROUTING|grep -E -o '[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}' |grep "^2")
[[ -z "$SASGVIP" ]] && echo "$DATE Error - unable to get sasg VIP for iptables OUTPUT rule."
[[ -z "$CHEF2IP" ]] && echo "$DATE Error - unable to get CHEF 2dot ip for iptables OUTPUT rule."
iptables_output_status=`iptables-save | egrep -E "\-A OUTPUT \-d"`

case $STATE in
        "MASTER") touch $KEEPALIVED/MASTER
                  echo "$DATE Becoming MASTER" >> $KEEPALIVED/COUNTER
                  # no start of ipsec here - let sasg-check script start ipsec.
                  if [ -z "$iptables_output_status" ];then
                    # when JH becomes master, add output rules
                    ${IPTABCMD} -t nat -A OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 443 -m comment --comment OUTPUT-DNAT-10 -j LOG --log-level 4 --log-prefix [SG_OUTPUT-DNAT-10]
                    ${IPTABCMD} -t nat -A OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 443 -m comment --comment OUTPUT-DNAT-10 -j DNAT --to-destination ${CHEF2IP}
                    ${IPTABCMD} -t nat -A OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 8443 -m comment --comment OUTPUT-DNAT-20 -j LOG --log-level 4 --log-prefix [SG_OUTPUT-DNAT-20]
                    ${IPTABCMD} -t nat -A OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 8443 -m comment --comment OUTPUT-DNAT-20 -j DNAT --to-destination ${CHEF2IP}
                  fi #if [ -z "$iptables_output_status" ];
                  exit 0
                  ;;
        "BACKUP") rm $KEEPALIVED/MASTER
                  echo "$DATE Becoming BACKUP" >> $KEEPALIVED/COUNTER
                  $STOP_IPSEC
                  if [ ! -z "$iptables_output_status" ];then
                    # when JH becomes backup, delete output rules
                    ${IPTABCMD} -t nat -D OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 443 -m comment --comment OUTPUT-DNAT-10 -j LOG --log-level 4 --log-prefix [SG_OUTPUT-DNAT-10]
                    ${IPTABCMD} -t nat -D OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 443 -m comment --comment OUTPUT-DNAT-10 -j DNAT --to-destination ${CHEF2IP}
                    ${IPTABCMD} -t nat -D OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 8443 -m comment --comment OUTPUT-DNAT-20 -j LOG --log-level 4 --log-prefix [SG_OUTPUT-DNAT-20]
                    ${IPTABCMD} -t nat -D OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 8443 -m comment --comment OUTPUT-DNAT-20 -j DNAT --to-destination ${CHEF2IP}
                  fi #if [ -z "$iptables_output_status" ];
                  exit 0
                  ;;
        "FAULT")  rm $KEEPALIVED/MASTER
                  echo "$DATE Becoming FAULT" >> $KEEPALIVED/COUNTER
                  $STOP_IPSEC
                  if [ ! -z "$iptables_output_status" ];then
                    # when JH becomes fault, delete output rules
                    ${IPTABCMD} -t nat -D OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 443 -m comment --comment OUTPUT-DNAT-10 -j LOG --log-level 4 --log-prefix [SG_OUTPUT-DNAT-10]
                    ${IPTABCMD} -t nat -D OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 443 -m comment --comment OUTPUT-DNAT-10 -j DNAT --to-destination ${CHEF2IP}
                    ${IPTABCMD} -t nat -D OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 8443 -m comment --comment OUTPUT-DNAT-20 -j LOG --log-level 4 --log-prefix [SG_OUTPUT-DNAT-20]
                    ${IPTABCMD} -t nat -D OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 8443 -m comment --comment OUTPUT-DNAT-20 -j DNAT --to-destination ${CHEF2IP}
                  fi #if [ -z "$iptables_output_status" ];
                  exit 0
                  ;;
        *)        echo "unknown state"
                  echo "$DATE Becoming UNKOWN" >> $KEEPALIVED/COUNTER
                  exit 1
                  ;;
esac
#############################################################
