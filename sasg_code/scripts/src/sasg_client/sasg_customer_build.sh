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
#    2018.01.24 - v3.1.07 added echo statements indicating name of firewall/keepalived backup files.
#    2018.02.22 - v3.1.0X added IAMaaS support.
#    2018.04.11 - SBraun - v3.2.1 - added dump of in-memory ipset/iptables configs to /sasg/backup for future firewall revalidation.
#    2018.05.07 - SBraun - v3.2.03 - changed iptables/keepalived build scripts to include proper JH interface, mask & tunnel interface name
#    2018.05.07 - SBraun - v3.2.03 - added check of return from nginx_configure.sh - if non-zero, 
#                 echo msg & exit with error so user is notified
#    2018.08.02 - SBraun - v3.3 - fix to backup - /sasg/configs - directory was specified incorrectly.
# Notes:
#    .
################################################################################
source ./vars
# source in build version sasg_common.sh
source ./sasg_common.sh

# took out verbose mode -no need to show all code, just echo what's being done & results
#set -o verbose


echo "Machine Type: $MACHINE_TYPE"
echo "Machine Interface: $MACHINE_INTF"
echo "Machine IP: $MACHINE_IP"
echo "Machine Subnet Mask: $MACHINE_SUBNET_MASK"
echo "Machine MASQ Interface: $MACHINE_MASQ_INTF"
echo "Machine MASQ IP: $MACHINE_MASQ_IP"
echo "ARRAYNUM: $ARRAYNUM"

#DATE=`date +"%F_%T"`
# use date with _ in time vs %T which put colons & sometimes caused issues with restores.
DATE=`date +"%F_%H%M%S"`
SHOST=`hostname -s`

# make sasg dir for logs & executables
if [ ! -d "/sasg/bin" ];then
  mkdir -p /sasg/bin
fi
if [ ! -d "/sasg/logs" ];then
  mkdir -p /sasg/logs
fi
if [ ! -d "/sasg/logs/keepalived/status" ];then
  mkdir -p /sasg/logs/keepalived/status
fi
if [ ! -d "/sasg/backup" ];then
  mkdir -p /sasg/backup
fi
if [ ! -d "/sasg/docs" ];then
  mkdir -p /sasg/docs
  chown 755 /sasg/docs
fi

##
# Make backup of all sasg files
##
echo "Backing up any existing configuration files..."
# get any existing sasg cronjobs & add those to backup
crontab -l |grep "/sasg/bin" >/tmp/root.cron
#tar -zcvf /sasg/backup/${SHOST}_${DATE}_backup.tgz /etc/keepalived /etc/openvpn /etc/sysconfig/iptables /etc/ipsec.conf /etc/ipsec.secrets /usr/libexec/keepalived /var/lib/keepalived /sasg/bin /sasg/logs /tmp/root.cron &>/dev/null
tar -zcvf /sasg/backup/${SHOST}_${DATE}_backup.tgz /etc/keepalived /etc/openvpn /sasg/configs /sasg/logs /sasg/bin /sasg/docs /etc/sysconfig/iptables /etc/ipsec.conf /etc/ipsec.secrets /usr/libexec/keepalived /var/lib/keepalived /tmp/root.cron /etc/rsyslog.d/sasgfw.conf /etc/ipset/ipset /etc/sysconfig/ipset /etc/logrotate.d/syslog /etc/logrotate.d/sasgfw /etc/logrotate.d/nginx /etc/rsyslog.conf &>/dev/null


echo "Backup created: /sasg/backup/${SHOST}_${DATE}_backup.tgz"

################################################
# v3.2.1 chg - 
# Take snapshot of current iptables/ipset configurations in memory
# if an existing snapshot file for this code version doesn't already exist:
IPTABVALFILE="${SAS_BACKUP}/iptables_Validate_${SHOST}_Pre-${VERSION}"
IPSETVALFILE="${SAS_BACKUP}/ipset_Validate_${SHOST}_Pre-${VERSION}"


if [ ! -f "${IPTABVALFILE}" ];then
  if [ ! -f "${IPTABSAVECMD}" ];then
     # iptables-save command not found - likely new install
     echo -e "${IPTABSAVECMD} not found - new install." > ${IPTABVALFILE}
  else
     echo -e "\nSaving current iptables configuration in memory to ${IPTABVALFILE} ..."
     sudo ${IPTABSAVECMD} > ${IPTABVALFILE}
     chmod 000 ${IPTABVALFILE}
  fi
fi
if [ ! -f "${IPSETVALFILE}" ];then
  if [ ! -f "${IPSETCMD}" ];then
     # iptables-save command not found - likely new install
     echo -e "${IPSETCMD} not found - new install." > ${IPSETVALFILE}
  else
     echo -e "\nSaving current iptables configuration in memory to ${IPSETVALFILE} ..."
     sudo ${IPSETCMD} save > ${IPSETVALFILE}
     chmod 000 ${IPSETVALFILE}
  fi
fi


# remove existing config files - all will be backed up already - this will help clean config & will
# enable switching between openvpn/ipsec or customers that had keepalive config in /etc/keepalived but
# switched to new code with configs in /var/lib/keepalived.

echo "Removing any existing configuration files..."
if [ -f "/etc/keepalived/keepalived.conf" ];then
  echo -e "Backing up existing /etc/keepalived/keepalived.conf as /etc/keepalived/keepalived.conf.$DATE ...."
  mv /etc/keepalived/keepalived.conf /etc/keepalived/keepalived.conf.$DATE
fi
rm -f /tmp/root.cron
if [ -f "/etc/sysconfig/iptables" ];then
  echo -e "Backing up existing /etc/sysconfig/iptables as /etc/sysconfig/iptables.$DATE  ...."
  mv /etc/sysconfig/iptables /etc/sysconfig/iptables.$DATE
fi
if [ -f "/etc/ipset/ipset" ];then
  echo -e "Backing up existing /etc/ipset/ipset as /etc/ipset/ipset.$DATE ...."
  mv /etc/ipset/ipset /etc/ipset/ipset.$DATE
fi
if [ -f "/etc/sysconfig/ipset" ];then
  echo -e "Backing up existing /etc/sysconfig/ipset as /etc/sysconfig/ipset.$DATE  ...."
  mv /etc/sysconfig/ipset /etc/sysconfig/ipset.$DATE
fi
if [ -f "/var/lib/keepalived/keepalived.conf" ];then
  echo -e "Backing up existing /var/lib/keepalived/keepalived.conf as /var/lib/keepalived/keepalived.conf.$DATE  ...."
  mv /var/lib/keepalived/keepalived.conf /var/lib/keepalived/keepalived.conf.$DATE
fi

# copy JHP_Design_Document.doc to /sasg/docs - required compliance doc
if [ -f "./JHP_Design_Document.doc" ];then
  cp ./JHP_Design_Document.doc /sasg/docs/
  chown 755 /sasg/docs/JHP*
fi

################################################################################
# Internet Connection Testing to CDS VYOS
################################################################################

# Run only when openvpn is not installed yet (only first run).
if [ ! -f "/etc/ipsec.conf" ]; then
  rpm -qa|grep -qi openvpn
  if [ $? -ne 0 ];then
    timeout 1 bash -c "cat < /dev/null > /dev/tcp/$PUBLIC_VYOS_IP/443"
    if [ "$?" -ne 0 ]; then 
        echo "ERROR: Internet connection to $PUBLIC_VYOS_IP:443 is CLOSED. Please check whether your outbound 443 is open in your local firewall and data center firewall."
    else
        echo "INFO: Internet connection to $PUBLIC_VYOS_IP:443 is OPEN"
    fi
  fi #if [ $? -ne 0 ];then
fi

# Copy check/debug tools to /usr/local/bin for easier future debugging with admins
cp sasgcheck /sasg/bin/sasgcheck
cp modnginx.sh /sasg/bin/modnginx.sh
cp sasgdebug /sasg/bin/sasgdebug
cp sasgbackout.sh /sasg/bin/sasgbackout.sh
cp sasg_common.sh /sasg/bin/sasg_common.sh
chmod 750 /sasg/bin/sasg_common.sh
chmod 750 /sasg/bin/sasgcheck
chmod 750 /sasg/bin/modnginx
chmod 750 /sasg/bin/sasgdebug
chmod 750 /sasg/bin/sasgbackout.sh
ln -s /sasg/bin/sasgcheck /usr/local/bin/sasgcheck 2>/dev/null
ln -s /sasg/bin/sasgdebug /usr/local/bin/sasgdebug 2>/dev/null
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

if [ ! -d "$KEEPALIVESTATUSDIR" ];then
  echo -e "\n$KEEPALIVESTATUSDIR doesn't existing...creating.."
  mkdir -p $KEEPALIVESTATUSDIR
fi

if [ ! -d "$SAS_CONFIG" ];then
  echo -e "\n$SAS_CONFIG doesn't existing...creating.."
  mkdir -p $SAS_CONFIG
fi

if [ ! -e "$keepalive_log_file" ]
then
    touch "$keepalive_log_file"
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

# Set permissions on sasg log dirs so automate id can access logs
# Setting permissions on each log dir individually - not granting r_x to every log file - ownership of log files will
# be set by logrotate
chmod 755 /sasg
chmod 755 /sasg/logs
chmod 755 /sasg/logs/Firewall
chmod 755 /sasg/logs/VPN

# now source in sasg server specific sasg_common.sh
source /sasg/bin/sasg_common.sh

#3.2.03 - changed iptables/keepalived build scripts to include proper JH interface, mask & tunnel interface name
# so no longer need to change it here.
###################################################################################
# NOTE: we can change SASG_NWIF=eth0 in vars.. timing issue when generating and used... 
# thus, change the interface in file 
###################################################################################
#if [ -z "$SASG_NWIF" ];then
#  SASG_NWIF="eth0"
#fi
#sed -i.bak s/$SASG_NWIF/$MACHINE_INTF/g ./keepalived.conf.${MACHINE_IP}
#sed -i.bak s/26/$MACHINE_SUBNET_MASK/g ./keepalived.conf.${MACHINE_IP}
#sed -i.bak s/$SASG_NWIF/$MACHINE_INTF/g ./iptables.${MACHINE_IP}
#if [ "$TUNNEL_TYPE" == "ipsec" ];then
  # change out whatever value was in vars for SASG_VPNIF for the IPSec tunnel interface
#  sed -i.bak s/$SASG_VPNIF/vti0/g ./iptables.${MACHINE_IP}
#  if [ -z "$MACHINE_MASQ_INTF" ];then
#    sed -i.bak s/$SASG_VPNIF/$MACHINE_INTF/g ./iptables.${MACHINE_IP}
#  else
#    sed -i.bak s/$SASG_VPNIF/$MACHINE_MASQ_INTF/g ./iptables.${MACHINE_IP}
#  fi
#fi

################################################################################
#Stop and disable firewalld
################################################################################

if [ "X$RHELVERSION" == "X7" ]; then
 if [[ -n `which firewalld 2>/dev/null` ]]; then
   echo "Disabling firewalld..."
   systemctl stop firewalld
   systemctl disable firewalld
 else
   echo "INFO: firewalld isn't installed." | tee -a $SASG_LOG
 fi
fi

################################################################################
# Obtain customer unique client keys 
################################################################################

if [ "$TUNNEL_TYPE" != "ipsec" ];then
echo "Moving keys into ${SAS_CONFIG}/auth..."

#mkdir -p /etc/openvpn/auth /etc/openvpn/status
#chmod 700 /etc/openvpn/auth /etc/openvpn/status
#cp ./keys/* /etc/openvpn/auth/
#chmod 640 /etc/openvpn/auth/*

mkdir -p ${SAS_CONFIG}/auth ${SAS_CONFIG}/status
chmod 700 ${SAS_CONFIG}/auth ${SAS_CONFIG}/status
cp ./keys/* ${SAS_CONFIG}/auth/
chmod -R 640 ${SAS_CONFIG}
fi

###############################################################################
# Check SELinux mode
###############################################################################
SELstatus=`getenforce | tr A-Z a-z `
echo "################################################################################################" 
echo "INFO: Current SELinux status is \"$SELstatus\"" | tee -a $SASG_LOG
if [[ $SELstatus == 'enforcing' ]]; then
   echo "" | tee -a $SASG_LOG
   echo "   To set \"permissive\" mode, run command:"  | tee -a $SASG_LOG
   echo "   setenforce permissive"   | tee -a $SASG_LOG
   echo "   To make this change permanent, edit the /etc/selinux/config file and replace the following value:"| tee -a $SASG_LOG
   echo "   SELINUX=permissive" | tee -a $SASG_LOG
   echo "" | tee -a $SASG_LOG
   echo "   To set \"disabled\" mode:" | tee -a $SASG_LOG 
   echo "   1)edit the /etc/selinux/config file and replace the following value:"  | tee -a $SASG_LOG
   echo "   SELINUX=disabled" | tee -a $SASG_LOG
   echo "   2)reboot server" | tee -a $SASG_LOG
   echo "################################################################################################" 
fi

################################################################################
# If IPSec copy proper ipsec.conf & build ipsec.secrets file
################################################################################

# move to /sasg/config - not doable as of 8sep2017- pluto --config arg doesnt appear to care if ipsec.config
# file is where you tell it - if there isnt an /etc/ipsec.conf file, it wont start the tunnel.
if [ "$TUNNEL_TYPE" == "ipsec" ];then
  IPSEC_CONF="/etc/ipsec.conf"
  IPSEC_SECRETS="/etc/ipsec.secrets"
  if [ -f "$IPSEC_CONF" ];then
    echo -e "\nBacking up IPSec config file $IPSEC_CONF  as ${IPSEC_CONF}.${DATE}...."
    mv ${IPSEC_CONF} ${IPSEC_CONF}.${DATE}
  fi

  echo -e "\nCopying IPSec config file ipsec.conf.$MACHINE_IP $IPSEC_CONF ..."
  if [ -z "$MACHINE_MASQ_IP" ];then
    # no pub ip defined on this machine - set left param to sasg primary ip
    sed -i.bak s@SASG_LEFT@$MACHINE_IP@g ./ipsec.conf.${MACHINE_IP}
  else
    # set left param in ipsec.conf to pub ip of sasg
    sed -i.bak s@SASG_LEFT@$MACHINE_MASQ_IP@g ./ipsec.conf.${MACHINE_IP}
  fi
   
  sed -i.bak s@CHANGEME@$VPNLOG@g ./ipsec.conf.${MACHINE_IP}
  cp ipsec.conf.${MACHINE_IP} ${IPSEC_CONF}

  echo -e "\nCreating IPSec secrets file $IPSEC_SECRETS ..."
  #only one ipsec secret file per sasg site - grab keyfile for primary sasg_ip_1
  #SECRET=$(cat ./keys_ipsec/ipsecpsk.${SASG_IP_1[$ARRAYNUM]})
  # change - use psk for first sasg peer site - required for 
  SECRET=$(cat ./keys_ipsec/ipsecpsk.${SASG_IP_1[0]})

  # if machine masq ip not found on server (ie dual nic, not natting pub ip, then use machine ip in secrets file)
  if [ -z "$MACHINE_MASQ_IP" ];then
     echo "${MACHINE_IP} $PUBLIC_VYOS_IP @peer${ARRAYNUM} : PSK \"$SECRET\"" > ${IPSEC_SECRETS}
  else
     echo "${MACHINE_MASQ_IP} $PUBLIC_VYOS_IP @peer${ARRAYNUM} : PSK \"$SECRET\"" > ${IPSEC_SECRETS}
  fi
  chmod 740 ${IPSEC_SECRETS}

  echo -e "\nSetting ipsec service to disabled - should be managed by keepalived.\n"
  if [ "X$RHELVERSION" == "X7" ]; then
    systemctl disable ipsec
  else
    chkconfig --level 345 ipsec off
  fi
  
fi


################################################################################
# Configure OpenVPN
################################################################################

if [ "$TUNNEL_TYPE" != "ipsec" ];then
  echo "Configuring OpenVPN..."

  #echo "Copying ./client.conf.${MACHINE_IP} /etc/openvpn/client.conf ..."
  #cp ./client.conf.${MACHINE_IP} /etc/openvpn/client.conf
  echo "Copying ./client.conf.${MACHINE_IP} ${SAS_CONFIG}/client.conf ..."
  cp ./client.conf.${MACHINE_IP} ${SAS_CONFIG}/client.conf

# for JH+ - don't disable openvpn service - just move old config file if exists & kill openvpn process if running
  grep -qi "SASG" /etc/openvpn/client.conf
  if [ "$?" -eq 0 ];then
    echo -e "\nFound SASG entry in /etc/openvpn/client.conf...moving conf file to /sasg/backup.  New openvpn"
    echo -e "configs will be located in $SAS_CONFIG.\n"
    mv /etc/openvpn/client.conf /sasg/backup/client.conf.$DATE
    openvpn_pid=$(ps aux|grep "/etc/openvpn"|grep "config client.conf"|grep -v grep | awk '{print $2}')
    if [ ! -z "$openvpn_pid" ];then
      echo -e "\nStopping openvpn process $openvpn_pid\n"
      kill $openvpn_pid
    fi
  fi
#  echo -e "\nSetting openvpn service to disabled - should be managed by keepalived.\n"
#  if [ "X$RHELVERSION" == "X7" ]; then
#    systemctl disable openvpn@client.service
#  else
#    chkconfig --level 2345 openvpn off
#  fi


fi # if [ "$TUNNEL_TYPE" == "ipsec"....

################################################################################
##Configure Keeplived
################################################################################

# DONE: discovery of interface name == IP of box
# DONE: need to differentiate keepalived.sh to primary and secondary... parameterize priority if possible

echo "Configuring Keepalived..."
MASTERBACKUPDIR="/usr/libexec/keepalived"
KEEPDIR="/etc/keepalived"

if [ ! -d "$KEEPDIR" ];then
  echo -e "$KEEPDIR does not exist...creating..."
  mkdir $KEEPDIR
fi
if [ ! -d "/var/run/openvpn" ];then
  echo -e "/var/run/openvpn does not exist...creating..."
  mkdir /var/run/openvpn
fi
if [ ! -d "$MASTERBACKUPDIR" ];then
  echo -e "$MASTERBACKUPDIR does not exist...creating..."
  mkdir $MASTERBACKUPDIR
fi
if [ -f "$MASTERBACKUPDIR/master-backup.sh" ];then
  mv ${MASTERBACKUPDIR}/master-backup.sh ${MASTERBACKUPDIR}/master-backup.sh.previous
fi
if [ -f "$KEEPDIR/keepalived.conf" ];then
  mv ${KEEPDIR}/keepalived.conf ${KEEPDIR}/keepalived.conf.previous
fi
# install new master-backup.sh 
if [ "$TUNNEL_TYPE" == "ipsec" ];then
  cp master-backup_ipsec.sh $MASTERBACKUPDIR/master-backup.sh
else
  cp master-backup.sh $MASTERBACKUPDIR
fi
cp ./keepalived.conf.${MACHINE_IP} ${KEEPDIR}/keepalived.conf

if [[ $SELstatus == 'enforcing' || $SELstatus == 'permissive' ]]; then
  echo -e "\n**Detected SELinux in $SELstatus mode...\n"

  echo -e "\n**Setting context for $KEEPDIR ..."
  chcon system_u:object_r:keepalived_var_run_t:s0 $KEEPDIR
  # change keepalived dir in master-backup file
  echo -e "Setting context on $MASTERBACKUPDIR/master-backup.sh ..."
  # chgd default location in scripts to match what's needed for selinux so no longer have to 
  # sed each file
  #  sed -i.bak s@/etc/keepalived@/usr/libexec/keepalived@g ./master-backup.sh
  restorecon -v ${MASTERBACKUPDIR}/master-backup.sh

  # update master-backup dir in keepalived.conf file
  echo -e "Setting context on $KEEPDIR/keepalived.conf ..."
#  sed -i.bak s@/etc/keepalived/master-backup.sh@/usr/libexec/keepalived/master-backup.sh@g ./keepalived.conf.${MACHINE_IP}
  restorecon -v ${KEEPDIR}/keepalived.conf

cat > /tmp/ibmsasg.te <<EOL
module ibmsasg 1.0;

require {
   type systemd_systemctl_exec_t;
   type init_t;
   type openvpn_t;
   type keepalived_t;
   type systemd_unit_file_t;
   class process { sigkill };
   class file { execute execute_no_trans read getattr open };
   class unix_stream_socket { connectto };
   class service { start status stop };
}

allow keepalived_t openvpn_t:process { sigkill };

allow keepalived_t systemd_systemctl_exec_t:file { execute execute_no_trans read getattr open };

allow keepalived_t init_t:unix_stream_socket { connectto };

allow keepalived_t systemd_unit_file_t:service { start status stop };
EOL

#  echo -e "Installing SELinux utils - policycoreutils-python..."
#  yum -y install policycoreutils-python
  echo -e "\nSetting keepalived additional permissions via SELinux policy module..."
  checkmodule -m -o /tmp/ibmsasg.mod /tmp/ibmsasg.te
  semodule_package -o /tmp/ibmsasg.pp -m /tmp/ibmsasg.mod
  semodule -i /tmp/ibmsasg.pp

fi

if [ "X$RHELVERSION" == "X7" ]; then
  systemctl restart keepalived
else
  /etc/init.d/keepalived restart
fi


################################################################################
# Enable ip Forward 
################################################################################

echo "Enabling IP Forward..."
FWCNT=$(cat /etc/sysctl.conf |grep "net.ipv4.ip_forward = 1" |wc -l|awk '{print $1}')
if [ $FWCNT -ge 1 ];then
  echo -e "\nmore than one net.ipv4.ip_forward = 1  line in /etc/sysctl.conf...cleaning up..."
  cp /etc/sysctl.conf /etc/sysctl.conf.prev
  cat /etc/sysctl.conf.prev |grep -v "net.ipv4.ip_forward = 1" > /etc/sysctl.conf
  echo net.ipv4.ip_forward = 1 >> /etc/sysctl.conf
else
  echo -e "\nadding net.ipv4.ip_forward = 1 to /etc/sysctl.conf..."
  echo net.ipv4.ip_forward = 1 >> /etc/sysctl.conf
fi

echo -e "restarting sysctl..."
sysctl -p /etc/sysctl.conf

################################################################################
# Configure ipset
################################################################################

echo -e "\nConfiguring IPSet..."
IPSET="/etc/sysconfig/ipset"

cp ./ipset.${MACHINE_IP} $IPSET
if [ $? -ne 0 ];then
  echo -e "Error Copying ./ipset.${MACHINE_IP} $IPSET  ...ipset required..exiting..\n"
  exit 1
fi
chmod 644 $IPSET

if [ "X$RHELVERSION" == "X7" ]; then

  systemctl enable ipset
  if [ $? -ne 0 ];then
    echo -e "\nError - unable to enable ipset - ipset required...exiting..\n"
    exit 1
  fi

  echo "restarting network......."
  systemctl restart network
  if [ $? -ne 0 ];then
    echo -e "\nError - error restarting network - manual intervention required. exiting.\n"
    exit 1
  fi

  # before restarting ipset, stop iptables so there's no reliance on ipset & ipset will restart with just the new config
  # we enable iptables in the next section after copying new config 
  echo "stopping iptables & restarting ipset..."
  systemctl stop iptables
  systemctl restart ipset
  if [ $? -ne 0 ];then
    echo -e "\nError -  error restarting ipset - ipset is required...exiting..\n"
    exit 1
  else
    echo -e "\nSuccess - ipset restarted."
  fi
  
else
  # create symlink from /etc/sysconfig/ipset to /etc/ipset/ipset
  if [ ! -s "/etc/sysconfig/ipset" ];then
    echo -e "\ncreating ipset symlink:  ln -s /etc/ipset/ipset /etc/sysconfig/ipset  ...\n"
    RET=$(ln -s /etc/ipset/ipset /etc/sysconfig/ipset)
    if [ $? -ne 0 ];then
      echo -e "\n**Error creating ipset symlink:  $RET\n"
    fi
  fi

  chkconfig --list ipset | awk '{print $5,$6,$7}'|grep off
  if [ $? -eq 0 ];then
     # ipset is of in either runlevel 3,4 or 5 so run chkconfig to turn it on
     echo -e "\nrunning chkconfig to enable ipset.\n"
     chkconfig --level 2345 ipset on
     if [ $? -ne 0 ];then 
        echo "\nError running: chkconfig --level 2345 ipset on...exiting\n"
        exit 1
     else
        service network restart
        if [ $? -ne 0 ];then 
          echo "\nError restarting network - manual intervention required. exiting.\n"
          exit 1
        fi
     fi
  fi
  # before restarting ipset, stop iptables so there's no reliance on ipset & ipset will restart with just the new config
  # we enable iptables in the next section after copying new config 
  service iptables stop
  service ipset restart
  if [ $? -ne 0 ];then 
     echo "\nError restarting ipset service."
     exit 1
  fi

fi


################################################################################
# Configure iptables
################################################################################

echo -e "\nConfiguring IPTables..."

if [ "X$RHELVERSION" == "X7" ]; then
  systemctl enable iptables
else
  chkconfig --level 345 iptables on
fi
# back up orig iptables file - put in if-then so we don't log an error if this is the first install
if [ -f "/etc/sysconfig/iptables" ];then
  cp /etc/sysconfig/iptables /etc/sysconfig/iptables.orig
fi

# no need to do primary/backup check - updated sasg_main.sh to add MACHINE_IP to vars when it runs.
# sasg_main checks for configured ip's when it runs & updates vars based on which ip it finds
cp ./iptables.${MACHINE_IP} /etc/sysconfig/iptables

# DONE: need to differentiate iptables.sh to primary and secondary
#if [ "$MACHINE_TYPE" == "PRIMARY" ]; then
#    cp ./iptables.$SASG_IP_1 /etc/sysconfig/iptables
#else # SECONDARY
#    cp ./iptables.$SASG_IP_2 /etc/sysconfig/iptables
#fi
if [ "X$RHELVERSION" == "X7" ]; then
  RET=$(systemctl restart iptables)
  if [ "$?" -ne 0 ];then
    echo -e "\nERROR: iptables restart failed - $RET"
    exit 1
  fi
else
  RET=$(service iptables restart)
  if [ "$?" -ne 0 ];then
    echo -e "\nERROR: iptables restart failed - $RET"
    exit 1
  fi
fi


################################################################################
# Configure logrotate / rsyslogd
################################################################################
./syslog_config.sh
if [ $? -ne 0 ];then
  echo -e "\nError running logrotate / rsyslog config - exiting.\n"
  exit 1
fi

################################################################################
## Install MRTG code, update cron in next step where we update cron for keepalived
################################################################################
if [ "X$RHELVERSION" == "X7" ]; then
  MRTG_TAR="./sasgMRTG_rh7.tar.gz"
else
  MRTG_TAR="./sasgMRTG_rh6.tar.gz"
fi

if [ ! -f "$MRTG_TAR" ];then
  echo -e "\nError - $MRTG_TAR not found !\n"
else
  echo -e "\nInstalling MRTG - untar'ing $MRTG_TAR files to /sasg/ "
  tar -zxvf ${MRTG_TAR} -C /sasg
  if [ "$?" -ne 0 ];then
    echo -e "\nError untar'ing $MRTG_TAR !\n"
  else
    echo -e "Successfully extracted MRTG files.\n"
   # if [ ! -d "/sasg/MRTG/conf" ];then
   #   echo -e "\n/sasg/MRTG/conf does not exist..creating."
   #   mkdir /sasg/MRTG/conf
   #   if [ "$?" -ne 0 ];then
   #     echo -e "\nError creating /sasg/MRTG/conf directory!\n"
   #   else
   #     echo -e "/sasg/MRTG/conf created successfully!\n"
   #   fi
   # fi
  fi
fi


###############################################################################
# Set up cronjob to monitor keepalived
# should be set up last so it doesn't see keepalive as down & kill openvpn/ipsec
###############################################################################

echo -e "\nSetting up keepalived and vpn tunnel monitoring ..."
if [ "$TUNNEL_TYPE" == "ipsec" ];then
  cp keepalived_ipsec_cron.sh /sasg/bin/keepalived_cron.sh
  cp keepalived_restart_cron.sh /sasg/bin/keepalived_restart_cron.sh
  cp sasg-check-keepalived_ipsec.sh /sasg/bin/sasg-check-keepalived.sh
else
  cp keepalived_cron.sh /sasg/bin/keepalived_cron.sh
  cp keepalived_restart_cron.sh /sasg/bin/keepalived_restart_cron.sh
  cp sasg-check-keepalived.sh /sasg/bin/sasg-check-keepalived.sh
fi
# now update ports in sasg-check-keepalived.sh script
if [ "$TUNNEL_TYPE" == "ipsec" ];then
 echo -e "ipsec tunnel type, using primary public ip in keepalived check"
 USEIP=$PUBLIC_VYOS_IP
else
 # openvpn - check array number -if greater than 0 means we have a multi-sasg config
 # and this is the 2nd/3rd, etc site.  Have to use the proper portable vtun ip defined in vars
 # in the sasg-check-keepalived.sh or else the connection test will not succeed.
 if [ $ARRAYNUM -eq 0 ];then
   echo -e "openvpn tunnel type, first sasg site, using primary public ip in keepalived check"
   USEIP=$PUBLIC_VYOS_IP
 else
   if [ ! -z "${PORTABLE_VTUN_CIDR[$ARRAYNUM]}" ];then
     # if we have a portable vtun cidr defined, get the ip address portion
     USEIP=$(echo ${PORTABLE_VTUN_CIDR[$ARRAYNUM]} | cut -f1 -d'/')
   else
     # give warning in log - no portable vtun cidr defined - using public vyos ip
     # shouldn't ever hit this as arraynum wouldn't be incremented unless the sasg_ip values were
     # defined incorrectly in vars or the portable_vtun_cidr was not set with a proper array #
     echo -e "\n*** WARNING! - Multi-SASG config detected but no portable vtun ip found for this site. Using $PUBLIC_VYOS_IP in keepalived check - tunnel may not start properly."
     USEIP=$PUBLIC_VYOS_IP
   fi
 fi
fi

# sjb - 9/19/17 - instead of setting vyos ip & port directly in sasg-check-keepalived.sh, add it to 
# the sasg_common.sh we're already sourcing in
#echo -e "\nsetting VYOS_PUBIP=$USEIP in sasg-check-keepalived.sh"
#sed -i.bak s@VYOS_PUBIP_HERE@$USEIP@g /sasg/bin/sasg-check-keepalived.sh
echo -e "\nAdding VYOS_PUB_IP=$USEIP and VYOS_BPM_PORT=443 to /sasg/bin/sasg_common.sh"
echo -e "VYOS_PUB_IP=$USEIP" >>/sasg/bin/sasg_common.sh
echo -e "VYOS_BPM_PORT=443" >>/sasg/bin/sasg_common.sh
if [ ! -z "$HTTPS_PROXY" ];then
  echo -e "\nAdding HTTPS_PROXY=${HTTPS_PROXY} to /sasg/bin/sasg_common.sh"
  echo -e "HTTPS_PROXY=${HTTPS_PROXY}" >>/sasg/bin/sasg_common.sh
  if [ -z "$HTTPS_PROXY_PORT" ];then
    # set default to 443
    echo -e "Adding HTTPS_PROXY_PORT=443 to /sasg/bin/sasg_common.sh\n"
    echo -e "HTTPS_PROXY_PORT=443" >>/sasg/bin/sasg_common.sh
  else
    echo -e "Adding HTTPS_PROXY_PORT=${HTTPS_PROXY_PORT} to /sasg/bin/sasg_common.sh\n"
    echo -e "HTTPS_PROXY_PORT=${HTTPS_PROXY_PORT}" >>/sasg/bin/sasg_common.sh
  fi
fi

chmod 750 /sasg/bin/*

crontab -l &>/dev/null
if [ $? -ne 0 ];then
echo -e "\nno current root crontab, creating new crontab with keepalived monitors and mrtg tool...."
  # no current crontab - create new crontab file to load
cat > /tmp/root.cron <<EOL
* * * * * /sasg/bin/keepalived_cron.sh &>/dev/null
*/5 * * * * /sasg/bin/keepalived_restart_cron.sh &>/dev/null
*/5 * * * * /sasg/MRTG/scripts/generic.pl >/dev/null 2>/dev/null
EOL
  crontab /tmp/root.cron
else
  # already an existing crontab
  echo -e "\ncurrent root crontab, keeping any existing entries & just replacing keepalived and mrtg entries..."
  crontab -l >/tmp/root.cron
  grep -q "keepalived_cron.sh" /tmp/root.cron
  if [ "$?" -eq 0 ];then
    # already have a keepalived_cron entry - create new root.cron without the keepalived or MRTG lines
    crontab -l|egrep -v "keepalived_cron|keepalived_restart|sasg\/MRTG" >/tmp/root.cron
  fi
  echo "* * * * * /sasg/bin/keepalived_cron.sh &>/dev/null" >>/tmp/root.cron
  echo "*/5 * * * * /sasg/bin/keepalived_restart_cron.sh &>/dev/null" >>/tmp/root.cron
  echo "*/5 * * * * /sasg/MRTG/scripts/generic.pl >/dev/null 2>/dev/null" >>/tmp/root.cron
  crontab /tmp/root.cron
fi

################################################################################
## Configure NGINX
################################################################################
./nginx_configure.sh
if [ "$?" -ne 0 ];then
  echo -e "nginx configuration error\n"
  exit 1
fi


################################################################################
## test
################################################################################
echo -e "\nNew iptables rules: \n"
iptables -nvL -t nat

# Final output to show the tunnel status
if [ "$MACHINE_TYPE" == "PRIMARY" ]; then

    # TODO check whether this needs fix. only primary has a tunnel.. so check primary only.
    # NOTE: This seems to take longer time to establish the tunnel, so wait like 10 seconds before finishing.

    echo -e "Waiting 10 seconds for the tunnel up....\n"
    sleep 10

    if [ "$TUNNEL_TYPE" == "ipsec" ];then
       $STATUS_IPSEC
    else
       #OPRPOC=$(ps aux|grep "/etc/openvpn"|grep "config client.conf"|grep -v grep)
       OPRPOC=$(ps aux|grep "$SAS_CONFIG"|grep "config client.conf"|grep -v grep)
       if [ -z "$OPROC" ];then
         echo -e "openvpn process not running.\n"
       else
         echo -e "$OPROC\n"
       fi
    fi

# if ipsec tunnel, connect to  pub vyos & port 443 - tests connection to bpm server
# if openvpn tunnel,  connect to sasg vip1 & port 443 - test connection to chef server
    if [ -f "$KEEPALIVED/MASTER" ];then
      if [ "$TUNNEL_TYPE" == "ipsec" ];then
        echo -e "\nTesting connectivity to bpm service..."
        timeout 1 bash -c "cat < /dev/null > /dev/tcp/$PUBLIC_VYOS_IP/443"
        if [ "$?" -ne 0 ]; then 
          echo "ERROR: Connection to $PUBLIC_VYOS_IP:443 is CLOSED."
          exit 1
        else
          echo "INFO: Connection to $PUBLIC_VYOS_IP:443 OPEN"
          exit 0
        fi
      else
        echo -e "\nTesting connectivity to chef service..."
        timeout 1 bash -c "cat < /dev/null > /dev/tcp/${SASG_VIP1[$ARRAYNUM]}/8443"
        if [ "$?" -ne 0 ]; then 
          echo "ERROR: Connection to ${SASG_VIP1[$ARRAYNUM]}:8443 is CLOSED."
          exit 1
        else
          echo "INFO: Connection to ${SASG_VIP1[$ARRAYNUM]}:8443 OPEN"
          exit 0
        fi
        
      fi # if [ "$TUNNEL_TYPE" == "ipsec....
    fi # if [ -f "$KEEPALIVED/MASTER...

fi

