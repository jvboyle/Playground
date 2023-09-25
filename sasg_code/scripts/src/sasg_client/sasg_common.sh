#!/bin/bash
# Set up common commands for start/stop/restart of keepalived, iptables, ipsec, etc
# common log vars, etcj
# Sourced into sasg_client/* scripts
# History:  
#    12Jun2017 - Original - SBraun
#    08Aug2017 - rsyslog start/stop added, variables for rsyslog/logrotate added.
#              - also dynamic vars added at install time by sasg_customer_build.sh
#              - for firewall & vpn log dir/name depending on sasg primary/backup
#    20Sep2017 - updated for nginix logrotate
#    01Nov2017 - Updated for SASFW & SASG - one common variables file for both
#    27Nov2017 - Added LOGROTATE_SASGVPN="$LOGROTATEDIR/sasgvpn" - separating out logrotate config files
#              - for vpn and firewall
#    24Jan2018 - date format changed slightly - removed underscore in time, added ORIGINALFILTERLINES variable
#
#    22Feb2018 - added SAS_IPSECPSK_DIR_IAM variable for AMaaS PSK key

#DATE=$(date +"%F_%T"|tr ':' '_')
DATE=`date +"%F_%H%M%S"`
SHOST=$(hostname -s)

KEEPALIVED="/etc/keepalived"
RHELVERSION=$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release) |cut -b1)

if [ "X$RHELVERSION" == "X6" ]; then
  # note -important to use full path to service command for use with cron
  START_IPTABLES="/sbin/service iptables start"
  STOP_IPTABLES="/sbin/service iptables stop"
  RESTART_IPTABLES="/sbin/service iptables restart"
  STATUS_IPTABLES="/sbin/service iptables status"

  START_IPSET="/sbin/service ipset start"
  STOP_IPSET="/sbin/service ipset stop"
  RESTART_IPSET="/sbin/service ipset restart"
  STATUS_IPSET="/sbin/service ipset status"

  START_KEEPALIVED="/sbin/service keepalived start"
  STOP_KEEPALIVED="/sbin/service keepalived stop"
  RESTART_KEEPALIVED="/sbin/service keepalived restart"
  STATUS_KEEPALIVED="/sbin/service keepalived status"

  START_IPSEC="/sbin/service ipsec start"
  STOP_IPSEC="/sbin/service ipsec stop"
  RESTART_IPSEC="/sbin/service ipsec restart"
  STATUS_IPSEC="/sbin/service ipsec status"

  START_RSYSLOG="/sbin/service rsyslog start"
  STOP_RSYSLOG="/sbin/service rsyslog stop"
  RESTART_RSYSLOG="/sbin/service rsyslog restart"
  STATUS_RSYSLOG="/sbin/service rsyslog status"

  START_NGINX="/sbin/service nginx start"
  STOP_NGINX="/sbin/service nginx stop"
  RESTART_NGINX="/sbin/service nginx restart"
  STATUS_NGINX="/sbin/service nginx status"
  ENABLE_NGINX="/sbin/chkconfig --level 2345 nginx on"

  IPTABCMD="/sbin/iptables"
  IPTABSAVECMD="/sbin/iptables-save"
  IPSETCMD="/usr/sbin/ipset"
else
  ## redhat v7
  START_IPTABLES="systemctl start iptables"
  STOP_IPTABLES="systemctl stop iptables"
  RESTART_IPTABLES="systemctl restart iptables"
  STATUS_IPTABLES="systemctl status iptables"

  START_IPSET="systemctl start ipset"
  STOP_IPSET="systemctl stop ipset"
  RESTART_IPSET="systemctl restart ipset"
  STATUS_IPSET="systemctl status ipset"

  START_KEEPALIVED="systemctl start keepalived"
  STOP_KEEPALIVED="systemctl stop keepalived"
  RESTART_KEEPALIVED="systemctl restart keepalived"
  STATUS_KEEPALIVED="systemctl status keepalived"

  START_IPSEC="systemctl start ipsec"
  STOP_IPSEC="systemctl stop ipsec"
  RESTART_IPSEC="systemctl restart ipsec"
  STATUS_IPSEC="systemctl status ipsec"

  START_RSYSLOG="systemctl start rsyslog.service"
  STOP_RSYSLOG="systemctl stop rsyslog.service"
  RESTART_RSYSLOG="systemctl restart rsyslog.service"
  STATUS_RSYSLOG="systemctl status rsyslog.service"

  START_NGINX="systemctl start nginx"
  STOP_NGINX="systemctl stop nginx"
  RESTART_NGINX="systemctl restart nginx"
  STATUS_NGINX="systemctl status nginx"
  ENABLE_NGINX="systemctl enable nginx"

  IPTABCMD="/usr/sbin/iptables"
  IPTABSAVECMD="/usr/sbin/iptables-save"
  IPSETCMD="/usr/sbin/ipset"

fi

# SASFW/SASG common variables, ie sas automation logs, binaries, configs
SAS_TOP="/sasg"
SAS_BIN="$SAS_TOP/bin"                   # binaries / tlsmon, etc.
SAS_BACKUP="$SAS_TOP/backup"             # sasfw backups
SAS_CONFIG="$SAS_TOP/configs"             # sasfw config files
SAS_LOGS="$SAS_TOP/logs"             # sasfw logs

SAS_FWLOG_DIR="$SAS_LOGS/Firewall"   # iptables filter/nat logging
SAS_VPNLOG_DIR="$SAS_LOGS/VPN"       # vpn start/stop/err logs

##################################################################################################
# SASFW specific vars:
SAS_CLIENT_TOP="$SAS_CONFIG/client"    # dir to copy all sasfw build scripts to
SAS_CLIENT_DIR="$SAS_CLIENT_TOP/sasg_client"  # dir for sasg-only build scripts
SAS_CLIENT_IMAGE_DIR="$SAS_CLIENT_TOP/Sasg"            # dir to store self-extracting sasg_install.sh

# SASFW Install ID, Install Log, Client self-extracting executable
#SAS_CONFIGURE_LOG="/tmp/sasfw_configure.log.$DATE"
SAS_CONFIGURE_LOG="/tmp/sasg_vyos_configure.log"
SAS_INSTALL_FILE="sasg_install.sh"
SASOWNER="sasauto"

# OPENVPN Dirs/Files
SAS_TLSRSA_DIR="$SAS_CONFIG/easy-rsa" # dir to create diffie-hellman/rsa keys in 
SAS_TLSAUTH_DIR="$SAS_CONFIG/auth"   # dir to copy openvpn keys for server side
SAS_CLIENT_TLSKEYS_DIR="$SAS_CLIENT_DIR/keys"  # dir to store tls public keys to be copied to JH

# IPSEC Dirs/Files
SAS_IPSECPSK_DIR="$SAS_CONFIG/keys_ipsec"   # dir for createing PSK keys in
SAS_IPSECPSK_DIR_IAM="$SAS_CONFIG/keys_ipsec_iam"   # dir for creating IAMaaS PSK keys in
SAS_CLIENT_IPSECPSK_DIR="$SAS_CLIENT_DIR/keys_ipsec"   # dir for psk keys to be copied to JH
SAS_IPSECCONF_DIR="/etc/ipsec.d"   # dir to store ipsec site to site config files
SAS_IPSECCONF_PREFIX="site"   # prefix to use for each ipsec site to site config file
##################################################################################################


# iptables/ipset conf file locations
IPTABFILE="/etc/sysconfig/iptables"
IPSETFILE="/etc/sysconfig/ipset"

# where tunnel started / killed msgs go
KEEPALIVESTATUSDIR="/sasg/logs/keepalived/status"
keepalive_log_file=/sasg/logs/keepalived/keepalived_status.log

# for rsyslog config that defines which messages to put in IPTABLELOG above
RSYSLOGDIR="/etc/rsyslog.d"
RSYSLOGCONFIG="$RSYSLOGDIR/sasgfw.conf"

# logrotate configs
LOGROTATEDIR="/etc/logrotate.d"
LOGROTATECONFIG="$LOGROTATEDIR/syslog"
LOGROTATE_SASGFW="$LOGROTATEDIR/sasgfw"
LOGROTATE_SASGVPN="$LOGROTATEDIR/sasgvpn"
LOGROTATE_NGINX="$LOGROTATEDIR/nginx"


# original iptables filter lines (non - SLA standard)
ORIGINALFILTERLINES="/sasg/backup/iptables.ofl"

