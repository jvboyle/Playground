#!/bin/bash
###########################################################################
# Description: Configures SASFW for SAS Customer Dedicated Segment
# Author: Stan Braun
# Date: 29SEP2017
# Usage: ./cds_sasfw_setup.sh
# History:
#    2017.29.04 - Original script - based on cds_vyos_configure.sh by John Simmons - updated for redhat iptables/ipset
#    2017.02.10 - Ipset creation working
#    2017.03.10 - Iptables raw & filter table creation working
#    2017.06.10 - Iptables snat/dnat working
#    2017.18.10 - Iptables working - gen'd new iptables - diff'd against vyos iptables
#    2017.19.10 - Additional rules to allow R1Soft/APM from sasfw
#    2017.25.10 - Additional rule to allow APM icmp to sasfw
#    2017.25.10 - Additional rule to allow APM icmp to sasfw
#    2017.01.11 - SBraun - chgs to allow running from sasauto id & using sudo.  Also import sasg_common.sh
#    2017.03.11 - SBraun - minor fixes to sudo cmds - escaped slashes...uncommented ESTABLISHED connection return lines - only commented log lines for established connections.
#    2017.06.11 - SBraun - added 5986 to OUTBOUND_CUST_TCP_PORTS if VCENTER_IP[0] defined - needed for asb connection
#    2017.06.11 - also added ASB_IP to new ipset list DEDICATED_SEGMENT_ASB and new rule to allow outbound ASB to bigfix on custprem
#    2017.07.11 - SBraun - per JVBoyle - updated nat rule for cds to outbound eth1 - source mask chgd to 10.0.0.0/8 to allow for rcp on different subnet
#    2017.08.11 - SBraun - fix - updated tunnel name in firewall hook - use appropriate ipsec vti0  or vtun0 depending on tunnel type. Added loop to add multiple vtunX hooks
#               - for multi-sasg installs.
#    2017.08.11 - SBraun - fixed VCENTER_IP array variable
#    2017.08.11 - SBraun - multiple nat rules still had -o eth1 vs new -o vti0 virtual tunnel interface.
#    14Nov2017 - SBraun - fixed addition of customer premise bigfix rules - wasn't adding all properly also need 443 to bigfix on cust prem per ASB/RCP team
#    15Nov2017 - SBraun - added vrrp mgmt segment IPs to MANAGEMENT_SEGMENT ipset list to allow proper elk server connectivity for log pulls.
#    20Nov2017 - SBraun - added check when updating ipset - if get already added msg - ignore, otherwise exit - handles case where 
#                         mini mgmt segment ip is specified but is one we already added by default.
#    11Dec2017 - SBraun - fixed defect #50 - issue with snat rule for non-10dot customer endpoint to CDS rule had incorrect source/destination.
#    09Jan2018 - SBraun - 3.1.07 added set of ipset/iptables services to enabled
#    11Jan2018 - SBraun - 3.1.07 fixed log-prefix label on a few entries missing [SG_ - caused a few entries to 
#                         go to default messages log vs sasfw firewall log.
#    13Feb2018 - SBraun - 3.1.07 added ETH1_LOCAL rule for established connections - otherwise outbound 443 was allowed out to internet but the reply packets would get dropped.
#    2018.02.20 - SDubrouskaya -v  -implemented IAMaaS automation
#    2018.04.10 - SBraun - added OUTBOUND_PUBLIC_PORTS 8200 to enable BluemMix Vault as a service
#    2018.04.10 - SBraun - added OUTBOUND_PUBLIC_PORTS 8200 to enable BluemMix Vault as a service
#    2018.04.25 - SDubrouskaya - fixed Multi Sasg support for IAMaaS  
#    2018.04.25 - SDubrouskaya - Put IAMaaS IPSEC interface into vti0 in case the customer tunnel type is openvpn
#    2018.05.03 - SBraun - 3.2.03 - Support for CEBW_IP - consolidated Chef, EE, BPM servers
#    2018.05.04 - SBraun - 3.2.03 - Support for RCP_IP - consolidated RCP_BPM, RCP_ROR servers
#    2018.05.09 - SBraun - 3.2.03 - Add both new & old mgmt vyatta VIPs to MANAGMENT_SEGMENT ipset list
#    2018.06.11 - ASakhno - 3.3 - Add ipset groups and iptables rules for CSC servers - CSC_*_IPS and CSC_*_PORTS
#    2018.06.11 - ASakhno - v3.3 - Feature 405729 - rules added for IAM TDI connectivity
#    2018.07.11 - SBraun - v3.3 Moved ETH1-LOCAL ESTABLISHED rule to outside CUSTOMER_NETWORK_INFO=true if-then so it gets set even for rcp dedicated/shared rcp sasfw environments
#    2018.09.05 - SBraun - v3.3 Found no code for adding MS_VYATTA_IP if specified in vars only MINI_MS_VYATTA_IP - added lien to add the MS_VYATTA_IP as well - ok even if duplicated - will just say already added.
#    2018.10.18 - SDubrouskaya -. Support for ticketing system on the customer premises
#    2018.11.23 - SBraun - v4 Major changes to filter rules for zero-trust model. No NAT changes. Using ip,mac bitmaps for each SDS server instead of just ip hash.
#    2018.12.03 - SBraun - v4 Kept in call to flush iptables raw table but commented out all calls to configure raw table in new config per Ntwk Arch request
#    2018.12.09 - SBraun - v4 Added missing ipset lists & filter rule for asb to vcenter
#    2018.12.19 - SBraun - v4.08 DEDICATED_SEGMENT changed to list:set, add ipset ip,mac bitmap set for each sds, add all sds sets as member of DEDICATED_SEGMENT,
#                          changed range on each individual server's ipset set to only include that server's ip address
#    2018.12.24 - SBraun - v4.08 Fixed check for DNS_IP, LDAP_IP to determine whether to add rules to allow traffic to customer dns / ldap servers.
#    2018.01.11 - SBraun - v4.10 Added filter for Endpoint to EE Kafka messaging
#    2018.01.31 - SBraun - v4.11 Fixed adding of exclude rules ONLY if one or more VTUN_PORT variables is set to 443.  Check if CHEF_PORT array variable is set before 
#    2019.05.17 - SBraun - Issue 279 - Add Zabbix connectivity from NA Mgmt Seg to tcp 10050
#    2019.06.03 - SDubrouskaya - RCP Shared HA Support
# Notes:  
########################################################################

#######################################
# Check sanity of the data in vars file. ALthough the check is also performed
# in SASGaaS, checking here helps in case scripts are manually executed
# Globals:
#   BPM_IP - (sourced from vars file) IP of BPM SLA machine
#   CEBW_IP - (sourced from vars file) IP of single VM (which contains EE,
#     Chef & BPM together)
#   CHEF_IP - (sourced from vars file) IP of Chef SLA machine
#   SASG_IP_1 - (sourced from vars file) SASG IP. If set indicates that SASG
#     is present for current customer
#   EE_IP - (sourced from vars file) IP of EE SLA machine
# Arguments:
#   None
# Returns:
#   0 - data from vars was successfully validated
#   1 - data from vars is wrong
#######################################
function input_data_validation() {
  # Do nothing for now

  return 0
}

# Source in account specific vars file
source ./vars

if ! input_data_validation; then
  echo -e "\nERROR: Input data could not be validated"
  exit 1
fi

# Source in sasfw common variables
source ./sasg_common.sh

SCRIPT_INFO="$0 $VERSION"
# checking via ifcfg file since some accounts have alias on private nic to support tools servers
# that were added on a different subnet.
# THISIP=$(ip addr show dev eth0 |grep "inet "|awk '{print $2}'|cut -f1 -d'/')
THIS_IP=$(sudo cat /etc/sysconfig/network-scripts/ifcfg-eth0 |grep -w IPADDR|awk -F'=' '{printf("%s\n",$2)}')
echo -e `date` " - Configuring SASFW server $THISIP, $SCRIPT_INFO\n"

IPSET="/etc/sysconfig/ipset"
IPTABLES="/etc/sysconfig/iptables"

# Run through check of each sds server defined & make sure a MAC address is defined as well
# since we need to allow each sds to talk thru sasfw on specific ports & with zero-trust we're setting
# the dedicated_segment and specific server lists such as ee_ip  up with an ip,mac bitmap.  Dont want
# to define the bitmap with just the ip and have it auto-populate the mac on first rule match & only keep
# that in memory.
MACS="true"
[[ ! -z "$CEBW_IP" ]] && [[ -z "$CEBW_MAC" ]] && MACS="CEBW_MAC"
[[ ! -z "$BPM_IP" ]] && [[ -z "$BPM_MAC" ]] && MACS="$MACS, BPM_MAC"
[[ ! -z "$CHEF_IP" ]] && [[ -z "$CHEF_MAC" ]] && MACS="$MACS, CHEF_MAC"
[[ ! -z "$EE_IP" ]] && [[ -z "$EE_MAC" ]] && MACS="$MACS, EE_MAC"
[[ ! -z "$ASB_IP" ]] && [[ -z "$ASB_MAC" ]] && MACS="$MACS, ASB_MAC"
[[ ! -z "$CSC_IP" ]] && [[ -z "$CSC_MAC" ]] && MACS="$MACS, CSC_MAC"
for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
do
   [[ ! -z "${RCP_PROXY_IP[INDEX]}" ]] && [[ -z "${RCP_PROXY_MAC[INDEX]}" ]] && MACS="$MACS, RCP_PROXY_MAC[${INDEX}]"
done
[[ ! -z "$RCP_IP" ]] && [[ -z "$RCP_MAC" ]] && MACS="$MACS, RCP_MAC"
[[ ! -z "$RCP_BPM_IP" ]] && [[ -z "$RCP_BPM_MAC" ]] && MACS="$MACS, RCP_BPM_MAC"
[[ ! -z "$RCP_ROR_IP" ]] && [[ -z "$RCP_ROR_MAC" ]] && MACS="$MACS, RCP_ROR_MAC"
[[ "$MACS" != "true" ]] && echo -e "\nERROR - MAC(s) not defined in vars: $MACS" && exit 1

echo -e "\nHave values for all mac addresses for all defined SDS's..continuing..."

# **IF LOCATION not set in vars file, get LOCATION info from hostname if possible
# DC name should be last part of hostname just before domain name
# ie: sla-p-la119-asb-dal09.sdad.sl.ibm.com,  DC=dal09
# if it is set, translate it to all upper case - just to make sure we're consistent.
if [ -z "$LOCATION" ];then
  HNAME=$(hostname)
  # use grep with pattern to pull out the location from the hostname - looks for anything
  # with a period or a dash (found some hosts specified incorrectly), followed by 3 letters then one to 3 digits followed by a dash.
  DC=$(echo "$HNAME"|grep -E -o "[-.]([a-zA-Z]){1,3}([0-9]){1,3}[.]"|sed "s/[0-9.\-]//g" | tr '[:lower:]' '[:upper:]')
  if [ -z "$DC" ];then
    echo -e "\nERROR - unable to determine DC from server hostname: $HNAME, exiting."
    exit 1
  fi
else
  DC=$(echo "$LOCATION" | tr '[:lower:]' '[:upper:]'|sed "s/[0-9]//g")
fi

if [ -z "$DC" ];then
  echo -e "\nERROR - no location found for server - unable to continue as rulebase is dependent on what geo the server is in.  Exiting."
  exit 1
fi

echo "LOCATION=<$LOCATION>, DC=<$DC>"



# 3.2.03 - support for CEBW_IP - consolidated chef, ee, bpm services in one vm
if [ ! -z "$CEBW_IP" ];then
  echo -e "\nCEBW_IP defined, setting variables for consolidate chef, ee, bpm services..."
  BPM_IP=$CEBW_IP
  BPM_MAC=$CEBW_MAC
  CHEF_IP=$CEBW_IP
  CHEF_MAC=$CEBW_MAC
  EE_IP=$CEBW_IP
  EE_MAC=$CEBW_MAC
fi
if [ ! -z "$RCP_IP" ];then
  echo -e "\nRCP_IP defined, setting variables for consolidated rcp services into single vm..."
  RCP_BPM_IP=$RCP_IP
  RCP_BPM_MAC=$RCP_MAC
  RCP_ROR_IP=$RCP_IP
  RCP_ROR_MAC=$RCP_MAC
fi

[[ -z ${LDAP_PORT} ]] && LDAP_PORT[0]=636

# set default Chef logs upload IP & port if they're missing
[ -z "${SASG_LOGPUSH_PORT}" ] && SASG_LOGPUSH_PORT=3444
[ -z "${SASG_LOGPUSH_IP}" ] && SASG_LOGPUSH_IP="${PRIVATE_VYOS_IP}"

# Assign MMS ips. We explicitly allow ops to provide several values via vars file
# hence the last reference to array is uncommented (since they will provide several
# values via commented out line with spaces, not via array)
[[ -z ${MS_WDC04_IP} ]] && MS_WDC04_IP=("10.149.99.229") || MS_WDC04_IP=("10.149.99.229" ${MS_WDC04_IP[@]})
[[ -z ${MS_MEL01_IP} ]] && MS_MEL01_IP="10.118.186.111"
[[ -z ${MS_SYD05_IP} ]] && MS_SYD05_IP="10.195.44.229"
[[ -z ${MS_AMS03_IP} ]] && MS_AMS03_IP="10.175.8.23"
# [[ -z ${MS_FRA02_IP} ]] && MS_FRA02_IP="10.85.112.193" # decommitted
[[ -z ${MS_MON01_IP} ]] && MS_MON01_IP="10.140.229.130"
[[ -z ${MS_CHE01_IP} ]] && MS_CHE01_IP="10.162.74.153"
[[ -z ${MS_TOK02_IP} ]] && MS_TOK02_IP="10.132.239.119"
tmp_test_ips=("10.190.84.216" "10.190.84.246" "10.149.99.236" "10.190.17.89")
[[ -z ${MS_TEST_IP} ]] && MS_TEST_IP=("${tmp_test_ips[@]}")

###########################################################################
# LOG - simple function to echo out arg with & if 2nd arg provided
# print divider line prior to echoing output - cleans up script instead of having
# LOG ...  everywhere
###########################################################################
LOG(){
  MSG="$1"
  DIVIDER="$2"
  if [ ! -z "$DIVIDER" ];then
    echo -e "\n################################################################################################"
  fi
  echo -e "$MSG"
}

DATE=`date +"%F %T"`
LOG "\nConfiguring SAS Firewall (SASFW)\n$DATE\nVersion: $VERSION"
LOG "\n" "divider"
###########################################################################
# copy a file to a backup either via mv or cp  and either exit or not depending on args received 
# Usage: BackupFile "file to back up" "cp|mv" "exit|noexit"
###########################################################################
BackupFile(){
  File2Backup="$1"
  CopyOrMove="$2"
  if [[ "$3" == "exit" ]];then
    ExitOnFail=0
  else
    ExitOnFail=1
  fi
  DATE=`date +"%F_%T"`

  LOG "\nexecuting: sudo su - root -c \"$CopyOrMove $File2Backup ${File2Backup}.${DATE}\"\n"
  if [ -f "$File2Backup" ];then
    RET=$(sudo su - root -c "$CopyOrMove $File2Backup ${File2Backup}.${DATE} 2>&1" )
    if [ "$?" -ne 0 ];then
       if [ "$ExitOnFail" -eq 0 ];then
          LOG "\nERROR: $CopyOrMove failed - $RET\n"
          exit 1
       else
          LOG "\nWarning: $CopyOrMove failed - $RET\n"
       fi
    else
       LOG "\nSuccess: $CopyOrMove $File2Backup ${File2Backup}.${DATE}\n"
    fi
  else
    LOG "$File2Backup does not exist... skipping $CopyOrMove..."
  fi
}

###########################################################################
# Run ipset command passed as arg, check for errors and
# print error/exit if ipset return is non-zero
###########################################################################
runIPSET(){
  ipsetcmd="$1"

  RET=$(sudo su - root -c "$IPSETCMD $1 2>&1")
  if [ "$?" -ne 0 ];then
   echo "$RET"|grep -qi -e "already added" -e "already exists"
   if [ "$?" -eq 0 ];then
     LOG "\n$IPSETCMD $1 - $RET\n"
   else
     # if any other err other than already added or already exists, log err & exit
     # takes care of case where mini mgmt segment is specified but already added by default
     LOG "\nERROR: $IPSETCMD $1 - $RET\n"
     exit 1
   fi
  else
   LOG "Success: $IPSETCMD $1"
  fi
}
###########################################################################
# Run iptables command passed as arg, check for errors and
# print error/exit if iptables return is non-zero
###########################################################################
#update iptables filter table
runIPTABLES(){
  iptablescmd="$1"

  RET=$(sudo su - root -c "$IPTABCMD $1 2>&1")
  if [ "$?" -ne 0 ];then
   echo "$RET"|grep -qi "Chain already exists"
   if [ "$?" -eq 0 ];then
     LOG "\nWARNING: $IPTABCMD $1 - $RET"
   else 
     LOG "\nERROR: $IPTABCMD $1 - $RET\n"
     exit 1
   fi
  else
   LOG "Success: $IPTABCMD $1"
  fi
}
# adds comment in iptables even if it has spaces & applies appropriate action - accept, reject, drop
# depending on args supplied
# if you call runIPTABLES above with field with spaces, it doesnt process the double quotes properly 
# hence the reason for doing it this way
runIPTABLESdefault(){
  iface="$1"  # ie ETH0_IN, VTUN_IN, VTUN_OUT
  action="$2" # ie REJECT --reject-with icmp-port-unreachable

  echo "$action"|grep -qi "RETURN"
  if [ "$?" -eq 0 ];then
    LOGFLAG="A"
    COMMENTFLAG="accept"
  fi
  echo "$action"|grep -qi "REJECT"
  if [ "$?" -eq 0 ];then
    LOGFLAG="R"
    COMMENTFLAG="reject"
  fi
  echo "$action"|grep -qi "DROP"
  if [ "$?" -eq 0 ];then
    LOGFLAG="D"
    COMMENTFLAG="drop"
  fi

  # create the log entry
  # only ETH1_IN & VTUN_IN gets logged
  if [[ "$iface" == "ETH1_IN" ]] || [[ "$iface" == "VTUN_IN" ]]; then
     RET=$(sudo su - root -c "$IPTABCMD -A $iface -m comment --comment \"${iface}-10000 default-action $COMMENTFLAG\"  -j LOG -m limit --limit 1/sec --log-prefix \"[SG_${iface}-default-${LOGFLAG}]\"  2>&1")
     if [ "$?" -ne 0 ];then
        LOG "\nERROR: $IPTABCMD -A $iface -m comment --comment \"${iface}-10000 default-action $COMMENTFLAG\"  -j LOG -m limit --limit 1/sec --log-prefix \"[SG_${iface}-default-${LOGFLAG}] - $RET\n"

        exit 1
     else
        LOG "\nSuccess: $IPTABCMD -A $iface -m comment --comment \"${iface}-10000 default-action $COMMENTFLAG\"  -j LOG -m limit --limit 1/sec --log-prefix \"[SG_${iface}-default-${LOGFLAG}]"
     fi
  fi    

  # create the action entry
  RET=$(sudo su - root -c "$IPTABCMD -A $iface -m comment --comment \"${iface}-10000 default-action $COMMENTFLAG\"  -j $action")
  if [ "$?" -ne 0 ];then
    LOG "\nERROR: $IPTABCMD -A $iface -m comment --comment \"${iface}-10000 default-action $COMMENTFLAG\"  -j $action - $RET"
    exit 1
  else
    LOG "\nSuccess: $IPTABCMD -A $iface -m comment --comment \"${iface}-10000 default-action $COMMENTFLAG\"  -j $action"
  fi
}
# update iptables raw table
runIPTABLESraw(){
  iptablescmd="$1"

  RET=$(sudo su - root -c "$IPTABCMD --table raw $1 2>&1")
  if [ "$?" -ne 0 ];then
   echo "$RET"|grep -qi "Chain already exists"
   if [ "$?" -eq 0 ];then
     LOG "\nWARNING: $IPTABCMD --table raw $1 - $RET"
   else
     LOG "\nERROR: $IPTABCMD --table raw $1 - $RET\n"
     exit 1
   fi
  else
   LOG "Success: $IPTABCMD --table raw $1"
  fi
}
# update iptables nat table
runIPTABLESnat(){
  iptablescmd="$1"

  RET=$(sudo su - root -c "$IPTABCMD --table nat $1 2>&1")
  if [ "$?" -ne 0 ];then
   echo "$RET"|grep -qi "Chain already exists"
   if [ "$?" -eq 0 ];then
     LOG "\nWARNING: $IPTABCMD --table nat $1 - $RET"
   else
     LOG "\nERROR: $IPTABCMD --table nat  $1 - $RET\n"
     exit 1
   fi
  else
   LOG "Success: $IPTABCMD --table nat $1"
  fi
}

# update iptables mangle table
runIPTABLEMangle(){
  iptablescmd="$1"

  RET=$(sudo su - root -c "$IPTABCMD --table mangle $1 2>&1")
  if [ "$?" -ne 0 ];then
   echo "$RET"|grep -qi "Chain already exists"
   if [ "$?" -eq 0 ];then
     LOG "\nWARNING: $IPTABCMD --table mangle $1 - $RET"
   else
     LOG "\nERROR: $IPTABCMD --table mangle  $1 - $RET\n"
     exit 1
   fi
  else
   LOG "Success: $IPTABCMD --table mangle $1"
  fi
}
###########################################################################
# Restart iptables - echo out msg if provided or just default msg.
# log error & exit if non-zero return
###########################################################################
restartIPTABLES(){
  MSG="$1"
  if [ -z "$MSG" ];then
    MSG="Restarting iptables..."
  fi
  LOG "\n$MSG"
  RET=$(sudo su - root -c "$RESTART_IPTABLES 2>&1")
  if [ "$?" -ne 0 ];then
    LOG "\nERROR: $RESTART_IPTABLES failed - $RET\n"
    exit 1
  else
    LOG "\nSuccess: $RESTART_IPTABLES completed.\n"
  fi
}
###########################################################################
# Restart ipset - echo out msg if provided or just default msg.
# log error & exit if non-zero return
###########################################################################
restartIPSET(){
  MSG="$1"
  if [ -z "$MSG" ];then
    MSG="\nRestarting ipset"
  fi
  LOG "\n$MSG"
  RET=$(sudo su - root -c "$RESTART_IPSET 2>&1")
  if [ "$?" -ne 0 ];then
    LOG "\nERROR: $RESTART_IPSET failed - $RET\n"
    exit 1
  else
    LOG "\nSuccess: $RESTART_IPSET completed.\n"
  fi
}

###########################################################################
# save ipset changes
###########################################################################
saveIPSET(){
  if [ -z "$MSG" ];then
    MSG="\nSaving ipset"
  fi
  LOG "\n$MSG"
  RET=$(sudo su - root -c "/usr/sbin/ipset save > ${IPSET} 2>&1")
  if [ "$?" -ne 0 ];then
   LOG "\nERROR: /usr/sbin/ipset save > ${IPSET} failed - $RET\n"
   exit 1
  else
   LOG "Success: /usr/sbin/ipset save > ${IPSET}"
  fi
}
###########################################################################
# save iptables changes
###########################################################################
saveIPTABLES(){
  if [ -z "$MSG" ];then
    MSG="\nSaving iptables"
  fi
  LOG "\n$MSG"
  RET=$(sudo su - root -c "/usr/sbin/iptables-save > ${IPTABLES} 2>&1")
  if [ "$?" -ne 0 ];then
   LOG "\nERROR: /usr/sbin/iptables-save > ${IPTABLES} failed - $RET\n"
   exit 1
  else
   LOG "Success: /usr/sbin/iptables-save > ${IPTABLES}"
  fi
}

###########################################################################
# enable ipset service
###########################################################################
enableIPSET(){
  if [ -z "$MSG" ];then
    MSG="\nSetting ipset service to enabled"
  fi
  LOG "\n$MSG"
  RET=$(sudo su - root -c "/usr/bin/systemctl enable ipset 2>&1")
  if [ "$?" -ne 0 ];then
   LOG "\nERROR: /usr/bin/systemctl enable ipset failed - $RET\n"
   exit 1
  else
   LOG "Success: /usr/bin/systemctl enable ipset"
  fi
}
###########################################################################
# enable iptables service
###########################################################################
enableIPTABLES(){
  if [ -z "$MSG" ];then
    MSG="\nSetting iptables service to enabled"
  fi
  LOG "\n$MSG"
  RET=$(sudo su - root -c "/usr/bin/systemctl enable iptables 2>&1")
  if [ "$?" -ne 0 ];then
   LOG "\nERROR: /usr/bin/systemctl enable iptables failed - $RET\n"
   exit 1
  else
   LOG "Success: /usr/bin/systemctl enable iptables"
  fi
}

###########################################################################
# To be able to add port without duplicates
###########################################################################
function append_port() {
  new_port="${1}"
  shift
  all_ports=("${@}")

  for port in "${all_ports[@]}"; do
    if [ "${new_port}" == "${port}" ]; then
      echo "${all_ports[@]}"
      exit 0
    fi
  done
  echo "${all_ports[@]}" "${new_port}"
}
  

###########################################################################
# Back-up existing configuration
###########################################################################
BackupFile "$IPTABFILE" "cp" "exit"
BackupFile "$IPSETFILE" "mv" "noexit"

###########################################################################
# Clear iptables chains & zero counters
###########################################################################
runIPTABLES "-F -t filter"
runIPTABLES "-F -t nat"
runIPTABLES "-F -t raw"
runIPTABLES "-Z -t filter"
runIPTABLES "-Z -t nat"
runIPTABLES "-Z -t raw"
runIPTABLES "-F -t mangle"
runIPTABLES "-Z -t mangle"

saveIPTABLES

###########################################################################
# Restart iptables and ipset with base configs so we can create new entries
###########################################################################
restartIPTABLES "Restarting iptables with base iptables file."
restartIPSET "Restarting ipset with base ipset file."

# Script Variables Section
if [ "${DVPN^^}" != "YES" ]; then
   if [[ -z $SASG_IP_1 ]] ; then
      echo Customer Network Info False in Vyos script
      CUSTOMER_NETWORK_INFO=false
   else
      echo Customer Network Info True in Vyos Script
      CUSTOMER_NETWORK_INFO=true
   fi
   if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
      MASQ_IP_GROUP=CUST_PEER_IP
   else
      MASQ_IP_GROUP=SASG_MASQ_IP
   fi
else
    if [[ -z $CUSTOMER_SUBNETS_MASQ_IP ]] ; then
      echo Customer Network Info False in Vyos script
      CUSTOMER_NETWORK_INFO=false
    else
      echo Customer Network Info True in Vyos Script
      CUSTOMER_NETWORK_INFO=true
    fi
    MASQ_IP_GROUP=CUST_PEER_IP
fi #[ "${DVPN^^}" != "YES" ]

if [[ ${#PORTABLE_VTUN_CIDR[@]} = 0 ]] ; then
   MULTIPLE_SASG_INFO=false
else
   MULTIPLE_SASG_INFO=true
fi

#IAMaaS section
if [ "$IAMaaS" == "YES" ]; then 	  
   IAMAAS_SUBNETS=(${IAMAAS_PRIMARY_SUBNET} ${IAMAAS_PORTABLE_SUBNET})
   declare -A MAP
   for OCTET in $IAMAAS_MAPPING
   do
     CUSTOMER_OCTET=$(echo $OCTET | cut -d ";" -f1)
     IAMAAS_OCTET=$(echo $OCTET | cut -d ";" -f2)
     MAP[$CUSTOMER_OCTET]=$IAMAAS_OCTET
   done
   if [ "$TUNNEL_TYPE" == "ipsec" ];then
      vti_iam=vti1
   else
      vti_iam=vti0
   fi 
   if [ -z $IAMaaS_SASG ]; then
      IAMaaS_SASG=0
      if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
         for ((INDEX=1; INDEX<${#CUSTOMER_SUBNETS[@]}; INDEX++))
         do
           IAMaaS_SASG="$IAMaaS_SASG $INDEX"
         done
      fi
   fi

fi
#end IAMaaS section

ETH0_IP=$PRIVATE_VYOS_IP
ETH1_IP=$PUBLIC_VYOS_IP
LOG "$IPADDR\nUsing ETH0_IP=$ETH0_IP\n     ETH1_IP=$ETH1_IP\n" "divider"

LOG "Creating IPSET lists ..." "divider"
###########################################################################
# Create Ipset Lists For Specific Individual SDS Servers
###########################################################################
# No cebw and rcp_ip for now as specific rules for these are not defined as of
# v4 instead their ips and macs are copied into bpm,chef,ee  and rcp_bpm & rcp_ror for now
# v4.08 - create DEDICATED_SEGMENT as list of ipset sets for each individual SDS
runIPSET "create DEDICATED_SEGMENT list:set"

if [ ! -z "$EE_IP" ];then
   runIPSET "create EE_IP bitmap:ip,mac range ${EE_IP}-${EE_IP}"
   runIPSET "add EE_IP ${EE_IP},${EE_MAC}"
   # adding regular hashmap to use in destination on filter rules - cant use ip,mac bitmaps as dest.
   runIPSET "create CDS_EE hash:net family inet hashsize 1024 maxelem 65536"
   runIPSET "add CDS_EE ${EE_IP}"
   # add ip to dedicated segment 
   runIPSET "add DEDICATED_SEGMENT EE_IP"
fi # if [ ! -z "$EE_IP" ]

if [ ! -z "$CHEF_IP" ];then
   runIPSET "create CHEF_IP bitmap:ip,mac range ${CHEF_IP}-${CHEF_IP}"
   runIPSET "add CHEF_IP ${CHEF_IP},${CHEF_MAC}"
   # adding regular hashmap to use in destination on filter rules - cant use ip,mac bitmaps as dest.
   runIPSET "create CDS_CHEF hash:net family inet hashsize 1024 maxelem 65536"
   runIPSET "add CDS_CHEF ${CHEF_IP}"
   # add ip to dedicated segment 
   runIPSET "add DEDICATED_SEGMENT CHEF_IP"
fi # if [ ! -z "$CHEF_IP" ]

if [ ! -z "$BPM_IP" ];then
   runIPSET "create BPM_IP bitmap:ip,mac range ${BPM_IP}-${BPM_IP}"
   runIPSET "add BPM_IP ${BPM_IP},${BPM_MAC}"
   # add ip to dedicated segment 
   runIPSET "add DEDICATED_SEGMENT BPM_IP"
fi # if [ ! -z "$BPM_IP" ]

if [ ! -z "$ASB_IP" ];then
   runIPSET "create ASB_IP bitmap:ip,mac range ${ASB_IP}-${ASB_IP}"
   runIPSET "add ASB_IP ${ASB_IP},${ASB_MAC}"
   # add ip to dedicated segment 
   runIPSET "add DEDICATED_SEGMENT ASB_IP"
fi # if [ ! -z "$ASB_IP" ]

if [ ! -z "$RCP_BPM_IP" ];then
   runIPSET "create RCP_BPM_IP bitmap:ip,mac range ${RCP_BPM_IP}-${RCP_BPM_IP}"
   runIPSET "add RCP_BPM_IP ${RCP_BPM_IP},${RCP_BPM_MAC}"
   # add ip to dedicated segment 
   runIPSET "add DEDICATED_SEGMENT RCP_BPM_IP"
fi # if [ ! -z "$RCP_BPM_IP" ]

if [ ! -z "$RCP_ROR_IP" ];then
   runIPSET "create RCP_ROR_IP bitmap:ip,mac range ${RCP_ROR_IP}-${RCP_ROR_IP}"
   runIPSET "add RCP_ROR_IP ${RCP_ROR_IP},${RCP_ROR_MAC}"
   # add ip to dedicated segment 
   runIPSET "add DEDICATED_SEGMENT RCP_ROR_IP"
fi # if [ ! -z "$RCP_ROR_IP" ]


if [ ! -z "$RCP_PROXY_IP" ];then
  for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
  do
    runIPSET "create RCP_PROXY_IP_${INDEX} bitmap:ip,mac range ${RCP_PROXY_IP[INDEX]}-${RCP_PROXY_IP[INDEX]}"
    runIPSET "add RCP_PROXY_IP_${INDEX} ${RCP_PROXY_IP[INDEX]},${RCP_PROXY_MAC[INDEX]}"
    # add ip to dedicated segment 
    runIPSET "add DEDICATED_SEGMENT RCP_PROXY_IP_${INDEX}"
  done
fi # if [ ! -z "$RCP_PROXY_IP" ]

if [ ! -z "$CSC_IP" ];then
   runIPSET "create CSC_IP bitmap:ip,mac range ${CSC_IP}-${CSC_IP}"
   runIPSET "add CSC_IP ${CSC_IP},${CSC_MAC}"
   # add ip to dedicated segment 
   runIPSET "add DEDICATED_SEGMENT CSC_IP"
fi # if [ ! -z "$CSC_IP" ]

###########################################################################
# Create Required SoftLayer Services / VPN Access
###########################################################################
runIPSET "create SL_SERVICES hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "add SL_SERVICES 100.100.0.0/20"
runIPSET "add SL_SERVICES 100.100.32.0/20"
runIPSET "add SL_SERVICES 10.0.64.0/19"
runIPSET "add SL_SERVICES 10.1.128.0/19"
runIPSET "add SL_SERVICES 10.1.160.0/20"
runIPSET "add SL_SERVICES 10.1.176.0/20"
runIPSET "add SL_SERVICES 10.1.192.0/20"
runIPSET "add SL_SERVICES 10.1.208.0/20"
runIPSET "add SL_SERVICES 10.1.64.0/19"
runIPSET "add SL_SERVICES 10.1.96.0/19"
runIPSET "add SL_SERVICES 10.200.0.0/20"
runIPSET "add SL_SERVICES 10.200.112.0/20"
runIPSET "add SL_SERVICES 10.200.128.0/20"
runIPSET "add SL_SERVICES 10.200.160.0/20"
runIPSET "add SL_SERVICES 10.200.16.0/20"
runIPSET "add SL_SERVICES 10.200.176.0/20"
runIPSET "add SL_SERVICES 10.200.64.0/20"
runIPSET "add SL_SERVICES 10.200.80.0/20"
runIPSET "add SL_SERVICES 10.200.96.0/20"
runIPSET "add SL_SERVICES 10.201.0.0/20"
runIPSET "add SL_SERVICES 10.201.112.0/20"
runIPSET "add SL_SERVICES 10.201.128.0/20"
runIPSET "add SL_SERVICES 10.201.16.0/20"
runIPSET "add SL_SERVICES 10.201.176.0/20"
runIPSET "add SL_SERVICES 10.201.192.0/20"
runIPSET "add SL_SERVICES 10.201.32.0/20"
runIPSET "add SL_SERVICES 10.201.48.0/20"
runIPSET "add SL_SERVICES 10.201.64.0/20"
runIPSET "add SL_SERVICES 10.201.80.0/20"
runIPSET "add SL_SERVICES 10.202.16.0/20"
runIPSET "add SL_SERVICES 10.2.112.0/20"
runIPSET "add SL_SERVICES 10.2.128.0/20"
runIPSET "add SL_SERVICES 10.2.144.0/20"
runIPSET "add SL_SERVICES 10.2.160.0/20"
runIPSET "add SL_SERVICES 10.2.176.0/20"
runIPSET "add SL_SERVICES 10.2.32.0/20"
runIPSET "add SL_SERVICES 10.2.48.0/20"
runIPSET "add SL_SERVICES 10.2.64.0/20"
runIPSET "add SL_SERVICES 10.2.80.0/20"
runIPSET "add SL_SERVICES 10.3.112.0/20"
runIPSET "add SL_SERVICES 10.3.128.0/20"
runIPSET "add SL_SERVICES 10.3.144.0/20"
runIPSET "add SL_SERVICES 10.3.160.0/20"
runIPSET "add SL_SERVICES 10.3.176.0/20"
runIPSET "add SL_SERVICES 10.3.192.0/24"
runIPSET "add SL_SERVICES 10.3.64.0/20"
runIPSET "add SL_SERVICES 10.3.80.0/20"
runIPSET "add SL_SERVICES 10.3.96.0/20"
runIPSET "add SL_SERVICES 161.26.0.0/16"
runIPSET "add SL_SERVICES 166.8.0.0/14"

runIPSET "create SL_SSLVPNS hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "add SL_SSLVPNS 100.101.132.0/24"
runIPSET "add SL_SSLVPNS 10.1.0.0/23"
runIPSET "add SL_SSLVPNS 10.1.16.0/23"
runIPSET "add SL_SSLVPNS 10.1.224.0/23"
runIPSET "add SL_SSLVPNS 10.1.232.0/24"
runIPSET "add SL_SSLVPNS 10.1.236.0/24"
runIPSET "add SL_SSLVPNS 10.1.24.0/23"
runIPSET "add SL_SSLVPNS 10.1.56.0/23"
runIPSET "add SL_SSLVPNS 10.1.8.0/23"
runIPSET "add SL_SSLVPNS 10.200.192.0/24"
runIPSET "add SL_SSLVPNS 10.200.196.0/24"
runIPSET "add SL_SSLVPNS 10.200.200.0/24"
runIPSET "add SL_SSLVPNS 10.200.204.0/24"
runIPSET "add SL_SSLVPNS 10.200.208.0/24"
runIPSET "add SL_SSLVPNS 10.200.212.0/22"
runIPSET "add SL_SSLVPNS 10.200.216.0/22"
runIPSET "add SL_SSLVPNS 10.200.220.0/22"
runIPSET "add SL_SSLVPNS 10.200.224.0/22"
runIPSET "add SL_SSLVPNS 10.200.228.0/24"
runIPSET "add SL_SSLVPNS 10.200.232.0/24"
runIPSET "add SL_SSLVPNS 10.200.236.0/24"
runIPSET "add SL_SSLVPNS 10.201.208.0/24"
runIPSET "add SL_SSLVPNS 10.201.212.0/24"
runIPSET "add SL_SSLVPNS 10.201.224.0/24"
runIPSET "add SL_SSLVPNS 10.201.228.0/24"
runIPSET "add SL_SSLVPNS 10.2.192.0/23"
runIPSET "add SL_SSLVPNS 10.2.200.0/23"
runIPSET "add SL_SSLVPNS 10.2.208.0/23"
runIPSET "add SL_SSLVPNS 10.2.216.0/24"
runIPSET "add SL_SSLVPNS 10.2.220.0/24"
runIPSET "add SL_SSLVPNS 10.2.224.0/24"
runIPSET "add SL_SSLVPNS 10.2.228.0/24"
runIPSET "add SL_SSLVPNS 10.2.232.0/24"
runIPSET "add SL_SSLVPNS 10.2.236.0/24"
runIPSET "add SL_SSLVPNS 10.3.200.0/24"
runIPSET "add SL_SSLVPNS 10.3.204.0/24"
runIPSET "add SL_SSLVPNS 10.3.212.0/24"
runIPSET "add SL_SSLVPNS 10.3.216.0/24"
runIPSET "add SL_SSLVPNS 10.3.220.0/24"
runIPSET "add SL_SSLVPNS 10.3.224.0/24"
runIPSET "add SL_SSLVPNS 10.3.228.0/24"
runIPSET "add SL_SSLVPNS 10.3.232.0/24"
runIPSET "add SL_SSLVPNS 10.3.236.0/24"

#############################################################################
# Define Functions to Create Geo / DataCenter specific
# ipset groups for Management Segment Services access
#############################################################################
ADD_MS_WDC04_IP(){
  runIPSET "create MS_WDC04_IP hash:net family inet hashsize 1024 maxelem 65536"
  for ms_ip in "${MS_WDC04_IP[@]}"; do runIPSET "add MS_WDC04_IP ${ms_ip}"; done
} #ADD_MS_WDC04_IP()

ADD_MS_MEL01_IP(){
  runIPSET "create MS_MEL01_IP hash:net family inet hashsize 1024 maxelem 65536"
  runIPSET "add MS_MEL01_IP ${MS_MEL01_IP}"
} # ADD_MS_MEL01_IP()

ADD_MS_SYD05_IP(){
  runIPSET "create MS_SYD05_IP hash:net family inet hashsize 1024 maxelem 65536"
  runIPSET "add MS_SYD05_IP ${MS_SYD05_IP}"
} # ADD_MS_SYD05_IP()

ADD_MS_AMS03_IP(){
  runIPSET "create MS_AMS03_IP hash:net family inet hashsize 1024 maxelem 65536"
  runIPSET "add MS_AMS03_IP ${MS_AMS03_IP}"
} # ADD_MS_AMS03_IP()

# MS_FRA02_IP decommitted
# ADD_MS_FRA02_IP(){
#   runIPSET "create MS_FRA02_IP hash:net family inet hashsize 1024 maxelem 65536"
#   runIPSET "add MS_FRA02_IP ${MS_FRA02_IP}"
# } # ADD_MS_FRA02_IP()

ADD_MS_MON01_IP(){
  runIPSET "create MS_MON01_IP hash:net family inet hashsize 1024 maxelem 65536"
  runIPSET "add MS_MON01_IP ${MS_MON01_IP}"
} # ADD_MS_MON01_IP()

ADD_MS_CHE01_IP(){
  runIPSET "create MS_CHE01_IP hash:net family inet hashsize 1024 maxelem 65536"
  runIPSET "add MS_CHE01_IP ${MS_CHE01_IP}"
} # ADD_MS_CHE01_IP()

ADD_MS_TOK02_IP(){
  runIPSET "create MS_TOK02_IP hash:net family inet hashsize 1024 maxelem 65536"
  runIPSET "add MS_TOK02_IP ${MS_TOK02_IP}"
} # ADD_MS_TOK02_IP()

# if LOCATION (DC) = TEST - add test network vyatta vrrp
ADD_MS_TEST_IP(){
  runIPSET "create MS_TEST_IP hash:net family inet hashsize 1024 maxelem 65536"
  for ms_ip in "${MS_TEST_IP[@]}"; do runIPSET "add MS_TEST_IP ${ms_ip}"; done
} # ADD_MS_TOK02_IP()

# Set up washington, amsterdam & melbourne groups for all geos for ras access, fra02
# and ams03 also for global compliance dashboard
ADD_MS_WDC04_IP
ADD_MS_AMS03_IP
ADD_MS_MEL01_IP
ADD_MS_SYD05_IP
# ADD_MS_FRA02_IP # decommitted

  # Create Location specific ipset groups & set variables to use in the filter rules
  # so the proper ipset group and rule number gets used
  case $DC in
  DAL|SEA|TOR)
     # no need to create new ipset list
     BIGFIX_GROUP="MS_WDC04_IP"
     R1SOFT_GROUP="MS_WDC04_IP"
     ;;
  AMS|LON|FRA)
     BIGFIX_GROUP="MS_AMS03_IP"
     R1SOFT_GROUP="MS_AMS03_IP"
     ;;
  CHE|TOK)
     BIGFIX_GROUP="MS_WDC04_IP"
     if [ "$DC" == "TOK" ];then
       ADD_MS_TOK02_IP
       R1SOFT_GROUP="MS_TOK02_IP"
     else
       ADD_MS_CHE01_IP
       R1SOFT_GROUP="MS_SYD05_IP"
     fi
     ;;
  # adding in common mis-spelling in hostname for sydney - SDY instead of SYD
  HKG|SEO|SNG|SYD|SDY)
     ADD_MS_TOK02_IP
     BIGFIX_GROUP="MS_WDC04_IP"
     R1SOFT_GROUP="MS_SYD05_IP"
     ;;
  TEST|*)
     ADD_MS_TEST_IP
     BIGFIX_GROUP="MS_TEST_IP"
     R1SOFT_GROUP="MS_TEST_IP"
     ;;
esac

  # Define all MS Port Groups - Every SASFW gets all these
  # for Inbound traffic from managment segment.
  runIPSET "create MS_SASGaaS_and_EE_Port bitmap:port range 1-65535"
  runIPSET "add MS_SASGaaS_and_EE_Port 2222"
  runIPSET "create MS_RAS_Port bitmap:port range 1-65535"
  runIPSET "add MS_RAS_Port 2222"
  runIPSET "create MS_Zabbix_Port bitmap:port range 1-65535"
  runIPSET "add MS_Zabbix_Port 10050"
  runIPSET "create MS_OSSec_Port bitmap:port range 1-65535"
  runIPSET "add MS_OSSec_Port 1515"
  runIPSET "create MS_GCD_Port bitmap:port range 1-65535"
  runIPSET "add MS_GCD_Port 3333"
  runIPSET "create MS_SEP_Port bitmap:port range 1-65535"
  runIPSET "add MS_SEP_Port 443"
  runIPSET "create MS_BigFix_Port bitmap:port range 1-65535"
  runIPSET "add MS_BigFix_Port 52311"
  runIPSET "create MS_R1Soft_Port bitmap:port range 1-65535"
  runIPSET "add MS_R1Soft_Port 1167"

#New DNS services
runIPSET "create symantecliveupdate_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create symantec_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create dl_fedoraproject_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create r1soft_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create networklayer_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create wazuh_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create ismnac_ibm_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create smtp_sendgrid_net_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create idaas_iam_ibm_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create na_artifactoryr_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create eu_artifactoryr_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create prepiam_toronto_ca_ibm_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create prepiam_ice_ibmcloud_com_masq hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create w3ids_sso_ibm_com hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create status_geotrust_com hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create database_clamav_net hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create sensors_genuine_sheeps_cbcloud hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create crowdstrike_instances hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create login_ibm_com  hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create VAULTaaS hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create newrelic_com hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create patch_advisories hash:net family inet hashsize 1024 maxelem 65536"
runIPSET "create CLAMAV_PUBLIC_PORTS bitmap:port range 1-65535"
runIPSET "add CLAMAV_PUBLIC_PORTS 80"
runIPSET "create CROWDSTRIKE_PUBLIC_PORTS bitmap:port range 1-65535"
runIPSET "add CROWDSTRIKE_PUBLIC_PORTS 443"
runIPSET "create LOGIN_IBM_PUBLIC_PORTS  bitmap:port range 1-65535"
runIPSET "add LOGIN_IBM_PUBLIC_PORTS 443"
runIPSET "create VSERV_SOS_PORTS bitmap:port range 1-65535"
runIPSET "add VSERV_SOS_PORTS 8200"
runIPSET "create NEW_RELIC_PUBLIC_PORTS bitmap:port range 1-65535"
runIPSET "add NEW_RELIC_PUBLIC_PORTS 443"
runIPSET "create PATCH_ADVISORIES_PORTS bitmap:port range 1-65535"
runIPSET "add PATCH_ADVISORIES_PORTS 443"


#############################################################################
# Create APM list (monitoring traffic)
#############################################################################
runIPSET "create APM_IP hash:ip family inet hashsize 1024 maxelem 65536"
if [ ! -z "$APM_IP" ]; then
  runIPSET "add APM_IP $APM_IP"
else
  # use default apm value if not set in vars
  runIPSET "add APM_IP 159.8.20.241"
fi

#############################################################################
# Create IAMaaS ipset lists if required
#############################################################################
if [ "$IAMaaS" == "YES" ]; then
   runIPSET "create IAMaaS_SERVICE hash:net family inet hashsize 1024 maxelem 65536"
   runIPSET "create ENDPOINTS_IAMaaS bitmap:port range 1-65535"
   runIPSET "create IAMaaS_VPN_PORTS bitmap:port range 1-65535"
   runIPSET "create IAMAAS_VYATTA_IP hash:ip family inet hashsize 1024 maxelem 65536"
   #Feature 405729
   if [ ! -z "$TDI_IP" ]; then
      runIPSET "create IAMaaS_TDI_IP hash:net family inet hashsize 1024 maxelem 65536"
      runIPSET "create IAMaaS_TDI_PORT bitmap:port range 1-65535"
   fi
  # Feature 441061
  if [ -n "${IAMAAS_MS_AD_PORT}" ] && [ -n "${IAMAAS_MS_AD_IP}" ]; then
    runIPSET "create CUST_ENDPOINTS_MS_AD hash:net family inet hashsize 1024 maxelem 65536"
    runIPSET "create ENDPOINTS_IAMaaS_MS_AD bitmap:port range 1-65535"
  fi
  if [ -n "${IAMAAS_REMEDY_PORT}" ] && [ -n "${IAMAAS_REMEDY_IP}" ]; then
    runIPSET "create CUST_ENDPOINTS_REMEDY hash:net family inet hashsize 1024 maxelem 65536"
    runIPSET "create ENDPOINTS_IAMaaS_REMEDY bitmap:port range 1-65535"
  fi

  for IAMAAS_SUBNET in ${IAMAAS_SUBNETS[@]}
  do
    runIPSET "add IAMaaS_SERVICE $IAMAAS_SUBNET"
  done

  ENDPOINTS_IAMaaS_PORTS=()
  # Ports 22 & 45580 are added only in case of non-SASG setup
  if [[ -z "${SASG_VIP1}" ]]; then
    [ -z "${TDI_IP}"] && ENDPOINT_IAMAAS_PORTS=($(append_port 22 "${ENDPOINT_IAMAAS_PORTS[@]}"))
    ENDPOINT_IAMAAS_PORTS=($(append_port 45580 "${ENDPOINT_IAMAAS_PORTS[@]}"))
  fi
  ENDPOINT_IAMAAS_PORTS=($(append_port 443 "${ENDPOINT_IAMAAS_PORTS[@]}"))
  ENDPOINT_IAMAAS_PORTS=($(append_port 9443 "${ENDPOINT_IAMAAS_PORTS[@]}"))
  [ -n "${IAMAAS_DATABASE_PORT}" ] &&  ENDPOINT_IAMAAS_PORTS=($(append_port "${IAMAAS_DATABASE_PORT}" "${ENDPOINT_IAMAAS_PORTS[@]}"))
  [ -n "${IAMAAS_MS_SQL_PORT}" ] &&  ENDPOINT_IAMAAS_PORTS=($(append_port "${IAMAAS_MS_SQL_PORT}" "${ENDPOINT_IAMAAS_PORTS[@]}"))
  [ -n "${IAMAAS_STORAGE_PORT}" ] &&  ENDPOINT_IAMAAS_PORTS=($(append_port "${IAMAAS_STORAGE_PORT}" "${ENDPOINT_IAMAAS_PORTS[@]}"))
  for endpoints_iamaas_port in "${ENDPOINT_IAMAAS_PORTS[@]}"; do
    runIPSET "add ENDPOINTS_IAMaaS ${endpoints_iamaas_port}"
  done

  # Feature 441061
  if [ -n "${IAMAAS_MS_AD_PORT}" ] && [ -n "${IAMAAS_MS_AD_IP}" ]; then
    [[ "${IAMAAS_MS_AD_IP}" =~ ^10\. ]] && IAMAAS_MS_AD_IP="1.${IAMAAS_MS_AD_IP:3}" # Converting to 1.x.x.x if it's 10.x.x.x
    runIPSET "add ENDPOINTS_IAMaaS_MS_AD ${IAMAAS_MS_AD_PORT}"
    runIPSET "add CUST_ENDPOINTS_MS_AD ${IAMAAS_MS_AD_IP}"
  fi
  if [ -n "${IAMAAS_REMEDY_PORT}" ] && [ -n "${IAMAAS_REMEDY_IP}" ]; then
    [[ "${IAMAAS_REMEDY_IP}" =~ ^10\. ]] && IAMAAS_REMEDY_IP="1.${IAMAAS_REMEDY_IP:3}"  # Converting to 1.x.x.x if it's 10.x.x.x
    runIPSET "add ENDPOINTS_IAMaaS_REMEDY ${IAMAAS_REMEDY_PORT}"
    runIPSET "add CUST_ENDPOINTS_REMEDY ${IAMAAS_REMEDY_IP}"
  fi

  #Feature 405729
  if [ -n "$TDI_IP" ]; then
      if [[ "$TDI_IP" =~ ^10\. ]];then
         ONE_TDI_IP=1.$(echo $TDI_IP | cut -d"." -f2-4)
         runIPSET "add IAMaaS_TDI_IP $ONE_TDI_IP"
      else
         runIPSET "add IAMaaS_TDI_IP $TDI_IP"
      fi
          if [ -z "$TDI_PORT" ]; then
              TDI_PORT=1099
          fi
     runIPSET "add IAMaaS_TDI_PORT $TDI_PORT"
  fi
  runIPSET "add IAMaaS_VPN_PORTS 500"
  runIPSET "add IAMaaS_VPN_PORTS 4500"
  [ ! -z "$JUNIPER_VPN_IP" ] && runIPSET "add IAMAAS_VYATTA_IP $JUNIPER_VPN_IP"

fi #[ "$IAMaaS" == "YES" ]
#end IAMaaS section

if [ "${DVPN^^}" != "YES" ]; then
   #############################################################################
   # Create ipset SASG_MASQ_IP list
   #############################################################################
   runIPSET "create SASG_MASQ_IP hash:ip family inet hashsize 1024 maxelem 65536"
   if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
      runIPSET "create CUST_PEER_IP hash:ip family inet hashsize 1024 maxelem 65536"
      runIPSET "add CUST_PEER_IP ${CUST_PEER_IP}"
      for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
      do
        runIPSET "add SASG_MASQ_IP ${SASG_IP_1[INDEX]}"
        [ ! -z ${SASG_IP_2[INDEX]} ] && runIPSET "add SASG_MASQ_IP ${SASG_IP_2[INDEX]}"
      done
      runIPSET "create EE_TO_CUST_JH bitmap:port range 1-65535"
      runIPSET "add EE_TO_CUST_JH 22"
   else
      if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
         for MASQ_IP in "${SASG_MASQ_IP[@]}"
         do
           if [ ! -z "$MASQ_IP" ];then
              runIPSET "add SASG_MASQ_IP $MASQ_IP"
           fi
         done
      fi
   fi
   #############################################################################
   # Create list of customer endpoint subnets
   #############################################################################
   runIPSET "create CUST_ENDPOINTS hash:net family inet hashsize 1024 maxelem 65536"
   if [ "${TUNNEL_TYPE^^}" != "MODEL6" ]; then
      if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
         for ((INDEX=0; INDEX<${#CUSTOMER_SUBNETS[@]}; INDEX++))
         do
            SASG_SUBNETS=(${CUSTOMER_SUBNETS[INDEX]})
            for SUBNET in "${SASG_SUBNETS[@]}"
            do
               ONE_SUBNET=1.$(echo $SUBNET | cut -d"." -f2-4)
               if [[ "$SUBNET" =~ ^10\. ]];then
                   runIPSET "add CUST_ENDPOINTS $ONE_SUBNET"
               else
                   runIPSET "add CUST_ENDPOINTS $SUBNET"
               fi
            done
            if [ "${SITE_MESSAGE_ENABLE[INDEX]^^}" == "Y" ]; then
               VIP=$(echo ${SASG_VIP1[$INDEX]}| cut -f1 -d "/" | sed 's/^10\./1\./')
               runIPSET "add CUST_ENDPOINTS $VIP"
            fi
         done
      fi
   else
       for VIP1 in "${SASG_VIP1[@]}"
       do
           VIP1=$(echo $VIP1| cut -f1 -d "/" | sed 's/^10\./1\./')
           runIPSET "add CUST_ENDPOINTS $VIP1"
       done
   fi

   if [[ "${TUNNEL_TYPE^^}" != "MODEL6" ]]; then
      #############################################################################
      # Create EE_TO_CUST server / app specific port lists
      #############################################################################
      runIPSET "create EE_TO_CUST_ENDPOINTS bitmap:port range 1-65535"
      runIPSET "add EE_TO_CUST_ENDPOINTS 22"
      runIPSET "add EE_TO_CUST_ENDPOINTS 443"
      runIPSET "add EE_TO_CUST_ENDPOINTS 5985"
   fi
   if [ ! -z "${DNS_IP[0]}" ];then
      runIPSET "create EE_TO_CUST_DNS bitmap:port range 1-65535"
      runIPSET "add EE_TO_CUST_DNS 53"

      runIPSET "create CUST_DNS hash:net family inet hashsize 1024 maxelem 65536"

      for ((INDEX=0; INDEX<${#DNS_IP[@]}; INDEX++))
      do
        for DNS in ${DNS_IP[INDEX]}
        do
        if [[ "${DNS}" =~ ^10\. ]];then
           ONE_DNS_IP=1.$(echo ${DNS} | cut -d"." -f2-4)
           runIPSET "add CUST_DNS $ONE_DNS_IP"
        else
           runIPSET "add CUST_DNS ${DNS}"
        fi
        done
      done
   fi # if [ ! -z "${DNS_IP[0]" ]


   if [ ! -z "${LDAP_IP[0]}" ];then
      #runIPSET "create EE_TO_CUST_LDAP bitmap:port range 1-65535"
      runIPSET "create CHEF_TO_CUST_LDAP bitmap:port range 1-65535"
      for port in "${LDAP_PORT[@]}"; do
          runIPSET "add CHEF_TO_CUST_LDAP ${port}"
      done
      runIPSET "create CUST_LDAP hash:net family inet hashsize 1024 maxelem 65536"

      for ((INDEX=0; INDEX<${#LDAP_IP[@]}; INDEX++))
      do
        if [[ "${LDAP_IP[INDEX]}" =~ ^10\. ]];then
           ONE_LDAP_IP=1.$(echo ${LDAP_IP[INDEX]} | cut -d"." -f2-4)
           runIPSET "add CUST_LDAP $ONE_LDAP_IP"
        else
           runIPSET "add CUST_LDAP ${LDAP_IP[INDEX]}"
        fi
      done
   fi # if [ ! -z "${LDAP_IP[0]" ]

   #############################################################################
   # Create ASB_TO_CUST server / app specific port lists
   #############################################################################
   if [ ! -z "$ASB_IP" ];then
      runIPSET "create ASB_TO_CUST_ENDPOINTS bitmap:port range 1-65535"
      runIPSET "add ASB_TO_CUST_ENDPOINTS 22"
      runIPSET "add ASB_TO_CUST_ENDPOINTS 443"
      runIPSET "add ASB_TO_CUST_ENDPOINTS 5985"

      runIPSET "create ASB_TO_CUST_DNS bitmap:port range 1-65535"
      runIPSET "add ASB_TO_CUST_DNS 53"

      runIPSET "create ASB_TO_CUST_LDAP bitmap:port range 1-65535"
      for port in "${LDAP_PORT[@]}"; do
          runIPSET "add ASB_TO_CUST_LDAP ${port}"
      done
   fi # if [ ! -z "$ASB_IP" ] ...
else
    #############################################################################
    # Create ipset CUST_PEER_IP list
    #############################################################################
    runIPSET "create CUST_PEER_IP hash:ip family inet hashsize 1024 maxelem 65536"
    [ ! -z "${CUSTPREM_BIGFIX_IP[0]}" ] && runIPSET "create CUSTPREM_BIGFIX_IPS list:set size 8"
    runIPSET "create CUST_DNS list:set size 8"
    runIPSET "create CUST_LDAP list:set size 8"
    runIPSET "create CUST_ENDPOINTS list:set size 8"
    for ((INDEX=0; INDEX<${#CUST_PEER_IP[@]}; INDEX++))
    do
      if [ ! -z "${CUST_PEER_IP[INDEX]}" ];then
         runIPSET "add CUST_PEER_IP ${CUST_PEER_IP[INDEX]}"
      fi
      runIPSET "create CUST_ENDPOINTS_VPN$((INDEX+1)) hash:net family inet hashsize 1024 maxelem 65536"
      [ ! -z "${DNS_IP[INDEX]}" ] && runIPSET "create CUST_DNS_VPN$((INDEX+1)) hash:net family inet hashsize 1024 maxelem 65536"
      [ ! -z "${LDAP_IP[INDEX]}" ] && runIPSET "create CUST_LDAP_VPN$((INDEX+1)) hash:net family inet hashsize 1024 maxelem 65536"
      [ ! -z "${CUSTPREM_BIGFIX_IP[INDEX]}" ] && runIPSET "create CUSTPREM_BIGFIX_VPN$((INDEX+1)) hash:ip family inet hashsize 1024 maxelem 65536"
      for ADDRESS in ${CUSTOMER_SUBNETS_MASQ_IP[INDEX]}
      do
       runIPSET "add CUST_ENDPOINTS_VPN$((INDEX+1)) ${ADDRESS}"
       runIPSET "add CUST_ENDPOINTS CUST_ENDPOINTS_VPN$((INDEX+1))"
      done
      for ADDRESS in ${LDAP_IP[INDEX]}
      do
       runIPSET "add CUST_LDAP_VPN$((INDEX+1)) ${ADDRESS}"
       runIPSET "add CUST_LDAP CUST_LDAP_VPN$((INDEX+1))"
      done
      for ADDRESS in ${DNS_IP[INDEX]}
      do
       runIPSET "add CUST_DNS_VPN$((INDEX+1)) ${ADDRESS}"
       runIPSET "add CUST_DNS CUST_DNS_VPN$((INDEX+1))"
      done
      for ADDRESS in ${CUSTPREM_BIGFIX_IP[INDEX]}
      do
        runIPSET "add CUSTPREM_BIGFIX_VPN$((INDEX+1)) ${ADDRESS}"
        runIPSET "add CUSTPREM_BIGFIX_IPS CUSTPREM_BIGFIX_VPN$((INDEX+1))"
      done
    done
    runIPSET "create EE_TO_CUST_DNS bitmap:port range 1-65535"
    runIPSET "add EE_TO_CUST_DNS 53"
    runIPSET "create CHEF_TO_CUST_LDAP bitmap:port range 1-65535"
    for port in "${LDAP_PORT[@]}"; do
        runIPSET "add CHEF_TO_CUST_LDAP ${port}"
    done
fi  # if [ "${MODEL5^^}" != "YES" ]

#############################################################################
# Create Endpoints to CDS EE / CHEF Port Lists
#############################################################################
runIPSET "create ENDPOINTS_CDS_EE bitmap:port range 1-65535"
runIPSET "add ENDPOINTS_CDS_EE 3333"
runIPSET "create ENDPOINTS_CDS_CHEF bitmap:port range 1-65535"
runIPSET "add ENDPOINTS_CDS_CHEF 8443"
[[ ! -z "${CHEF_PORT[0]}" && "${CHEF_PORT[0]}" -ne 8443 ]] && runIPSET "add ENDPOINTS_CDS_CHEF ${CHEF_PORT[0]}"
[[ ! -z "${CHEF_PORT[1]}" && "${CHEF_PORT[1]}" -ne 8443 ]] && runIPSET "add ENDPOINTS_CDS_CHEF ${CHEF_PORT[1]}"

#############################################################################
# Create Endpoints to CDS EE Kafka
#############################################################################
runIPSET "create ENDPOINTS_CDS_EE_KAFKA bitmap:port range 1-65535"
if [ -z "$KAFKA_PORT" ];then
  KAFKA_PORT=9093
fi
runIPSET "add ENDPOINTS_CDS_EE_KAFKA $KAFKA_PORT"

#############################################################################
# Create Customer Premise BigFix lists if required
#############################################################################

if [ ! -z "${CUSTPREM_BIGFIX_IP[0]}" ];then

  if [ "${DVPN^^}" != "YES" ]; then
     runIPSET "create CUSTPREM_BIGFIX_IPS hash:ip family inet hashsize 1024 maxelem 65536"
     # add bigfix address group (allows for more than one bigfix ip if ever needed, ie multi-sasg)
     # if custprem bigfix ip is set then go thru each ip listed
     # add to firewall address-group CUSTPREM_BIGFIX_IPS
     # add UNIQUE ports to CUSTPREM_BIGFIX_PORTS port-group and BIGFIX_PORTS variable for use in dnat rule
     # add 443 & 52311 as defaults as of 14nov2017

     # add bigfix ips to CUSTPREM_BIGFIX_IPS ipset list
     for ((INDEX=0; INDEX<${#CUSTPREM_BIGFIX_IP[@]}; INDEX++))
     do
       for BFIP in ${CUSTPREM_BIGFIX_IP[INDEX]}
       do
       if [[ "${BFIP}" =~ ^10\. ]];then
          BFIP=1.$(echo ${CUSTPREM_BIGFIX_IP[INDEX]} | cut -d"." -f2-4)
       fi
       runIPSET "add CUSTPREM_BIGFIX_IPS $BFIP"
       done
     done
  fi

  # if no customer premise bigfix port was defined in vars, use default of 52311
  runIPSET "create CUSTPREM_BIGFIX_PORTS bitmap:port range 1-65535"
  BIGFIX_PORTS=""
  if [ -z "${CUSTPREM_BIGFIX_PORT[0]}" ];then
    # if bigfix ports is blank, skip leading comma or we'll have a failure 
    # later in the iptables nat rule with the extra comma
    if [ -z "$BIGFIX_PORTS" ];then
     BIGFIX_PORTS="52311"
    else
     BIGFIX_PORTS="$BIGFIX_PORTS,52311"
    fi # if [ -z "$BIGFIX_PORTS" ];
     runIPSET "add CUSTPREM_BIGFIX_PORTS 52311"
  else
     # loop through each CUSTPREM_BIGFIX_PORT defined and add to the CUSTPREM_BIGFIX_PORTS list
     for ((INDEX=0; INDEX<${#CUSTPREM_BIGFIX_PORT[@]}; INDEX++))
     do
        runIPSET "add CUSTPREM_BIGFIX_PORTS ${CUSTPREM_BIGFIX_PORT[INDEX]}"
        # add to BIGFIX_PORTS variable as we use this later
        # if bigfix ports is blank, skip leading comma or we'll have a failure 
        # later in the iptables nat rule with the extra comma
        if [ -z "$BIGFIX_PORTS" ];then
          BIGFIX_PORTS="${CUSTPREM_BIGFIX_PORT[INDEX]}"
        else
          BIGFIX_PORTS="$BIGFIX_PORTS,${CUSTPREM_BIGFIX_PORT[INDEX]}"
        fi # if [ -z "$BIGFIX_PORTS" ];
     done
  fi # if [ -z "${CUSTPREM_BIGFIX_PORT[0]}" ];then

fi # if [ ! -z "${CUSTPREM_BIGFIX_IP[0]}" ];then

#############################################################################
# Create Customer Premise Ticketing lists if required
#############################################################################
if [ ! -z "${CUSTPREM_TICKETING_IP}" ];then
  runIPSET "create CUSTPREM_TICKETING_IPS hash:ip family inet hashsize 1024 maxelem 65536"
  runIPSET "create CUSTPREM_TICKETING_PORTS bitmap:port range 1-65535"
fi # if [ ! -z "${CUSTPREM_TICKETING_IP}"
# if CSC_IP defined then add appropriate CSC ipset entries
if [ ! -z "$CSC_IP" ]; then
  runIPSET "create CUSTPREM_CSC_IWSD_IPS hash:ip family inet hashsize 1024 maxelem 65536"
  runIPSET "create CUSTPREM_CSC_IWSZ_IPS hash:ip family inet hashsize 1024 maxelem 65536"
  runIPSET "create CUSTPREM_CSC_BMC_IPS hash:ip family inet hashsize 1024 maxelem 65536"
  runIPSET "create CUSTPREM_CSC_IWSD_PORTS bitmap:port range 1-65535"
  runIPSET "create CUSTPREM_CSC_IWSZ_PORTS bitmap:port range 1-65535"
  runIPSET "create CUSTPREM_CSC_BMC_PORTS bitmap:port range 1-65535"
fi # if [ ! -z "$CSC_IP ...

# add CSC Add ips and ports to the ipset groups created
# Add  TWS/d, BMC Control-m, TWS/z IPs to the related CUSTPREM_CSC_*_IPS ipset groups ( first octet must be replaced by 1)
# Add  TWS/d, BMC Control-m, TWS/z ports to the related CUSTPREM_CSC_*_PORTS ipset groups
# Add CSC tool server ip to the CSC_IP and DEDICATED_SEGMENT ipset groups

#Set CSC default ports in case not defined in vars
[[ -z "$CSC_IWSD_BOOTPORT" ]] && CSC_IWSD_BOOTPORT=31117
[[ -z "$CSC_IWSD_HTTPSPORT" ]] && CSC_IWSD_HTTPSPORT=31116
[[ -z "$CSC_IWSD_CSI_AUTHPORT" ]] && CSC_IWSD_CSI_AUTHPORT=31122
[[ -z "$CSC_IWSD_ADM_SECPORT" ]] && CSC_IWSD_ADM_SECPORT=31124
[[ -z "$CSC_IWSZ_SERVOPTSPORT" ]] && CSC_IWSZ_SERVOPTSPORT=425
[[ -z "$CSC_IWSZ_DWC_BOOTPORT" ]] && CSC_IWSZ_DWC_BOOTPORT=16312
[[ -z "$CSC_BMC_REST_APIPORT" ]] && CSC_BMC_REST_APIPORT=8443
[[ -z "$CSC_BMC_COBRASERVPORT" ]] && CSC_BMC_COBRASERVPORT=13075


# add CSC Add ips and ports to the ipset groups created
# Add  TWS/d, BMC Control-m, TWS/z IPs to the related CUSTPREM_CSC_*_IPS ipset groups ( first octet must be replaced by 1)
# Add  TWS/d, BMC Control-m, TWS/z ports to the related CUSTPREM_CSC_*_PORTS ipset groups
# if CSC_IP defined then add appropriate CSC ipset entries
if [ ! -z "$CSC_IP" ]; then
  for ((INDEX=0; INDEX<2; INDEX++))
  do
    if [ ! -z "${CSC_IWSD_IP1[INDEX]}" ]; then
      CSCIP="${CSC_IWSD_IP1[INDEX]}"
      if [[ "${CSC_IWSD_IP1[INDEX]}" =~ ^10\. ]]; then
        CSCIP=1.$(echo ${CSC_IWSD_IP1[INDEX]} | cut -d"." -f2-4)
      fi
      runIPSET "add CUSTPREM_CSC_IWSD_IPS $CSCIP"
    fi
    if [ ! -z "${CSC_IWSZ_IP1[INDEX]}" ]; then
      CSCIP="${CSC_IWSZ_IP1[INDEX]}"
            if [[ "${CSC_IWSZ_IP1[INDEX]}" =~ ^10\. ]]; then
        CSCIP=1.$(echo ${CSC_IWSZ_IP1[INDEX]} | cut -d"." -f2-4)
      fi
      runIPSET "add CUSTPREM_CSC_IWSZ_IPS $CSCIP"
    fi
    if [ ! -z "${CSC_BMC_IP1[INDEX]}" ]; then
      CSCIP="${CSC_BMC_IP1[INDEX]}"
            if [[ "${CSC_BMC_IP1[INDEX]}" =~ ^10\. ]]; then
        CSCIP=1.$(echo ${CSC_BMC_IP1[INDEX]} | cut -d"." -f2-4)
      fi
      runIPSET "add CUSTPREM_CSC_BMC_IPS $CSCIP"
    fi

    if [ ! -z "${CSC_IWSD_IP2[INDEX]}" ]; then
      CSCIP="${CSC_IWSD_IP2[INDEX]}"
            if [[ "${CSC_IWSD_IP2[INDEX]}" =~ ^10\. ]]; then
        CSCIP=1.$(echo ${CSC_IWSD_IP2[INDEX]} | cut -d"." -f2-4)
      fi
      runIPSET "add CUSTPREM_CSC_IWSD_IPS $CSCIP"
    fi
    if [ ! -z "${CSC_IWSZ_IP2[INDEX]}" ]; then
      CSCIP="${CSC_IWSZ_IP2[INDEX]}"
            if [[ "${CSC_IWSZ_IP2[INDEX]}" =~ ^10\. ]]; then
        CSCIP=1.$(echo ${CSC_IWSZ_IP2[INDEX]} | cut -d"." -f2-4)
      fi
      runIPSET "add CUSTPREM_CSC_IWSD_IPS $CSCIP"
    fi
    if [ ! -z "${CSC_BMC_IP2[INDEX]}" ]; then
      CSCIP="${CSC_BMC_IP2[INDEX]}" 
            if [[ "${CSC_BMC_IP2[INDEX]}" =~ ^10\. ]]; then
        CSCIP=1.$(echo ${CSC_BMC_IP2[INDEX]} | cut -d"." -f2-4)
      fi
      runIPSET "add CUSTPREM_CSC_BMC_IPS $CSCIP"
    fi
  done

  runIPSET "add CUSTPREM_CSC_IWSD_PORTS $CSC_IWSD_BOOTPORT"
  runIPSET "add CUSTPREM_CSC_IWSD_PORTS $CSC_IWSD_HTTPSPORT"
  runIPSET "add CUSTPREM_CSC_IWSD_PORTS $CSC_IWSD_CSI_AUTHPORT"
  runIPSET "add CUSTPREM_CSC_IWSD_PORTS $CSC_IWSD_ADM_SECPORT"
  runIPSET "add CUSTPREM_CSC_IWSZ_PORTS $CSC_IWSZ_SERVOPTSPORT"
  runIPSET "add CUSTPREM_CSC_IWSZ_PORTS $CSC_IWSZ_DWC_BOOTPORT"
  runIPSET "add CUSTPREM_CSC_BMC_PORTS $CSC_BMC_REST_APIPORT"
  runIPSET "add CUSTPREM_CSC_BMC_PORTS $CSC_BMC_COBRASERVPORT"

fi # if [ ! -z "$CSC_IP" ....

#add custom ticketing system ports and ips
TICKETING_PORTS=""
 # add ticketing ips to CUSTPREM_TICKETING_IPS ipset list
for ((INDEX=0; INDEX<${#CUSTPREM_TICKETING_IP[@]}; INDEX++))
do
  #echo $INDEX
  if [ ! -z "${CUSTPREM_TICKETING_IP[INDEX]}" ];then
    CTIP=${CUSTPREM_TICKETING_IP[INDEX]}
    if [[ "${CUSTPREM_TICKETING_IP[INDEX]}" =~ ^10\. ]];then
      CTIP=1.$(echo ${CUSTPREM_TICKETING_IP[INDEX]} | cut -d"." -f2-4)
    fi
    if [ -z "${CUSTPREM_TICKETING_PORT[INDEX]}" ];then
       CTPORT=443
    else
       CTPORT=${CUSTPREM_TICKETING_PORT[INDEX]}
    fi  
    runIPSET "add CUSTPREM_TICKETING_IPS $CTIP"
    runIPSET "add CUSTPREM_TICKETING_PORTS $CTPORT"
       # add to TICKETING_PORTS variable as we use this later
     # if ticketing ports is blank, skip leading comma or we'll have a failure 
     # later in the iptables nat rule with the extra comma
    
     if [ -z "$TICKETING_PORTS" ];then
          TICKETING_PORTS="$CTPORT"
     else
         
         if [ "$(echo "$TICKETING_PORTS" | sed "s/,/ /g " | egrep -w "$CTPORT")" == "" ]; then
            TICKETING_PORTS="$TICKETING_PORTS,$CTPORT"
         fi
     fi # if [ -z "$TICKETING_PORTS" ];
  fi
done

# END of CUSTPREM TICKETING SECTION
########################################

#############################################################################
# Create Inbound /Outbound Public Ports Lists
#############################################################################
# note - used for inbound public filter rule so ipset list of bpm/rcp-bpm / rcp-proxy  
# destination targets can only contain ip of these servers, not ip/mac address bitmap.
runIPSET "create INBOUND_PUBLIC_ACCESS hash:ip family inet hashsize 1024 maxelem 65536"
runIPSET "create INBOUND_PUBLIC_PORTS bitmap:port range 1-65535"
if [ ! -z "$BPM_IP" ]; then
  runIPSET "add INBOUND_PUBLIC_ACCESS $BPM_IP"
else
  if [ ! -z "$RCP_PROXY_IP" ];then
     for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
     do
       runIPSET "add INBOUND_PUBLIC_ACCESS ${RCP_PROXY_IP[INDEX]}"
     done
  else
    [[ -n "${RCP_BPM_IP}" ]] && runIPSET "add INBOUND_PUBLIC_ACCESS $RCP_BPM_IP"
  fi
fi
runIPSET "add INBOUND_PUBLIC_PORTS 443"

runIPSET "create OUTBOUND_PUBLIC_PORTS bitmap:port range 1-65535"
runIPSET "add OUTBOUND_PUBLIC_PORTS 443"
runIPSET "add OUTBOUND_PUBLIC_PORTS 587"
runIPSET "add OUTBOUND_PUBLIC_PORTS 80"

###
if [ "${DVPN^^}" == "YES" ]; then
   runIPSET "create CDS_SASFW hash:net family inet hashsize 1024 maxelem 65536"
   runIPSET "add CDS_SASFW ${PRIVATE_VYOS_IP}"
fi
###

if [ "${DVPN^^}" != "YES" ]; then
#############################################################################
# Create Lists used for Jumphost LogPush
#############################################################################
   if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
      runIPSET "create CUST_JH hash:net family inet hashsize 1024 maxelem 65536" # List of Jump Hosts on customer side
      runIPSET "create VTUN_IN_LOGPUSH_PORT bitmap:port range 1-65535" # Port for pushing SASG logs
      runIPSET "create LP_DEST hash:net family inet hashsize 1024 maxelem 65536" # Log push destination IP
      runIPSET "add VTUN_IN_LOGPUSH_PORT $SASG_LOGPUSH_PORT"
      if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
          SASG_IP_LIST=""${SASG_IP_1[@]}" "${SASG_IP_2[@]}""
      else
          SASG_IP_LIST=""${SASG_IP_1[@]}" "${SASG_IP_2[@]}" "${SASG_VIP1[@]}" "${SASG_VIP2[@]}""
      fi
      for sasg_ip_vip in ${SASG_IP_LIST}; do
        if [[ "${sasg_ip_vip}" =~ ^10\. ]]; then
           transformed_sasg_ip_vip="1.$(echo ${sasg_ip_vip} | cut -d"." -f2-4)"
        else
           transformed_sasg_ip_vip="${sasg_ip_vip}"
        fi
        # runIPSET "add CUST_JH ${transformed_sasg_ip_vip}"
        # simple fix added - just check if transformed_sasg_ip_vip is blank before calling ipset
        [[ ! -z "${transformed_sasg_ip_vip}" ]] && runIPSET "add CUST_JH ${transformed_sasg_ip_vip}"
      done
      runIPSET "add LP_DEST $SASG_LOGPUSH_IP"
   fi
   # end Logpush section
fi #if [ "${DVPN^^}" != "YES" ]; then

#############################################################################

# if asb & vcenter defined, add asb_to_vcenter port ipset list and cusptrem vcenter ip list
if [[ ! -z "${VCENTER_IP[0]}" && ! -z "$ASB" ]];then
     runIPSET "create ASB_TO_VCENTER bitmap:port range 1-65535"
     runIPSET "add ASB_TO_VCENTER 443"
     runIPSET "create CUSTPREM_VCENTER hash:ip family inet hashsize 1024 maxelem 65536"
   
     for VCENTER in "${VCENTER_IP[@]}"
     do
       runIPSET "add CUSTPREM_VCENTER ${VCENTER}"
     done
fi

###########################################################################

if [ "${DVPN^^}" == "YES" ]; then
   TUNNEL_TYPE=ipsec
fi

if [ -z "$TUNNEL_TYPE" ];then
  TUNNEL_TYPE=openvpn
fi

if [[ "$TUNNEL_TYPE" == "openvpn" || "${TUNNEL_TYPE^^}" == "MODEL6" ]];then
for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
do
   # if vtun listener port not defined, use 1194 as default
   # this just allows to be able to set port per openvpn tunnel & use default of 1194 if not specified.
   [[ -z ${VTUN_PORT[$INDEX]} ]] && VTUN_PORT[$INDEX]=1194
done
fi

if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
    if [[ "$TUNNEL_TYPE" == "ipsec" || "$IAMaaS" == "YES" || "${TUNNEL_TYPE^^}" == "MODEL6" ]];then
     runIPSET "create IPSEC_VPN_PORTS bitmap:port range 1-65535"
     runIPSET "add IPSEC_VPN_PORTS 500"
     runIPSET "add IPSEC_VPN_PORTS 4500"
    fi

    if [ "$TUNNEL_TYPE" != "ipsec" ]; then
     runIPSET "create OPENVPN_VPN_PORT bitmap:port range 1-65535"
     runIPSET "add OPENVPN_VPN_PORT ${VTUN_PORT[0]}"
     [[ ! -z "${VTUN_PORT[1]}" ]] && [[ "${VTUN_PORT[1]}" -ne "${VTUN_PORT[0]}" ]] && runIPSET "add OPENVPN_VPN_PORT ${VTUN_PORT[1]}"
     [[ ! -z "${VTUN_PORT[2]}" ]] && [[ "${VTUN_PORT[2]}" -ne "${VTUN_PORT[0]}" ]] && runIPSET "add OPENVPN_VPN_PORT ${VTUN_PORT[2]}"
    fi
fi


###########################################################################
# Create Black List IPs
###########################################################################
runIPSET "create BLACK_LIST hash:net family inet hashsize 1024 maxelem 65536"

LOG "Configuring IPtables Chains/Hooks..." "divider"

###########################################################################
# Create IPTABLES firewall rules
###########################################################################



# set up filter table in/out chains
runIPTABLES "-N ETH0_IN"
runIPTABLES "-N ETH0_LOCAL"
runIPTABLES "-N ETH0_OUT"
runIPTABLES "-N ETH1_IN"
runIPTABLES "-N ETH1_LOCAL"
runIPTABLES "-N ETH1_OUT"
if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
   runIPTABLES "-N VTI_LOCAL"
fi
runIPTABLES "-N VTUN_IN"
runIPTABLES "-N VTUN_OUT"
runIPTABLES "-N SASFW_FW_IN_HOOK"
runIPTABLES "-N SASFW_FW_LOCAL_HOOK"
runIPTABLES "-N SASFW_FW_OUT_HOOK"
runIPTABLES "-A INPUT -j SASFW_FW_LOCAL_HOOK"
runIPTABLES "-A FORWARD -j SASFW_FW_IN_HOOK"
runIPTABLES "-A FORWARD -j SASFW_FW_OUT_HOOK"

# set up nat table hooks
runIPTABLESnat "-N SASFW_PRE_DNAT_HOOK"
runIPTABLESnat "-N SASFW_PRE_SNAT_HOOK"
runIPTABLESnat "-A SASFW_PRE_DNAT_HOOK -j RETURN"
runIPTABLESnat "-A SASFW_PRE_SNAT_HOOK -j RETURN"


###########
# ETH0_IN - inbound rules for packets received on sasfw private but some other destination, ie customer premise
###########
LOG "Configuring IPtables Filter Table ..." "divider"
RN=0 # Allow established state connections
((RN=RN+10))
runIPTABLES "-A ETH0_IN -m comment --comment ETH0_IN-${RN} -m state --state ESTABLISHED -j RETURN"

####
# These rules get added to sasfw whether a customer endpoint network is defined or not (ie rcp-only, rcp-shared environments)
  # SDS to Internet TCP
  ((RN=RN+10))
  runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set APM_IP dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
#  ((RN=RN+10))
#  runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG --log-prefix "[SG_ETH0_IN-${RN}-A]""
#  runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"

# Added rules to allow traffic from cci's back to sl vpns/services.
  ((RN=RN+10))
  runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set SL_SERVICES dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
  runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set SL_SERVICES dst -j RETURN"

  ((RN=RN+10))
  runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set SL_SSLVPNS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
  runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set SL_SSLVPNS dst -j RETURN" 

# New Egress Rules
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set symantecliveupdate_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set symantecliveupdate_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set symantec_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set symantec_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set dl_fedoraproject_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set dl_fedoraproject_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set r1soft_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set r1soft_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set networklayer_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set networklayer_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set wazuh_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set wazuh_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set ismnac_ibm_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set ismnac_ibm_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set smtp_sendgrid_net_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set smtp_sendgrid_net_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set idaas_iam_ibm_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set idaas_iam_ibm_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set na_artifactoryr_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set na_artifactoryr_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set eu_artifactoryr_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set eu_artifactoryr_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set prepiam_toronto_ca_ibm_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set prepiam_toronto_ca_ibm_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set prepiam_ice_ibmcloud_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set prepiam_ice_ibmcloud_com_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set w3ids_sso_ibm_com dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set w3ids_sso_ibm_com dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set status_geotrust_com dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set status_geotrust_com dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set database_clamav_net dst -m set --match-set CLAMAV_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set database_clamav_net dst -m set --match-set CLAMAV_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set sensors_genuine_sheeps_cbcloud dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set sensors_genuine_sheeps_cbcloud dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set crowdstrike_instances dst -m set --match-set CROWDSTRIKE_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set crowdstrike_instances dst -m set --match-set CROWDSTRIKE_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set login_ibm_com dst -m set --match-set LOGIN_IBM_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set login_ibm_com dst -m set --match-set LOGIN_IBM_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set VAULTaaS dst -m set --match-set VSERV_SOS_PORTS dst -m limit --limit 1/sec -j LOG --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set VAULTaaS dst -m set --match-set VSERV_SOS_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set newrelic_com dst -m set --match-set NEW_RELIC_PUBLIC_PORTS dst -m limit --limit 1/sec -j LOG --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set newrelic_com dst -m set --match-set NEW_RELIC_PUBLIC_PORTS dst -j RETURN"
((RN=RN+10))
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set patch_advisories dst -m set --match-set PATCH_ADVISORIES_PORTS dst -m limit --limit 1/sec -j LOG --log-prefix "[SG_ETH0_IN-${RN}-A]""
runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set patch_advisories dst -m set --match-set PATCH_ADVISORIES_PORTS dst -j RETURN"
if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
   if [[ "${DVPN^^}" != "YES" && "${TUNNEL_TYPE^^}" != "MODEL6" ]]; then
      # Allow Dedicated segment ping to CP Endpoints
      ((RN=RN+10))
      runIPTABLES "-A ETH0_IN -p icmp -m comment --comment ETH0_IN-${RN} -m icmp --icmp-type 8 -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set CUST_ENDPOINTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
      runIPTABLES "-A ETH0_IN -p icmp -m comment --comment ETH0_IN-${RN} -m icmp --icmp-type 8 -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set CUST_ENDPOINTS dst -j RETURN"

      # Allow EE to CP Endpoints
      [[ -n "${EE_IP}" ]] && ((RN=RN+10))
      [[ -n "${EE_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_ENDPOINTS dst -m set --match-set EE_TO_CUST_ENDPOINTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
      [[ -n "${EE_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_ENDPOINTS dst -m set --match-set EE_TO_CUST_ENDPOINTS dst -j RETURN"
   fi #if [[ "${DVPN^^}" != "YES" && "${TUNNEL_TYPE^^}" != "MODEL6" ]]
   if [[ ! -z "${DNS_IP[0]}" || "${DVPN^^}" == "YES" ]];then
     [[ -n "${EE_IP}" ]] && ((RN=RN+10))
     [[ -n "${EE_IP}" ]] && runIPTABLES "-A ETH0_IN -p udp -m comment --comment ETH0_IN-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_DNS dst -m set --match-set EE_TO_CUST_DNS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     [[ -n "${EE_IP}" ]] && runIPTABLES "-A ETH0_IN -p udp -m comment --comment ETH0_IN-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_DNS dst -m set --match-set EE_TO_CUST_DNS dst -j RETURN"
   fi

   if [[ ! -z "${LDAP_IP[0]}" || "${DVPN^^}" == "YES" ]];then
     # Allow EE to CP LDAPS
     [[ -n "${CHEF_IP}" ]] && ((RN=RN+10))
     #runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_LDAP dst -m set --match-set EE_TO_CUST_LDAP dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     #runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_LDAP dst -m set --match-set EE_TO_CUST_LDAP dst -j RETURN"
     [[ -n "${CHEF_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set CHEF_IP src,src -m set --match-set CUST_LDAP dst -m set --match-set CHEF_TO_CUST_LDAP dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     [[ -n "${CHEF_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set CHEF_IP src,src -m set --match-set CUST_LDAP dst -m set --match-set CHEF_TO_CUST_LDAP dst -j RETURN"
   fi

   if [ ! -z "${CUSTPREM_BIGFIX_IP[0]}" -a ! -z "$RCP_BPM_IP" ];then
     if [[ "${DVPN^^}" != "YES" && "${TUNNEL_TYPE^^}" != "MODEL6" ]];then
        # Allow RCP_BPM to CP BigFix
        [[ -n "${RCP_BPM_IP}" ]] && ((RN=RN+10))
        [[ -n "${RCP_BPM_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set RCP_BPM_IP src,src -m set --match-set CUSTPREM_BIGFIX_IPS dst -m set --match-set CUSTPREM_BIGFIX_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
        [[ -n "${RCP_BPM_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set RCP_BPM_IP src,src -m set --match-set CUSTPREM_BIGFIX_IPS dst -m set --match-set CUSTPREM_BIGFIX_PORTS dst -j RETURN"
     fi

     # Allow RCP_RoR to CP BigFix
     [[ -n "${RCP_ROR_IP}" ]] && ((RN=RN+10))
     [[ -n "${RCP_ROR_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set RCP_ROR_IP src,src -m set --match-set CUSTPREM_BIGFIX_IPS dst -m set --match-set CUSTPREM_BIGFIX_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     [[ -n "${RCP_ROR_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set RCP_ROR_IP src,src -m set --match-set CUSTPREM_BIGFIX_IPS dst -m set --match-set CUSTPREM_BIGFIX_PORTS dst -j RETURN"
   fi # if [ ! -z "${CUSTPREM_BIGFIX_IP[0]}" -a ! -z "$RCP_BPM_IP" ]

   #create rules for CUSTPREM_CSC_*_IPS
   if [ ! -z "${CSC_IWSD_IP1[0]}" ];then
     # Allow CSC to CP IWSD
     [[ -n "${CSC_IP}" ]] && ((RN=RN+10))
     [[ -n "${CSC_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set CSC_IP src,src -m set --match-set CUSTPREM_CSC_IWSD_IPS dst -m set --match-set CUSTPREM_CSC_IWSD_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     [[ -n "${CSC_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set CSC_IP src,src -m set --match-set CUSTPREM_CSC_IWSD_IPS dst -m set --match-set CUSTPREM_CSC_IWSD_PORTS dst -j RETURN"
   fi
   if [ ! -z "${CSC_IWSZ_IP1[0]}" ];then
     # Allow CSC to CP IWSZ
     [[ -n "${CSC_IP}" ]] && ((RN=RN+10))
     [[ -n "${CSC_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set CSC_IP src,src -m set --match-set CUSTPREM_CSC_IWSZ_IPS dst -m set --match-set CUSTPREM_CSC_IWSZ_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     [[ -n "${CSC_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set CSC_IP src,src -m set --match-set CUSTPREM_CSC_IWSZ_IPS dst -m set --match-set CUSTPREM_CSC_IWSZ_PORTS dst -j RETURN"
   fi
   if [ ! -z "${CSC_BMC_IP1[0]}" ];then
     # Allow CSC to CP BMC
     [[ -n "${CSC_IP}" ]] && ((RN=RN+10))
     [[ -n "${CSC_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set CSC_IP src,src -m set --match-set CUSTPREM_CSC_BMC_IPS dst -m set --match-set CUSTPREM_CSC_BMC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     [[ -n "${CSC_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set CSC_IP src,src -m set --match-set CUSTPREM_CSC_BMC_IPS dst -m set --match-set CUSTPREM_CSC_BMC_PORTS dst -j RETURN"
   fi

  if [ ! -z "$ASB_IP" ];then
   # Allow ASB to CP Endpoints
   ((RN=RN+10))
   runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUST_ENDPOINTS dst -m set --match-set ASB_TO_CUST_ENDPOINTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
   runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUST_ENDPOINTS dst -m set --match-set ASB_TO_CUST_ENDPOINTS dst -j RETURN"
  fi

  if [ ! -z "$ASB_IP" ];then
   if [ ! -z "${DNS_IP[0]}" ];then
     # Allow ASB to CP DNS
     ((RN=RN+10))
     runIPTABLES "-A ETH0_IN -p udp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUST_DNS dst -m set --match-set ASB_TO_CUST_DNS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     runIPTABLES "-A ETH0_IN -p udp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUST_DNS dst -m set --match-set ASB_TO_CUST_DNS dst -j RETURN"
   fi

   if [ ! -z "${LDAP_IP[0]}" ];then
     # Allow ASB to CP LDAPS
     [[ -n "${ASB_IP}" ]] && ((RN=RN+10))
     [[ -n "${ASB_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUST_LDAP dst -m set --match-set ASB_TO_CUST_LDAP dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     [[ -n "${ASB_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUST_LDAP dst -m set --match-set ASB_TO_CUST_LDAP dst -j RETURN"
   fi

   # if asb & vcenter defined, allow asb to customer premise vcenter ips.
   if [ ! -z "${VCENTER_IP[0]}" && ! -z "$ASB_IP" ];then
     ((RN=RN+10))
     runIPSET "add ASB_TO_VCENTER 443"
     runIPSET "create CUSTPREM_VCENTER hash:ip family inet hashsize 1024 maxelem 65536"
     runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUSTPREM_VCENTER dst -m set --match-set ASB_TO_VCENTER dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
     runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUSTPREM_VCENTER dst -m set --match-set ASB_TO_VCENTER dst -j RETURN"
   fi

   if [ ! -z "${CUSTPREM_BIGFIX_IP[0]}" ];then
    # Allow ASB to CP BigFix
    [[ -n "${ASB_IP}" ]] && ((RN=RN+10))
    [[ -n "${ASB_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUSTPREM_BIGFIX_IPS dst -m set --match-set CUSTPREM_BIGFIX_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
    [[ -n "${ASB_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set ASB_IP src,src -m set --match-set CUSTPREM_BIGFIX_IPS dst -m set --match-set CUSTPREM_BIGFIX_PORTS dst -j RETURN"
   fi
  fi # if [ ! -z "${ASB_IP}" ]

  if [ ! -z "$TICKETING_PORTS" ];then
   # Allow RCP_BPM to CP Ticketing system
   [[ -n "${RCP_BPM_IP}" ]] && ((RN=RN+10))
   [[ -n "${RCP_BPM_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set RCP_BPM_IP src,src -m set --match-set CUSTPREM_TICKETING_IPS dst -m set --match-set CUSTPREM_TICKETING_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
   [[ -n "${RCP_BPM_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set RCP_BPM_IP src,src -m set --match-set CUSTPREM_TICKETING_IPS dst -m set --match-set CUSTPREM_TICKETING_PORTS dst -j RETURN"
   # Allow RCP_ROR to CP Ticketing system
   [[ -n "${RCP_ROR_IP}" ]] && ((RN=RN+10))
   [[ -n "${RCP_ROR_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set RCP_ROR_IP src -m set --match-set CUSTPREM_TICKETING_IPS dst -m set --match-set CUSTPREM_TICKETING_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_IN-${RN}-A]""
   [[ -n "${RCP_ROR_IP}" ]] && runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set RCP_ROR_IP src -m set --match-set CUSTPREM_TICKETING_IPS dst -m set --match-set CUSTPREM_TICKETING_PORTS dst -j RETURN"
  fi
   if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
     ((RN=RN+10))
     runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_JH dst -m set --match-set EE_TO_CUST_JH dst -m limit --limit 1/sec -j LOG --log-prefix "[SG_ETH0_IN-${RN}-A]""
     runIPTABLES "-A ETH0_IN -p tcp -m comment --comment ETH0_IN-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_JH dst -m set --match-set EE_TO_CUST_JH dst -j RETURN"
   fi
fi # if [ "$CUSTOMER_NETWORK_INFO" = true ]

  runIPTABLESdefault "ETH0_IN" "REJECT --reject-with icmp-port-unreachable"


###########
# ETH0_LOCAL - inbound rules for packets with destination of sasfw private interface
###########
RN=0
# Allow established state connections
((RN=RN+10))
runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -m state --state ESTABLISHED -j RETURN"
# SoftLayer Service connections
((RN=RN+10))
runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -m set --match-set SL_SERVICES src -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_LOCAL-${RN}-A]""
runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -m set --match-set SL_SERVICES src -j RETURN"
# SoftLayer SSL VPN connections
((RN=RN+10))
runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -m set --match-set SL_SSLVPNS src -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH0_LOCAL-${RN}-A]""
runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -m set --match-set SL_SSLVPNS src -j RETURN"

##For New DNS service
runIPTABLES "-A ETH0_LOCAL -p udp -m udp --dport 53 -m comment --comment \"dns - Forward Mode for dns\" -j ACCEPT"

  # if in test env, make sure to use test vyatta vrrp for sasgaas/ras filter rules
  if [ "$DC" == "TEST" ];then
   SASGAAS_SET="MS_TEST_IP"
   RAS_NA_SET="MS_TEST_IP"
  else
   SASGAAS_SET="MS_WDC04_IP"
   RAS_NA_SET="MS_WDC04_IP"
  fi

  # MS SASGaaS, EE and MIST connections
  ((RN=RN+10))
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set $SASGAAS_SET src -m set --match-set MS_SASGaaS_and_EE_Port dst -j LOG -m limit --limit 1/sec --log-prefix \"[SG_ETH0_LOCAL-${RN}-A]\""
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set $SASGAAS_SET src -m set --match-set MS_SASGaaS_and_EE_Port dst -j ACCEPT"

  # MS RAS (NA) connections
  ((RN=RN+10))
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_Port dst -j LOG -m limit --limit 1/sec --log-prefix \"[SG_ETH0_LOCAL-${RN}-A]\""
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_Port dst -j ACCEPT"

  # MS RAS (NA) Zabbix connection
  ((RN=RN+10))
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_Zabbix_Port dst -j LOG -m limit --limit 1/sec --log-prefix \"[SG_ETH0_LOCAL-${RN}-A]\""
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_Zabbix_Port dst -j ACCEPT"

  # MS RAS (AMS) connections
  ((RN=RN+10))
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_Port dst -j LOG -m limit --limit 1/sec --log-prefix \"[SG_ETH0_LOCAL-${RN}-A]\""
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_Port dst -j ACCEPT"

  # MS RAS (MEL) connections
  ((RN=RN+10))
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_Port dst -j LOG -m limit --limit 1/sec --log-prefix \"[SG_ETH0_LOCAL-${RN}-A]\""
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_Port dst -j ACCEPT"

  # MS RAS (SYD) connections
  ((RN=RN+10))
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_Port dst -j LOG -m limit --limit 1/sec --log-prefix \"[SG_ETH0_LOCAL-${RN}-A]\""
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_Port dst -j ACCEPT"

  # allow MS BigFixRelay connections
  ((RN=RN+10))
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p udp -m set --match-set $BIGFIX_GROUP src -m set --match-set MS_BigFix_Port dst -j LOG -m limit --limit 1/sec --log-prefix \"[SG_ETH0_LOCAL-${RN}-A]\""
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p udp -m set --match-set $BIGFIX_GROUP src -m set --match-set MS_BigFix_Port dst -j ACCEPT"

  # allow MS R1Soft connections
  ((RN=RN+10))
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set $R1SOFT_GROUP src -m set --match-set MS_R1Soft_Port dst -j LOG -m limit --limit 1/sec --log-prefix \"[SG_ETH0_LOCAL-${RN}-A]\""
  runIPTABLES "-A ETH0_LOCAL -m comment --comment ETH0_LOCAL-${RN} -p tcp -m set --match-set $R1SOFT_GROUP src -m set --match-set MS_R1Soft_Port dst -j ACCEPT"

runIPTABLESdefault "ETH0_LOCAL" "REJECT --reject-with icmp-port-unreachable"

# ETH0_OUT - Set default to accept connections
runIPTABLESdefault "ETH0_OUT" "RETURN"


###########
# ETH1_IN - packets received on sasfw public interface with some other destination ip
###########
RN=0 
# Allow established state connections
((RN=RN+10))
runIPTABLES "-A ETH1_IN -m comment --comment ETH1_IN-${RN} -m state --state ESTABLISHED -j RETURN"

#Black List to 443
((RN=RN+10))
runIPTABLES "-A ETH1_IN -p tcp -m comment --comment ETH1_IN-${RN} -m set --match-set BLACK_LIST src --dport 443 -m limit --limit 1/sec -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_IN-BlackList-D] " --log-level 6"
runIPTABLES "-A ETH1_IN -p tcp -m comment --comment ETH1_IN-${RN} -m set --match-set BLACK_LIST src --dport 443 -j DROP"

# Internet to BPM / RCP-Proxy https
((RN=RN+10))
runIPTABLES "-A ETH1_IN -p tcp -m comment --comment ETH1_IN-${RN} -m set --match-set INBOUND_PUBLIC_ACCESS dst -m set --match-set INBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_IN-${RN}-A]""
runIPTABLES "-A ETH1_IN -p tcp -m comment --comment ETH1_IN-${RN} -m set --match-set INBOUND_PUBLIC_ACCESS dst -m set --match-set INBOUND_PUBLIC_PORTS dst -j RETURN"


runIPTABLESdefault "ETH1_IN" "DROP"


###########
# ETH1_LOCAL - packets received on sasfw public interface with sasfw pub ip as destination
###########
RN=0 
# Allow established state connections
((RN=RN+10))
runIPTABLES "-A ETH1_LOCAL -p tcp -m comment --comment ETH1_LOCAL-${RN} -m state --state ESTABLISHED -j RETURN"

if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
  if [ "$IAMaaS" == "YES" ]; then 

    # Allow IAMaaS Vyatta ping for troubleshooting
    ((RN=RN+10))
    runIPTABLES "-A ETH1_LOCAL -p icmp -m comment --comment ETH1_LOCAL-${RN} -m icmp --icmp-type 8 -m set --match-set IAMAAS_VYATTA_IP src -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_LOCAL-${RN}-A]""
    runIPTABLES "-A ETH1_LOCAL -p icmp -m comment --comment ETH1_LOCAL-${RN} -m icmp --icmp-type 8 -m set --match-set IAMAAS_VYATTA_IP src -j RETURN"

    # IAMaaS / SASFW IPSec VPN connection udp
    ((RN=RN+10))
    runIPTABLES "-A ETH1_LOCAL -p udp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set IAMAAS_VYATTA_IP src -m set --match-set IPSEC_VPN_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[ETH1_LOCAL-${RN}-A] ""
    runIPTABLES "-A ETH1_LOCAL -p udp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set IAMAAS_VYATTA_IP src -m set --match-set IPSEC_VPN_PORTS dst -j RETURN"

    # IAMaaS / SASFW IPSec VPN connection esp
    ((RN=RN+10))
    runIPTABLES "-A ETH1_LOCAL -p esp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set IAMAAS_VYATTA_IP src -j LOG -m limit --limit 1/sec --log-prefix "[ETH1_LOCAL-${RN}-A] ""
    runIPTABLES "-A ETH1_LOCAL -p esp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set IAMAAS_VYATTA_IP src -j RETURN"
  fi 

  # Allow SASG ping for troubleshooting
  ((RN=RN+10))
  runIPTABLES "-A ETH1_LOCAL -p icmp -m comment --comment ETH1_LOCAL-${RN} -m icmp --icmp-type 8 -m set --match-set ${MASQ_IP_GROUP} src -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_LOCAL-${RN}-A]""
  runIPTABLES "-A ETH1_LOCAL -p icmp -m comment --comment ETH1_LOCAL-${RN} -m icmp --icmp-type 8 -m set --match-set ${MASQ_IP_GROUP} src -j RETURN"

  
  if [[ "$TUNNEL_TYPE" == "ipsec" || "${TUNNEL_TYPE^^}" == "MODEL6" ]];then
    # SASG / SASFW IPSec VPN connection udp
    ((RN=RN+10))
    runIPTABLES "-A ETH1_LOCAL -p udp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set ${MASQ_IP_GROUP} src -m set --match-set IPSEC_VPN_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_LOCAL-${RN}-A] ""
    runIPTABLES "-A ETH1_LOCAL -p udp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set ${MASQ_IP_GROUP} src -m set --match-set IPSEC_VPN_PORTS dst -j RETURN"

    # SASG / SASFW IPSec VPN connection esp
    ((RN=RN+10))
    runIPTABLES "-A ETH1_LOCAL -p esp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set ${MASQ_IP_GROUP} src -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_LOCAL-${RN}-A] ""
    runIPTABLES "-A ETH1_LOCAL -p esp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set ${MASQ_IP_GROUP} src -j RETURN"
  else
    # SASG / SASFW OpenVPN VPN connection
    ((RN=RN+10))
    runIPTABLES "-A ETH1_LOCAL -p tcp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set SASG_MASQ_IP src -m set --match-set OPENVPN_VPN_PORT dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_LOCAL-${RN}-A] ""
    runIPTABLES "-A ETH1_LOCAL -p tcp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set SASG_MASQ_IP src -m set --match-set OPENVPN_VPN_PORT dst -j RETURN"
  fi

fi # if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then

# Public APM to SASFW
((RN=RN+10))
runIPTABLES "-A ETH1_LOCAL -p icmp -m comment --comment ETH1_LOCAL-${RN} -m icmp --icmp-type 3/4 -m set --match-set APM_IP src -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_LOCAL-${RN}-A] ""
runIPTABLES "-A ETH1_LOCAL -p icmp -m comment --comment ETH1_LOCAL-${RN} -m icmp --icmp-type 3/4 -m set --match-set APM_IP src -j RETURN"

#For APM ALLOW OUT
((RN=RN+10))
runIPTABLES "-A ETH1_LOCAL -p tcp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set APM_IP dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_ETH1_LOCAL-${RN}-A] ""
runIPTABLES "-A ETH1_LOCAL -p tcp -m comment --comment ETH1_LOCAL-${RN} -m set --match-set APM_IP dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN"
#

runIPTABLESdefault "ETH1_LOCAL" "DROP"

# ETH1_OUT
  RN=0
runIPTABLESdefault "ETH1_OUT" "RETURN"

###########
# VTUN_IN - packets received on sasfw TUNNEL interface with some other destination
###########

RN=0
if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then

  if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
     ((RN=RN+10))
     runIPTABLES "-A VTI_LOCAL -m comment --comment VTI_LOCAL-${RN} -m state --state ESTABLISHED -j RETURN"
     ((RN=RN+10))
     runIPTABLES "-A VTI_LOCAL -p icmp -m comment --comment VTI_LOCAL-${RN} -m icmp --icmp-type 8 -m set --match-set SASG_MASQ_IP src -m limit --limit 1/sec -j LOG --log-prefix "[SG_VTI_LOCAL-${RN}-A]""
     runIPTABLES "-A VTI_LOCAL -p icmp -m comment --comment VTI_LOCAL-${RN} -m icmp --icmp-type 8 -m set --match-set SASG_MASQ_IP src -j RETURN"
     ((RN=RN+10))
     runIPTABLES "-A VTI_LOCAL -p tcp -m comment --comment VTI_LOCAL-${RN} -m set --match-set SASG_MASQ_IP src -m set --match-set OPENVPN_VPN_PORT dst -m limit --limit 1/sec -j LOG --log-prefix "[SG_VTI_LOCAL-${RN}-A]""
     runIPTABLES "-A VTI_LOCAL -p tcp -m comment --comment VTI_LOCAL-${RN} -m set --match-set SASG_MASQ_IP src -m set --match-set OPENVPN_VPN_PORT dst -j RETURN"
     # VTI_LOCAL - set default to reject connections
     runIPTABLESdefault "VTI_LOCAL" "REJECT --reject-with icmp-port-unreachable"
  fi
  # Allow established state connections via VPN
  ((RN=RN+10))
  runIPTABLES "-A VTUN_IN -m comment --comment VTUN_IN-${RN} -m state --state ESTABLISHED -j RETURN"
  
  #NOTE _ using CDS_EE & CDS_CHEF as destination groups -these are regular ip hash lists, not bitmap ip,mac lists which can't be used on destination matches.
  # Customer Endpoints  to EE connections
  [[ -n "${EE_IP}" ]] && ((RN=RN+10))
  [[ -n "${EE_IP}" ]] && runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VTUN_IN-${RN} -m set --match-set CUST_ENDPOINTS src -m set --match-set CDS_EE dst -m set --match-set ENDPOINTS_CDS_EE dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_VTUN_IN-${RN}-A]""
  [[ -n "${EE_IP}" ]] && runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VTUN_IN-${RN} -m set --match-set CUST_ENDPOINTS src -m set --match-set CDS_EE dst -m set --match-set ENDPOINTS_CDS_EE dst -j RETURN"

  # Add endpoint to EE Kafka messaging filters
  [[ -n "${EE_IP}" ]] && ((RN=RN+10))
  [[ -n "${EE_IP}" ]] && runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VTUN_IN-${RN} -m set --match-set CUST_ENDPOINTS src -m set --match-set CDS_EE dst -m set --match-set ENDPOINTS_CDS_EE_KAFKA dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_VTUN_IN-${RN}-A]""
  [[ -n "${EE_IP}" ]] && runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VTUN_IN-${RN} -m set --match-set CUST_ENDPOINTS src -m set --match-set CDS_EE dst -m set --match-set ENDPOINTS_CDS_EE_KAFKA dst -j RETURN"

  # Customer Endpoints to Chef connections
  [[ -n "${CHEF_IP}" ]] && ((RN=RN+10))
  [[ -n "${CHEF_IP}" ]] && runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VTUN_IN-${RN} -m set --match-set CUST_ENDPOINTS src -m set --match-set CDS_CHEF dst -m set --match-set ENDPOINTS_CDS_CHEF dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_VTUN_IN-${RN}-A]""
  [[ -n "${CHEF_IP}" ]] && runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VTUN_IN-${RN} -m set --match-set CUST_ENDPOINTS src -m set --match-set CDS_CHEF dst -m set --match-set ENDPOINTS_CDS_CHEF dst -j RETURN"

  #IAMaaS section
  if [ "$IAMaaS" == "YES" ]; then
   # Customer Endpoints to IAMaaS
   ((RN=RN+10))
   runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CUST_ENDPOINTS src -m set --match-set IAMaaS_SERVICE dst -m set --match-set ENDPOINTS_IAMaaS dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_VTUN_IN-${RN}-A]""
   runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CUST_ENDPOINTS src -m set --match-set IAMaaS_SERVICE dst -m set --match-set ENDPOINTS_IAMaaS dst -j RETURN"

   #Feature 405729
   if [ ! -z "$TDI_IP" ]; then
      ((RN=RN+10))
      runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_TDI_IP src -m set --match-set IAMaaS_SERVICE dst -m set --match-set IAMaaS_TDI_PORT dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_VTUN_IN-${RN}-A]""
      runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_TDI_IP src -m set --match-set IAMaaS_SERVICE dst -m set --match-set IAMaaS_TDI_PORT dst -j RETURN"
   fi
  
    # feature 441061
    if [ -n "${IAMAAS_MS_AD_PORT}" ] && [ -n "${IAMAAS_MS_AD_IP}" ]; then
     ((RN=RN+10))
     runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CUST_ENDPOINTS_MS_AD src -m set --match-set IAMaaS_SERVICE dst -m set --match-set ENDPOINTS_IAMaaS_MS_AD dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_VTUN_IN-${RN}-A]""
     runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CUST_ENDPOINTS_MS_AD src -m set --match-set IAMaaS_SERVICE dst -m set --match-set ENDPOINTS_IAMaaS_MS_AD dst -j RETURN"    
    fi
    if [ -n "${IAMAAS_REMEDY_PORT}" ] && [ -n "${IAMAAS_REMEDY_IP}" ]; then
     ((RN=RN+10))
     runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CUST_ENDPOINTS_REMEDY src -m set --match-set IAMaaS_SERVICE dst -m set --match-set ENDPOINTS_IAMaaS_REMEDY dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_VTUN_IN-${RN}-A]""
     runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CUST_ENDPOINTS_REMEDY src -m set --match-set IAMaaS_SERVICE dst -m set --match-set ENDPOINTS_IAMaaS_REMEDY dst -j RETURN"    
    fi
  fi
  #end IAMaaS section

 if [ "${DVPN^^}" != "YES" ]; then
  # SASG to Chef via SASFW connection (Logpush section)
  ((RN=RN+10))
  runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CUST_JH src -m set --match-set VTUN_IN_LOGPUSH_PORT dst -m set --match-set LP_DEST dst -j LOG -m limit --limit 1/sec --log-prefix "[SG_VTUN_IN-${RN}-A]""
  runIPTABLES "-A VTUN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CUST_JH src -m set --match-set VTUN_IN_LOGPUSH_PORT dst -m set --match-set LP_DEST dst -j RETURN"
  # end Logpush
 fi
  # VTUN_IN - set default to reject connections
  runIPTABLESdefault "VTUN_IN" "REJECT --reject-with icmp-port-unreachable"


###########
# VTUN_OUT - packets outbound on sasfw TUNNEL interface - just return
###########
  # VTUN_OUT - set default to accept connections
  runIPTABLESdefault "VTUN_OUT" "RETURN"


  if [ "$TUNNEL_TYPE" == "ipsec" ];then
    runIPTABLES "-A SASFW_FW_IN_HOOK -i vti+ -j VTUN_IN"
    runIPTABLES "-A SASFW_FW_OUT_HOOK -o vti+ -j VTUN_OUT"
  else
    for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
    do
      runIPTABLES "-A SASFW_FW_IN_HOOK -i vtun${INDEX} -j VTUN_IN"
      runIPTABLES "-A SASFW_FW_OUT_HOOK -o vtun${INDEX} -j VTUN_OUT"
    done
  fi
fi # if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
runIPTABLES "-A SASFW_FW_IN_HOOK -i eth0 -j ETH0_IN"
runIPTABLES "-A SASFW_FW_IN_HOOK -i eth1 -j ETH1_IN"
if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
   runIPTABLES "-A SASFW_FW_LOCAL_HOOK -i vti1 -j VTI_LOCAL"
fi
runIPTABLES "-A SASFW_FW_LOCAL_HOOK -i eth0 -j ETH0_LOCAL"
runIPTABLES "-A SASFW_FW_LOCAL_HOOK -i eth1 -j ETH1_LOCAL"
runIPTABLES "-A SASFW_FW_OUT_HOOK -o eth0 -j ETH0_OUT"
runIPTABLES "-A SASFW_FW_OUT_HOOK -o eth1 -j ETH1_OUT"

LOG "Configuring IPtables Raw Table ..." "divider"

if [ "${DVPN^^}" != "YES" ]; then
###########
# NAT table configuration - set pre/post routing rules (dnat/snat)
###########

LOG "Configuring IPtables NAT Table ..." "divider"
RN=0
if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
   runIPTABLESnat "-A PREROUTING -j SASFW_PRE_DNAT_HOOK"
   echo "  setting nat destination rules...."
   if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
      echo "SNAT"
      SASG_IPS=(${SASG_IP_1[@]} ${SASG_IP_2[@]})
      for SASG_IP in ${SASG_IPS}
      do
          if [[ "$SASG_IP" =~ ^10\. ]];then 
             ((RN=RN+10))
             ONE_SASG_IP=$(echo ${SASG_IP}| cut -f1 -d "/" | sed 's/^10\./1\./')
             runIPTABLESnat "-A PREROUTING -s ${EE_IP}/32 -d $SASG_IP -i eth0 -p tcp -m tcp --dport 22 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
             runIPTABLESnat "-A PREROUTING -s ${EE_IP}/32 -d $SASG_IP -i eth0 -p tcp -m tcp --dport 22 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $ONE_SASG_IP"
          fi
      done
   fi
   for ((INDEX=0; INDEX<${#CUSTOMER_SUBNETS[@]}; INDEX++))
   do
      # Add NAT to redirect JH LOGPUSH traffic to SASFW private ip no matter what the destination ip is set to as long as the source is the VIP1 ip (handle multi-site as well).
      if [ ! -z "${CUSTOMER_SUBNETS[$INDEX]}" ];then
        VIP1=$(echo ${SASG_VIP1[$INDEX]}| cut -f1 -d "/" | sed 's/^10\./1\./')
        ((RN=RN+10))
        if [ "$TUNNEL_TYPE" == "ipsec" ];then
           runIPTABLESnat "-A PREROUTING -i vti0 -p tcp --dport $SASG_LOGPUSH_PORT -m comment --comment DST-NAT-${RN} -j NETMAP --to ${PRIVATE_VYOS_IP}/32"
        else
           runIPTABLESnat "-A PREROUTING -s ${VIP1} -i vtun$INDEX -p tcp --dport $SASG_LOGPUSH_PORT -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
           runIPTABLESnat "-A PREROUTING -s ${VIP1} -i vtun$INDEX -p tcp --dport $SASG_LOGPUSH_PORT -m comment --comment DST-NAT-${RN} -j NETMAP --to ${PRIVATE_VYOS_IP}/32"
        fi
      fi # if [ ! -z "${CUSTOMER_SUBNETS[$INDEX]" ....
      if [[ "${TUNNEL_TYPE^^}" != "MODEL6" ]]; then
      SASG_SUBNETS=(${CUSTOMER_SUBNETS[INDEX]})
      for SUBNET in "${SASG_SUBNETS[@]}"
      do
         
         if [[ "$SUBNET" =~ ^10\. ]];then
            ONE_SUBNET=1.$(echo $SUBNET | cut -d"." -f2-4)
               ((RN=RN+10))
               BFPORTS=""
               DPORTS=22,5985,443,9443
               for port in "${LDAP_PORT[@]}"; do
                DPORTS="$DPORTS,${port}"
               done 
               if [ ! -z "$BIGFIX_PORTS" ];then
                  DPORTS="$DPORTS,$BIGFIX_PORTS"
               fi
               if [ ! -z "$TICKETING_PORTS" ];then
                  DPORTS="$DPORTS,$TICKETING_PORTS"
               fi
               # if CSC_IP defined then make sure we add all CSC ports to DPORTS variable so firewall accepts 
               # inbound traffic from private network destined for the customer subnet.
               if [ ! -z "$CSC_IP" ];then
                  DPORTS="$DPORTS,$CSC_IWSD_BOOTPORT,$CSC_IWSD_HTTPSPORT,$CSC_IWSD_CSI_AUTHPORT,$CSC_IWSD_ADM_SECPORT,$CSC_IWSZ_SERVOPTSPORT,$CSC_IWSZ_DWC_BOOTPORT,$CSC_BMC_REST_APIPORT,$CSC_BMC_COBRASERVPORT"
               fi
               #runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d $SUBNET -i eth0 -p tcp -m multiport --dports $DPORTS -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
               runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d $SUBNET -i eth0 -p tcp -m multiport --dports $DPORTS -m comment --comment DST-NAT-${RN} -j NETMAP --to $ONE_SUBNET"

              ((RN=RN+10))
              #runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d $SUBNET -i eth0 -p icmp -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
              runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d $SUBNET -i eth0 -p icmp -m comment --comment DST-NAT-${RN} -j NETMAP --to $ONE_SUBNET"

            ((RN=RN+10))
            if [ "$TUNNEL_TYPE" == "ipsec" ];then
              #runIPTABLESnat "-A PREROUTING -s $ONE_SUBNET -d 2.0.0.0/8 -i vti0 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
              runIPTABLESnat "-A PREROUTING -s $ONE_SUBNET -d 2.0.0.0/8 -i vti0 -m comment --comment DST-NAT-${RN} -j NETMAP --to 10.0.0.0/8"
            else
              #runIPTABLESnat "-A PREROUTING -s $ONE_SUBNET -d 2.0.0.0/8 -i vtun$INDEX -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
              runIPTABLESnat "-A PREROUTING -s $ONE_SUBNET -d 2.0.0.0/8 -i vtun$INDEX -m comment --comment DST-NAT-${RN} -j NETMAP --to 10.0.0.0/8"
            fi


         else
            ((RN=RN+10))
            if [ "$TUNNEL_TYPE" == "ipsec" ];then
              #runIPTABLESnat "-A PREROUTING -s $SUBNET -d 2.0.0.0/8 -i vti0 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
              runIPTABLESnat "-A PREROUTING -s $SUBNET -d 2.0.0.0/8 -i vti0 -m comment --comment DST-NAT-${RN} -j NETMAP --to 10.0.0.0/8"
            else
              #runIPTABLESnat "-A PREROUTING -s $SUBNET -d 2.0.0.0/8 -i vtun$INDEX -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
              runIPTABLESnat "-A PREROUTING -s $SUBNET -d 2.0.0.0/8 -i vtun$INDEX -m comment --comment DST-NAT-${RN} -j NETMAP --to 10.0.0.0/8"
            fi
         fi
      done
      else
          if [[ "${SASG_VIP1[INDEX]}" =~ ^10\. ]];then
             ((RN=RN+10))
             runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d ${SASG_VIP1[INDEX]} -i eth0 -m comment --comment DST-NAT-${RN} -j NETMAP --to ${VIP1}"
          fi
          ((RN=RN+10))
          runIPTABLESnat "-A PREROUTING -s $VIP1 -d 2.0.0.0/8 -i vtun$INDEX -m comment --comment DST-NAT-${RN} -j NETMAP --to 10.0.0.0/8"
      fi
   done
   for DNS in "${DNS_IP[@]}"
   do
     ((RN=RN+10))
      if [[ "$DNS" =~ ^10\. ]];then
         ONE_SUBNET_DNS=1.$(echo $DNS | cut -d"." -f2-4)
         #runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d $DNS -i eth0 -p udp --dport 53 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
         runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d $DNS -i eth0 -p udp --dport 53 -m comment --comment DST-NAT-${RN} -j NETMAP --to $ONE_SUBNET_DNS"
      fi     
    done
    for ((INDEX=0; INDEX<${#CUSTPREM_BIGFIX_IP[@]}; INDEX++))
    do
      ((RN=RN+10))
      if [[ "${CUSTPREM_BIGFIX_IP[INDEX]}" =~ ^10\. ]];then
         ONE_SUBNET_BigFix=1.$(echo ${CUSTPREM_BIGFIX_IP[INDEX]} | cut -d"." -f2-4)
         [ -z ${CUSTPREM_BIGFIX_PORT[INDEX]} ] && CUSTPREM_BIGFIX_PORT[${INDEX}]=52311
         #runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d $BigFix -i eth0 -p tcp --dport ${CUSTPREM_BIGFIX_PORT[INDEX]} -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
         runIPTABLESnat "-A PREROUTING -s 10.0.0.0/8 -d ${ONE_SUBNET_BigFix} -i eth0 -p tcp --dport ${CUSTPREM_BIGFIX_PORT[INDEX]} -m comment --comment DST-NAT-${RN} -j NETMAP --to $ONE_SUBNET_BigFix"
      fi     
    done
fi

# if openvpn & port 443 then insert exclude rule but not if ipsec or openvpn on 1194 or 
# sasg keepalive checks will fail
if [[ "$TUNNEL_TYPE" != "ipsec" && "${TUNNEL_TYPE^^}" != "MODEL6" ]];then
  if echo "${VTUN_PORT[*]}" | grep -wq 443; then
     if [ ! -z "$MASQ_IP" ];then
        ((RN=RN+10))
        #runIPTABLESnat "-A PREROUTING -m set --match-set SASG_MASQ_IP src -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}-EXCL]""
        runIPTABLESnat "-A PREROUTING -m set --match-set SASG_MASQ_IP src -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j RETURN"
      fi
  fi
fi


if [ "${TUNNEL_TYPE^^}" == "MODEL6" ]; then
      for IP_ADDR in "${LOCAL_DVPN_IP[@]}"
      do
        ((RN=RN+10))
        runIPTABLESnat "-A PREROUTING -d ${IP_ADDR}/32 -i vti1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination ${PRIVATE_VYOS_IP}:${SASG_LOGPUSH_PORT}"
      done
fi
if [ ! -z "$BPM_IP" ]; then
       ((RN=RN+10))
       #runIPTABLESnat "-A PREROUTING -d $ETH1_IP -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
       runIPTABLESnat "-A PREROUTING -d $ETH1_IP -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $BPM_IP"
    else
       #runIPTABLESnat "-A PREROUTING -d $ETH1_IP -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
       #runIPTABLESnat "-A PREROUTING -d $ETH1_IP -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $RCP_BPM_IP"
       # v4 - for shared rcp, should route internet 443 to rcp-proxy-ip
       #runIPTABLESnat "-A PREROUTING -d $ETH1_IP -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
       for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
       do
         ((RN=RN+10))
         runIPTABLESnat "-A PREROUTING -d $ETH1_IP -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination ${RCP_PROXY_IP[INDEX]}"
       done
fi
# if using openvpn & listening on 1194 not 443, then add destination nat for each portable vtun ip
# so traffic from sasg hitting the portable vtun ip & port 443 will get directed to the bpm server for
# sasg-check-keepalived.
if [ ! -z "${PORTABLE_VTUN_CIDR[1]}" ];then
  if [ "$TUNNEL_TYPE" != "ipsec" ];then
     for ((INDEX=1; INDEX<=${#PORTABLE_VTUN_CIDR[@]}; INDEX++))
     do
       if [ "${VTUN_PORT[$INDEX]}" == "1194" ] ; then
          ((RN=RN+10))
          PVTUN=$(echo ${PORTABLE_VTUN_CIDR[INDEX]} | cut -f1 -d'/')
          echo "multi-sasg config with openvpn port 1194 - adding dnat for inbound on portable vtun $PVTUN"
          if [ ! -z "$BPM_IP" ]; then
             #runIPTABLESnat "-A PREROUTING -d $PVTUN -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
             runIPTABLESnat "-A PREROUTING -d $PVTUN -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $BPM_IP"
          elif [ ! -z "$RCP_PROXY_IP" ]; then
             #runIPTABLESnat "-A PREROUTING -d $PVTUN -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
             #runIPTABLESnat "-A PREROUTING -d $PVTUN -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $RCP_BPM_IP"
             # v4 - for shared rcp, should route internet 443 to rcp-proxy-ip
             #runIPTABLESnat "-A PREROUTING -d $PVTUN -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
             runIPTABLESnat "-A PREROUTING -d $PVTUN -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $RCP_PROXY_IP"
          fi
        fi
     done
  fi #if [ "$TUNNEL_TYPE" != "ipsec" ];then
fi #if [ ! -z "${PORTABLE_VTUN_CIDR[0]}" ];then

runIPTABLESnat "-A POSTROUTING -j SASFW_PRE_SNAT_HOOK"
DST_RN=${RN}  

echo "  setting nat source rules...."
RN=0
if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
   if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
      TWO_EE_IP=$(echo ${EE_IP}| cut -f1 -d "/" | sed 's/^10\./2\./')
      for ((INDEX=0; INDEX<${#CUSTOMER_SUBNETS[@]}; INDEX++))
      do
         SASG_IPS=(${SASG_IP_1[INDEX]} ${SASG_IP_2[INDEX]})
         for SASG_IP in ${SASG_IPS}
         do
          if [[ "$SASG_IP" =~ ^10\. ]];then 
             ((RN=RN+10))
             ONE_SASG_IP=$(echo ${SASG_IP}| cut -f1 -d "/" | sed 's/^10\./1\./')
             runIPTABLESnat "-A POSTROUTING -s ${EE_IP}/32 -d $ONE_SASG_IP -o vtun${INDEX} -p tcp -m tcp --dport 22 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
             runIPTABLESnat "-A POSTROUTING -s ${EE_IP}/32 -d $ONE_SASG_IP -o vtun${INDEX} -p tcp -m tcp --dport 22 -m comment --comment DST-NAT-${RN} -j SNAT --to-source $TWO_EE_IP"
          fi
         done
      done
   fi
   for ((INDEX=0; INDEX<${#CUSTOMER_SUBNETS[@]}; INDEX++))
   do
      if [[ "${TUNNEL_TYPE^^}" != "MODEL6" ]]; then
      SASG_SUBNETS=(${CUSTOMER_SUBNETS[INDEX]})
      for SUBNET in "${SASG_SUBNETS[@]}"
      do
         if [[ "$SUBNET" =~ ^10\. ]];then
            ONE_SUBNET=1.$(echo $SUBNET | cut -d"." -f2-4)
            ((RN=RN+10))
            if [ "$TUNNEL_TYPE" == "ipsec" ];then
              #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $ONE_SUBNET -o eth1 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
              #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $ONE_SUBNET -o eth1 -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
              #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $ONE_SUBNET -o vti0 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
              runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $ONE_SUBNET -o vti0 -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
            else
              #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $ONE_SUBNET -o vtun$INDEX -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
              runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $ONE_SUBNET -o vtun$INDEX -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
            fi
             ((RN=RN+10))
            #runIPTABLESnat "-A POSTROUTING -s $ONE_SUBNET -d 10.0.0.0/8 -o eth0 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
            runIPTABLESnat "-A POSTROUTING -s $ONE_SUBNET -d 10.0.0.0/8 -o eth0 -m comment --comment SRC-NAT-${RN} -j SNAT --to-source $ETH0_IP"
          else
            ((RN=RN+10))
            if [ "$TUNNEL_TYPE" == "ipsec" ];then
              #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $SUBNET -o eth1 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
              #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $SUBNET -o eth1 -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
              #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $SUBNET -o vti0 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
              runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $SUBNET -o vti0 -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
            else
              #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $SUBNET -o vtun$INDEX -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
              runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $SUBNET -o vtun$INDEX -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
            fi
            ((RN=RN+10))
#            runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $SUBNET -o eth0 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
#            runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d $SUBNET -o eth0 -m comment --comment SRC-NAT-${RN} -j SNAT --to-source $ETH0_IP"
            #runIPTABLESnat "-A POSTROUTING -s $SUBNET -d 10.0.0.0/8 -o eth0 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
            runIPTABLESnat "-A POSTROUTING -s $SUBNET -d 10.0.0.0/8 -o eth0 -m comment --comment SRC-NAT-${RN} -j SNAT --to-source $ETH0_IP"
         fi
      done
      else
          [ ! -z "${CUSTOMER_SUBNETS[$INDEX]}" ] && VIP1=$(echo ${SASG_VIP1[$INDEX]}| cut -f1 -d "/" | sed 's/^10\./1\./')
          runIPTABLESnat "-A POSTROUTING -s $VIP1 -d 10.0.0.0/8 -o eth0 -m comment --comment SRC-NAT-${RN} -j SNAT --to-source $ETH0_IP"
          for DNS in ${DNS_IP[INDEX]}
          do
          if [[ "${DNS}" =~ ^10\. ]];then
             ((RN=RN+10))
             ONE_DNS_IP=1.$(echo ${DNS} | cut -d"." -f2-4)
             runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d ${ONE_DNS_IP}/32 -o vtun${INDEX} -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
          else
             ((RN=RN+10))
             runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d ${DNS}/32 -o vtun${INDEX} -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
          fi
          done
          for BFIP in ${CUSTPREM_BIGFIX_IP[INDEX]}
          do
          if [[ "${BFIP}" =~ ^10\. ]];then
             ((RN=RN+10))
             ONE_CUSTPREM_BIGFIX_IP=1.$(echo ${BFIP} | cut -d"." -f2-4)
             runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d ${ONE_CUSTPREM_BIGFIX_IP}/32 -o vtun${INDEX} -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
          else
             ((RN=RN+10))
             runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -d ${BFIP}/32 -o vtun${INDEX} -m comment --comment SRC-NAT-${RN} -j NETMAP --to 2.0.0.0/8"
          fi
          done
      fi
   done
fi
((RN=RN+10))
  #runIPTABLESnat "-A POSTROUTING -s $TOOLS_SUBNET -o eth1 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
  #runIPTABLESnat "-A POSTROUTING -s $TOOLS_SUBNET -o eth1 -m comment --comment SRC-NAT-${RN} -j MASQUERADE"
  #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -o eth1 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
  runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -o eth1 -m comment --comment SRC-NAT-${RN} -j MASQUERADE"
SRC_RN=${RN}

#IAMaaS section
if [ "$IAMaaS" == "YES" ]; then
   if [ "$CUSTOMER_NETWORK_INFO" = true ] ; then
      IAMAAS_UNIQUE_NUMBER=$(echo $IAMAAS_MAPPING | cut -d";" -f1)
      ((RN=DST_RN+900))
      for INDEX in $IAMaaS_SASG
      do  
        runIPTABLESnat "-A PREROUTING -j SASFW_PRE_DNAT_HOOK"
        SASG_SUBNETS=(${CUSTOMER_SUBNETS[INDEX]})
        for SUBNET in "${SASG_SUBNETS[@]}"
        do
          CUSTOMER_OCTET=$(echo $SUBNET | cut -d"." -f1)
          if [[ "$SUBNET" =~ ^10\. ]];then 
             SUBNET=1.$(echo $SUBNET | cut -d"." -f2-4)
          fi
          
          IAMAAS_UNIQUE_SUBNET=${MAP[$CUSTOMER_OCTET]}.$(echo $SUBNET | cut -d"." -f2-4)
          for IAMAAS_SUBNET in "${IAMAAS_SUBNETS[@]}"
          do
            ((RN=RN+10))
            #runIPTABLESnat "-A PREROUTING -s $IAMAAS_SUBNET -d $IAMAAS_UNIQUE_SUBNET -i $vti_iam -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[DST-NAT-SRC-${RN}]"" 
            runIPTABLESnat "-A PREROUTING -s $IAMAAS_SUBNET -d $IAMAAS_UNIQUE_SUBNET -i $vti_iam -m comment --comment DST-NAT-${RN} -j NETMAP --to $SUBNET" 
          done
          #TWO_LB_JUNCTION=2.$(echo $LB_JUNCTION | cut -d"." -f2-4)
          #((RN=RN+10)) 
          #runIPTABLESnat "-A PREROUTING -s $SUBNET -d $TWO_LB_JUNCTION/32 -i vti0 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j NETMAP --to $LB_JUNCTION/32" 
          #((RN=RN+10))
          #runIPTABLESnat "-A PREROUTING -s $SUBNET -d $TWO_LB_JUNCTION/32 -i vti0 -p tcp -m tcp --dport 9443 -m comment --comment DST-NAT-${RN} -j NETMAP --to $LB_JUNCTION/32"
        done
      done

     ((RN=SRC_RN+900))
     runIPTABLESnat "-A POSTROUTING -j SASFW_PRE_SNAT_HOOK"
     if [ ! -z ${JUNIPER_VPN_IP} ];then
        for SUBNET in ${IAMAAS_PORTABLE_SUBNET}
        do
          runIPTABLESnat "-A POSTROUTING -d ${SUBNET} -o $vti_iam -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${PRIVATE_VYOS_IP}"
          ((RN=RN+10))
        done
     fi
     for INDEX in $IAMaaS_SASG
     do  
       SASG_SUBNETS=(${CUSTOMER_SUBNETS[INDEX]})
       for SUBNET in "${SASG_SUBNETS[@]}"
       do
         CUSTOMER_OCTET=$(echo $SUBNET | cut -d"." -f1)
         if [[ "$SUBNET" =~ ^10\. ]];then 
            SUBNET=1.$(echo $SUBNET | cut -d"." -f2-4)
         fi
         IAMAAS_UNIQUE_SUBNET=${MAP[$CUSTOMER_OCTET]}.$(echo $SUBNET | cut -d"." -f2-4)
         #for IAMAAS_SUBNET in "${IAMAAS_SUBNET[@]}"
         #do
          # ((RN=RN+10))
           #TWO_IAMAAS_SUBNET=2.$(echo $IAMAAS_SUBNET | cut -d"." -f2-4)
           #runIPTABLESnat "-A POSTROUTING -s $IAMAAS_SUBNET -d $SUBNET -o vti0 -m comment --comment SRC-NAT-${RN} -j NETMAP --to $TWO_IAMAAS_SUBNET" 
         #done
         ((RN=RN+10)) 
         #runIPTABLESnat "-A POSTROUTING -s $SUBNET -d $LB_JUNCTION/32 -o $vti_iam -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SRC-NAT-SRC-${RN}]"" 
         runIPTABLESnat "-A POSTROUTING -s $SUBNET -d $LB_JUNCTION/32 -o $vti_iam -m comment --comment SRC-NAT-${RN} -j NETMAP --to $IAMAAS_UNIQUE_SUBNET" 
      done
   done
fi
fi
#end IAMaaS section
else
    #NAT for DVPN
    runIPTABLESnat "-A PREROUTING -j SASFW_PRE_DNAT_HOOK"
    RN=10
    #runIPTABLESnat "-A PREROUTING -d ${PUBLIC_VYOS_IP}/32 -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j LOG --log-prefix "[SG_NAT-DST-${RN}]""
    runIPTABLESnat "-A PREROUTING -d ${PUBLIC_VYOS_IP}/32 -i eth1 -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $BPM_IP"
   ((RN=RN+10))
   runIPTABLESnat "-A PREROUTING -i vti+ -p tcp -m multiport --dports 3333 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $EE_IP"
   ((RN=RN+10))
   runIPTABLESnat "-A PREROUTING -i vti+ -p tcp -m multiport --dports 9093 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $EE_IP"
   ((RN=RN+10))
   runIPTABLESnat "-A PREROUTING -i vti+ -p tcp -m multiport --dports 8443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $CHEF_IP"
   
   RN=10
   runIPTABLESnat "-A POSTROUTING -j SASFW_PRE_SNAT_HOOK"
   for ((INDEX=0; INDEX<${#CUST_PEER_IP[@]}; INDEX++))
   do
   ((RN=RN+10))
   [ -z ${LOCAL_DVPN_IP[INDEX]} ] && LOCAL_DVPN_IP[${INDEX}]=158.87.31.$((INDEX+152))
   runIPTABLESnat "-A POSTROUTING -o vti$((INDEX+1)) -m mark --mark 0x$((INDEX+1)) -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${LOCAL_DVPN_IP[INDEX]}"
   done
   ((RN=RN+10))
   runIPTABLESnat "-A POSTROUTING -o eth0 -m mark ! --mark 0x0 -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${PRIVATE_VYOS_IP}"
   ((RN=RN+10))
   #runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -o eth1 -m comment --comment SRC-NAT-${RN} -j LOG --log-prefix "[SG_NAT-SRC-${RN}]""
   runIPTABLESnat "-A POSTROUTING -s 10.0.0.0/8 -o eth1 -m comment --comment SRC-NAT-${RN} -j MASQUERADE"
    
    #mangle table for Model 5
    RN=10
    runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set EE_IP src,src -m set --match-set CDS_SASFW dst -m set --match-set ENDPOINTS_CDS_EE src -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff"
    ((RN=RN+10))
    runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set EE_IP src,src -m set --match-set CDS_SASFW dst -m set --match-set ENDPOINTS_CDS_EE_KAFKA src -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff"
    ((RN=RN+10))
    runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set CHEF_IP src,src -m set --match-set CDS_SASFW dst -m set --match-set ENDPOINTS_CDS_CHEF src -j CONNMARK --restore-mark --nfmask 0xffffffff --ctmask 0xffffffff"
    for ((INDEX=0; INDEX<${#CUST_PEER_IP[@]}; INDEX++))
    do
      ((RN=RN+10))
      runIPTABLEMangle "-A PREROUTING -i eth0 -m comment --comment MRK-MGL-${RN} -m mark --mark 0x$((INDEX+1)) -j ACCEPT"
    done
    
    for ((INDEX=0; INDEX<${#CUST_PEER_IP[@]}; INDEX++))
    do
    ((RN=RN+10))
    #runIPTABLEMangle "-A PREROUTING -i eth0 -p udp -m comment --comment MRK-MGL-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_DNS dst -m set --match-set EE_TO_CUST_DNS dst -j LOG --log-prefix "[SG_MGL-MRK-${RN}]""
    [[ -n "${EE_IP}" ]] && [[ -n "${DNS_IP[INDEX]}" ]] && runIPTABLEMangle "-A PREROUTING -i eth0 -p udp -m comment --comment MRK-MGL-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_DNS_VPN$((INDEX+1)) dst -m set --match-set EE_TO_CUST_DNS dst -j MARK --set-mark 0x$((INDEX+1))/0xffffffff"
    ((RN=RN+10))
    #runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_LDAP dst -m set --match-set EE_TO_CUST_LDAP dst -j LOG --log-prefix "[SG_MGL-MRK-${RN}]""
    #runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set EE_IP src,src -m set --match-set CUST_LDAP dst -m set --match-set EE_TO_CUST_LDAP dst -j MARK --set-mark 0x1/0xffffffff"
    [[ -n "${CHEF_IP}" ]] && [[ -n "${LDAP_IP[INDEX]}" ]] && runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set CHEF_IP src,src -m set --match-set CUST_LDAP_VPN$((INDEX+1)) dst -m set --match-set CHEF_TO_CUST_LDAP dst -j MARK --set-mark 0x$((INDEX+1))/0xffffffff"
    ((RN=RN+10))
    [[ -n "${RCP_ROR_IP}" ]] && [[ -n "${CUSTPREM_BIGFIX_IP[INDEX]}" ]] && runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set RCP_ROR_IP src,src -m set --match-set CUSTPREM_BIGFIX_VPN$((INDEX+1)) dst -m set --match-set CUSTPREM_BIGFIX_PORTS dst -j MARK --set-xmark 0x$((INDEX+1))/0xffffffff"
    ((RN=RN+10))
    #runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set EE_IP src,src -m set --match-set CDS_SASFW dst -m set --match-set ENDPOINTS_CDS_EE src -j LOG --log-prefix "[SG_MGL-MRK-${RN}]""
    [[ -n "${EE_IP}" ]] && runIPTABLEMangle "-A POSTROUTING -o eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set CUST_ENDPOINTS_VPN$((INDEX+1)) src -m set --match-set CDS_EE dst -m set --match-set ENDPOINTS_CDS_EE dst -j MARK --set-xmark 0x$((INDEX+1))/0xffffffff"
    ((RN=RN+10))
    #runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set EE_IP src,src -m set --match-set CDS_SASFW dst -m set --match-set ENDPOINTS_CDS_EE_KAFKA src -j LOG --log-prefix "[SG_MGL-MRK-${RN}]""
    [[ -n "${EE_IP}" ]] && runIPTABLEMangle "-A POSTROUTING -o eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set CUST_ENDPOINTS_VPN$((INDEX+1)) src -m set --match-set CDS_EE dst -m set --match-set ENDPOINTS_CDS_EE_KAFKA dst -j MARK --set-xmark 0x$((INDEX+1))/0xffffffff"
    ((RN=RN+10))
    #runIPTABLEMangle "-A PREROUTING -i eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set CHEF_IP src,src -m set --match-set CDS_SASFW dst -m set --match-set ENDPOINTS_CDS_CHEF src -j LOG --log-prefix "[SG_MGL-MRK-${RN}]""
    [[ -n "${CHEF_IP}" ]] && runIPTABLEMangle "-A POSTROUTING -o eth0 -p tcp -m comment --comment MRK-MGL-${RN} -m set --match-set CUST_ENDPOINTS_VPN$((INDEX+1)) src -m set --match-set CDS_CHEF dst -m set --match-set ENDPOINTS_CDS_CHEF dst -j MARK --set-xmark 0x$((INDEX+1))/0xffffffff"
    done
    for ((INDEX=0; INDEX<${#CUST_PEER_IP[@]}; INDEX++))
    do
      ((RN=RN+10))
      runIPTABLEMangle "-A POSTROUTING -o eth0 -m comment --comment MRK-MGL-${RN} -m mark --mark 0x$((INDEX+1)) -j CONNMARK --save-mark --nfmask 0xffffffff --ctmask 0xffffffff"
    done


fi
###########################################################################
# end of iptables changes as well - if we get here - means all ipset & iptables
# commands completed successfully - now save the changes & restart ipset & iptables
###########################################################################
LOG "\nDone updating iptables." "divider"

saveIPSET "Saving all ipset updates ..."
restartIPSET "Restarting ipset to implement changes ..."


saveIPTABLES "Saving all iptables updates ..."
restartIPTABLES "Restarting iptables to implement changes ..."


LOG "\nRestarts complete, updated ipset file contents:"
LOG "\n" "divider"
ls -l $IPSETFILE
sudo cat $IPSETFILE
LOG "\n\n"
LOG "\nUpdated iptables file contents:"
LOG "\n" "divider"
ls -l $IPTABFILE
sudo cat $IPTABFILE
LOG "\n" "divider"

enableIPSET
enableIPTABLES

LOG "\n$0 complete.\n" "divider"
