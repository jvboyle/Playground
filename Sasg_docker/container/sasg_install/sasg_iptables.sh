#!/bin/bash
###########################################################################
# Description: Configures iptables for ipsec on SASG
# Author: John Simmons, Daniel Miller
# Date: 2016.11.16
# Config: vars file
# Main: ./sasg_build.sh
# Standalone Usage: ./sasg_1_iptables.sh
#    2016.06.27 - Original script.
#    2016.11.16 - Commented references to port 3330, and INPUT statement
#    2017.04.27 - S.Braun - Updated to create multiple iptables files for multi-sasg install based
#               - on SASG_IP_1, SASG_VIP1, CUSTOMER_SUBNETS, and PORTABLE_VTUN_CIDR arrays in vars.
#    2017.05.03 - S.Braun - Updated to add check if ASB IP not provided in vars then don't add rules
#               - ASB server now optional.  If ASB IP is defined then go ahead and add the rules.
#    2017.05.18 - S.Braun - added CHEF_PORT[], EE_PORT[] processing - allows specifying one or more ports
#               - for chef/ee return traffic - endpoint to sasg.
#    2017.06.06 - updated directory output files are created in - now in $FN/sasg_client
#    2017.07.04 - V2.6 - added rules for sasg firewall / logging
#    2017.07.05 - V2.6 - set up so only single iptables script is required vs separate scripts for primary/backup sasg- renamed as just sasg_iptables.sh
#    2017.07.06 - V2.6 - fixes to iptables/ipset rules - removed dbl quotes for comments - rh6 doesnt handle it right
#    2017.07.19 - V2.6 - updated to be run on sasg directly vs on vyos
#    2017.08.07 - V2.6 - fixed logging on all interfaces
#    2017.09.08 - V2.6 - added --log-level 4 -m limit --limit 1/s --limit-burst 1 on default-action accept log stanzas for all nics.
#    2017.09.13 - V2.6 - consolidated natting for 10. cust endpoint subnets- nat CDS tools subnet to 1.0.0.0/8 - stateful firewall - no longer need protection at nat level.
#    2017.09.13 - V2.6 - consolidated natting for non-10. cust endpoint subnets since running stateful firewall and all
#                        cust endpoint subnets can be defined/managed in ipset.
#    2017.09.25 - V2.6.1 - updates to postrouting for Nginx support for openvpn/ipsec.
#    2017.09.28 - V2.6.1 - fixed incorrect protocol on rule 40 - ee to cust dns
#    2017.11.06 - V3.1 - SBraun - added missing output rules needed for nginx / sasg on-board.
#    2017.11.06 - V3.1 - SBraun - added new rules for ASB -> vcenter/bigfix on cust premise.
#    2017.11.14 - V3.1.01 - SBraun - added new rules for ASB -> ldap, ee->ldap, chgd code so filter rule numbers use $RN so can be moved more easily,
#               -  per D. Miller, chgd so asb rules add if ASB defined, not only if vcenter defined.  Only add asb, rcp to bigfix/vcenter if on custprem.
#    2017.11.15 - V3.1.01 - SBraun - added default of 1.1.1.1 if DNS_IP not defined.  LDAP_IP defaults to same as DNS_IP if not defined.
#    2017.11.28 - V3.1.03 - SBraun - moved add of vcenter & asb to bigfix rules to within if-then that checks if ASB_IP is defined.
#    2017.11.30 - V3.1.04 - SBraun - chgd hook NIC names from vtun0 to $SASG_VPNIF to avoid issues with substitution later
#                         - depending on whether openvpn/ipsec is used & someone changed value of SASG_VPNIF in vars.
#    2017.12.14 - V3.1.06 - SBraun - fixed postroute snat rule that sets source ip of sasg VIP for Nginx 3333 traffic to tools subnet - was changing first octet to 1 for non-10. sasg_vips.
#    2018.01.19 - V3.1.07 - SBraun - Per RTC 359267, tda approved opening EE,ASB server to cust endpoints, tcp 443.  Updated IPSET EE_TO_CUST_ENDPOINTS, ASB_TO_CUST_ENDPOINTS.
#    2018.01.23 - 3.1.07 - SBraun -  Changed query to get name of all NICs - handles interface names with . (dot) in them:
#    2018.01.24 - 3.1.07 - SBraun -  Updated to check if ORIGINALFILTERLINES file exists, incorporate those filter lines into new iptables file
#    2018.02.13 - 3.1.07 - SBraun - set CHEF_PORT[0]=443, CHEF_PORT[1]=8443.  Force output/preroute rules for both
#                        ports to enable master-backup.sh to add/remove both sets of output rules for backup
#                        sasg server on-boarding.
#    2018.02.22 - 3.1.0X - SDubrouskaya added IAMaaS support.
#    2018.03.13 - 3.1.07.02 - SBraun - minor fix - check if extra ldap, dns or vcenter variable is not null to prevent adding "add" line to ipset file with no ip.
#    2018.04.04 - 3.1.07.03 - SBraun - minor fix - changed comments and numbers on output rules - allows for master-backup.sh to call iptables commands with
#                             proper comments, etc to be able to match rules and add/delete the output rules properly.
#    2018.04.25 - 3.2.03 - SDubrouskaya - IAMaaS use VIP2 for natting
#    2018.05.03 - SBraun - 3.2.03 - Support for CEBW_IP - consolidated Chef, EE, BPM servers
#    2018.05.04 - SBraun - 3.2.03 - Support for RCP_IP - consolidated RCP_BPM, RCP_ROR servers
#    2018.05.07 - SBraun - 3.2.03 - Fix for accts where JH has multiple NICs & interface specified for the SASG_IP doesn't match what's in the vars file by default for SASG_NWIF.
#                          Was causing duplicate iptables filter entries & iptables start issues. Similarly for VPNIF - don't do check in sasg_customer_build.sh & sed on the file - just
#                          do the check initially for tunnel type & if using ipsec, put in vti0 for tunnel interface name otherwise set to vtun0
#    2018.06.14 - ASakhno - 3.2.03 - Support for CSC tools including multi-sasg support.
#    2018.08.15 - jvboyle - removed old IAM and CSC section that were commented out , Added iptables comment section were rules are defined
#    2018.12.09 - jvboyle - Merged Native sasg 40 rules into docker 
#    2018.17.18 - jvboyle - moved network interface from VAR into script/ changed Outbound/inbound interface for new network (host-only ) 
#    2019.01.11 - sbraun - added rules for Kafka messaging (endpoint to Kafka port -> EE) - issue #16
#    2019.05.02 - sbraun - allow CHEF to CP LDAP instead of EE to CP LDAP
#    2019.05.07 - sbraun - limit logging - no log on defaults / NATs, add limits on all others.
# Notes:
#    Make sure "Tool Variable Input Section" is completed before running.
###########################################################################
set -e

source ./vars
source ./sasg_ipset_lib.sh

# --- Setting default variables ------------------
  [[ "${DOCKER_HOST_NAT^^}" != "NO" ]] && DOCKER_HOST_NAT="YES"
  echo "Docker host NAT:  ${DOCKER_HOST_NAT}"
  case "${TUNNEL_TYPE}" in 
    "ipsec")
      VPN_IFACE="vti0"
      echo "Tunnel type:      ipsec"
      echo "I-face name:      vti0"
      ;;
    "openvpn") 
      ;&
    *)
      TUNNEL_TYPE="openvpn"
      echo "Tunnel type:      openvpn"
      echo "I-face name:      vtun0"
      VPN_IFACE="vtun0"
      ;;
  esac    

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

# 3.2.03 - support for CEBW_IP - consolidated chef, ee, bpm services in one vm
if [[ ! -z "$CEBW_IP" ]];then
  echo -e "\nCEBW_IP defined, setting variables for consolidate chef, ee, bpm services..."
  BPM_IP=$CEBW_IP
  CHEF_IP=$CEBW_IP
  EE_IP=$CEBW_IP
fi
if [[ ! -z "$RCP_IP" ]];then
  echo -e "\nRCP_IP defined, setting variables for consolidated rcp services into single vm..."
  RCP_BPM_IP=$RCP_IP
  RCP_ROR_IP=$RCP_IP
fi

[[ -z ${LDAP_PORT} ]] && LDAP_PORT[0]=636

#IAMaaS section
if [[ -z $IAMaaS_SASG ]]; then
      IAMaaS_SASG=0
      for ((INDEX=1; INDEX<${#CUSTOMER_SUBNETS[@]}; INDEX++))
      do
        IAMaaS_SASG="$IAMaaS_SASG $INDEX"
      done
fi
#end IAMaaS section

#Set CSC default ports in case not defined in vars
[[ -z "$CSC_IWSD_BOOTPORT" ]] && CSC_IWSD_BOOTPORT=31117
[[ -z "$CSC_IWSD_HTTPSPORT" ]] && CSC_IWSD_HTTPSPORT=31116
[[ -z "$CSC_IWSD_CSI_AUTHPORT" ]] && CSC_IWSD_CSI_AUTHPORT=31122
[[ -z "$CSC_IWSD_ADM_SECPORT" ]] && CSC_IWSD_ADM_SECPORT=31124
[[ -z "$CSC_IWSZ_SERVOPTSPORT" ]] && CSC_IWSZ_SERVOPTSPORT=425
[[ -z "$CSC_IWSZ_DWC_BOOTPORT" ]] && CSC_IWSZ_DWC_BOOTPORT=16312
[[ -z "$CSC_BMC_REST_APIPORT" ]] && CSC_BMC_REST_APIPORT=8443
[[ -z "$CSC_BMC_COBRASERVPORT" ]] && CSC_BMC_COBRASERVPORT=13075

#####Build DIR for Standard OS Deploy
#FN="."
#####Build DIR For Docker Deploy
FN="/sasg/tmp"

DATE=`date`
SCRIPT_INFO="$0 v$VERSION"

#####Set network interface for container
SASG_NWIF=eth1

#### Set Docker variables required to enable onboarding 
# HOST_ONLY_GW is passed via docker-compose environment
if [[ "$DOCKER_HOST" =~ ^10\. ]];then
   ONE_DOCKER_HOST=1.$(echo -e $DOCKER_HOST | cut -d"." -f2-4)
fi

################ Script Auto Variables Section ############################
[[ ! -z "$BPM_IP" ]] && TWO_BPM_IP=2.$(echo -e $BPM_IP | cut -d"." -f2-4)
[[ ! -z "$CHEF_IP" ]] && TWO_CHEF_IP=2.$(echo -e $CHEF_IP | cut -d"." -f2-4)
[[ ! -z "$EE_IP" ]] && TWO_EE_IP=2.$(echo -e $EE_IP | cut -d"." -f2-4)

# set default EE logs upload port if it's missing
[[ -z "${SASG_LOGPUSH_PORT}" ]] && SASG_LOGPUSH_PORT=3444
[[ -z "${SASG_LOGPUSH_IP}" ]] && SASG_LOGPUSH_IP="${PRIVATE_VYOS_IP}"
TWO_LOGPUSH_IP=2.$(echo -e $SASG_LOGPUSH_IP | cut -d"." -f2-4)

TWO_TOOLS_SUBNET=2.$(echo -e $TOOLS_SUBNET | cut -d"." -f2-4)

if [[ ! -z "$ASB_IP" ]]; then
  TWO_ASB_IP=2.$(echo -e $ASB_IP | cut -d"." -f2-4)
fi

if [[ ! -z "$RCP_BPM_IP" ]]; then
  TWO_RCP_BPM_IP=2.$(echo -e $RCP_BPM_IP | cut -d"." -f2-4)
fi

if [[ ! -z "$RCP_ROR_IP" ]]; then
  TWO_RCP_ROR_IP=2.$(echo -e $RCP_ROR_IP | cut -d"." -f2-4)
fi

TWO_LB_JUNCTION=2.$(echo -e $LB_JUNCTION | cut -d"." -f2-4)
ALL_SUBNETS="0.0.0.0/0"  #  used to define all cust endpoint subnets as subnets now managed via ipset

##########################################################################
# big loop to handle multi-sasg & go through each set of customer subnets on a per sasg site / server basis

if [[ ! -z "${CUSTPREM_BIGFIX_IP[$ARRAYNUM]}" ]]; then
    ONE_CUSTPREM_BIGFIX_IP=1.$(echo ${CUSTPREM_BIGFIX_IP[$ARRAYNUM]} | cut -d"." -f2-4)
fi

#IAMaaS section
  if [[ -z "$IAMAAS_PRIMARY_SUBNET" ]] && [[ -z "$IAMAAS_PORTABLE_SUBNET" ]]; then
     IAMaaS=NO
  elif [[ -z "$JUNIPER_VPN_IP" || -z "$IAMAAS_MAPPING" || -z "$LB_JUNCTION" ]]; then
       echo -e "\nERROR: Not all IAMaaS variables are specified. Please check."
       exit 1
  else
      for ITEM in $IAMaaS_SASG
      do
        if [[ "$ARRAYNUM" == "$ITEM" ]]; then
           IAMaaS=YES
           break
        else
           IAMaaS=NO
        fi
      done
  fi
#end IAMaaS section

SASGIP=$(ip addr show dev eth1 |grep "inet "|awk '{print $2}'|cut -f1 -d'/')
SASGVIP=$SASGIP
SASGVIP2=${SASG_VIP2[$ARRAYNUM]}
######### Add 2nd Vip to container ###################
if [[ ! -z "$SASGVIP2" && "${SASGVIP}" != "${SASGVIP2}" ]]; then
ip addr add $SASGVIP2/$MACHINE_SUBNET_MASK dev eth1
fi
#############################################################################################
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
  IPTAB="$FN/iptables.${SASGIP}"
  IPSET="$FN/ipset.${SASGIP}"

  if [[ -f ${IPTAB} ]];then
    echo -e "removing old ${IPTAB}"
    rm ${IPTAB}
  fi

# get 1dot VIP addr for NGINX rule

ONE_SASGVIP=1.$(echo ${SASGVIP} | cut -d"." -f2-4)
#
#
#
#
########################Just for alpine #############################
for SUBNET in `echo ${CUSTOMER_SUBNETS[$ARRAYNUM]} | sed "s/ \+/\n/g"`
   do
   if [[ "$SUBNET" =~ ^10\. ]];then
      TEN_SUBNET=true
      break
   fi
    echo -e "add CUST_ENDPOINTS ${SUBNET}" >> $IPSET
  done
######################################################################

  #if [ ${#CHEF_PORT[@]} -lt 1 ];then
  #  echo -e -e "\n**Warning - No CHEF_PORT[] defined in vars - using default of port 443!\n"
  #fi

  # v3.1.07 - just set chef ports to 443/8443 for iptables rules - add output / prerouting rules for both
  # new master-backup will add/remove output rules for both ports.  this allows for consistent numbering.

  CHEF_PORT[0]=443
  CHEF_PORT[1]=8443

  # v4.10 - added support for endpoint to Kafka on EE
  if [[ -z "$KAFKA_PORT" ]];then
    KAFKA_PORT=9093
  fi

  if [[ ${#EE_PORT[@]} -lt 1 ]];then
    echo -e -e "\n**Warning - No EE_PORT[] defined in vars - using default of port 3333!\n"
    EE_PORT[0]=3333
  fi

  echo -e "Generating SASG $SASLOOP Iptables file: ${IPTAB}..........\n"

  ###########################################################################################################
  ############ Iptables Config Section, Only Lines that setup iptables file #################################
  ############ This section is to be Universal for Docker and standard JH Deploy ############################
  ###########################################################################################################
#
### #cat > $IPTAB << EOL
echo -e "# Generated by $SCRIPT_INFO on $DATE" >$IPTAB

echo -e "# Create iptables Configuration Section" >>$IPTAB
echo -e "*nat" >>$IPTAB
echo -e ":PREROUTING ACCEPT [0:0]" >>$IPTAB
echo -e "#:INPUT ACCEPT [0:0]" >>$IPTAB
echo -e ":OUTPUT ACCEPT [0:0]" >>$IPTAB
echo -e ":POSTROUTING ACCEPT [0:0]" >>$IPTAB
echo -e ":SASG_PRE_DNAT_HOOK - [0:0]" >>$IPTAB
echo -e ":SASG_PRE_SNAT_HOOK - [0:0]" >>$IPTAB
echo -e "-A PREROUTING -j SASG_PRE_DNAT_HOOK" >>$IPTAB
#EOL

if [[ ! -z "$CHEF_IP" ]]; then
   echo -e "\n# IF (SRC=SASG & DST=SASG:${CHEF_PORT[@]}) THEN DNAT=2.CHEF" >> $IPTAB
   echo -e "-A OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 443 -m comment --comment OUTPUT-DNAT-10 -j DNAT --to-destination $TWO_CHEF_IP" >> $IPTAB
   echo -e "-A OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport 8443 -m comment --comment OUTPUT-DNAT-20 -j DNAT --to-destination $TWO_CHEF_IP" >> $IPTAB
fi

echo -e "-A OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport $SASG_LOGPUSH_PORT -m comment --comment OUTPUT-DNAT-30 -j DNAT --to-destination $TWO_LOGPUSH_IP" >> $IPTAB
if [[ ! -z "$EE_IP" ]]; then
# add output rule for kafka
echo -e "-A OUTPUT -d ${SASGVIP}/32 -p tcp -m tcp --dport ${KAFKA_PORT} -m comment --comment OUTPUT-DNAT-40 -j DNAT --to-destination $TWO_EE_IP" >> $IPTAB
fi

RN=30
echo -e "\n# TO ALLOW COMMUNICATION BETWEEN SASG_HOST AND TOOLS" >> $IPTAB
if [[ "$DOCKER_HOST" =~ ^10\. ]];then
   echo -e "-A PREROUTING -s $TWO_TOOLS_SUBNET -d ${ONE_DOCKER_HOST}/32 -i ${VPN_IFACE} -m comment --comment DST-NAT-${RN} -j NETMAP --to ${HOST_ONLY_GW}/32" >> $IPTAB 
else
   echo -e "-A PREROUTING -s $TWO_TOOLS_SUBNET -d ${DOCKER_HOST}/32 -i ${VPN_IFACE} -m comment --comment DST-NAT-${RN} -j NETMAP --to ${HOST_ONLY_GW}/32" >> $IPTAB 
fi

if [[ "$TEN_SUBNET" = true ]];then
   ((RN=RN+10))
   echo -e "\n# IF (SRC=2.TOOLS_SUBNET & DST=1.ENDPOINT) THEN DNAT=10." >> $IPTAB
   echo -e "-A PREROUTING -s $TWO_TOOLS_SUBNET -d 1.0.0.0/8 -i $SASG_VPNIF -m comment --comment DST-NAT-${RN} -j NETMAP --to 10.0.0.0/8" >> $IPTAB
   #IAMaaS section
   if [[ "$IAMaaS" == "YES" ]]; then
      IAMAAS_SUBNETS=(${IAMAAS_PRIMARY_SUBNET} ${IAMAAS_PORTABLE_SUBNET})
      echo -e "\n#IF (SRC=2.IAMAAS & DST=1.ENDPOINTS) THEN DNAT=ENDPOINTS" >> $IPTAB
      for IAMAAS_SUBNET in "${IAMAAS_SUBNETS[@]}"
      do
       TWO_IAMAAS_SUBNET=2.$(echo $IAMAAS_SUBNET | cut -d"." -f2-4)
       ((RN=RN+10))
       echo -e "-A PREROUTING -s $TWO_IAMAAS_SUBNET -d 1.0.0.0/8 -i $SASG_VPNIF -m comment --comment DST-NAT-${RN} -j NETMAP --to 10.0.0.0/8" >> $IPTAB
      done
   fi
   #end IAMaaS section
fi # if [[ "$TEN_SUBNET" = true ...

if [[ ! -z "$CHEF_IP" ]]; then
   echo -e "\n# IF (SRC=ENDPOINT & DST=SASG:${CHEF_PORT[@]}) THEN DNAT=2.CHEF" >> $IPTAB
   for CPORT in "${CHEF_PORT[@]}"
   do
      ((RN=RN+10))
      echo -e "-A PREROUTING -s ${HOST_ONLY_GW}/32 -d ${SASGVIP}/32  -p tcp -m tcp --dport $CPORT -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $TWO_CHEF_IP" >> $IPTAB 
      ((RN=RN+10))
      echo -e "-A PREROUTING -s $ALL_SUBNETS -d ${SASGVIP}/32 -i $SASG_NWIF -p tcp -m tcp --dport $CPORT -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $TWO_CHEF_IP" >> $IPTAB
   done
fi

if [[ ! -z "$EE_IP" ]]; then
   # add nats for EE Kafka
   echo -e "\n# IF (SRC=ENDPOINT & DST=SASG:${KAFKA_PORT}) THEN DNAT=2.EE" >> $IPTAB
   ((RN=RN+10))
   echo -e "-A PREROUTING -s ${HOST_ONLY_GW}/32 -d ${SASGVIP}/32  -p tcp -m tcp --dport $KAFKA_PORT -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $TWO_EE_IP" >> $IPTAB 
   ((RN=RN+10))
   echo -e "-A PREROUTING -s $ALL_SUBNETS -d ${SASGVIP}/32 -i $SASG_NWIF -p tcp -m tcp --dport $KAFKA_PORT -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $TWO_EE_IP" >> $IPTAB
fi

#IAMaaS section
if [[ "$IAMaaS" == "YES" ]]; then
   ((RN=RN+10))
   echo -e "\n#IF (SRC=ENDPOINT & DST=SASG:443) THEN DNAT=2.LB_JUNCTION:443" >> $IPTAB
   echo -e "-A PREROUTING -s $ALL_SUBNETS -d ${SASGVIP2}/32 -i $SASG_NWIF -p tcp -m tcp --dport 443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $TWO_LB_JUNCTION" >> $IPTAB
   ((RN=RN+10))
   echo -e "\n#IF (SRC=ENDPOINT & DST=SASG:9443) THEN DNAT=2.LB_JUNCTION:9443" >> $IPTAB
   echo -e "-A PREROUTING -s $ALL_SUBNETS -d ${SASGVIP2}/32 -i $SASG_NWIF -p tcp -m tcp --dport 9443 -m comment --comment DST-NAT-${RN} -j DNAT --to-destination $TWO_LB_JUNCTION" >> $IPTAB
fi
echo -e "-A POSTROUTING -j SASG_PRE_SNAT_HOOK"  >>$IPTAB
RN=0
echo -e "\n# TO ALLOW COMMUNICATION BETWEEN SASG_HOST AND TOOLS" >> $IPTAB
((RN=RN+10))
echo -e "-A POSTROUTING -s $TWO_TOOLS_SUBNET -d  ${HOST_ONLY_GW}/32  -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${SASGVIP}" >>$IPTAB

((RN=RN+10))
echo -e "\n# IF (SRC=2.TOOLS_SUBNET & DST=ENDPOINT) THEN SNAT=SASG" >> $IPTAB
echo -e "-A POSTROUTING -s $TWO_TOOLS_SUBNET -d $ALL_SUBNETS -o $SASG_NWIF -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${SASGVIP}" >>$IPTAB

#IAMaaS section
if [[ "$IAMaaS" == "YES" ]]; then
  IAMAAS_SUBNETS=(${IAMAAS_PRIMARY_SUBNET} ${IAMAAS_PORTABLE_SUBNET})
  echo -e "\n#IF (SRC=2.IAMAAS & DST=ENDPOINTS) THEN SNAT=SASG" >> $IPTAB
  for IAMAAS_SUBNET in "${IAMAAS_SUBNETS[@]}"
  do
    TWO_IAMAAS_SUBNET=2.$(echo $IAMAAS_SUBNET | cut -d"." -f2-4)
    ((RN=RN+10))
    echo -e "-A POSTROUTING -s $TWO_IAMAAS_SUBNET -d $ALL_SUBNETS -o $SASG_NWIF -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${SASGVIP2}" >>$IPTAB
  done
fi
#end IAMaaS section

if [[ ! -z "$EE_IP" ]]; then
   # src nat for nginx
   ((RN=RN+10))
   # fix added so proper source ip gets set if the sasg VIP is not a 10dot
   if [[ "$SASGVIP" =~ ^10\. ]];then
      echo -e "\n# IF (SRC=SASG Service & DST=2.TOOLS_SUBNET) THEN SNAT=1.vip" >> $IPTAB
      echo -e "-A POSTROUTING -d $TWO_TOOLS_SUBNET -p tcp -m tcp --dport 3333 -o $SASG_VPNIF -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${ONE_SASGVIP}" >>$IPTAB
      ((RN=RN+10))
      echo -e "-A POSTROUTING -d $TWO_TOOLS_SUBNET -p tcp -m tcp --dport 8443 -o $SASG_VPNIF -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${ONE_SASGVIP}" >>$IPTAB
     ((RN=RN+10))
      echo -e "-A POSTROUTING -d $TWO_TOOLS_SUBNET -p tcp -m tcp --dport 9093 -o $SASG_VPNIF -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${ONE_SASGVIP}" >>$IPTAB
   else
      echo -e "\n# IF (SRC=SASG Service & DST=2.TOOLS_SUBNET) THEN SNAT=vip" >> $IPTAB
      echo -e "-A POSTROUTING -d $TWO_TOOLS_SUBNET -p tcp -m tcp --dport 3333 -o $SASG_VPNIF -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${SASGVIP}" >>$IPTAB
      ((RN=RN+10))
      echo -e "-A POSTROUTING -d $TWO_TOOLS_SUBNET -p tcp -m tcp --dport 8443 -o $SASG_VPNIF -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${SASGVIP}" >>$IPTAB
      ((RN=RN+10))
      echo -e "-A POSTROUTING -d $TWO_TOOLS_SUBNET -p tcp -m tcp --dport 9093 -o $SASG_VPNIF -m comment --comment SRC-NAT-${RN} -j SNAT --to-source ${SASGVIP}" >>$IPTAB
   fi
fi

echo -e "\n# TO ALLOW COMMUNICATION BETWEEN SASG_HOST AND TOOLS" >> $IPTAB
((RN=RN+10))
if [[ "$DOCKER_HOST" =~ ^10\. ]];then
   echo -e "-A POSTROUTING -s ${HOST_ONLY_GW}/32 -d $TWO_TOOLS_SUBNET -o ${SASG_VPNIF} -m comment --comment SRC-NAT-${RN} -j NETMAP --to ${ONE_DOCKER_HOST}" >> $IPTAB
else
   echo -e "-A POSTROUTING -s ${HOST_ONLY_GW}/32 -d $TWO_TOOLS_SUBNET -o ${SASG_VPNIF} -m comment --comment SRC-NAT-${RN} -j NETMAP --to ${DOCKER_HOST}" >> $IPTAB
fi

 # only need to put this in once..so once in, set flag so it's not set multiple times
if [[ "$TEN_SUBNET" = true ]];then
   ((RN=RN+10))
   echo -e "\n# IF (SRC=10.ENDPOINT & DST=2.TOOLS_SUBNET) THEN SNAT=1.ENDPOINT" >> $IPTAB
   echo -e "-A POSTROUTING -s 10.0.0.0/8 -d $TWO_TOOLS_SUBNET -o $SASG_VPNIF -m comment --comment SRC-NAT-${RN} -j NETMAP --to 1.0.0.0/8" >> $IPTAB
   #IAMaaS section
   if [[ "$IAMaaS" == "YES" ]]; then
      ((RN=RN+10))
      echo -e "#IF (SRC=ENDPOINT & DST=2.LB_JUNCTION) THEN SNAT=1.ENDPOINT" >> $IPTAB
      echo -e "-A POSTROUTING -s 10.0.0.0/8 -d $TWO_LB_JUNCTION/32 -o $SASG_VPNIF -m comment --comment SRC-NAT-${RN} -j NETMAP --to 1.0.0.0/8" >> $IPTAB
   fi
fi

#Nat to Docker host for VPN
if [[ "$DOCKER_HOST_NAT" == "YES" ]]; then
  case "${TUNNEL_TYPE}" in 
    "ipsec")
      VTUN_PORTS=("500" "4500")
      VPN_PROTO="udp"
      NAT_TARGET_IP="$(ifconfig eth0 | grep 'inet addr' | cut -d: -f2 | awk '{print $1}')"
      IFACE_FILTER=""
      ;;
    "openvpn") 
      ;&
    *)
      if [[ -z "${VTUN_PORT[$INDEX]}" ]];then
        VTUN_PORT=("${VTUN_PORT[0]}")
      else
        VTUN_PORT=("${VTUN_PORT[$ARRAYNUM]}")
      fi
   
      [[ -z ${VTUN_PORT} ]] &&  VTUN_PORT=("1194")
      VPN_PROTO="tcp"
      NAT_TARGET_IP="DOCKER_HOST"
      IFACE_FILTER="-o eth1"
      ;;
  esac    


  for VTUN_PORT in "${VTUN_PORTS[@]}"; do
    ((RN=RN+10))  

    if [[ $ARRAYNUM == 0 ]]; then
      echo "-A POSTROUTING -d $PUBLIC_VYOS_IP/32 ${IFACE_FILTER} -p "${VPN_PROTO}" -m "${VPN_PROTO}" --dport ${VTUN_PORT} -m comment --comment SRC-NAT-${RN} -j NFLOG --nflog-prefix  \"[SG_NAT-SRC-${RN}]\"" >>$IPTAB
      echo "-A POSTROUTING -d $PUBLIC_VYOS_IP/32 ${IFACE_FILTER} -p "${VPN_PROTO}" -m "${VPN_PROTO}" --dport ${VTUN_PORT} -m comment --comment SRC-NAT-${RN} -j SNAT --to-source $NAT_TARGET_IP" >> $IPTAB
    else
      if [[ -n ${PORTABLE_VTUN_CIDR[$ARRAYNUM]} ]]; then
        NAT_DEST="${PORTABLE_VTUN_CIDR[$ARRAYNUM]}"
      else
        NAT_DEST="${PUBLIC_VYOS_IP}"
      fi
      echo "-A POSTROUTING -d ${NAT_DEST} ${IFACE_FILTER} -p "${VPN_PROTO}" -m "${VPN_PROTO}" --dport ${VTUN_PORT} -m comment --comment SRC-NAT-${RN} -j NFLOG --nflog-prefix  \"[SG_NAT-SRC-${RN}]\"" >>$IPTAB
      echo "-A POSTROUTING -d ${NAT_DEST} ${IFACE_FILTER} -p "${VPN_PROTO}" -m "${VPN_PROTO}" --dport ${VTUN_PORT} -m comment --comment SRC-NAT-${RN} -j SNAT --to-source $NAT_TARGET_IP" >> $IPTAB
    fi
  done
fi
#########################

echo -e "-A SASG_PRE_DNAT_HOOK -j RETURN" >>$IPTAB
echo -e "-A SASG_PRE_SNAT_HOOK -j RETURN" >>$IPTAB

echo -e "COMMIT\n" >> $IPTAB

# get all interface names except for vtun & vti
#NICS=$(ip -f inet addr |grep "^[0-9]:"|egrep -v "lo:| vtun| vti" | awk -F': ' '{print $2}')
# 3.1.07 - new way of getting all NICs - handles interface names with . (dot) in them:
NICS=$(ip -f inet -o address | egrep -v " lo| vtun| vti" | awk '{print $2}'|sort|uniq)

# add in new filter lines
cat >> $IPTAB << EOL
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
EOL

# add in entries for all interfaces  other than vpn
for NIC in $NICS
do
cat >> $IPTAB <<EOL
:${NIC}_IN - [0:0]
:${NIC}_LOCAL - [0:0]
:${NIC}_OUT - [0:0]
EOL
done

# add in VPN interface, hooks & tunnel-in filter rules
cat >> $IPTAB << EOL
:VPN_IN - [0:0]
:SASG_FW_IN_HOOK - [0:0]
:SASG_FW_LOCAL_HOOK - [0:0]
:SASG_FW_OUT_HOOK - [0:0]
:SASG_POST_FW_FWD_HOOK - [0:0]
:SASG_POST_FW_IN_HOOK - [0:0]
:SASG_POST_FW_OUT_HOOK - [0:0]
:SASG_PRE_FW_FWD_HOOK - [0:0]
:SASG_PRE_FW_IN_HOOK - [0:0]
:SASG_PRE_FW_OUT_HOOK - [0:0]
-A INPUT -j SASG_PRE_FW_IN_HOOK
-A INPUT -j SASG_FW_LOCAL_HOOK
-A INPUT -j SASG_POST_FW_IN_HOOK
-A FORWARD -j SASG_PRE_FW_FWD_HOOK
-A FORWARD -j SASG_FW_IN_HOOK
-A FORWARD -j SASG_FW_OUT_HOOK
-A FORWARD -j SASG_POST_FW_FWD_HOOK
-A OUTPUT -j SASG_PRE_FW_OUT_HOOK
-A OUTPUT -j SASG_POST_FW_OUT_HOOK
EOL

# if ORIGINALFILTERLINES file exists, add in those entries to the new iptab file
if [[ -f "$ORIGINALFILTERLINES" ]];then
  cat $ORIGINALFILTERLINES >> $IPTAB
fi

# add in logging rules for all NICs other than vpn tunnels
for NIC in $NICS
do
cat >> $IPTAB <<EOL
-A ${NIC}_IN -m comment --comment ${NIC}_IN-10 -m state --state ESTABLISHED -j RETURN
EOL

if [[ ! -z "$EE_IP" ]]; then 
cat >> $IPTAB <<EOL
# allow endpoints to chef
-A ${NIC}_IN -m comment --comment ${NIC}_IN-30 -m set --match-set CUST_ENDPOINTS src -m set --match-set CDS_CHEF dst -m set --match-set ENDPOINTS_CDS_CHEF dst -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_IN-30-A]"
-A ${NIC}_IN -m comment --comment ${NIC}_IN-30 -m set --match-set CUST_ENDPOINTS src -m set --match-set CDS_CHEF dst -m set --match-set ENDPOINTS_CDS_CHEF dst -j RETURN
# allow endpoints to kafka
-A ${NIC}_IN -m comment --comment ${NIC}_IN-30 -m set --match-set CUST_ENDPOINTS src -m set --match-set 2EE_IP dst -m set --match-set ENDPOINTS_CDS_EE_KAFKA dst -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_IN-30-A]"
-A ${NIC}_IN -m comment --comment ${NIC}_IN-30 -m set --match-set CUST_ENDPOINTS src -m set --match-set 2EE_IP dst -m set --match-set ENDPOINTS_CDS_EE_KAFKA dst -j RETURN
EOL
fi

if [[ "$IAMaaS" == "YES" ]]; then
   # allow endpoints to iamaas
   echo -e "-A ${NIC}_IN -m comment --comment ${NIC}_IN-40 -m set --match-set CUST_ENDPOINTS src -m set --match-set SASG_IAMaaS_VIP2 dst -m set --match-set ENDPOINTS_IAMaaS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_${NIC}_IN-40-A]\"" >> $IPTAB
   echo -e "-A ${NIC}_IN -m comment --comment ${NIC}_IN-40 -m set --match-set CUST_ENDPOINTS src -m set --match-set SASG_IAMaaS_VIP2 dst -m set --match-set ENDPOINTS_IAMaaS dst -j RETURN" >> $IPTAB
fi # if [ "$IAMaaS" == "YES" ]

cat >> $IPTAB <<EOL
# add in ${NIC}_IN default reject filter
# for testing in native sasg deploy - commented out default-reject, added accept with log - in testing native deploy can then see what would normally get rejected. 
### -A ${NIC}_IN -m comment --comment ${NIC}_IN-default-R -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_IN-default-R]"
### -A ${NIC}_IN -m comment --comment ${NIC}_IN-default-R -j REJECT --reject-with icmp-port-unreachable
-A ${NIC}_IN -m comment --comment ${NIC}_IN-default-A -j RETURN

-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-10 -m state --state ESTABLISHED -j RETURN

EOL

if [[ ! -z "$EE_IP" ]]; then 
cat >> $IPTAB <<EOL
# allow 2.ee to active sasg
-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-20 -m set --match-set 2EE_IP src -m set --match-set SASG_CC_VIP1 dst -m set --match-set EE_TO_SASG dst -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_LOCAL-10-A]"
-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-20 -m set --match-set 2EE_IP src -m set --match-set SASG_CC_VIP1 dst -m set --match-set EE_TO_SASG dst -j RETURN
# allow ee to passive sasg
-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-30 -m set --match-set SASG_CC_VIP1 src -m set --match-set SASG_Physical_IPs dst -m set --match-set EE_TO_SASG dst -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_LOCAL-30-A]"
-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-30 -m set --match-set SASG_CC_VIP1 src -m set --match-set SASG_Physical_IPs dst -m set --match-set EE_TO_SASG dst -j RETURN

# allow docker_host to nginx
-A eth0_LOCAL -m comment --comment eth0_LOCAL-40+ -m set --match-set HOST_ONLY src -m set --match-set SASG_CC_VIP1 dst -m set --match-set ENDPOINTS_CDS_EE dst -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_eth0_LOCAL-40+-A]"
-A eth0_LOCAL -m comment --comment eth0_LOCAL-40+ -m set --match-set HOST_ONLY src -m set --match-set SASG_CC_VIP1 dst -m set --match-set ENDPOINTS_CDS_EE dst -j RETURN

# allow endpoints to nginx
-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-40 -m set --match-set CUST_ENDPOINTS src -m set --match-set SASG_CC_VIP1 dst -m set --match-set ENDPOINTS_CDS_EE dst -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_LOCAL-40-A]"
-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-40 -m set --match-set CUST_ENDPOINTS src -m set --match-set SASG_CC_VIP1 dst -m set --match-set ENDPOINTS_CDS_EE dst -j RETURN
EOL
fi

cat >> $IPTAB <<EOL
# allow sasg ips to ping JH VIPS
-A ${NIC}_LOCAL -p icmp -m icmp --icmp-type 8 -m comment --comment ${NIC}_LOCAL-50 -m set --match-set SASG_IPS src -m set --match-set SASG_VIPS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_LOCAL-50-A]"
-A ${NIC}_LOCAL -p icmp -m icmp --icmp-type 8 -m comment --comment ${NIC}_LOCAL-50 -m set --match-set SASG_IPS src -m set --match-set SASG_VIPS dst -j RETURN

#
-A ${NIC}_LOCAL -p icmp -m comment --comment ${NIC}_LOCAL-60 -m set --match-set HOST_ONLY src -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_LOCAL-50-A]"
-A ${NIC}_LOCAL -p icmp -m comment --comment ${NIC}_LOCAL-60 -m set --match-set HOST_ONLY src -j RETURN

# add in ${NIC}_LOCAL default reject filter
# for testing in native sasg deploy - commented out default-reject, added accept with log - in testing native deploy can then see what would normally get rejected. 
#-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-default-R -j NFLOG --nflog-prefix "[SG_${NIC}_LOCAL-default-R]"
-A ${NIC}_LOCAL -m comment --comment ${NIC}_LOCAL-default-R -j REJECT --reject-with icmp-port-unreachable

#-A ${NIC}_OUT -m comment --comment "${NIC}_OUT-10000 default-action accept" -j NFLOG -m limit --limit 1/sec --nflog-prefix "[SG_${NIC}_OUT-default-A]"
-A ${NIC}_OUT -m comment --comment "${NIC}_OUT-10000 default-action accept" -j RETURN
EOL
done # for NIC in $NICS

RN=10
#-A VPN_IN -m comment --comment VPN_IN-10 -m state --state ESTABLISHED -j NFLOG --nflog-prefix "[SG_VPN_IN-10-A] "
echo -e "-A VPN_IN -m comment --comment VPN_IN-${RN} -m state --state ESTABLISHED -j RETURN" >> $IPTAB

RN=20
echo -e "-A VPN_IN -p icmp -m icmp --icmp-type 8 -m comment --comment VPN_IN-${RN} -m set --match-set CUST_ENDPOINTS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
echo -e "-A VPN_IN -p icmp -m icmp --icmp-type 8 -m comment --comment VPN_IN-${RN} -m set --match-set CUST_ENDPOINTS dst -j RETURN" >> $IPTAB

if [[ ! -z "$EE_IP" ]]; then
RN=25
echo -e "\n# TO ALLOW COMMUNICATION BETWEEN SASG_HOST AND TOOLS" >> $IPTAB
echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_EE src -m set --match-set HOST_ONLY dst -m set --match-set EE_TO_CUST_ENDPOINTS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_EE src -m set --match-set HOST_ONLY dst -m set --match-set EE_TO_CUST_ENDPOINTS dst -j RETURN" >> $IPTAB

RN=30
echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_EE src -m set --match-set CUST_ENDPOINTS dst -m set --match-set EE_TO_CUST_ENDPOINTS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_EE src -m set --match-set CUST_ENDPOINTS dst -m set --match-set EE_TO_CUST_ENDPOINTS dst -j RETURN" >> $IPTAB

RN=40
echo -e "-A VPN_IN -p udp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_EE src -m set --match-set CUST_DNS dst -m set --match-set EE_TO_CUST_DNS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
echo -e "-A VPN_IN -p udp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_EE src -m set --match-set CUST_DNS dst -m set --match-set EE_TO_CUST_DNS dst -j RETURN" >> $IPTAB
fi

if [[ ! -z "$CHEF_IP" ]]; then 
RN=50
echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_CHEF src -m set --match-set CUST_LDAP dst -m set --match-set EE_TO_CUST_LDAP dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_CHEF src -m set --match-set CUST_LDAP dst -m set --match-set EE_TO_CUST_LDAP dst -j RETURN" >> $IPTAB
fi

# if rcp_bpm is defined & bigfix is on customer premise, allow rcp to bigfix 
if [[ ! -z "$RCP_BPM_IP" ]];then
 if [[ ! -z "${CUSTPREM_BIGFIX_IP[$ARRAYNUM]}" ]]; then
    RN=60
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_RCP_BPM src -m set --match-set CUSTPREM_BIGFIX dst -m set --match-set CDS_TO_CUSTPREM_BIGFIX dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_RCP_BPM src -m set --match-set CUSTPREM_BIGFIX dst -m set --match-set CDS_TO_CUSTPREM_BIGFIX dst -j RETURN" >> $IPTAB
  fi
fi

# if rcp_bpm is defined & bigfix is on customer premise, allow rcp to bigfix 
if [[ ! -z "$RCP_ROR_IP" ]];then
 if [[ ! -z "${CUSTPREM_BIGFIX_IP[$ARRAYNUM]}" ]]; then
    RN=70
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_RCP_ROR src -m set --match-set CUSTPREM_BIGFIX dst -m set --match-set CDS_TO_CUSTPREM_BIGFIX dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_RCP_ROR src -m set --match-set CUSTPREM_BIGFIX dst -m set --match-set CDS_TO_CUSTPREM_BIGFIX dst -j RETURN" >> $IPTAB
  fi
fi

# QUESTION - rcp-bpm to ldap was allowed before but not  in new rule list.
#if [ -n "${RCP_BPM_IP}" ]; then
#  ((RN=RN+10))
#  echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_RCP_BPM src -m set --match-set CUST_LDAP dst -m set --match-set RCP_BPM_TO_CUST_LDAP dst -j NFLOG --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
#  echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_RCP_BPM src -m set --match-set CUST_LDAP dst -m set --match-set RCP_BPM_TO_CUST_LDAP dst -j RETURN" >> $IPTAB
#fi

# let's allow CSC incl case for multi-sasg
if [[ ! -z "${CSC_IWSD_IP1[0]}" ]] || [[ ! -z "${CSC_IWSD_IP2[0]}" ]];then
RN=70
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_CSC src -m set --match-set CUSTPREM_CSC_IWSD dst -m set --match-set CDS_TO_CUSTPREM_CSC_IWSD dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-60-A] \"" >> $IPTAB
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_CSC src -m set --match-set CUSTPREM_CSC_IWSD dst -m set --match-set CDS_TO_CUSTPREM_CSC_IWSD dst -j RETURN" >> $IPTAB
fi
if [[ ! -z "${CSC_IWSZ_IP1[0]}" ]] || [[ ! -z "${CSC_IWSZ_IP2[0]}" ]];then
RN=80
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_CSC src -m set --match-set CUSTPREM_CSC_IWSZ dst -m set --match-set CDS_TO_CUSTPREM_CSC_IWSZ dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-60-A] \"" >> $IPTAB
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_CSC src -m set --match-set CUSTPREM_CSC_IWSZ dst -m set --match-set CDS_TO_CUSTPREM_CSC_IWSZ dst -j RETURN" >> $IPTAB
fi
if [[ ! -z "${CSC_BMC_IP1[0]}" ]] || [[ ! -z "${CSC_BMC_IP2[0]}" ]];then
RN=90
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_CSC src -m set --match-set CUSTPREM_CSC_BMC dst -m set --match-set CDS_TO_CUSTPREM_CSC_BMC dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-60-A] \"" >> $IPTAB
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_CSC src -m set --match-set CUSTPREM_CSC_BMC dst -m set --match-set CDS_TO_CUSTPREM_CSC_BMC dst -j RETURN" >> $IPTAB
fi

# if ASB ip is defined, add rule to allow ASB connectivity to customer endpoints, vcenter, and if on custprem, bigfix.
if [[ ! -z "${ASB_IP}" ]]; then
  # allow asb to cust endpoints on specific ports
  RN=100
  echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUST_ENDPOINTS dst -m set --match-set ASB_TO_CUST_ENDPOINTS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
  echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUST_ENDPOINTS dst -m set --match-set ASB_TO_CUST_ENDPOINTS dst -j RETURN" >> $IPTAB

  # allow asb to cust dns on specific ports
  RN=110
  echo -e "-A VPN_IN -p udp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUST_DNS dst -m set --match-set ASB_TO_CUST_DNS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
  echo -e "-A VPN_IN -p udp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUST_DNS dst -m set --match-set ASB_TO_CUST_DNS dst -j RETURN" >> $IPTAB

  # allow asb to cust ldap
  RN=120
  echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUST_LDAP dst -m set --match-set EE_TO_CUST_LDAP dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
  echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUST_LDAP dst -m set --match-set EE_TO_CUST_LDAP dst -j RETURN" >> $IPTAB


  if [[ ! -z "${VCENTER_IP[0]}" ]]; then
    # allow asb to cust vcenter on specific ports
    RN=130
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUSTPREM_VCENTER dst -m set --match-set ASB_TO_VCENTER dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUSTPREM_VCENTER dst -m set --match-set ASB_TO_VCENTER dst -j RETURN" >> $IPTAB
  fi

   # if bigfix is on customer premise, allow asb to bigfix
   if [[ ! -z "${CUSTPREM_BIGFIX_IP[$ARRAYNUM]}" ]]; then
     RN=140
     echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUSTPREM_BIGFIX dst -m set --match-set CDS_TO_CUSTPREM_BIGFIX dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
     echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_ASB src -m set --match-set CUSTPREM_BIGFIX dst -m set --match-set CDS_TO_CUSTPREM_BIGFIX dst -j RETURN" >> $IPTAB
   fi
fi # if [ ! -z "${ASB_IP}" ...


#IAMaaS section
if [[ "$IAMaaS" == "YES" ]]; then
  RN=150
  echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_SERVICE src -m set --match-set CUST_ENDPOINTS dst -m set --match-set ENDPOINTS_IAMaaS dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
  echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_SERVICE src -m set --match-set CUST_ENDPOINTS dst -m set --match-set ENDPOINTS_IAMaaS dst -j RETURN" >> $IPTAB
  #Feature 405729
  if [[ ! -z "$TDI_IP" ]]; then
     RN=160
     echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_SERVICE src -m set --match-set IAMaaS_TDI_IP dst -m set --match-set IAMaaS_TDI_PORT dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
     echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_SERVICE src -m set --match-set IAMaaS_TDI_IP dst -m set --match-set IAMaaS_TDI_PORT dst -j RETURN" >> $IPTAB
  fi
  # --- feature 441061 BEGIN ---
  if [[ -n "${IAMAAS_MS_AD_PORT}" ]] && [[ -n "${IAMAAS_MS_AD_IP}" ]]; then
    RN=170
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_SERVICE src -m set --match-set CUST_ENDPOINTS_MS_AD dst -m set --match-set ENDPOINTS_IAMaaS_MS_AD dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_SERVICE src -m set --match-set CUST_ENDPOINTS_MS_AD dst -m set --match-set ENDPOINTS_IAMaaS_MS_AD dst -j RETURN" >> $IPTAB
  fi
  if [[ -n "${IAMAAS_REMEDY_PORT}" ]] && [[ -n "${IAMAAS_REMEDY_IP}" ]]; then
    RN=200
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_SERVICE src -m set --match-set CUST_ENDPOINTS_REMEDY dst -m set --match-set ENDPOINTS_IAMaaS_REMEDY dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
    echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set IAMaaS_SERVICE src -m set --match-set CUST_ENDPOINTS_REMEDY dst -m set --match-set ENDPOINTS_IAMaaS_REMEDY dst -j RETURN" >> $IPTAB
  fi
  # --- feature 441061 END ---
fi
#end IAMaaS section


#TICKETING
if [[ ! -z "$RCP_BPM_IP" ]];then
   if [[ ! -z "${CUSTPREM_TICKETING_IP[$ARRAYNUM]}" ]]; then
      RN=220
      echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_RCP src -m set --match-set CUSTPREM_TICKETING dst -m set --match-set CDS_TO_CUSTPREM_TICKETING dst -j NFLOG -m limit --limit 1/sec --nflog-prefix \"[SG_VPN_IN-${RN}-A] \"" >> $IPTAB
      echo -e "-A VPN_IN -p tcp -m comment --comment VPN_IN-${RN} -m set --match-set CDS_RCP src -m set --match-set CUSTPREM_TICKETING dst -m set --match-set CDS_TO_CUSTPREM_TICKETING dst -j RETURN" >> $IPTAB
   fi
fi

# add in VPN_IN default reject filter
echo -e "-A VPN_IN -m comment --comment VPN_IN-default-R -j REJECT --reject-with icmp-port-unreachable" >> $IPTAB

# add in FW Hooks
cat >> $IPTAB <<EOL
-A SASG_FW_IN_HOOK -i $SASG_VPNIF -j VPN_IN
-A SASG_POST_FW_FWD_HOOK -j ACCEPT
-A SASG_POST_FW_IN_HOOK -j ACCEPT
-A SASG_POST_FW_OUT_HOOK -j ACCEPT
-A SASG_PRE_FW_FWD_HOOK -j RETURN
-A SASG_PRE_FW_IN_HOOK -j RETURN
-A SASG_PRE_FW_OUT_HOOK -j RETURN
EOL

# add in FW Hooks for all NICs other than vpn tunnels
for NIC in $NICS
do
cat >> $IPTAB <<EOL
-A SASG_FW_IN_HOOK -i ${NIC} -j ${NIC}_IN
-A SASG_FW_LOCAL_HOOK -i ${NIC} -j ${NIC}_LOCAL
-A SASG_FW_OUT_HOOK -o ${NIC} -j ${NIC}_OUT
EOL
done
echo "COMMIT" >>$IPTAB


DATE=`date`
echo -e "\n# Completed on $DATE" >> $IPTAB
#
  ###########################################################################################################
  ################################ END Iptables Config Section ##############################################
  ############ This section is to be Universal for Docker and standard JH Deploy ############################
  ###########################################################################################################

# last thing before loop is done - echo -e out whole created file
echo -e "\n--------- iptables file created for SASG $SASLOOP ($SASGIP) - $IPTAB ---------\n"
cat $IPTAB

# now create the required ipset file

# To be able to add port without duplicates
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

echo -e "\nGenerating SASG $SASLOOP ipset file: ${IPSET}..........\n"
echo -e "create CUST_ENDPOINTS hash:net family inet hashsize 1024 maxelem 65536" > $IPSET

#for SUBNET in "${CUSTOMER_SUBNETS[@]}"
####################Just for Alpine #############
for SUBNET in `echo ${CUSTOMER_SUBNETS[$ARRAYNUM]} | sed "s/ \+/\n/g"`
do
  echo -e "add CUST_ENDPOINTS ${SUBNET}" >> $IPSET
done
###############################################################

# create ipset group with sasg vip1 for rules allowing endpoints to JH for EE/Chef
#!!!!
echo -e "create SASG_CC_VIP1 hash:net family inet hashsize 1024 maxelem 65536" >> $IPSET
echo -e "add SASG_CC_VIP1 ${SASGVIP}" >> $IPSET

if [[ -n "${SASGVIP2}" ]]; then
  # create ipset group with sasg vipr for iam rules allowing endpoints to JH for IAMaaS
  echo -e "create SASG_IAMaaS_VIP2 hash:net family inet hashsize 1024 maxelem 65536" >> $IPSET
  echo -e "add SASG_IAMaaS_VIP2 ${SASGVIP2}" >> $IPSET
fi

#create ipset group for host-only network ip
echo -e "create HOST_ONLY hash:net family inet hashsize 1024 maxelem 65536" >> $IPSET
echo -e "add HOST_ONLY ${HOST_ONLY_GW}/32" >> $IPSET

if [[ ! -z "$EE_IP" ]]; then
# create group for ee to sasg ssh nic_local rule
echo -e "create EE_TO_SASG bitmap:port range 1-65535" >> $IPSET
echo -e "add EE_TO_SASG 22" >> $IPSET

echo -e "create EE_TO_CUST_ENDPOINTS bitmap:port range 1-65535" >> $IPSET
echo -e "add EE_TO_CUST_ENDPOINTS 22"  >> $IPSET
echo -e "add EE_TO_CUST_ENDPOINTS 443"  >> $IPSET
echo -e "add EE_TO_CUST_ENDPOINTS 5985"  >> $IPSET

echo -e "create ENDPOINTS_CDS_EE_KAFKA bitmap:port range 1-65535" >> $IPSET
echo -e "add ENDPOINTS_CDS_EE_KAFKA $KAFKA_PORT" >> $IPSET

echo -e "create ENDPOINTS_CDS_EE bitmap:port range 1-65535" >> $IPSET
echo -e "add ENDPOINTS_CDS_EE 3333" >> $IPSET

# add 2EE_IP for ee ssh to JH filters.
echo -e "create 2EE_IP hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
echo -e "add 2EE_IP $TWO_EE_IP" >> $IPSET

echo -e "create CDS_EE hash:ip family inet hashsize 1024 maxelem 65536"  >> $IPSET
echo -e "add CDS_EE $TWO_EE_IP"  >> $IPSET
fi

# Add list with all SASG_Physical_IPs
echo -e "create SASG_Physical_IPs hash:ip family inet hashsize 1024 maxelem 65536"  >> $IPSET
echo -e "add SASG_Physical_IPs $SASGIP"  >> $IPSET

# Add list with all JH Virtual ip's - for allowing icmp in from backup jumphost
echo -e "create SASG_VIPS hash:ip family inet hashsize 1024 maxelem 65536"  >> $IPSET
echo -e "add SASG_VIPS ${SASG_VIP1[$ARRAYNUM]}"  >> $IPSET
if [[ ! -z "${SASG_VIP2[$ARRAYNUM]}" ]];then
  echo -e "add SASG_VIPS ${SASG_VIP2[$ARRAYNUM]}"  >> $IPSET
fi
if [[ ! -z "${SASG_VIP3[$ARRAYNUM]}" ]];then
  echo -e "add SASG_VIPS ${SASG_VIP3[$ARRAYNUM]}"  >> $IPSET
fi
# Add all JH IPS for allowing icmp from backup JH
echo -e "create SASG_IPS hash:ip family inet hashsize 1024 maxelem 65536"  >> $IPSET
echo -e "add SASG_IPS ${SASG_IP_1[$ARRAYNUM]}"  >> $IPSET
if [[ ! -z "${SASG_IP_2[$ARRAYNUM]}" ]];then
  echo -e "add SASG_IPS ${SASG_IP_2[$ARRAYNUM]}"  >> $IPSET
fi

echo -e "create EE_TO_CUST_DNS bitmap:port range 1-65535" >> $IPSET
echo -e "add EE_TO_CUST_DNS 53" >> $IPSET

echo -e "create EE_TO_CUST_LDAP bitmap:port range 1-65535" >> $IPSET
for port in "${LDAP_PORT[@]}"; do
    echo -e "add EE_TO_CUST_LDAP ${port}" >> $IPSET
done

echo -e "create RCP_BPM_TO_CUST_LDAP bitmap:port range 1-65535" >> $IPSET
for port in "${LDAP_PORT[@]}"; do
    echo -e "add RCP_BPM_TO_CUST_LDAP ${port}" >> $IPSET
done

if [[ ! -z "$CHEF_IP" ]]; then
   echo -e "create CDS_CHEF hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
   echo -e "add CDS_CHEF $TWO_CHEF_IP" >> $IPSET

   echo -e "create ENDPOINTS_CDS_CHEF bitmap:port range 1-65535" >> $IPSET
   echo -e "add ENDPOINTS_CDS_CHEF 443" >> $IPSET
   echo -e "add ENDPOINTS_CDS_CHEF 8443" >> $IPSET
fi

if [[ ! -z "$BPM_IP" ]]; then
   echo -e "create CDS_BPM hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
   echo -e "add CDS_BPM $TWO_BPM_IP" >> $IPSET
fi

# if cust dns not listed, set to 9.9.9.9
if [[ -z "${DNS_IP[0]}" ]];then
  DNS_IP=1.1.1.1
fi
echo -e "create CUST_DNS hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
for DNS in "${DNS_IP[@]}"
do
  [[ ! -z "$DNS" ]] && echo -e "add CUST_DNS ${DNS}" >> $IPSET
done

# if ldap not listed, set to same as dns 0 server
if [ -z "${LDAP_IP[0]}" ];then
  LDAP_IP[0]=${DNS_IP[0]}
fi
echo -e "create CUST_LDAP hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
for LDAP in "${LDAP_IP[@]}"
do
  [[ ! -z "$LDAP" ]] && echo -e "add CUST_LDAP ${LDAP}" >> $IPSET
done

if [[ ! -z "$RCP_BPM_IP" ]]; then
  echo -e "create CDS_RCP_BPM hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
  echo -e "add CDS_RCP_BPM $TWO_RCP_BPM_IP" >> $IPSET
fi
if [[ ! -z "$RCP_ROR_IP" ]]; then
  echo -e "create CDS_RCP_ROR hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
  echo -e "add CDS_RCP_ROR $TWO_RCP_ROR_IP" >> $IPSET
fi

# if CDS ASB is defined, add ipset lists for asb server & port connectivity allowed
if [[ ! -z "${ASB_IP}" ]]; then
  echo -e "create ASB_TO_CUST_ENDPOINTS bitmap:port range 1-65535" >> $IPSET
  echo -e "add ASB_TO_CUST_ENDPOINTS 22" >> $IPSET
  echo -e "add ASB_TO_CUST_ENDPOINTS 443" >> $IPSET
  echo -e "add ASB_TO_CUST_ENDPOINTS 5985" >> $IPSET

  echo -e "create ASB_TO_CUST_DNS bitmap:port range 1-65535" >> $IPSET
  echo -e "add ASB_TO_CUST_DNS 53" >> $IPSET

  echo -e "create CDS_ASB hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
  echo -e "add CDS_ASB ${TWO_ASB_IP}" >> $IPSET
fi

# if vcenter ips are defined then add asb vcenter ipset lists
if [[ ! -z "${VCENTER_IP[0]}" ]]; then
  echo -e "create ASB_TO_VCENTER bitmap:port range 1-65535" >> $IPSET
  echo -e "add ASB_TO_VCENTER 443" >> $IPSET

  echo -e "create CUSTPREM_VCENTER hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
  for VCENTERIP in "${VCENTER_IP[@]}"
  do
    [[ ! -z "$VCENTERIP" ]] && echo -e "add CUSTPREM_VCENTER ${VCENTERIP}" >> $IPSET
  done
fi

# create set of ipset groups to support CSC if CDC_IP is defined
if [[ ! -z "$CSC_IP" ]]; then
   echo -e "create CDS_CSC hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
   CSCIP=2.$(echo $CSC_IP | cut -d"." -f2-4)
   echo -e "add CDS_CSC $CSCIP"	>>$IPSET

#   if [ $SASLOOP -eq 1 ];then
	if [[ ! -z "${CSC_IWSD_IP1[$ARRAYNUM]}" ]]; then
            echo -e "create CUSTPREM_CSC_IWSD hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
            echo -e "add CUSTPREM_CSC_IWSD ${CSC_IWSD_IP1[$ARRAYNUM]}" >> $IPSET
	fi
	if [[ ! -z "${CSC_IWSD_IP2[$ARRAYNUM]}" ]]; then
            echo -e "add CUSTPREM_CSC_IWSD ${CSC_IWSD_IP2[$ARRAYNUM]}" >> $IPSET
	fi
	if [[ ! -z "${CSC_IWSZ_IP1[$ARRAYNUM]}" ]]; then
                echo -e "create CUSTPREM_CSC_IWSZ hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
                echo -e "add CUSTPREM_CSC_IWSZ ${CSC_IWSZ_IP1[$ARRAYNUM]}" >> $IPSET
	fi
	if [[ ! -z "${CSC_IWSZ_IP2[$ARRAYNUM]}" ]]; then
                echo -e "add CUSTPREM_CSC_IWSZ ${CSC_IWSZ_IP2[$ARRAYNUM]}" >> $IPSET
	fi
	if [[ ! -z "${CSC_BMC_IP1[$ARRAYNUM]}" ]]; then
                echo -e "create CUSTPREM_CSC_BMC hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
                echo -e "add CUSTPREM_CSC_BMC ${CSC_BMC_IP1[$ARRAYNUM]}" >> $IPSET
	fi
	if [[ ! -z "${CSC_BMC_IP2[$ARRAYNUM]}" ]]; then
                echo -e "add CUSTPREM_CSC_BMC ${CSC_BMC_IP2[$ARRAYNUM]}" >> $IPSET
	fi

  echo -e "create CDS_TO_CUSTPREM_CSC_IWSD bitmap:port range 1-65535" >> $IPSET
  [[ ! -z "$CSC_IWSD_BOOTPORT" ]] && echo -e "add CDS_TO_CUSTPREM_CSC_IWSD $CSC_IWSD_BOOTPORT" >> $IPSET
  [[ ! -z "$CSC_IWSD_HTTPSPORT" ]] && echo -e "add CDS_TO_CUSTPREM_CSC_IWSD $CSC_IWSD_HTTPSPORT" >> $IPSET
  [[ ! -z "$CSC_IWSD_CSI_AUTHPORT" ]] && echo -e "add CDS_TO_CUSTPREM_CSC_IWSD $CSC_IWSD_CSI_AUTHPORT" >> $IPSET
  [[ ! -z "$CSC_IWSD_ADM_SECPORT" ]] && echo -e "add CDS_TO_CUSTPREM_CSC_IWSD $CSC_IWSD_ADM_SECPORT" >> $IPSET

  echo -e "create CDS_TO_CUSTPREM_CSC_IWSZ bitmap:port range 1-65535" >> $IPSET
  [[ ! -z "$CSC_IWSZ_SERVOPTSPORT" ]] && echo -e "add CDS_TO_CUSTPREM_CSC_IWSZ $CSC_IWSZ_SERVOPTSPORT" >> $IPSET
  [[ ! -z "$CSC_IWSZ_DWC_BOOTPORT" ]] && echo -e "add CDS_TO_CUSTPREM_CSC_IWSZ $CSC_IWSZ_DWC_BOOTPORT" >> $IPSET

  echo -e "create CDS_TO_CUSTPREM_CSC_BMC bitmap:port range 1-65535" >> $IPSET
  [[ ! -z "$CSC_BMC_REST_APIPORT" ]] && echo -e "add CDS_TO_CUSTPREM_CSC_BMC $CSC_BMC_REST_APIPORT" >> $IPSET
  [[ ! -z "$CSC_BMC_COBRASERVPORT" ]] && echo -e "add CDS_TO_CUSTPREM_CSC_BMC $CSC_BMC_COBRASERVPORT" >> $IPSET

fi # if [ ! -z "$CSC_IP ....

# if bigfix on customer premise, set up ipset rules for bigfix
if [[ ! -z "${CUSTPREM_BIGFIX_IP[$ARRAYNUM]}" ]]; then
  echo -e "create CUSTPREM_BIGFIX hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
  echo -e "add CUSTPREM_BIGFIX ${CUSTPREM_BIGFIX_IP[$ARRAYNUM]}" >> $IPSET

  echo -e "create CDS_TO_CUSTPREM_BIGFIX bitmap:port range 1-65535" >> $IPSET
  if [[ -z "${CUSTPREM_BIGFIX_PORT[$ARRAYNUM]}" ]];then
    echo -e "add CDS_TO_CUSTPREM_BIGFIX 52311" >> $IPSET
    echo -e "add CDS_TO_CUSTPREM_BIGFIX 443" >> $IPSET
  else
    echo -e "add CDS_TO_CUSTPREM_BIGFIX ${CUSTPREM_BIGFIX_PORT[$ARRAYNUM]}" >> $IPSET
    echo -e "add CDS_TO_CUSTPREM_BIGFIX 443" >> $IPSET
  fi
fi

# if ticketing on customer premise, set up ipset rules for ticketing
if [[ ! -z "${CUSTPREM_TICKETING_IP[$ARRAYNUM]}" ]]; then
  echo -e "create CUSTPREM_TICKETING hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
  echo -e "add CUSTPREM_TICKETING ${CUSTPREM_TICKETING_IP[$ARRAYNUM]}" >> $IPSET

  echo -e "create CDS_TO_CUSTPREM_TICKETING bitmap:port range 1-65535" >> $IPSET
  if [[ -z "${CUSTPREM_TICKETING_PORT[$ARRAYNUM]}" ]];then
     echo -e "add CDS_TO_CUSTPREM_TICKETING 443" >> $IPSET
  else
     echo -e "add CDS_TO_CUSTPREM_TICKETING ${CUSTPREM_TICKETING_PORT[$ARRAYNUM]}" >> $IPSET
  fi

fi

#IAMaaS section
if [[ "$IAMaaS" == "YES" ]]; then
   #Feature 405729
   if [[ -n "$TDI_IP" ]]; then
	  echo -e "create IAMaaS_TDI_IP hash:ip family inet hashsize 1024 maxelem 65536" >> $IPSET
	  echo -e "create IAMaaS_TDI_PORT bitmap:port range 1-65535" >> $IPSET
      echo -e "add IAMaaS_TDI_IP $TDI_IP"  >> $IPSET
	  if [[ -z "$TDI_PORT" ]]; then
	      TDI_PORT=1099
	  fi
      echo -e "add IAMaaS_TDI_PORT $TDI_PORT"  >> $IPSET
   fi

  # feature 416603
  # Add port via append function to avoid duplicates
  ENDPOINT_IAMAAS_PORTS=()
  [[ -z "${TDI_IP}" ]] && ENDPOINT_IAMAAS_PORTS=($(append_port 22 "${ENDPOINT_IAMAAS_PORTS[@]}"))
  ENDPOINT_IAMAAS_PORTS=($(append_port 443 "${ENDPOINT_IAMAAS_PORTS[@]}"))
  ENDPOINT_IAMAAS_PORTS=($(append_port 9443 "${ENDPOINT_IAMAAS_PORTS[@]}"))
  ENDPOINT_IAMAAS_PORTS=($(append_port 45580 "${ENDPOINT_IAMAAS_PORTS[@]}"))
  [[ -n "${IAMAAS_DATABASE_PORT}" ]] && ENDPOINT_IAMAAS_PORTS=($(append_port "${IAMAAS_DATABASE_PORT}" "${ENDPOINT_IAMAAS_PORTS[@]}"))
  [[ -n "${IAMAAS_MS_SQL_PORT}" ]] && ENDPOINT_IAMAAS_PORTS=($(append_port "${IAMAAS_MS_SQL_PORT}" "${ENDPOINT_IAMAAS_PORTS[@]}"))
  [[ -n "${IAMAAS_STORAGE_PORT}" ]] && ENDPOINT_IAMAAS_PORTS=($(append_port "${IAMAAS_STORAGE_PORT}" "${ENDPOINT_IAMAAS_PORTS[@]}"))

  echo -e "create ENDPOINTS_IAMaaS bitmap:port range 1-65535" >> $IPSET
  for endpoint_iamaas_port in "${ENDPOINT_IAMAAS_PORTS[@]}"; do
    echo -e "add ENDPOINTS_IAMaaS ${endpoint_iamaas_port}"  >> $IPSET
  done

   echo -e "create IAMaaS_SERVICE hash:net family inet hashsize 1024 maxelem 65536" >> $IPSET
   IAMAAS_SUBNETS=(${IAMAAS_PRIMARY_SUBNET} ${IAMAAS_PORTABLE_SUBNET})
   for IAMAAS_SUBNET in "${IAMAAS_SUBNETS[@]}"
   do
     TWO_IAMAAS_SUBNET=2.$(echo $IAMAAS_SUBNET | cut -d"." -f2-4)
     echo -e "add IAMaaS_SERVICE $TWO_IAMAAS_SUBNET"  >> $IPSET
   done

  # feature 441061
  if [[ -n "${IAMAAS_MS_AD_PORT}" ]] && [[ -n "${IAMAAS_MS_AD_IP}" ]]; then
    echo -e "create ENDPOINTS_IAMaaS_MS_AD bitmap:port range 1-65535" >> $IPSET
    echo -e "add ENDPOINTS_IAMaaS_MS_AD ${IAMAAS_MS_AD_PORT}"  >> $IPSET
    echo -e "create CUST_ENDPOINTS_MS_AD hash:net family inet hashsize 1024 maxelem 65536" >> $IPSET
    echo -e "add CUST_ENDPOINTS_MS_AD ${IAMAAS_MS_AD_IP}"  >> $IPSET
  fi

  if [[ -n "${IAMAAS_REMEDY_PORT}" ]] && [[ -n "${IAMAAS_REMEDY_IP}" ]]; then
    echo -e "create ENDPOINTS_IAMaaS_REMEDY bitmap:port range 1-65535" >> $IPSET
    echo -e "add ENDPOINTS_IAMaaS_REMEDY ${IAMAAS_REMEDY_PORT}"  >> $IPSET
    echo -e "create CUST_ENDPOINTS_REMEDY hash:net family inet hashsize 1024 maxelem 65536" >> $IPSET
    echo -e "add CUST_ENDPOINTS_REMEDY ${IAMAAS_REMEDY_IP}"  >> $IPSET
  fi
fi
#end IAMaaS section

echo -e "\n--------- ipset file created for SASG $SASLOOP ($SASGIP) - $IPSET ---------\n"
cat $IPSET

# --- Set docker ipvlan network's as default gateway -------------------------------------
  ip route delete default
  ip route add default via "${IPVLAN_GW}" dev eth1
# ----------------------------------------------------------------------------------------


