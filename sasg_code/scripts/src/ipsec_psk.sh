#!/bin/bash
###########################################################################
# Description: Generate Openvpn configuration file
# Author: Joe boyle,Stan Braun
# Date: 22May2017
# Config: vars file 
# Main: ./sasg_build.sh
# Standalone Usage: ./ipsec_psk.sh
# History:
#    2017.05.22 - Original script.
#    2017.06.15 - SBraun - simple change made to copy secret key for sasg_ip1[0] vs creating separate ones for each pair.
#                 With new way of handling multi-sasg ipsec & using @peerx naming for each ipsec peer (sasg site) (to
#                 allow for customers with multiple load-balanced public ip's, etc., the current ipsec code does not
#                 not like having separate pre shared keys for each peer.  Just have to take out if-then as indicated.
#    2017.10.31 - SBraun - updated for sasfw, using sasg_common.sh for variables, took out key backup as 
#               - this is done in sasg_main - tarball created of all of /sasg
#    2017.11.08 - SBraun - fixes for ipsec secrets install/config.
#    2017.11.13 - SBraun - add newline before appending IPSEC_PSK to vars file - for some reason on some systems
#                 just appending doesn't always put it on new line.
#    2018.02.21 - SDubrouskaya - add psk key generating for IAMaaS ipsec
#    2018.03.29 - 3.1.07.03 - SBraun - updated key generation to pipe urandom thru xxd -ps - was adding unprintable chars previously.
#    2018.05.04 - 3.2.03 - SBraun - pipe key generation through base64 - still were issues in some environments with unprintable chars in ipsec key even with using xxd.
#    2018.06.15 - 3.3 - SBraun - pipe base64 output thru sed to eliminate double == & other characters vyatta doesnt like
#                 in it's ipsec keys.
# Notes:
#    Make sure "Tool Variable Input Section" is completed before running.
###########################################################################
set -e

source ./vars
source ./sasg_common.sh
SCRIPT_INFO="$0 v$VERSION"
DATE=`date +"%F_%H%M%S"`

echo "Generating IPSec PSK keys......."

# Expect pre-existing keys already backed up by sasg_main.sh

# function to create random 16 char/digit key for ipsec auth pre-shared key
GenPSK(){
sasgip=$1
ipsec_dir=$2

#exec 2>/dev/null
#MIN=15
#test -n "$1" -a $1 -gt 0 && MIN=$1
#MAX=16
#test -n "$2" -a $2 -gt $MIN && MAX=$2
#
#PW=""
#until [ ${#PW} -gt $MIN -a ${#PW} -le $MAX ]; do
#PW=`dd if=/dev/urandom bs=1k count=1 2>/dev/null | sed -e 's/[^-a-zA-Z0-9<>.,;:=+]*//g' | head -n 1`
# 3.1.07.03 - changed urandom & piped thru xxd to gen hex - prevents non-printable chars
#done
# 3.2.03 - changed xxd to base64 - still issues in some environments with non-printable chars even with xxd
#PW=$(dd if=/dev/urandom count=16 bs=1 2>/dev/null | xxd --ps)
#PW=$(dd if=/dev/urandom count=16 bs=1 2>/dev/null | base64)
PW=$(dd if=/dev/urandom count=16 bs=1 2>/dev/null | base64|sed -e 's/[^-a-zA-Z0-9<>.,;:+]*//g')
echo "$PW" > $ipsec_dir/ipsecpsk.$sasgip
echo "$PW" > $SAS_IPSECPSK_DIR/ipsecpsk.$sasgip
}

INDEX=0
if [[ "$TUNNEL_TYPE" == "ipsec" && "${DVPN^^}" != "YES" ]]; then
   echo -e "\nGenerating new PSK keys if needed..."
   CUSTOMER_SITE_IP=(${SASG_IP_1[@]})
   # loop thru all sasg svr1 ips listed in vars - generate ipsec psk key if the file doesn't exist
   # already - otherwise skip. Create one key per site, not one key per MASQ ip
   for ((INDEX=0; INDEX<${#CUSTOMER_SITE_IP[@]}; INDEX++))
   do
     if [ -f "$SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]}" ];then
        echo "$SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]} exists...skipping PSK generation for this ip."
     else
        echo "Creating PSK for SASG_IP_1 ${CUSTOMER_SITE_IP[$INDEX]} in $SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]}"
        #GenPSK "${CUSTOMER_SITE_IP[$INDEX]}"
        # in future, to enable separate IPSec PSK per peer, just comment out if-then below
        # & uncomment the GenPSK line above
        if [ $INDEX == 0 ];then
           GenPSK "${CUSTOMER_SITE_IP[$INDEX]}" "${SAS_IPSECPSK_DIR}"
        else
           cp $SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[0]} $SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]}
        fi
     fi

     # if per site secrets file doesn't exist, create it.  Note - creating under /sasg dir structure but 
     # gets copied into place in /etc/ipsec.d by sasg_main via sudo
     find $SAS_IPSECPSK_DIR/ -name "site*.secrets" -exec mv {} {}.bk.${DATE} \;
     SECRET=$(cat $SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]})
     echo -e "${PUBLIC_VYOS_IP} %any : PSK \"${SECRET}\"" > $SAS_IPSECPSK_DIR/site${INDEX}.secrets
     echo -e "\ncreated $SAS_IPSECPSK_DIR/site${INDEX}.secrets"
     
     # if IPSEC_PSK variable unset for this IP, add it to vars, otherwise use what's defined.
     if [ -z "${IPSEC_PSK[$INDEX]}" ];then
        IPSEC_PSK[$INDEX]=`cat $SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]}`
        echo -e "\nIPSEC_PSK[$INDEX]=\"${IPSEC_PSK[$INDEX]}\"" >> ./vars
        echo -e "\nIPSEC_PSK[$INDEX]=\"${IPSEC_PSK[$INDEX]}\"" >> $SAS_CLIENT_TOP/vars
     fi

   done
fi

#DVPN section
if [[ "${TUNNEL_TYPE^^}" == "MODEL5" ]]; then
   echo -e "\nGenerating new PSK keys if needed..."
   CUSTOMER_SITE_IP=(${CUST_PEER_IP[@]})
   # loop thru all  ips listed in vars - generate ipsec psk key if the file doesn't exist
   # already - otherwise skip. Create one key per site
   [ -f "$SAS_IPSECPSK_DIR/dvpn_sites.secrets" ] && mv $SAS_IPSECPSK_DIR/dvpn_sites.secrets $SAS_IPSECPSK_DIR/dvpn_sites.secrets.bk.${DATE}
   for ((INDEX=0; INDEX<${#CUSTOMER_SITE_IP[@]}; INDEX++))
   do
     if [ -f "$SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]}" ];then
        echo "$SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]} exists...skipping PSK generation for this ip."
     else
        echo "Creating PSK for SASG_IP_1 ${CUSTOMER_SITE_IP[$INDEX]} in $SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]}"
        GenPSK "${CUSTOMER_SITE_IP[$INDEX]}" "${SAS_IPSECPSK_DIR}"
     fi

     SECRET=$(cat $SAS_IPSECPSK_DIR/ipsecpsk.${CUSTOMER_SITE_IP[$INDEX]})
     if [ $INDEX == 0 ]; then
         echo -e "${PUBLIC_VYOS_IP} ${CUSTOMER_SITE_IP[$INDEX]} : PSK \"${SECRET}\"" > $SAS_IPSECPSK_DIR/dvpn_sites.secrets
         echo -e "Added secret for ${CUSTOMER_SITE_IP[$INDEX]} to the  $SAS_IPSECPSK_DIR/dvpn_sites.secrets"
     else
        echo -e "${PUBLIC_VYOS_IP} ${CUSTOMER_SITE_IP[$INDEX]} : PSK \"${SECRET}\"" >> $SAS_IPSECPSK_DIR/dvpn_sites.secrets
        echo -e "Added secret for ${CUSTOMER_SITE_IP[$INDEX]} to the  $SAS_IPSECPSK_DIR/dvpn_sites.secrets"
     fi

   done
   echo -e "\ncreated $SAS_IPSECPSK_DIR/dvpn_sites.secrets"
fi

#Model 6 section
if [[ "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
   echo -e "\nGenerating new PSK keys if needed..."

   [ -f "$SAS_IPSECPSK_DIR/sites.secrets" ] && mv $SAS_IPSECPSK_DIR/sites.secrets $SAS_IPSECPSK_DIR/sites.secrets.bk.${DATE}
     if [ -f "$SAS_IPSECPSK_DIR/ipsecpsk.${CUST_PEER_IP}" ];then
        echo "$SAS_IPSECPSK_DIR/ipsecpsk.${CUST_PEER_IP} exists...skipping PSK generation for this ip."
     else
        echo "Creating PSK for SASG_IP_1 ${CUST_PEER_IP} in $SAS_IPSECPSK_DIR/ipsecpsk.${CUST_PEER_IP}"
        GenPSK "${CUST_PEER_IP}" "${SAS_IPSECPSK_DIR}"
     fi

     SECRET=$(cat $SAS_IPSECPSK_DIR/ipsecpsk.${CUST_PEER_IP})
     if [ $INDEX == 0 ]; then
         echo -e "${PUBLIC_VYOS_IP} ${CUST_PEER_IP} : PSK \"${SECRET}\"" > $SAS_IPSECPSK_DIR/sites.secrets
         echo -e "Added secret for ${CUST_PEER_IP} to the  $SAS_IPSECPSK_DIR/sites.secrets"
     else
        echo -e "${PUBLIC_VYOS_IP} ${CUST_PEER_IP} : PSK \"${SECRET}\"" >> $SAS_IPSECPSK_DIR/sites.secrets
        echo -e "Added secret for ${CUST_PEER_IP} to the  $SAS_IPSECPSK_DIR/sites.secrets"
     fi
   echo -e "\ncreated $SAS_IPSECPSK_DIR/sites.secrets"
fi

#IAMaaS section
if [ ! -z ${JUNIPER_VPN_IP} ]; then
   if [ -f "$SAS_IPSECPSK_DIR_IAM/ipsecpsk.${JUNIPER_VPN_IP}" ];then
      echo "$SAS_IPSECPSK_DIR_IAM/ipsecpsk.${JUNIPER_VPN_IP} exists...skipping PSK generation for this ip."
   else
      echo "Creating PSK for IAMaaS Vyatta ${JUNIPER_VPN_IP} in $SAS_IPSECPSK_DIR_IAM/ipsecpsk.${JUNIPER_VPN_IP}"
      GenPSK "${JUNIPER_VPN_IP}" "${SAS_IPSECPSK_DIR_IAM}" 
   fi
   find $SAS_IPSECPSK_DIR_IAM/ -name "site*.secrets" -exec mv {} {}.bk.${DATE} \;
   SECRET=$(cat $SAS_IPSECPSK_DIR_IAM/ipsecpsk.${JUNIPER_VPN_IP})
   echo -e "${PUBLIC_VYOS_IP} "${JUNIPER_VPN_IP}" : PSK \"${SECRET}\"" > $SAS_IPSECPSK_DIR_IAM/site${INDEX}.secrets
   echo -e "\ncreated $SAS_IPSECPSK_DIR_IAM/site${INDEX}.secrets"
fi
#end IAMaaS section

exit 0
