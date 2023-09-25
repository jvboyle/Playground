#!/bin/bash
#
# switch ssl_protocols in nginx config and restart nginx service
NGINX_SLACONF="/etc/nginx/conf.d/sla.conf"
source /sasg/bin/sasg_common.sh

NGINX_RESTART(){
 $STATUS_NGINX|grep -qi "running"
 if [ "$?" -eq 0 ];then
   echo -e "nginx service already running... restarting..."
   $RESTART_NGINX
   if [ "$?" -ne 0 ];then
     echo -e "\nERROR re-starting NGINX service!"
   else
     echo -e "\nnginx service restarted."
   fi
 else

   echo -e "Starting nginx service..."
   $START_NGINX
   if [ "$?" -ne 0 ];then
     echo -e "\nERROR starting NGINX service!"
   else
     echo -e "\nnginx service started."
   fi
 fi

} #NGINX_RESTART()

NGINX_TLSSWAP(){
  FROM="$1"
  TO="$2"
  echo -e "\n$NGINX_SLACONF currently configured ssl_protocol(s):\n   ${FROM}\n\nReplace with:\n   ${TO}\n\n ? (y/n)"
  read RESP
  if [ "$RESP" == "y" ];then
     echo -e "This will require a restart of the nginx service...are you sure? (y/n)"
     read RESP
     if [ "$RESP" == "y" ];then
        sed -i.bak "s/$FROM/$TO/g" $NGINX_SLACONF
        if [ "$?" -eq 0 ];then
           echo -e "Update of $NGINX_SLACONF successful ..."
           NGINX_RESTART
           echo -e "\nssl parameters now defined in $NGINX_SLACONF:\n\n"
           grep "ssl" $NGINX_SLACONF
        else
           echo -e "ERROR: update of $NGINX_SLACONF failed, not restarting nginx."
           echo -e "       Manual intervention required, please check $NGINX_SLACONF file."
           echo -e "\nssl parameters now defined in $NGINX_SLACONF:\n\n"
           grep "ssl" $NGINX_SLACONF
           exit 1
        fi # if [ "$?" -eq 0 ];then
     else
        echo -e "\nNo changes made, nginx service not restarted ..."
        exit 0
     fi # if [ "$RESP" == "y" ];then
  else
    echo -e "\nNo changes made, exiting ..."
    exit 0
  fi # if [ "$RESP" == "y" ];then

} # NGINX_TLSSWAP()...

grep -qw "ssl_protocols TLSv1.2;" $NGINX_SLACONF
[[ "$?" -eq 0 ]] && VNOW=1.2

grep -qw "ssl_protocols TLSv1 TLSv1.1 TLSv1.2;" $NGINX_SLACONF
[[ "$?" -eq 0 ]] && VNOW=1.0

case $VNOW in
  "1.0")  NGINX_TLSSWAP "ssl_protocols TLSv1 TLSv1.1 TLSv1.2;" "ssl_protocols TLSv1.2;"
          ;;
  "1.2")  NGINX_TLSSWAP "ssl_protocols TLSv1.2;" "ssl_protocols TLSv1 TLSv1.1 TLSv1.2;"
          ;;
      *)  echo -e "\nERROR: non-standard ssl_protocols configured in $NGINX_SLACONF - manual intervention required.\n"
          echo -e "\nssl parameters currently defined in $NGINX_SLACONF:\n"
          grep "ssl" $NGINX_SLACONF
          exit 1
esac


