#!/bin/bash

source ./vars
source ./sasg_common.sh
UNIQUE_1ST_OCTETS=$(echo $IAMAAS_MAPPING | sed "s/[0-9]*;//g")
SECRET=$(cat $SAS_IPSECPSK_DIR_IAM/ipsecpsk.${JUNIPER_VPN_IP})
echo -e "########################################################################"
echo -e "# The next rules must be applied                                       #"
for OCTET in ${UNIQUE_1ST_OCTETS}; do
   echo -e "set security address-book global address ${OCTET}-0-0-0_8 $OCTET.0.0.0/8"
done
echo -e "set security address-book global address SASFW-${IAMAAS_IPSEC_DESCR} ${PRIVATE_VYOS_IP}/32"
for OCTET in ${UNIQUE_1ST_OCTETS}; do
   echo -e "set security address-book global address-set CUSTOMER_SUBNETS address ${OCTET}-0-0-0_8"
done
echo -e "set security address-book global address-set CUSTOMER_SUBNETS address SASFW-${IAMAAS_IPSEC_DESCR}"

echo -e "set interfaces st0.<REPLACE BY CORRECT NUMBER OF UNIT> family inet"
echo -e "set interfaces st0.<REPLACE BY CORRECT NUMBER OF UNIT> description VPN-to-${IAMAAS_IPSEC_DESCR}"
echo -e "set security zones security-zone CUSTOMER-PRIVATE interfaces st0.<REPLACE BY CORRECT NUMBER OF UNIT>"
for OCTET in ${UNIQUE_1ST_OCTETS}; do
    echo -e "set policy-options prefix-list CUSTOMER-SUBNETS $OCTET.0.0.0/8"
    echo -e "set routing-instances PBR routing-options static route $OCTET.0.0.0/8 next-hop st0.<REPLACE BY CORRECT NUMBER OF UNIT>"
    echo -e "set routing-options static route $OCTET.0.0.0/8 next-hop ${Juniper_GW} preference 1"
done
echo -e "set security ike policy ike-policy-${IAMAAS_IPSEC_DESCR} mode main"
echo -e "set security ike policy ike-policy-${IAMAAS_IPSEC_DESCR} proposals ike-proposal-SASFW"
echo -e "set security ike policy ike-policy-${IAMAAS_IPSEC_DESCR} pre-shared-key ascii-text ${SECRET}"
echo -e "set security ike gateway ike-gw-${IAMAAS_IPSEC_DESCR} ike-policy ike-policy-${IAMAAS_IPSEC_DESCR}"
echo -e "set security ike gateway ike-gw-${IAMAAS_IPSEC_DESCR} address ${PUBLIC_VYOS_IP}"
echo -e "set security ike gateway ike-gw-${IAMAAS_IPSEC_DESCR} external-interface <REPLACE BY CORRECT EXTERNAL-INTERFACE NAME>"
echo -e "set security ipsec vpn ipsec-vpn-${IAMAAS_IPSEC_DESCR} bind-interface st0.<REPLACE BY CORRECT NUMBER OF UNIT>"
echo -e "set security ipsec vpn ipsec-vpn-${IAMAAS_IPSEC_DESCR} ike gateway ike-gw-${IAMAAS_IPSEC_DESCR}"
echo -e "set security ipsec vpn ipsec-vpn-${IAMAAS_IPSEC_DESCR} ike ipsec-policy ipsec-policy-SASFW"
TUN=1
for SUBNET in ${IAMAAS_PORTABLE_SUBNET}
do
echo -e "set security ipsec vpn ipsec-vpn-${IAMAAS_IPSEC_DESCR} traffic-selector t${TUN} local-ip ${SUBNET}"
echo -e "set security ipsec vpn ipsec-vpn-${IAMAAS_IPSEC_DESCR} traffic-selector t${TUN} remote-ip ${PRIVATE_VYOS_IP}/32"
((TUN=TUN+1))
done

for SUBNET in ${IAMAAS_PRIMARY_SUBNET} ${IAMAAS_PORTABLE_SUBNET}
do
    for OCTET in ${UNIQUE_1ST_OCTETS}; do
        echo -e "set security ipsec vpn ipsec-vpn-${IAMAAS_IPSEC_DESCR} traffic-selector t${TUN} local-ip ${SUBNET}"
        echo -e "set security ipsec vpn ipsec-vpn-${IAMAAS_IPSEC_DESCR} traffic-selector t${TUN} remote-ip $OCTET.0.0.0/8"
        ((TUN=TUN+1))
    done
done

echo -e "set security ipsec vpn ipsec-vpn-${IAMAAS_IPSEC_DESCR} establish-tunnels immediately"
echo -e "########################################################################"
echo -e "# The next rules may exist, verify prior apply!!!                               #"
echo -e "set security ike proposal ike-proposal-SASFW authentication-method pre-shared-keys"
echo -e "set security ike proposal ike-proposal-SASFW dh-group group2"
echo -e "set security ike proposal ike-proposal-SASFW authentication-algorithm sha-256"
echo -e "set security ike proposal ike-proposal-SASFW encryption-algorithm aes-256-cbc"
echo -e "set security ike proposal ike-proposal-SASFW lifetime-seconds 28800"
echo -e "set security ipsec proposal ipsec-proposal-SASFW protocol esp"
echo -e "set security ipsec proposal ipsec-proposal-SASFW authentication-algorithm hmac-sha-256-128"
echo -e "set security ipsec proposal ipsec-proposal-SASFW encryption-algorithm aes-256-cbc"
echo -e "set security ipsec proposal ipsec-proposal-SASFW lifetime-seconds 3600"
echo -e "set security ipsec policy ipsec-policy-SASFW perfect-forward-secrecy keys group2"
echo -e "set security ipsec policy ipsec-policy-SASFW proposals ipsec-proposal-SASFW"
