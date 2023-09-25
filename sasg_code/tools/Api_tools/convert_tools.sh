#!/bin/bash

VARSFILE=$1
if [ ! "$VARSFILE" ];then
   echo -e "\nUSAGE: $0 <full path/filename of vars file to read in>\n"
   exit 1
fi
if [ ! -f "$VARSFILE" ];then
   echo -e "\n$VARSFILE not found..exiting..\n"
   exit 1
fi

if [ ! -z "$2" ];then
  CUSTOMER_NAME="$2"
  CUSTOMER_ID="$2"
else
  CUSTOMER_NAME="sbraun_API_test"
  CUSTOMER_ID="sbraun_API_test"
fi
API_ID="sbraun@us.ibm.com"
API_KEY="j9WAkNdj1HWGqlvdqKyh0SSPLDQmM5dVqG3gnDwQFQ8"

#API_ID="jvboyle@us.ibm.com"
#API_KEY=6KSLlfnrd46qT7uOZiqtMc94iM1O1p50BRLiuWykqNY #Test
#BLUEGROUP="sasgaas-North America"
BLUEGROUP="sasgaas-admin"
#CUSTOMER_NAME="API_T3"
#CUSTOMER_ID="API_T3"
source $VARSFILE
#SASGAAS_IP=https://sasgaas_test.gtsonsl.com
#SASGAAS_IP=https://10.190.17.89
#SASGAAS_IP=https:///sasgaas.gtsonsl.com
SASGAAS_IP=https://10.148.11.148

###########################################################################
#                             _   _            _                       
#  _ _  ___   _ _  ___ ___ __| | | |_ ___   __| |_  __ _ _ _  __ _ ___ 
# | ' \/ _ \ | ' \/ -_) -_) _` | |  _/ _ \ / _| ' \/ _` | ' \/ _` / -_)
# |_||_\___/ |_||_\___\___\__,_|  \__\___/ \__|_||_\__,_|_||_\__, \___|
#                                                            |___/     
###########################################################################

OVERWRITE_SASKEY=false

CleanArray(){
  ARR=("$@")
  NONBL=""
  
for i in "${ARR[@]}";do
  if [ ! -z "$i" ];then
    if [ -z "$NONBL" ];then
      NONBL="\"$i\""
    else
      NONBL="$NONBL,\"$i\""
    fi
  fi
done
echo -e "$NONBL"
  
} #CleanArray()

DNS_IPS=$(CleanArray "${DNS_IP[@]}")
LDAP_IPS=$(CleanArray "${LDAP_IP[@]}")
LDAP_PORTS=$(CleanArray "${LDAP_PORT[@]}")
MASQ_IPS=$(CleanArray "${SASG_MASQ_IP[@]}")
[[ -z "$PORTABLE_VTUN_CIDR[1]" ]] && PORTABLE_VTUN_CIDR[0]=1.1.1.1/32
[[ ! -z "$PORTABLE_VTUN_CIDR[1]" ]] && PORTABLE_VTUN_CIDR[0]=" "
PORTABLE_IPS=$(CleanArray "${PORTABLE_VTUN_CIDR[@]}")
VTUN_PORTS=$(CleanArray "${VTUN_PORT[@]}")
VCENTER_IPS=$(CleanArray "${VCENTER_IP[@]}")
SASG_IP1S=$(CleanArray "${SASG_IP_1[@]}")
SASG_IP2S=$(CleanArray "${SASG_IP_2[@]}")
SASG_VIP1S=$(CleanArray "${SASG_VIP1[@]}")
SASG_VIP2S=$(CleanArray "${SASG_VIP2[@]}")
SASG_VIP3S=$(CleanArray "${SASG_VIP3[@]}")
TP_TUN_INS=$(CleanArray "${TP_TUN_IN_BW[@]}")
TP_TUN_OUTS=$(CleanArray "${TP_TUN_OUT_BW[@]}")
CSC_IWSD_IP1_IPS=$(CleanArray "${CSC_IWSD_IP1[@]}")
CSC_IWSD_IP2_IPS=$(CleanArray "${CSC_IWSD_IP2[@]}")
CSC_IWSZ_IP1_IPS=$(CleanArray "${CSC_IWSZ_IP1[@]}")
CSC_IWSZ_IP2_IPS=$(CleanArray "${CSC_IWSZ_IP2[@]}")
CSC_BMC_IP1_IPS=$(CleanArray "${CSC_BMC_IP1[@]}")
CSC_BMC_IP2_IPS=$(CleanArray "${CSC_BMC_IP2[@]}")
CHEF_PORT_NUMS=$(CleanArray "${CHEF_PORT[@]}")
EE_PORT_NUMS=$(CleanArray "${EE_PORT[@]}")
RCP_PROXIES=$(CleanArray "${RCP_PROXY_IP[@]}")
CUSTPREM_BIGFIX_IPS=$(CleanArray "${CUSTPREM_BIGFIX_IP[@]}")
CUSTPREM_BIGFIX_PORTS=$(CleanArray "${CUSTPREM_BIGFIX_PORT[@]}")

echo -e "\nPORTABLE_IPS=<$PORTABLE_IPS>"

VAR1=$(cat <<EOF
{
        "BLUEGROUPS": ["sasgaas-North America","sasgaas-Belarus","sasgaas-Brazil","sasgaas-Czech Republic","sasgaas-India","sasgaas-LA","sasgaas-Romania","sasgaas-Singapore","sasgaas-admin"],
	"CUSTOMER_NAME": "$CUSTOMER_NAME",
	"CUSTOMER_ID": "$CUSTOMER_ID",
	"VYOS_AUTO_USERNAME": "sasauto",
	"VYOS_AUTO_PASSKEY": "sasauto",
	"TOOLS_AUTO_USERNAME": "sasauto",
	"TOOLS_AUTO_PASSKEY": "sasauto", 
	"VARS":
	{
	"LOCATION": "$LOCATION",
        "INSTALL_MODE": "$INSTALL_MODE",
	"CEBW_IP": "$CEBW_IP",
	"BPM_IP": "$BPM_IP",
	"CHEF_IP": "$CHEF_IP",
	"EE_IP": "$EE_IP",
	"ASB_IP" : "$ASB_IP",
	"RCP_IP" : "$RCP_IP",
	"RCP_BPM_IP" : "$RCP_BPM_IP",
	"RCP_ROR_IP" : "$RCP_ROR_IP",
	"RCP_PROXY_IP" : [${RCP_PROXIES}],
	"RCP_PROXY_LB_IP" : "$RCP_PROXY_LB_IP",
	"CSC_IP" : "$CSC_IP",
        "CSC_IWSD_BOOTPORT" : "$CSC_IWSD_BOOTPORT",
        "CSC_IWSD_HTTPSPORT" : "$CSC_IWSD_HTTPSPORT",
        "CSC_IWSD_CSI_AUTHPORT" : "$CSC_IWSD_CSI_AUTHPORT",
        "CSC_IWSD_ADM_SECPORT" : "$CSC_IWSD_ADM_SECPORT",
        "CSC_IWSZ_SERVOPTSPORT" : "$CSC_IWSZ_SERVOPTSPORT",
        "CSC_IWSZ_DWC_BOOTPORT" : "$CSC_IWSZ_DWC_BOOTPORT",
        "CSC_BMC_REST_APIPORT" : "$CSC_BMC_REST_APIPORT",
        "CSC_BMC_COBRASERVPORT" : "$CSC_BMC_COBRASERVPORT",
        "CSC_IWSD_IP1" : [${CSC_IWSD_IP1_IPS}],
        "CSC_IWSD_IP2" : [${CSC_IWSD_IP2_IPS}],
        "CSC_IWSZ_IP1" : [${CSC_IWSZ_IP1_IPS}],
        "CSC_IWSZ_IP2" : [${CSC_IWSZ_IP2_IPS}],
        "CSC_BMC_IP1" : [${CSC_BMC_IP1_IPS}],
        "CSC_BMC_IP2" : [${CSC_BMC_IP2_IPS}],
	"TOOLS_SUBNET": "$TOOLS_SUBNET",
        "CHEF_PORT" : [${CHEF_PORT_NUMS}],
        "EE_PORT" : [${EE_PORT_NUMS}],
        "SASG_LOGPUSH_PORT" : "$SASG_LOGPUSH_PORT",
        "SASG_LOGPUSH_IP" : "$SASG_LOGPUSH_IP",
	"MS_VYATTA_IP": "$MS_VYATTA_IP",
	"MINI_MS_VYATTA_IP" : "$MINI_MS_VYATTA_IP",
	"BCR_IP": "$BCR_IP",
	"SASGAAS_MS_IP" : "$SASGAAS_MS_IP",
	"SASGAAS_CDS_IP" : "$SASGAAS_CDS_IP",
	"CUSTOMER_SUBNETS": ["\"${CUSTOMER_SUBNETS[0]}\"","\"${CUSTOMER_SUBNETS[1]}\"","\"${CUSTOMER_SUBNETS[2]}\""], 
        "CUSTOMER_SUBNETS_MASQ_IP": ["\"${CUSTOMER_SUBNETS_MASQ_IP[0]}\"","\"${CUSTOMER_SUBNETS_MASQ_IP[1]}\"","\"${CUSTOMER_SUBNETS_MASQ_IP[2]}\""], 
	"SASG_MASQ_IP": [${MASQ_IPS}],
	"PORTABLE_VTUN_CIDR": [${PORTABLE_IPS}],
	"TUNNEL_TYPE": "$TUNNEL_TYPE",
	"VTUN_PORT" : [${VTUN_PORTS}],
	"VCENTER_IP" : [${VCENTER_IPS}],
	"DNS_IP" : [${DNS_IPS}], 
	"LDAP_IP" : [${LDAP_IPS}], 
	"LDAP_PORT" : [${LDAP_PORTS}], 
	"PRIVATE_VYOS_IP": "$PRIVATE_VYOS_IP",
	"PUBLIC_VYOS_IP": "$PUBLIC_VYOS_IP",
        "DOCKER_HOST_NAT": "$DOCKER_HOST_NAT",
        "LOGROTATE_MODEL": "$LOGROTATE_MODEL",
	"SASG_IP_1": [${SASG_IP1S}],
	"SASG_IP_2": [${SASG_IP2S}],
	"SASG_VIP1": [${SASG_VIP1S}],
	"SASG_VIP2": [${SASG_VIP2S}],
	"SASG_VIP3": [${SASG_VIP3S}],
        "LOCAL_DVPN_SUBNET": "$LOCAL_DVPN_SUBNET",
        "LOCAL_DVPN_IP": "$LOCAL_DVPN_IP",
        "ENCR_PH1": "$ENCR_PH1",
        "ENCR_QUICK": "$ENCR_QUICK",
        "HASH_PH1": "$HASH_PH1",
        "HASH_QUICK": "$HASH_QUICK",
        "LIFETIME_PH1": "$LIFETIME_PH1",
        "LIFETIME_QUICK": "$LIFETIME_QUICK",
        "DHG_PH1": "$DHG_PH1",
        "DHG_PH2": "$DHG_PH2",
        "PFS": "$PFS",
	"APM_IP": "$APM_IP",
	"SASG_NWIF": "$SASG_NWIF",
	"SASG_VPNIF": "$SASG_VPNIF",
	"OVERWRITE_SASKEY": "$OVERWRITE_SASKEY",
	"TP_TUN_IN_BW": [${TP_TUN_INS}],
	"TP_TUN_OUT_BW": [${TP_TUN_OUTS}],
	"TP_TUN_BURST": "$TP_TUN_BURST",
        "CUSTPREM_BIGFIX_IP": [${CUSTPREM_BIGFIX_IPS}],
        "CUSTPREM_BIGFIX_PORT": [${CUSTPREM_BIGFIX_PORTS}],
        "CUSTPREM_TICKETING_IP": "$CUSTPREM_TICKETING_IP",
        "CUSTPREM_TICKETING_PORT": "$CUSTPREM_TICKETING_PORT",
        "PUBLIC_VYATTA_VIP": "$PUBLIC_VYATTA_VIP",
        "IAMAAS_PRIMARY_SUBNET": "\"$IAMAAS_PRIMARY_SUBNET\"",
        "IAMAAS_PORTABLE_SUBNET": "\"$IAMAAS_PORTABLE_SUBNET\"",
        "IAMAAS_MAPPING": "\"$IAMAAS_MAPPING\"",
        "LB_JUNCTION": "$LB_JUNCTION",
        "IAMAAS_IPSEC_DESCR": "\"$IAMAAS_IPSEC_DESCR\"",
        "IAMaaS_SASG": "$IAMaaS_SASG",
        "TDI_IP": "$TDI_IP",
        "TDI_PORT": "$TDI_PORT",
        "IAMAAS_MS_AD_PORT": "$IAMAAS_MS_AD_PORT",
        "IAMAAS_MS_AD_IP": "$IAMAAS_MS_AD_IP",
        "IAMAAS_DATABASE_PORT": "$IAMAAS_DATABASE_PORT",
        "IAMAAS_MS_SQL_PORT": "$IAMAAS_MS_SQL_PORT",
        "IAMAAS_STORAGE_PORT": "$IAMAAS_STORAGE_PORT",
        "IAMAAS_REMEDY_PORT": "$IAMAAS_REMEDY_PORT",
        "IAMAAS_REMEDY_IP": "$IAMAAS_REMEDY_IP",
        "HA_USER": "$HA_USER",
        "SASG_INCLUDE_IMAGES": "$SASG_INCLUDE_IMAGES",
        "SASG_MAIN_IMAGE_VERSION": "\"$SASG_MAIN_IMAGE_VERSION\"",
        "SASG_CHECKER_IMAGE_VERSION": "\"$SASG_CHECKER_IMAGE_VERSION\"",
	"HTTPS_PROXY": "$HTTPS_PROXY",
	"HTTPS_PROXY_PORT": "$HTTPS_PROXY_PORT",
	"HOSTNAME": "\`hostname\`",
	"TIMESTAMP": "$TIMESTAMP",
	"VERSION": "\`cat ./VERSION\`"
   } 
}
EOF
)
	
POSTDATA=$(cat <<EOF
{
	"CUSTOMER_NAME": "$CUSTOMER_NAME",
	"ACTION": "configure"
   } 
EOF
)
	
cat <<EOF
 curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$VAR1" $SASGAAS_IP/customer
EOF


# Create Profile in Sasg
echo "....Creating SASGaas profile" 
RET=$(curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$VAR1" $SASGAAS_IP/customer 2>&1)
echo "$RET"| grep "\"status\":"|grep -i "OK"
if [ "$?" -ne 0 ];then
  echo -e "\nERROR creating SASGaas profile: $RET\n"
  exit 1
else
  echo -e "\nSUCCESS creating SASGaas profile: $RET\n"
fi


#If updating Profile , Regenerate Scripts after Profile updated
echo "....Regenerating Scripts just incase you are updating an Existing Profile"
RET=$(curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$POSTDATA" $SASGAAS_IP/regenerate 2>&1 )
echo "$RET"| grep "\"status\":"|grep -i "OK"
if [ "$?" -ne 0 ];then
  echo -e "\nERROR regenerating scripts: $RET\n"
  exit 1
else
  echo -e "\nSUCCESS regenerating scripts: $RET\n"
fi

#Configure SASFW
echo "....Configuring Firewall"
RET=$(curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$POSTDATA" $SASGAAS_IP/vyos 2>&1)
echo "$RET"| grep "\"status\":"|grep -i "OK"
if [ "$?" -ne 0 ];then
  echo -e "\nERROR configuring firewall: $RET\n"
  [[ -z "${SASG_IP1S}" ]] && echo -e "$CUSTOMER_NAME - SASG IPs blank, ssh err on sasfw not an issue..."
else
  echo -e "\nSUCCESS configuring firewall: $RET\n"
fi


#Configure Tools servers
echo "....Configuring Tools Servers"
RET=$(curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$POSTDATA" $SASGAAS_IP/tools 2>&1 )
echo "$RET"| grep "\"status\":"|grep -i "OK"
if [ "$?" -ne 0 ];then
  echo -e "\nERROR configuring tools servers: $RET\n"
  exit 1
else
  echo -e "\nSUCCESS configuring tools servers: $RET"
fi

# for testing - dont download sasg
exit 0

#Download Sasg_install.sh 
#echo "....Downloading the sasg_install.sh package"
#curl -k -o sasg_install.sh $SASGAAS_IP/userdata/customers/$CUSTOMER_NAME/sasg_install.sh
