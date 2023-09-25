#!/bin/bash
################################################################################
# Description: Install SASG
# Author: Jinho Hwang
# Date: 2016.08.16
# Config: vars file 
# Main: ./sasg_install.sh
# Standalone Usage: Run each script alone
# History:
#    2016.08.16 - Original script.
#    2017.04.27 - SBraun - added : MACHINE_IP var - updated keepalived.conf, iptables, client.conf 
#               - standardized naming convention - filename.extension.sasg_IP. Separate files for each
#               - sasg - support multi-sasg implementation.
#               - copy couple of debug scripts to /usr/local/bin for future vpn debugging
#    2017.05.24 - Modified for ipsec install
#    2017.05.29 - Modified for selinux - incorporated Ruslan's SElinux keepalived/master-backup findings
#    2017.05.29 - Modified for mrtg logpusher
#    2017.05.31 - Fixed mrtg installer
#    2017.06.01 - SBraun - commented out all mrtg/logpusher install per JBoyle
#    2017.06.01 - SBraun - added tcpdump package and /var/run/openvpn dir reqmt for new keepalived setup
#               - and checks for software packages & prompt to user if they want to install or exit.
#    2017.06.02 - changed keepalived.conf back to /etc/keepalived or issues with service not setting up VIPS
#    2017.06.05 - updated ipsec.secrets to use new @peer name
#    2017.06.06 - updated for ipsec in iptables - use network interface for tunnel in iptables that 
#               - has the SASG_MASQ_IP assigned (multi-nic setups) or if not found, used NIC for
#               - sasg private ip.
#    2017.06.06 - updated final connectivity check- bpm_ip 2.x address, port 443 - openvpn/ipsec compatible
#    2017.06.06 - fix in check for which array number is used for sasg ip - used for iptables update
#    2017.06.07 - moved sasgcheck/debug scripts to /sasg/bin & put symlinks to them in /usr/local/bin
#    2017.06.07 - removed port chg sed of openvpn sasg-check script
#    2017.06.07 - removed set -o verbose mode & added echos - hides script but tells user whats being done
#    2017.06.08 - removed world read from openvpn auths so openvpn doesn't log errs even though 
#               - auth dir itself is only accessible from root.
#    2017.06.14 - moved cron setup to last - just before connection test
#    2017.06.19 - uncommented out unused /var/run/openvpn dir create.
#    2017.06.29 - Added step to set openvpn /ipsec service to disabled (in case we're installing over prev version & an admin
#               - manually set openvpn / ipsec service to enabled instead of letting keepalive manage it.
#    2017.06.29 - Added install of ipset on openvpn installs as well as ipsec installs
#    2017.06.29 - Err checking fix for failed package installs.
#    2017.06.30 - fixed yum installs, ipsec.secrets putting wrong ip in when no pub ip on server.
#    2017.07.12 - fixed err during last ip check - called return instead of exit.
#    2017.07.13 - fixed sasg required package install - call separate checkpkgs.sh
#    2017.07.31 - moved install of policycoreutils to checkpkgs.sh script
#    2017.08.02 - v2.6 moved checkpkgs part of install to first thing in sasg_main.sh
#    2017.08.03 - v2.6 added rsyslog config / ipset config
#    2017.08.07 - v2.6 changed format of time string in backups to avoid issues with restores.
#    2017.09.08 - v2.6 changed removes of orig config files to just copy key cfg's to .$DATE
#    2017.09.13 - v2.6 make dir for openvpn config - /sasg/config
#    2017.09.13 - v2.6 dont disable openvpn systemd service - if on JH+, ipcenter uses systemctl to manage openvpn - check
#               - at install time - if there are certs with SASG in the name in /etc/openvpn/client.conf then we know its
#               - an old sasg install, mv the old client.conf to a /sasg/backup with date, then ps & look for openvpn 
#               - process with this client.conf, if find one, kill it.  That way new openvpn with config in 
#               - /sasg/configs will start properly and systemd wont try to restart the sasg openvpn.
#    2017.09.15 - v2.6 set permissions on new sasg log dirs so automate id can access the logs - also set in 
#               - keepalived & logrotate config.
#    2017.09.19 - v2.6.1 Added install for mrtg - cronjob, untar mrtg file to /sasg
#    2017.09.19 - v2.6.1 put vyos ip & bpm port in /sasg/bin/sasg_common.sh vs running sed & changing 
#                 sasg-check-keepalived.sh scripts directly. Also add HTTPS_PROXY & HTTPS_PROXY_PORT if defined.
#    2017.09.28 - v2.6.1 minor chg to msg saying that new openvpn configs will be in /sasg/configs -  was saying /sasg/logs/VPN though the configs were in the right place
#    2017.10.04 - v2.6.1 minor chg to create /sasg/docs directory and copy required compliance document JHP_Design_Document.doc
#    2017.10.06 - v2.6.1 fixed minor bug - fixed missing dollar sign on HTTPS_PROXY variable.
#    2017.11.06 - v3.1 fixed minor bugs - no obvious err reported on ipset/iptables restart errors / code wasn't exiting on err.
#    2017.11.09 - v3.1 fixed HTTPS_PROXY_PORT variable added to sasg_common - was missing underscore
#    2018.12.17 - v4.0.6 removed Network interface / added Nat add logic / added dockerhost logic
# Notes:
#    .
################################################################################
source ./vars
# source in build version sasg_common.sh
source ./sasg_common.sh

DATE=`date +"%F_%H%M%S"`
SHOST=`hostname -s`


################################################################################
#Move and fix perms 
################################################################################

# Copy check/debug tools to /usr/local/bin for easier future debugging with admins
mkdir -p /sasg/bin
cp sasg_common.sh /sasg/bin/sasg_common.sh

chmod 750 /sasg/bin/sasg_common.sh
cp VERSION /sasg/bin/VERSION

# source in the sasg_common.sh we copied to /sasg/bin
# has common vars for start/stop of processes, redhat version check, etc
if [ ! -f "/sasg/bin/sasg_common.sh" ];then
  echo -e "\nERROR:  No /sasg/bin/sasg_common.sh.  Please send the log file (/tmp/sasg_install.log) to IBM contact for the investigation."
  exit 1
fi

###############################################################################
# Set up basic /sasg dirs/vars for logging.
##############################################################################

if [ ! -d "$SAS_VPNLOG_DIR" ];then
  echo -e "\n$SAS_VPNLOG_DIR doesn't existing...creating.."
  mkdir -p $SAS_VPNLOG_DIR
fi

if [ ! -d "$SAS_CONFIG" ];then
  echo -e "\n$SAS_CONFIG doesn't existing...creating.."
  mkdir -p $SAS_CONFIG
fi

# append host specific variables to sasg_common.sh for use with other setup/monitoring scripts

echo -e "\nadding system specific log variables to sasg_common..."
if [ "$MACHINE_TYPE" == "PRIMARY" ];then
  echo "VPNLOG=\"${SAS_VPNLOG_DIR}/sasgvpn01\"" |tee -a /sasg/bin/sasg_common.sh
  echo "IPTABLELOG=\"/sasg/logs/Firewall/sasgfw01\"" |tee -a /sasg/bin/sasg_common.sh
else
  echo "VPNLOG=\"${SAS_VPNLOG_DIR}/sasgvpn02\"" |tee -a /sasg/bin/sasg_common.sh
  echo "IPTABLELOG=\"/sasg/logs/Firewall/sasgfw02\"" |tee -a /sasg/bin/sasg_common.sh
fi

# now source in sasg server specific sasg_common.sh
source /sasg/bin/sasg_common.sh

################################################################################
# Obtain customer unique client keys 
################################################################################
echo -e "\Obtain customer unique client keys..."
mkdir -p ${SAS_CONFIG}/auth ${SAS_CONFIG}/status
chmod 700 ${SAS_CONFIG}/auth ${SAS_CONFIG}/status
cp ./keys/* ${SAS_CONFIG}/auth/
chmod -R 640 ${SAS_CONFIG}

################################################################################
# Configure OpenVPN
################################################################################
echo "Configuring OpenVPN..."
echo "Copying ./client.conf.${MACHINE_IP} ${SAS_CONFIG}/client.conf ..."
  cp /sasg/tmp/client.conf.${MACHINE_IP} ${SAS_CONFIG}/client.conf

if [ ! -d "/var/run/openvpn" ];then
  echo -e "/var/run/openvpn does not exist...creating..."
  mkdir /var/run/openvpn
fi
echo -e "\nConfiguring tuntap..."
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chown openvpn:openvpn /dev/net/tun

################################################################################
# Configure ipset
################################################################################

echo -e "\nConfiguring IPSet..."
IPSET="/etc/ipset.d/ipset"

cp /sasg/tmp/ipset.${MACHINE_IP} $IPSET
if [ $? -ne 0 ];then
  echo -e "Error Copying ./ipset.${MACHINE_IP} $IPSET  ...ipset required..exiting..\n"
  exit 1
fi
chmod 744 $IPSET

################################################################################
# Configure iptables
################################################################################

echo -e "\nConfiguring IPTables..."

# no need to do primary/backup check - updated sasg_main.sh to add MACHINE_IP to vars when it runs.
# sasg_main checks for configured ip's when it runs & updates vars based on which ip it finds
cp /sasg/tmp/iptables.${MACHINE_IP} /etc/iptables/iptables


#################################################################################
##Http Proxy 
#################################################################################
# sjb - 9/19/17 - instead of setting vyos ip & port directly in sasg-check-keepalived.sh, add it to 
# the sasg_common.sh we're already sourcing in
#echo -e "\nsetting VYOS_PUBIP=$USEIP in sasg-check-keepalived.sh"
#sed -i.bak s@VYOS_PUBIP_HERE@$USEIP@g /sasg/bin/sasg-check-keepalived.sh
#echo -e "\nAdding VYOS_PUB_IP=$USEIP and VYOS_BPM_PORT=443 to /sasg/bin/sasg_common.sh"
#echo -e "VYOS_PUB_IP=$USEIP" >>/sasg/bin/sasg_common.sh
#echo -e "VYOS_BPM_PORT=443" >>/sasg/bin/sasg_common.sh
#if [ ! -z "$HTTPS_PROXY" ];then
#  echo -e "\nAdding HTTPS_PROXY=${HTTPS_PROXY} to /sasg/bin/sasg_common.sh"
#  echo -e "HTTPS_PROXY=${HTTPS_PROXY}" >>/sasg/bin/sasg_common.sh
#  if [ -z "$HTTPS_PROXY_PORT" ];then
#    # set default to 443
#    echo -e "Adding HTTPS_PROXY_PORT=443 to /sasg/bin/sasg_common.sh\n"
#    echo -e "HTTPS_PROXY_PORT=443" >>/sasg/bin/sasg_common.sh
#  else
#    echo -e "Adding HTTPS_PROXY_PORT=${HTTPS_PROXY_PORT} to /sasg/bin/sasg_common.sh\n"
#    echo -e "HTTPS_PROXY_PORT=${HTTPS_PROXY_PORT}" >>/sasg/bin/sasg_common.sh
#  fi
#fi

################################################################################
## Configure NGINX
################################################################################
if [[ -n $EE_IP || -n $CEBW_IP ]]; then
   echo -e "\nConfigureing Nginx...\n"
   ./nginx_configure.sh
fi
###############################################################################

## Echo Finish sasg_customer_build.sh###############################
echo -e "\nEcho Finish sasg_customer_build.sh: \n"




