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
#    2018.12.18 - Added 4.0.6 Nat code 
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

echo 'Terms & Conditions ... -> yes'

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

# --- Setting default variables ------------------
[[ "${DOCKER_HOST_NAT^^}" != "NO" ]] && DOCKER_HOST_NAT="YES"
[[ "${TUNNEL_TYPE,,}" != "ipsec" ]] && TUNNEL_TYPE="openvpn"

if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
   for ((INDEX=1; INDEX<${#SASG_IP_1[@]}; INDEX++))
   do
     if [ -z ${LOCAL_DVPN_IP[$INDEX]} ]; then
        PORTABLE_VTUN_CIDR[$INDEX]=158.87.31.$((INDEX+152))
     else
        PORTABLE_VTUN_CIDR[$INDEX]=${LOCAL_DVPN_IP[$INDEX]}
     fi
   done
   if [ -z ${LOCAL_DVPN_IP[0]} ]; then
      PUBLIC_VYOS_IP=158.87.31.152
   else
      PUBLIC_VYOS_IP=${LOCAL_DVPN_IP[0]}
   fi
fi
# ------------------------------------------------

################################################################################
# # find IP and interface of this machine
# 2: eth0    inet 10.0.2.15/24 brd 10.0.2.255 scope global eth0\       valid_lft forever preferred_lft forever
################################################################################
echo "gathering server network interface info ..." | tee -a $SASG_LOG
ip -f inet -o address | while read -r line; do
    if=$(echo $line | cut -d\  -f 2)
    ip=$(echo $line | cut -d\  -f 4 | cut -d/ -f 1)
    subnet=$(echo $line | cut -d\  -f 4 | cut -d/ -f 2)
    
    ARRAYNUM=""
    for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++)); do
      if [[ "$ip" == "${SASG_VIP1[$INDEX]}" || "$ip" == "${SASG_VIP2[$INDEX]}" ]]; then
         ARRAYNUM="${INDEX}"
         if [ "${HOST_IP}" == "${SASG_IP_1[$ARRAYNUM]}" ]; then
            MACHINE_TYPE="PRIMARY"
         elif [ "${HOST_IP}" == "${SASG_IP_2[$ARRAYNUM]}" ]; then
            MACHINE_TYPE="SECONDARY"
         else
          echo "Could not find ${HOST_IP} among available SASG IPs (${SASG_IPS[@]})"
          exit 1
         fi
         #touch vars
         #sed --in-place "/^MACHINE_TYPE=.*/d" vars
         #sed --in-place "/^DOCKER_HOST=.*/d" vars
         #sed --in-place "/^MACHINE_INTF=.*/d" vars
         #sed --in-place "/^MACHINE_IP=.*/d" vars
         #sed --in-place "/^MACHINE_SUBNET_MASK=.*/d" vars
         #sed --in-place "/^ARRAYNUM=.*/d" vars
         echo "MACHINE_TYPE=\"${MACHINE_TYPE}\"" >> vars
         echo "DOCKER_HOST=${HOST_IP}" >> vars
         echo "MACHINE_INTF=$if" >> vars
         echo "MACHINE_IP=$ip" >> vars
         echo "MACHINE_SUBNET_MASK=$subnet" >> vars
         echo "ARRAYNUM=$ARRAYNUM" >> vars
         break 2
      fi   
    done

done

if [[ MACHINE_TYPE == "" ]]; then
  echo "Could not determine SASG VIP & SASG IP. Aborting"
  exit 1
fi

################################################################################
#Check basic internet connectivity
################################################################################
if [[ $ARRAYNUM -eq 0 ]];then
  IPTOCHECK=$PUBLIC_VYOS_IP
else
  IPTOCHECK=$(echo "${PORTABLE_VTUN_CIDR[$ARRAYNUM]}" | cut -f1 -d'/')
  if [ -z "$IPTOCHECK" ];then
   IPTOCHECK=$PUBLIC_VYOS_IP
  fi
fi

# basic connection check - same check sasg-check-keepalived.sh will perform - test to vyos pub IP, port 443
# echo "Checking basic tcp connectivity to IBM server public IP $IPTOCHECK port 443..." | tee -a $SASG_LOG
# nc -v -w2 -i2 $IPTOCHECK 443 2>&1  | tee -a $SASG_LOG

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

################################################################################
# make sasg dir for logs & executables
mkdir -p /sasg/tmp
mkdir -p /sasg/bin
mkdir -p /sasg/logs
mkdir -p /sasg/logs/Firewall
mkdir -p /var/log/nginx
mkdir -p /var/lock

mkdir -p /var/lib/nginx/logs
mkdir -p /var/spool/cron/crontabs
chmod 755 /sasg/logs
chmod -R 755 /var


case "${TUNNEL_TYPE}" in
  "ipsec")
    ./ipsec_client.sh 2>&1 | tee -a $SASG_LOG
    RET=$?
    if [ ! $RET  -eq 0 ]; then
      echo "ipsec_client.sh failed: $RET" | tee -a $SASG_LOG
      echo "Please find the log file in $SASG_LOG"
      echo "ERROR" | tee -a $SASG_LOG
      exit $RET
    fi
    ;;
  *)
    echo "Tunnel type: \"${TUNNEL_TYPE}\", setting up openvpn tunnel" 
    mkdir -p /var/run/openvpn
    ./openvpn_client.sh 2>&1 | tee -a $SASG_LOG
    RET=$?
    if [ ! $RET  -eq 0 ]; then
      echo "openvpn_client.sh failed: $RET" | tee -a $SASG_LOG
      echo "Please find the log file in $SASG_LOG"
      echo "ERROR" | tee -a $SASG_LOG
      exit $RET
    fi
    ;;
esac
############################################################################
# Openvpn Config
############################################################################

#########################################################################
# only have to call one sasg_iptables.sh file now - not separate ones for each sasg server.
#########################################################################
./sasg_iptables.sh 2>&1 | tee -a $SASG_LOG
RET=$?
if [ ! $RET  -eq 0 ]; then
    echo "sasg_iptables.sh failed: $RET" | tee -a $SASG_LOG
    echo "Please find the log file in $SASG_LOG"
    echo "ERROR" | tee -a $SASG_LOG
    exit $RET
fi

#############################################################################
# Now call the sasg_customer_build.sh to configure services, copy the vpn/iptables/ipset configs to the right places, etc
#############################################################################
./sasg_customer_build.sh 2>&1 | tee -a $SASG_LOG

############################################################################
##Starting Services
###########################################################################
#Starting ulodg
echo -e "\nStarting ulogd..."
ulogd -d
###########################################################################
#Start crond
echo -e "\nStarting crond..."
crond
############################################################################
#Start conntrackd -d
echo -e "\nStarting conntrackd..."
conntrackd -d
###########################################################################
#Starting ipset
echo -e "\nStarting IPset..."
#/etc/ipset.d/ipset
cat /etc/ipset.d/ipset | egrep -v "^#|^$" | while read LINE; do ipset $LINE; done
###########################################################################
#Starting iptables
echo -e "\nStarting IPtables..."
iptables-restore -c /etc/iptables/iptables
###########################################################################
#Starting openvpn
#Nat to Docker host for VPN

#if varible DOCKER_HOST_NAT=Yes- then 
if [ "$DOCKER_HOST_NAT" == "YES" ]; then
   ROUTE=$(ip -f inet -o address | egrep -v " lo| vtun| vti| eth1" | awk '{print $4}'| sed 's/....$/1/')
   if [[ $ARRAYNUM -eq 0 ]]; then
      ip route add $PUBLIC_VYOS_IP via $ROUTE dev eth0
   else
      ip route add ${PORTABLE_VTUN_CIDR[$ARRAYNUM]%/*} via $ROUTE dev eth0
   fi
   if [[ ! -z "$HTTPS_PROXY" ]]; then
      ip route add "$HTTPS_PROXY" via "$ROUTE" dev eth0
   fi 
fi
#
case "${TUNNEL_TYPE}" in
  "openvpn") 
    echo -e "\nStarting Openvpn..."
    openvpn --config /sasg/configs/client.conf
    ;;
  "ipsec") 
    echo -e "\nStarting ipsec..."
    PLUTO_LOG_FILE="/sasg/logs/VPN/sasvpn01"
    touch "${PLUTO_LOG_FILE}"
    mkdir -p /var/run/pluto
    ipsec initnss
    ipsec pluto \
      --config /etc/ipsec.conf \
      --nofork \
      --logfile "${PLUTO_LOG_FILE}" \
      --leak-detective \
    & # Running pluto in background
    ;;
esac

###############################################################################
#Echo Out configs
## Echo Out Configs for Logging
################################################################################
echo -e "\nNew iptables nat rules: \n"
iptables -nvL -t nat

echo -e "\nNew iptables FW rules: \n"
iptables -L

echo -e "\nNew ipset Groups: \n"
ipset list

echo -e "\nNew nginx config: \n"
cat /etc/nginx/conf.d/sla.conf

RESOLV_FILE="/etc/resolv.conf"
TMP_RESOLV_FILE="/tmp/resolv.conf"
# Using second file to be as atomic as possible and 
# overwrite original resolv.conf as a very last step
NEW_RESOLV_FILE="/tmp/resolv.conf.new"
:> "${NEW_RESOLV_FILE}"
cp "${RESOLV_FILE}" "${TMP_RESOLV_FILE}"
for ((i=0; i<${#DNS_IP[@]}; i++)); do
  # No need to fail if there is no DNS IP provided
  # hence checking inside the loop
  touch "${RESOLV_FILE}"
  if [[ $? -ne 0 ]]; then
    echo "ERROR: cannot modify ${RESOLV_FILE}. Pls add the following line into docker-compose.yml under volumes for sasgc"
    echo "- ${RESOLV_FILE}:${RESOLV_FILE}"
    exit 1
  fi

  sed -i "/${DNS_IP[${i}]}/d" "${TMP_RESOLV_FILE}"
  echo "nameserver ${DNS_IP[${i}]}" >> "${NEW_RESOLV_FILE}"
done
cat "${TMP_RESOLV_FILE}" >> "${NEW_RESOLV_FILE}"
if ! diff -q "${NEW_RESOLV_FILE}" "${RESOLV_FILE}" > /dev/null; then
  echo "Found updates to ${RESOLV_FILE}"
  diff "${NEW_RESOLV_FILE}" "${RESOLV_FILE}"
  # Updating resolv.conf ONLY if there are updates
  cat "${NEW_RESOLV_FILE}" > "${RESOLV_FILE}"
fi

rm -f "${NEW_RESOLV_FILE}" "${TMP_RESOLV_FILE}"

################################################################################

#echo -e "SASG is configured successfully!" | tee -a $SASG_LOG
#echo "SUCCESS" | tee -a $SASG_LOG
