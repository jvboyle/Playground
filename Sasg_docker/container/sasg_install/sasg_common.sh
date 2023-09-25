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
#

DATE=$(date +"%F_%T"|tr ':' '_')
SHOST=$(hostname -s)

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
#SAS_INSTALL_FILE="sasg_install.sh"
#SASOWNER="sasauto"

# OPENVPN Dirs/Files
SAS_TLSRSA_DIR="$SAS_CONFIG/easy-rsa" # dir to create diffie-hellman/rsa keys in 
SAS_TLSAUTH_DIR="$SAS_CONFIG/auth"   # dir to copy openvpn keys for server side
SAS_CLIENT_TLSKEYS_DIR="$SAS_CLIENT_DIR/keys"  # dir to store tls public keys to be copied to JH

# IPSEC Dirs/Files
SAS_IPSECPSK_DIR="$SAS_CONFIG/keys_ipsec"   # dir for createing PSK keys in
SAS_CLIENT_IPSECPSK_DIR="$SAS_CLIENT_DIR/keys_ipsec"   # dir for psk keys to be copied to JH
SAS_IPSECCONF_DIR="/etc/ipsec.d"   # dir to store ipsec site to site config files
SAS_IPSECCONF_PREFIX="site"   # prefix to use for each ipsec site to site config file
##################################################################################################


# iptables/ipset conf file locations
IPTABFILE="/etc/iptables"
IPSETFILE="/etc/ipset"

