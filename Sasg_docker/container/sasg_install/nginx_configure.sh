#!/bin/bash
###########################################################################
# Description: Configure NGINX
# Author: Joe Boyle, Stan Braun
# Date: 2017.09.20
# Config: vars file
# Main: ./sasg_customer_build.sh
# Standalone Usage: ./nginx_config.sh
# History:
#    2017.09.20 - Original script.
#    2017.09.28 - fixed issue with /sasg/Nginx not being created initially & set with nginx.nginx as owner
#    2017.10.05 - added removal of default nginx config file /etc/nginx/conf.d/default.conf prior to startup for security compliance
#    2017.10.05 - added removal of default /usr/share/nginx/html/* files prior to start
#    2017.11.20 - SBraun - added proxy_request_buffering off;  to sla.conf - fix for endpoint post problem with ipsec tunnels
# Notes:
#    Assumptions:
#      nginx code already installed - this just sets up config files / directories
#      REQUIRES: sasg_common.sh, vars
#      Assumes logrotate configured separately via syslog_config.sh
#      Assumes iptables configured separately via sasg_iptables.sh
###########################################################################

source ./vars
source /sasg/bin/sasg_common.sh
SCRIPT_INFO="$0 v$VERSION"

#########################################################################
echo "Configuring NGINX...."

NGINX_SLACONF="/etc/nginx/conf.d/sla.conf"
NGINX_CONF="/etc/nginx/nginx.conf"
NGINX_CACHE="/sasg/Nginx/installer_cache"
NGINX_SSL="/etc/nginx/SSL"
NGINX_LOGS="/sasg/logs/Nginx"
ERRORS=""

if [ ! -d "/sasg/Nginx" ];then
  echo -e "\n/sasg/Nginx dir not found...creating....\n"
  mkdir -p /sasg/Nginx
fi
if [ ! -d "$NGINX_LOGS" ];then
  echo -e "\n$NGINX_LOGS dir not found...creating....\n"
  mkdir -p $NGINX_LOGS
fi
chown -R nginx:nginx /sasg/Nginx
chmod -R 750 /sasg/Nginx
#chown -R nginx.nginx $NGINX_LOGS
chmod -R 755 $NGINX_LOGS

logerr(){
  NEWERR="$1"
  ERRORS="$ERRORS\n$NEWERR"
  echo "\n$NEWERR"
}


if [ ! -d "$NGINX_CACHE" ];then
  echo -e "creating nginx installer cache directory $NGINX_CACHE"
  mkdir -p "$NGINX_CACHE"
  if [ "$?" -ne 0 ];then
    logerr "Error creating $NGINX_CACHE"
  fi
fi
if [ ! -d "$NGINX_SSL" ];then
  echo -e "creating nginx ssl directory $NGINX_SSL"
  mkdir -p "$NGINX_SSL"
  if [ "$?" -ne 0 ];then
    logerr "Error creating $NGINX_SSL"
  fi
fi
if [ ! -d "$NGINX_LOGS" ];then
  echo -e "creating nginx logs directory $NGINX_LOGS"
  mkdir -p "$NGINX_LOGS"
  if [ "$?" -ne 0 ];then
    logerr "Error creating $NGINX_LOGS"
  fi
fi

[[ -z ${EE_IP} ]] && [[ ! -z ${CEBW_IP} ]] && EE_IP=${CEBW_IP}
TWO_EE_IP=2.$(echo -e $EE_IP | cut -d"." -f2-4)
echo -e "\ncreating nginx sla config: $NGINX_SLACONF"
cat > $NGINX_SLACONF <<EOL
upstream execution_engine {
  server $TWO_EE_IP:3333;
}
# inactive says how long it can be in the cache w/out being access before it is deleted from the cache by the cache manager
proxy_cache_path /sasg/Nginx/installer_cache levels=1:2 keys_zone=installer_cache:10m max_size=10g inactive=14d use_temp_path=off;

server {
  listen 3333;
  ssl on;
  ssl_certificate     /etc/nginx/SSL/sdad.sl.ibm.com.pem;
  ssl_certificate_key /etc/nginx/SSL/sdad.sl.ibm.com.key;
  ssl_protocols TLSv1.2;
  ssl_prefer_server_ciphers on;
  ssl_ciphers ECDH+AESGCM:ECDH+AES256:ECDH+AES128:!DH:!ADH:!AECDH:!MD5;
  location /shared {
    proxy_pass https://execution_engine;
    add_header X-Proxy-Cache \$upstream_cache_status;

        # set length of time cache entries are valid for - after this time it will be revalidated if proxy_cache_revalidate is turned on
        # note that this must be set if the content has no expiration specified via headers or other means or nginx will not cache the file
    proxy_cache_valid 1h;

        # enable locking to prevent network storms if multiple clients request a file that is not cached
    proxy_cache_lock on;

        # amount of time to wait for download from backend
    proxy_cache_lock_timeout 300s;

        # amount of time to wait until additional requests are sent to the backend
    proxy_cache_lock_age 600s;

        # check for newer files on backend using a conditional GET
    proxy_cache_revalidate on;

        # if cached file is being updated, use stale copy until the updated version is available (not sure if this is desirable or not)
    proxy_cache_use_stale updating;

        # enable the cache
    proxy_cache installer_cache;
  }
  location / {
    proxy_http_version 1.1;
    proxy_set_header Upgrade \$http_upgrade;
    proxy_set_header Connection 'upgrade';
    proxy_set_header Host \$host;
    proxy_pass https://execution_engine;
    proxy_request_buffering off;
   }
}
EOL
if [ "$?" -ne 0 ];then
  logerr "Error writing nginx SLA conf file $NGINX_SLACONF"
fi

mkdir -p /var/tmp/nginx/client_body
mkdir -p /var/run

##############################################################################  
echo -e "Starting nginx service..."
/usr/sbin/nginx 

##############################################################################
if [ -z "$ERRORS" ];then
  echo -e "\nNGINX configuration completed with no errors."
  exit 0
else
  echo -e "\nNGINX configuration completed with ERRORS:\n$ERRORS"
  exit 1
fi
