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
#    2018.01.24 - 3.1.07 - SBraun -update to check for existing iptables filter lines not part of default sample
#                 iptables file or normal sasg updates.  If found, copy filter lines to separate file so they can 
#                 be merged into new iptables filter rules.
#    2018.02.22 - SDubrouskaya - Added IAMaaS support 
# Notes:
#    .
################################################################################

function check_connectivity
{
###############################################################################
#                   Check DNS and LDAP connectivity                           #
###############################################################################
RETURNMSG=""
ERRS=0
  if [ ! -z "${DNS_IP[0]}" ];then
   for item in "${DNS_IP[@]}"
   do
     echo "Checking connection to DNS server $item:53 ..." | tee -a $SASG_LOG
     cat < /dev/null > /dev/tcp/$item/53
     if [ $? -ne 0 ];then
        RETURNMSG="$RETURNMSG \n connection to DNS server $item:53 failed."
        ERRS=1
     else
        RETURNMSG="$RETURNMSG \n connection to DNS server $item:53 successful."
        echo $RETURNMSG >> $SASG_LOG
     fi
   done
  else
     echo "No DNS server listed to check connectivity to.  Continuing ..." | tee -a $SASG_LOG
  fi

  if [ ! -z "${LDAP_IP[0]}" ];then
   for item in "${LDAP_IP[@]}"
   do
     for port in "${LDAP_PORT[@]}"; do
         echo "Checking connection to LDAP server $item:${port} ..." | tee -a $SASG_LOG
         cat < /dev/null > /dev/tcp/$item/${port}
         if [ $? -ne 0 ];then
            RETURNMSG="$RETURNMSG \n connection to LDAP server $item on port ${port} failed"
            echo $RETURNMSG >> $SASG_LOG
            ERRS=1
         else
            RETURNMSG="$RETURNMSG \n connection to LDAP server $item on port ${port} successful"
            echo $RETURNMSG >> $SASG_LOG
         fi
      done
   done
  else
     echo "No LDAP server listed to check connectivity to.  Continuing ..." | tee -a $SASG_LOG
  fi

 echo $RETURNMSG
 if [ $ERRS -ne 0 ];then
   return 1
 else
   return 0
 fi
}

echo ' ____    _    ____   ____   ___ _   _ ____ _____  _    _     _                 '
echo '/ ___|  / \  / ___| / ___| |_ _| \ | / ___|_   _|/ \  | |   | |                '
echo '\___ \ / _ \ \___ \| |  _   | ||  \| \___ \ | | / _ \ | |   | |                '
echo ' ___) / ___ \ ___) | |_| |  | || |\  |___) || |/ ___ \| |___| |___   _   _   _ '
echo '|____/_/   \_\____/ \____| |___|_| \_|____/ |_/_/   \_\_____|_____| (_) (_) (_)'
echo
echo '                                                         © IBM Corporation 2016'
echo

echo 'Terms & Conditions ... -> yes'

#echo 'Checking stuffs (os and some other stuffs) here....'
echo -e "Checking pre-req software, os version, network interfaces, etc....\n"

DATE=`date +"%F_%T"`
SASG_LOG=/tmp/sasg_install.log.$DATE

if [ ! -f "vars" ]; then
    echo 'ERROR: Please provide a user configuration file "vars"' | tee -a $SASG_LOG
    exit -1
fi

set -o pipefail

source ./vars
echo "SASG VERSION $VERSION" | tee -a $SASG_LOG

#IAMaaS section
if [[ -z "$IAMAAS_PRIMARY_SUBNET" && -z "$IAMAAS_PORTABLE_SUBNET" ]]; then
   echo "IAMaaS=NO" >> sasg_common.sh
elif [[ -z "$IAMAAS_MAPPING" || -z "$LB_JUNCTION" ]]; then
    echo -e "\nERROR: Not all IAMaaS variables are specified. Please check."
    exit 1
else
    echo "IAMaaS=YES" >> sasg_common.sh
fi
#end IAMaaS section

################################################################################
#Install required packages
################################################################################

# only install when not running in container.
if [ "$SASG_RUNNING_PLATFORM" != "CONTAINER" ]; then

./checkpkgs.sh 2>&1 |tee -a $SASG_LOG
if [ $? -ne 0 ];then
  echo -e "\nNot all software pre-requisites are met, exiting..\n" | tee -a $SASG_LOG
  exit 1
fi

fi

################################################################################
# # find IP and interface of this machine
# 2: eth0    inet 10.0.2.15/24 brd 10.0.2.255 scope global eth0\       valid_lft forever preferred_lft forever
################################################################################
echo "gathering server network interface info ..." | tee -a $SASG_LOG
ip -f inet -o address | while read -r line; do
    if=$(echo $line | cut -d\  -f 2)
    ip=$(echo $line | cut -d\  -f 4 | cut -d/ -f 1)
    subnet=$(echo $line | cut -d\  -f 4 | cut -d/ -f 2)

# changes added for multi-sasg - loop thru sasg_ip arrays
    for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
    do
      if [ "${SASG_IP_1[$INDEX]}" == "$ip" ];then
        echo "match on sasg_ip_1 - ${SASG_IP_1[$INDEX]}" | tee -a $SASG_LOG
        echo 'MACHINE_TYPE="PRIMARY"' >> vars
        echo "MACHINE_INTF=$if" >> vars
        echo "MACHINE_IP=$ip" >> vars
        echo "MACHINE_SUBNET_MASK=$subnet" >> vars
        echo "ARRAYNUM=$INDEX" >> vars
        break 2
      fi
    done
    for ((INDEX=0; INDEX<${#SASG_IP_2[@]}; INDEX++))
    do
      if [ "${SASG_IP_2[$INDEX]}" == "$ip" ];then
        echo "match on sasg_ip_2 - ${SASG_IP_2[$INDEX]}" | tee -a $SASG_LOG
        echo 'MACHINE_TYPE="SECONDARY"' >> vars
        echo "MACHINE_INTF=$if" >> vars
        echo "MACHINE_IP=$ip" >> vars
        echo "MACHINE_SUBNET_MASK=$subnet" >> vars
        echo "ARRAYNUM=$INDEX" >> vars
        break 2
      fi
    done
done

################################################################################
#Check basic internet connectivity
################################################################################
if [ "$ARRAYNUM" -eq 0 ];then
  IPTOCHECK=$PUBLIC_VYOS_IP
else
  IPTOCHECK=$(echo "${PORTABLE_VTUN_CIDR[$ARRAYNUM]}" | cut -f1 -d'/')
  if [ -z "$IPTOCHECK" ];then
   IPTOCHECK=$PUBLIC_VYOS_IP
  fi
fi

# basic connection check - same check sasg-check-keepalived.sh will perform - test to vyos pub IP, port 443
echo "Checking basic tcp connectivity to IBM server public IP $IPTOCHECK port 443..." | tee -a $SASG_LOG
nc -v -w2 -i2 $IPTOCHECK 443 2>&1  | tee -a $SASG_LOG

# now loop again but check for any interfaces with the public MASQ_IP - grab the NIC
# needed for ipsec iptables config in multi-nic sasg setup
ip -f inet -o address | while read -r line; do
    if=$(echo $line | cut -d\  -f 2)
    ip=$(echo $line | cut -d\  -f 4 | cut -d/ -f 1)
    subnet=$(echo $line | cut -d\  -f 4 | cut -d/ -f 2)
    for ((INDEX=0; INDEX<${#SASG_MASQ_IP[@]}; INDEX++))
    do
      if [ "${SASG_MASQ_IP[$INDEX]}" == "$ip" ];then
        echo "match on SASG_MASQ_IP[$INDEX] - ${SASG_MASQ_IP[$INDEX]}, interface $if" | tee -a $SASG_LOG
        echo "MACHINE_MASQ_INTF=$if" >> vars
        echo "MACHINE_MASQ_IP=$ip" >> vars
        break 2
      fi
    done
done

# Now build the iptables, ipset, keepalived.conf, client.conf files
if [ "$TUNNEL_TYPE" == "ipsec" ]; then
   ./ipsec_client.sh 2>&1 | tee -a $SASG_LOG
   RET=$?
   if [ ! $RET  -eq 0 ]; then
      echo "ipsec_client.sh failed: $RET" | tee -a $SASG_LOG
      echo "Please find the log file in $SASG_LOG"
      echo "ERROR" | tee -a $SASG_LOG
      exit $RET
   fi
else
  ./openvpn_client.sh 2>&1 | tee -a $SASG_LOG
   RET=$?
   if [ ! $RET  -eq 0 ]; then
      echo "openvpn_client.sh failed: $RET" | tee -a $SASG_LOG
      echo "Please find the log file in $SASG_LOG"
      echo "ERROR" | tee -a $SASG_LOG
      exit $RET
   fi
fi

# v3.1.07 change - check for existing iptables filter rules not part of sample iptables or normal sasg updates

ORIGINALFILTERLINESFOUND="false"
if [ -f "$ORIGINALFILTERLINES" ];then
  # if file already exists that contains original non-standard (ie, ipcenter iptables filter lines), move the
  # file to a backup - don't just copy it.  Will overwrite with any new filter lines found in the existing iptables
  # which may have had some modifications to those lines.
  mv $ORIGINALFILTERLINES ${ORIGINALFILTERLINES}.prev
fi

if [ -f "$IPTABFILE" ];then
  echo -e "iptables file $IPTABFILE found..."

  grep -q "SASG_PRE_" $IPTABFILE
  if [ "$?" -eq 0 ];then
     # contains sasg rules, check for original filter lines
     grep -q "ORIGINAL FILTER LINES" $IPTABFILE
     if [ "$?" -eq 0 ];then
        echo -e "Found customized iptables filter statements not part of standard SLA install which will be merged"
        echo -e "into the new iptables configuration. Lines to be merged will be stored in $ORIGINALFILTERLINES."
       # have some original filter lines in iptables - need to save these off.
       SAVELINE=0
       cat $IPTABFILE|while read LINE
       do
         echo "$LINE"|grep -q "ORIGINAL FILTER LINES"
         if [ "$?" -eq 0 ];then
           if [ "$SAVELINE" -eq 0 ];then
             SAVELINE=1
           else
             SAVELINE=0
             echo -e "$LINE" |tee -a $ORIGINALFILTERLINES
           fi #if [ "$SAVELINE" -eq 0 ];then
         fi
       
         if [ "$SAVELINE" -eq 1 ];then
           echo -e "$LINE" | tee -a $ORIGINALFILTERLINES
         fi
       done
       ORIGINALFILTERLINESFOUND="true"
     fi # if ORIGINAL FILTER LINES is found in iptables

  else
     # contains no sasg rules, check if it has "sample configuration" text
     grep -qi "sample configuration for iptables" ${IPTABFILE}
     if [ "$?" -eq 0 ];then
        echo -e "\nFound sample configuration iptables file, just creating new iptables."
     else
        echo -e "\nNo SLA firewall rules found, no sample configuration text found, assuming custom firewall rules & incorporating"
        echo -e "into new iptables rules."
        echo -e "# START ORIGINAL FILTER LINES" > $ORIGINALFILTERLINES
        # now parse file for all lines starting with -A INPUT, -A OUTPUT, -A FORWARD & save those off.
        cat ${IPTABFILE} | egrep "^-A INPUT |^-A OUTPUT |^-A FORWARD ">> $ORIGINALFILTERLINES
        echo -e "# END ORIGINAL FILTER LINES" >> $ORIGINALFILTERLINES
        ORIGINALFILTERLINESFOUND="true"
     fi
  fi # if [ "$?" -eq 0 ];then

else
  echo -e "No iptables file $IPTABFILE found...creating..."
fi # if [ -f "$IPTABFILE" ];then

# now proceed with normal iptables file creation / update

# only have to call one sasg_iptables.sh file now - not separate ones for each sasg server.
./sasg_iptables.sh 2>&1 | tee -a $SASG_LOG
RET=$?
if [ ! $RET  -eq 0 ]; then
    echo "sasg_iptables.sh failed: $RET" | tee -a $SASG_LOG
    echo "Please find the log file in $SASG_LOG"
    echo "ERROR" | tee -a $SASG_LOG
    exit $RET
fi

# create keepalived.conf templates
./keepalived.sh 2>&1 | tee -a $SASG_LOG
RET=$?
if [ ! $RET  -eq 0 ]; then
    echo "keepalived.sh failed: $RET" | tee -a $SASG_LOG
    echo "Please find the log file in $SASG_LOG"
    echo "ERROR" | tee -a $SASG_LOG
    exit $RET
fi


# Now call the sasg_customer_build.sh to configure services, copy the vpn/iptables/ipset configs to the right places, etc
./sasg_customer_build.sh 2>&1 | tee -a $SASG_LOG
if [ "$?" -ne 0 ];then
  echo -e "\nError during configuration, please send $SASG_LOG to your IBM contact.\n"
  exit 1
else
  echo -e "\nconfiguration complete, checking dns/ldap connectivity...\n"
fi

RET=$(check_connectivity)
if [ "$?" -ne 0 ];then
    echo -e "\nDNS/LDAP connectivity errors:\n$RET \nErrors also logged in $SASG_LOG" | tee -a $SASG_LOG
    exit 1
else
    echo -e "No DNS/LDAP connectivity errors:\n$RET" | tee -a $SASG_LOG
fi

############################################################################### 
echo -e "SASG is configured successfully!" | tee -a $SASG_LOG
echo "SUCCESS" | tee -a $SASG_LOG
