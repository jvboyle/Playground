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


API_ID=""
API_KEY=""
BLUEGROUP=""
CUSTOMER_NAME=""
CUSTOMER_ID=""
#source ./vars
SASGAAS_IP=https://sasgaas_test.gtsonsl.com

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
MASQ_IPS=$(CleanArray "${SASG_MASQ_IP[@]}")
PORTABLE_VTUN_CIDR[0]=1.1.1.1/32
PORTABLE_IPS=$(CleanArray "${PORTABLE_VTUN_CIDR[@]}")
VTUN_PORTS=$(CleanArray "${VTUN_PORT[@]}")
VCENTER_IPS=$(CleanArray "${VENTER_IP[@]}")
SASG_IP1S=$(CleanArray "${SASG_IP_1[@]}")
SASG_IP2S=$(CleanArray "${SASG_IP_2[@]}")
SASG_VIP1S=$(CleanArray "${SASG_VIP1[@]}")
SASG_VIP2S=$(CleanArray "${SASG_VIP2[@]}")
SASG_VIP3S=$(CleanArray "${SASG_VIP3[@]}")
TP_TUN_INS=$(CleanArray "${TP_TUN_IN_BW[@]}")
TP_TUN_OUTS=$(CleanArray "${TP_TUN_OUT_BW[@]}")


VAR1=$(cat <<EOF
{
	"BLUEGROUPS": ["sasgaas-North America"],
	"CUSTOMER_NAME": "$CUSTOMER_NAME",
	"CUSTOMER_ID": "$CUSTOMER_ID",
	"VYOS_AUTO_USERNAME": "sasauto",
	"VYOS_AUTO_PASSKEY": "sasauto",
	"TOOLS_AUTO_USERNAME": "sasauto",
	"TOOLS_AUTO_PASSKEY": "sasauto", 
	"VARS":
	{
	"CEBW_IP": "$CEBW_IP",
	"BPM_IP": "$BPM_IP",
	"CHEF_IP": "$CHEF_IP",
	"EE_IP": "$EE_IP",
	"ASB_IP" : "$ASB_IP",
	"RCP_IP" : "$RCP_IP",
	"RCP_BPM_IP" : "$RCP_BPM_IP",
	"RCP_ROR_IP" : "$RCP_ROR_IP",
	"TOOLS_SUBNET": "$TOOLS_SUBNET",
	"MS_VYATTA_IP": "$MS_VYATTA_IP",
	"MINI_MS_VYATTA_IP" : "$MINI_MS_VYATTA_IP",
	"BCR_IP": "$BCR_IP",
	"MS_APIE_IP": "$MS_APIE_IP",
	"MS_R1SOFT_IP" : "$MS_R1SOFT_IP",
	"SASGAAS_MS_IP" : "$SASGAAS_MS_IP",
	"SASGAAS_CDS_IP" : "$SASGAAS_CDS_IP",
	"CUSTOMER_SUBNETS": ["\"${CUSTOMER_SUBNETS[0]}\"","\"${CUSTOMER_SUBNETS[1]}\"","\"${CUSTOMER_SUBNETS[2]}\""], 
	"SASG_MASQ_IP": [${MASQ_IPS}],
	"PORTABLE_VTUN_CIDR": [${PORTABLE_IPS}],
	"TUNNEL_TYPE": "$TUNNEL_TYPE",
	"VTUN_PORT" : [${VTUN_PORTS}],
	"VCENTER_IP" : [${VCENTER_IPS}],
	"DNS_IP" : [${DNS_IPS}], 
	"LDAP_IP" : [${LDAP_IPS}], 
	"PRIVATE_VYOS_IP": "$PRIVATE_VYOS_IP",
	"PUBLIC_VYOS_IP": "$PUBLIC_VYOS_IP",
	"SASG_IP_1": [${SASG_IP1S}],
	"SASG_IP_2": [${SASG_IP2S}],
	"SASG_VIP1": [${SASG_VIP1S}],
	"SASG_VIP2": [${SASG_VIP2S}],
	"SASG_VIP3": [${SASG_VIP3S}],
	"DOCKER_SUBNET": "$DOCKER_SUBNET",
	"APM_IP": "$APM_IP",
	"SASG_NWIF": "$SASG_NWIF",
	"SASG_VPNIF": "$SASG_VPNIF",
        "DOCKER_CONTAINER": "$DOCKER_CONTAINER",
	"OVERWRITE_SASKEY": "$OVERWRITE_SASKEY",
	"TP_TUN_IN_BW": [${TP_TUN_INS}],
	"TP_TUN_OUT_BW": [${TP_TUN_OUTS}],
	"TP_TUN_BURST": "$TP_TUN_BURST",
	"CUSTPREM_BIGFIX_IP": "$CUSTPREM_BIGFIX_IP",
	"CUSTPREM_BIGFIX_PORT": "$CUSTPREM_BIGFIX_PORT",
	"HTTPS_PROXY": "$HTTPS_PROXY",
	"HTTPS_PROXY_PORT": "$HTTPS_PROXY_PORT",
	"HOSTNAME": "$HOSTNAME",
	"TIMESTAMP": "$TIMESTAMP",
	"VERSION": "$VERSION"
   } 
}
EOF
)
	

#echo -e "VAR1=<$VAR1>\n"

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
curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$VAR1" $SASGAAS_IP/customer


#If updating Profile , Regenerate Scripts after Profile updated
echo "....Regenerating Scripts just incase you are updating an Existing Profile"
curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$POSTDATA" $SASGAAS_IP/regenerate


#Configure SASFW
echo "....Configuring Firewall"
curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$POSTDATA" $SASGAAS_IP/vyos


#Configure Tools servers
echo "....Configuring Tools Servers"
curl -k -X POST -H "Content-Type: application/json" -H "X-Api-Id: $API_ID" -H "X-Api-Key: $API_KEY" -H "X-Api-BG: $BLUEGROUP" -d "$POSTDATA" $SASGAAS_IP/tools

# for testing - dont download sasg
exit 0

#Download Sasg_install.sh 
echo "....Downloading the sasg_install.sh package"
curl -k -o sasg_install.sh $SASGAAS_IP/userdata/customers/$CUSTOMER_NAME/sasg_install.sh


