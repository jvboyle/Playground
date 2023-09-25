#!/bin/bash
################################################################################
# Description: Install SASG
# Author: Jinho Hwang
# Date: 2016.08.16
# Config: vars file 
# Main: ./sasg_install.sh
# Standalone Usage: Run each script alone
# History:
#    2016.08.16 - Original script.
#    2016.04.27 - S.Braun - added line to write MACHINE_IP to vars file - used by sasg_customer_build
#               - script so it knows which iptables, keepalive, etc files to copy over.
#               - Also added check for nc - if avail on system, use nc vs telnet - quicker timeout
#               - if target server/port unreachable.
#    2016.06.06 - S.Braun - write MACHINE_MASQ_IP to vars file - used for ipsec iptables if 
#               - sasg has multi-nics & one has MASQ_IP.
#    2016.06.16 - changed sasg log to have date/timestamp
#    2016.08.02 - Calling setup scripts for iptables, client.conf, ipset, keepalived - previously done on vyos
#    2016.08.02 - moved checkpkgs.sh rpm install to first thing in sasg_main.sh script.
#               - changed internet check - instead of pinging 8.8.8.8, just nc to proper vyos pub ip & port 443
#               - like the sasg-check-keepalived.sh will do & show the results.
#    2017.09.25 - output from checkpkgs.sh wasn't going to sasg install log - added tee 
# Notes:
#    .
################################################################################


echo ' ____    _    ____   ____   ___ _   _ ____ _____  _    _     _                 '
echo '/ ___|  / \  / ___| / ___| |_ _| \ | / ___|_   _|/ \  | |   | |                '
echo '\___ \ / _ \ \___ \| |  _   | ||  \| \___ \ | | / _ \ | |   | |                '
echo ' ___) / ___ \ ___) | |_| |  | || |\  |___) || |/ ___ \| |___| |___   _   _   _ '
echo '|____/_/   \_\____/ \____| |___|_| \_|____/ |_/_/   \_\_____|_____| (_) (_) (_)'
echo
echo '                                                         © IBM Corporation 2016'
echo

source ./vars
source ./sasg_common.sh
SASG_LOG=/tmp/sasg_fwupdate.${DATE}.log
IPTABBACKUP="/etc/sysconfig/iptables.$DATE"
IPSETBACKUP="/etc/sysconfig/ipset.$DATE"

BUILD_DIR=$(pwd)

# back-up iptables & ipset
BackupFW(){
  echo "backing up existing iptables/ipset config files."
  RET=$(mv $IPTABFILE $IPTABBACKUP 2>&1)
  if [ "$?" -ne 0 ];then
    echo -e "mv $IPTABFILE $IPTABBACKUP failed - $RET\n"
    return 1
  fi
  RET=$(mv $IPSETFILE $IPSETBACKUP 2>&1)
  if [ "$?" -ne 0 ];then
    echo -e "mv $IPSETFILE $IPSETBACKUP failed - $RET\n"
    return 1
  fi
  echo "original ipset and iptables files backed up to file.$DATE"
  return 0
} #BackupFW

# restore iptables & ipset
RestoreFW(){
  echo "restoring iptables/ipset config files from backup."
  FAILED=""
  RET=$(cp $IPTABBACKUP $IPTABFILE 2>&1)
  if [ "$?" -ne 0 ];then
    echo -e "cp $IPTABBACKUP $IPTABFILE failed - $RET\n"
    FAILED="$IPTABFILE"
  fi
  RET=$(cp $IPSETBACKUP $IPSETFILE 2>&1)
  if [ "$?" -ne 0 ];then
    echo -e "cp $IPSETBACKUP $IPSETFILE failed - $RET\n"
    FAILED="$FAILED, $IPSETFILE"
  fi
  if [ ! -z "$FAILED" ];then
     echo -e "\nError trying to restore previous FW config files - $FAILED. Manual intervention required!  Exiting...\n"
     exit -1
  else
     echo -e "\nSuccessfully restored previous FW config files. Exiting...\n"
     return 0
  fi
} #BackupFW

# Restart ipset and iptables
RestartFW(){
   echo -e "\nRestarting ipset ..."
   
   RESTARTFAILED=""
   RET=$($RESTART_IPSET 2>&1)
   if [ "$?" -ne 0 ];then
     echo -e "ipset restart failed - $RET"
     echo -e "showing ipset status & journalctl -xe output:\n"
     $STATUS_IPSET
     journalctl -xe | tail -20
     return 1
   else
     sleep 1
     echo -e "\nRestarting iptables ..."
     RET=$($RESTART_IPTABLES 2>&1)
     if [ "$?" -ne 0 ];then
       echo -e "iptables restart failed - $RET"
       echo -e "showing iptables status & journalctl -xe output:\n"
       $STATUS_IPTABLES
       journalctl -xe | tail -20
       return 1
     fi
   fi
   return 0
} # RestartFW


main(){
if [ ! -f "vars" ]; then
    echo 'ERROR: Please provide a user configuration file "vars"'
    exit -1
fi

#set -o pipefail

echo "SASG VERSION $VERSION"


################################################################################
# # find IP and interface of this machine
# 2: eth0    inet 10.0.2.15/24 brd 10.0.2.255 scope global eth0\       valid_lft forever preferred_lft forever
################################################################################
echo "gathering server network interface info ..."
/usr/sbin/ip -f inet -o address | while read -r line; do
    if=$(echo $line | cut -d\  -f 2)
    ip=$(echo $line | cut -d\  -f 4 | cut -d/ -f 1)
    subnet=$(echo $line | cut -d\  -f 4 | cut -d/ -f 2)

# changes added for multi-sasg - loop thru sasg_ip arrays
    for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
    do
      if [ "${SASG_IP_1[$INDEX]}" == "$ip" ];then
        echo "match on sasg_ip_1 - ${SASG_IP_1[$INDEX]}"
        echo 'MACHINE_TYPE="PRIMARY"' >> vars
        echo "MACHINE_INTF=$if" >> vars
        echo "MACHINE_IP=$ip" >> vars
        echo "MACHINE_SUBNET_MASK=$subnet" >> vars
        echo "ARRAYNUM=$INDEX" >> vars
        echo "SASG_NWIF=$if" >> vars
        break 2
      fi
    done
    for ((INDEX=0; INDEX<${#SASG_IP_2[@]}; INDEX++))
    do
      if [ "${SASG_IP_2[$INDEX]}" == "$ip" ];then
        echo "match on sasg_ip_2 - ${SASG_IP_2[$INDEX]}"
        echo 'MACHINE_TYPE="SECONDARY"' >> vars
        echo "MACHINE_INTF=$if" >> vars
        echo "MACHINE_IP=$ip" >> vars
        echo "MACHINE_SUBNET_MASK=$subnet" >> vars
        echo "ARRAYNUM=$INDEX" >> vars
        echo "SASG_NWIF=$if" >> vars
        break 2
      fi
    done
done

# now loop again but check for any interfaces with the public MASQ_IP - grab the NIC
# needed for ipsec iptables config in multi-nic sasg setup
/usr/sbin/ip -f inet -o address | while read -r line; do
    if=$(echo $line | cut -d\  -f 2)
    ip=$(echo $line | cut -d\  -f 4 | cut -d/ -f 1)
    subnet=$(echo $line | cut -d\  -f 4 | cut -d/ -f 2)
    for ((INDEX=0; INDEX<${#SASG_MASQ_IP[@]}; INDEX++))
    do
      if [ "${SASG_MASQ_IP[$INDEX]}" == "$ip" ];then
        echo "match on SASG_MASQ_IP[$INDEX] - ${SASG_MASQ_IP[$INDEX]}, interface $if"
        echo "MACHINE_MASQ_INTF=$if" >> vars
        echo "MACHINE_MASQ_IP=$ip" >> vars
        break 2
      fi
    done
done

# echo out updated SASG_NWIF and SASG_VPNIF variables to use before calling iptables.sh & creating the template files for all
# sasgs - this way we get the right ethernet & tunnel NIC names before even creating the templates & can just copy the files 
# into place & restart iptables/ipset.
if [ "$TUNNEL_TYPE" == "ipsec" ];then
  echo -e "\nSASG_VPNIF=vti0" >> vars
else
  echo -e "\nSASG_VPNIF=vtun0" >> vars
fi

# re-source in vars
source ./vars
cd $BUILD_DIR

# only have to call one sasg_iptables.sh file now - not separate ones for each sasg server.
echo -e "\nBuilding machine specific iptables an ipset configuration files ....\n"
./sasg_iptables.sh 2>&1 
RET=$?
if [ ! $RET  -eq 0 ]; then
    echo "sasg_iptables.sh failed: $RET"
    echo "Please find the log file in $SASG_LOG"
    echo "ERROR"
    exit $RET
fi

# back-up existing ipset/iptables files
BackupFW
if [ "$?" -ne 0 ];then
  echo -e "\nNo changes made - error trying to back up FW config files. Exiting...\n"
  exit -1
fi

# copy new files into place then restart ipset & iptables - if err on ipset or iptables restart then 
# mv new ones to .failed then copy original ones back into place & restart ipset/iptables.
RET=$(cp $BUILD_DIR/ipset.${MACHINE_IP} $IPSETFILE 2>&1)
if [ "$?" -ne 0 ];then
  echo -e "cp $BUILD_DIR/ipset.${MACHINE_IP} $IPSETFILE failed - $RET\nPutting original ipset & iptables back & restarting services.\n"
  # put orig ipset & iptables files back
  RestoreFW
  echo -e "ERROR: Failed to copy new ipset/iptables files into place..exiting."
  # no need to restart ipset/iptables since we hadn't done a restart yet.
else
  RET=$(cp $BUILD_DIR/iptables.${MACHINE_IP} $IPTABFILE 2>&1)
  if [ "$?" -ne 0 ];then
    echo -e "cp $BUILD_DIR/iptables.${MACHINE_IP} $IPTABFILE failed - $RET\nPutting original ipset & iptables back & restarting services.\n"
    RestoreFW
    echo -e "ERROR: Failed to copy new ipset/iptables files into place..exiting."
    # no need to restart ipset/iptables since we hadn't restarted yet - were just trying to copy new files into place.
  else
    # New config files copied successfully - now restart ipset then iptables.
    echo -e "\nnew ipset & iptables configs in place...restarting ipset and iptables ...."
    RestartFW
    if [ "$?" -ne 0 ];then
       echo -e "Failed to restart firewall - $RET\n going back to original configuration ..."
       RestoreFW
       # if we get here, means original files copied back ok, now restart ipset/iptables.
       RestartFW
       if [ "$?" -ne 0 ];then
         echo -e "ERROR: Failed to restart firewall after original configuration files restored - $RET\nManual intervention required!"
         exit 1
       else
         echo -e "WARN: firewall restarted with original configuration files"
       fi
    else
       echo -e "\nSUCCESS - restarted firewall with new configuration."
    fi
  fi
       
fi

############################################################################### 
} # main() function

main | tee -a $SASG_LOG
