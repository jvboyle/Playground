#!/bin/bash
#######################################################################
# read in device as first arg - source in /sasg/configs/tc_$device.conf
# and run tc commands to set up bandwidth limiting based on the
# variables sourced in.
# script intended to be called by openvpn configs as well as ipsec
# tunnel restart monitor.
#######################################################################
LOG="/sasg/logs/BwSetup.log"

ALLARGS="$*"
DEVICE="$1"
DATE=$(date)
LIMITS="/sasg/configs/tc_${DEVICE}.conf"
source $LIMITS

main(){
echo -e "---- $DATE $0 -------------------\nall_args=$ALLARGS"
echo "From $LIMITS: $dev=$dev, burst=$burst, rate_out=$rate_out, rate_in=$rate_in"

if [ "$burst" == "" ]; then
   burst=15k
fi

#delete policy
  /usr/sbin/tc qdisc del dev $dev root handle 1:
  [[ "$?" -ne 0 ]] && echo "err on tc del dev $dev root handle"
  /usr/sbin/tc qdisc del dev $dev handle ffff: ingress
  [[ "$?" -ne 0 ]] && echo "err on tc qdisc del dev $dev handle ffff: ingress"
#Set up policy
if [ "$rate_out" != "" ];then
   /usr/sbin/tc qdisc add dev $dev root handle 1: htb default 10
[[ "$?" -ne 0 ]] && echo "htb default 10 failed"
   /usr/sbin/tc class add dev $dev parent 1: classid 1:1 htb rate 100mbit burst $burst
[[ "$?" -ne 0 ]] && echo "100mbit burst failed"
   /usr/sbin/tc class add dev $dev parent 1:1 classid 1:10 htb rate $rate_out burst $burst
[[ "$?" -ne 0 ]] && echo "$rate_out burst failed"
   /usr/sbin/tc qdisc add dev $dev parent 1:10 handle 10: sfq perturb 10
[[ "$?" -ne 0 ]] && echo "perterb 10 failed"
   /usr/sbin/tc filter add dev $dev parent 1: protocol all prio 1 u32 match ip src any flowid 1:10
[[ "$?" -ne 0 ]] && echo "protocol all failed"
fi

if [ "$rate_in" != "" ];then
   /usr/sbin/tc qdisc add dev $dev handle ffff: ingress
[[ "$?" -ne 0 ]] && echo "ingress failed"
   /usr/sbin/tc filter add dev $dev parent ffff: protocol ip prio 1 u32 match ip src 0.0.0.0/0 police rate $rate_in burst $burst drop flowid :1
[[ "$?" -ne 0 ]] && echo "$rate_in failed"
fi

echo "Setup limit"
/usr/sbin/tc qdisc show dev $dev
} # end of main()

main >>$LOG 2>&1

