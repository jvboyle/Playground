#!/bin/bash
HOSTLIST="/root/proxy.csv"

while(true)
do
  MATCHES=""
  MATCHCOUNT=0

  MATCHES=($(grep -i "$SEARCH" $HOSTLIST|sed "s/ //g" | awk -F ',' '{printf("%s;%s;%s;%s;%s;%s\n",$1,$2,$3,$4,$5,$6,$7)}'))

  echo -e "\n--------------------------------------------------------"
  for ((INDEX=0; INDEX<${#MATCHES[@]}; INDEX++))
  do
   #echo -e "$INDEX  - ${MATCHES[$INDEX]}"   # dumps everything
   echo -e "$INDEX  - ${MATCHES[$INDEX]}" | cut -f1 -d';'
  done
  echo -e "\n--------------------------------------------------------"

  MATCHCOUNT=$(( ${#MATCHES[@]} - 1 ))
  echo -e "\nPlease select a file (0 - $MATCHCOUNT) from the list above"
  read SELECTED
  if [ ! -z "$SELECTED" ];then
    USEIP=$(echo "${MATCHES[$SELECTED]}" | cut -f2 -d';')
    CIDR=$(echo "${MATCHES[$SELECTED]}" | cut -f3 -d';')

     echo -e "\n--------------------------------------------------------"
     echo "sshuttle -D -l 192.168.1.2 -r $USER_ID@$USEIP 100.0.0.0/8 $CIDR"
     echo -e "--------------------------------------------------------"
     echo 1 > /proc/sys/net/ipv4/ip_forward
     ssh-keyscan -t ed25519 $USEIP >>~/.ssh/known_hosts
     #sshuttle -D -r $USER_ID@$USEIP 100.0.0.0/8 $CIDR
     sshuttle -D --listen 0.0.0.0 -r $USER_ID@$USEIP 100.0.0.0/8 $CIDR
     exit
  fi
done