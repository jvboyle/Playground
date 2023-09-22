#!/bin/bash

#simple script to save off root cronjob & comment out the sla_daily_run.sh on bpm & vyos's

THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/'|head -1)
SHNAME=`hostname -s`
DATE=`date +"%F_%H%M%S"`

sudo ipset list kyndryl_jfrog_io_masq
if [ "$?" -ne 0 ];then
  sudo su - root -c "cp -p /etc/sysconfig/ipset /etc/sysconfig/ipset.${DATE}"
  sudo su - root -c "cp -p /etc/dnsmasq.conf /etc/dnsmasq.conf.${DATE}"
  sudo su - root -c "iptables-save > /etc/sysconfig/iptables.${DATE}"
  echo "Updating DNSmasq"
  sudo su - root -c "echo "ipset=/kyndryl.jfrog.io/kyndryl_jfrog_io_masq" >> /etc/dnsmasq.conf"
  sudo su - root -c "service dnsmasq restart"

  echo "kyndryl_jfrog_io_masq not found in  ipset list..adding..."
  sudo ipset create kyndryl_jfrog_io_masq hash:net family inet hashsize 1024 maxelem 65536

  echo "Adding iptables rules"
  sudo iptables -D ETH0_IN -m comment --comment "ETH0_IN-10000 default-action reject" -j REJECT --reject-with icmp-port-unreachable
  sudo iptables -A ETH0_IN -p tcp -m comment --comment ETH0_IN-jfrog_io -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set kyndryl_jfrog_io_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -m limit --limit 1/sec -j LOG --log-prefix "[SG_ETH0_IN-jfrog_io-A]"
  sudo iptables -A ETH0_IN -p tcp -m comment --comment ETH0_IN-jfrog_io -m set --match-set DEDICATED_SEGMENT src,src -m set --match-set kyndryl_jfrog_io_masq dst -m set --match-set OUTBOUND_PUBLIC_PORTS dst -j RETURN
  sudo iptables -A ETH0_IN -m comment --comment "ETH0_IN-10000 default-action reject" -j REJECT --reject-with icmp-port-unreachable
  
  echo "saving current iptables file"
  sudo su - root -c "iptables-save > /etc/sysconfig/iptables"
  
  if [ "$?" -ne 0 ];then
     echo -e "\nERROR,$SHNAME,$THIS,failed adding to kyndryl_jfrog_io_masq  "
  else
    sudo su - root -c "sudo ipset save >/etc/sysconfig/ipset"
    if [ "$?" -ne 0 ];then
       echo -e "\nERROR,$SHNAME,$THIS,failed saving runtime ipset config."
    else
       echo -e "\nSUCCESS,$SHNAME,$THIS,kyndryl_jfrog_io_masq ipset list updated"
    fi
  fi
else
  echo -e "\nSUCCESS,$SHNAME,$THIS,kyndryl_jfrog_io_masq ipset list already contained..no change made."
fi