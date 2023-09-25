
#CUSTOMER_SUBNET="a b c"
#CUSTOMER_SUBNETS=(${CUSTOMER_SUBNET[@]})
#echo "number of elements: ${#CUSTOMER_SUBNETS[@]}"
#echo "all elements: ${CUSTOMER_SUBNETS[@]}"

#SASG_MASQ_IP[0]='1.1.1.1'

. ./vars.template

# Script Variables Section
if [[ ${#SASG_MASQ_IP[@]} = 0 || ${#CUSTOMER_SUBNETS[@]} = 0 || -z $VTUN_CA_CERT_FILE || -z $VTUN_CERT_FILE || -z $VTUN_DH_FILE || -z $VTUN_KEY_FILE ]] ; then 
   CUSTOMER_NETWORK_INFO=false
else
   CUSTOMER_NETWORK_INFO=true
fi

echo $CUSTOMER_NETWORK_INFO



CUSTOMER_SUBNETS[0]="a b c"
CUSTOMER_SUBNETS[1]="d e f"
CUSTOMER_SUBNET=(${CUSTOMER_SUBNETS[1][@]})
echo "number of elements: ${#CUSTOMER_SUBNET[@]}"
echo "all elements: ${CUSTOMER_SUBNET[@]}"

CUSTOMER_SUBNET=(${CUSTOMER_SUBNETS[@]})
echo "number of elements: ${#CUSTOMER_SUBNET[@]}"
echo "elements: ${CUSTOMER_SUBNET[@]}"
for subnet in "${CUSTOMER_SUBNET[@]}"
do 
    echo $subnet
done

echo $TESTING
if [ -z "$TESTING" ] || [ "$TESTING" == "false" ]; then
    echo 'not testing...'
else
    echo 'testing...'
fi



