#!/bin/bash
################################################################################
# Description: Install Tools (VyOS) and Generate Customer Package
# Author: Jinho Hwang
# Date: 2016.10.27
# Main: ./sasg_main.sh
# History:
#    2016.08.16 - Original script.
#    2016.10.27 - Added CUSTOMER_NETWORK_INFO logic
#               _ Added logic to skip SASG package creation if no customer network info
#    2017.04.28 - SBraun - added mkdir -p /config/auth/client/Sasg to store all sasg config and sasg_install script
#    2017.05.22 - SBraun - added call to ipsec ipsec_psk.sh to generate ipsec PSK 16 char shared secret
#    2017.05.31 - SBraun - added mrtg config code
#    2017.05.31 - SBraun - copy sasg_install.sh to /tmp as well as to new /config/auth/client/Sasg - Sasgaas
#               - needs the file in /tmp.  Fixed mrtg script logging as well.
#    2017.06.06 - updated directory conf files are created in - now in $FN/sasg_client, sasg self-extracting installer
#               - built from this directory - makes for smaller/cleaner sasg install
#    2017.06.12 - added sanity check section for vars file - initially checking if update mode is selected
#               - but chaning vtun port or tunnel type then log err & exit
#    2017.06.16 - added date/tim to install log filename, added chown -R on /config/auth to automate id to avoid install
#               - issues on existing accts where someone may have changed file/directory ownership.
#    2017.06.30 - changed remove of sasg_client subdir to recursive on initial cleanup prior to install to avoid misleading errs in install log.
#    2017.07.12 - Fixed err with existing vpn keys not being copied properly to sasg_client build dir
#    2017.07.17 - Moved chown of /config/auth to before it tries to copy files to the dir - accounts for systems where permissions were changed.
#    2017.07.24 - Minor change to use sasauto id vs automate id - chowns changed.
#    2017.07.25 - fixed err with a few err msgs not showing in install log.
#    2017.11.01 - Lots of changes for SASFW configuration 
#    2017.11.02 - Backup/dir creates in wrong spot - corrected.
#                   more error logging, use sasg_common.sh, create backup of existing install,
#                   updates to vars sanity checks, mrtg install, root crontab, more..
#    2017.11.07 - SBraun - minor updates on echo stmts., fixed sanity check done for vtun_port
#    2017.11.08 - SBraun - fixes for ipsec secrets install/config.
#    2017.11.13 - SBraun - added removal of old vpn / ipsec config files prior to running new config, fixed sudo so ipsec.d conf files get backed up properly.
#    2017.11.20 - SBraun - added exclude of /sasg/migrate directory  - avoid large backups of code used when vyos->sasfw migration was done previously.
#    2017.11.27 - SBraun - changed path to openvpn configs to $SAS_CONFIG vs /etc/openvpn as that's where it should be after new code is run on each server
#               - /etc/openvpn/server is where configs were from vyos->sasfw migration.  new installs use std /sasg/configs directory for configs & keys
#    2018.01.11 - SBraun - v3.1.07 - Added check - if no customer network info (no sasg_ip) defined, don't try to copy client side keys & create sasg_install.sh
#                        - avoids error msgs when configuring a dedicated rcp, shared rcp type env.
#    2018.01.11 - SBraun - v3.1.07 - added parsing of vars file TP_* variables & call to script to set bandwidth traffic control
#    2018.02.14 - SBraun - v3.1.07 - if DOCKER_CONTAINER=YES, copy docker_main.sh, keys to /sasg/configs/client/docker_client dir then create sasg_install.sh
#                        - with just that directories files. Small installer that just does basic dockerized client setup.
#    2018.02.14 - SBraun - v3.1.07 - removed misleading, extraneous "Customer network info True test comment" lines
#    2018.02.15 - SBraun - v3.1.07.01 -not all SAS redhat images have openvpn - added check/install of 
#                                      epel repo & openvpn if not already installed.
#    2018.02.20 - SDubrouskaya -v  -implemented IAMaaS automation 
#    2018.03.30 - SBraun - v3.1.07.03 - put in call to checkpkgs_sasfw.sh - checks for & install alls required ipset, iptables, openvpn, libreswan, etc
#    2018.04.11 - SBraun - v3.2.01 - added dump of in-memory ipset/iptables configs to /sasg/backup for future firewall revalidation.
#    2018.04.12 - SBraun - v3.2.01 - add sasfw hostname to sasg_common file so it gets into the sasg_client vars copy 
#                          and can be used in the rsyslog config for firewall log entries.
#    2018.04.12 - SBraun - v3.2.01 - added Model 5 support: sasg_install.sh package contains only scripts that are
#                                     required for nginx installation and configuration
#    2018.12.31 - SBraun - v4.08 - Force creation of dockerized sasg (DOCKER_CONTAINER=YES) if customer network=true
#    2019.03.22 - SBraun - v5.0  - call dnsmasq_setup.sh after ipset/iptables setup complete to set up dnsmasq service and cleanup utils.
# Notes:
#    This is the main script to run all other configuration scripts.
################################################################################

################################################################################
# Intercept other commands: network test, etc.
# NOTE: arguments can not have space. e.g., -n "a b" can not be used.
# From the package: ./sasg_vyos_configure.sh --quiet -- -n server.com server.com:80 -n server.com:8000
################################################################################

#######################################
# Check sanity of the data in vars file. ALthough the check is also performed
# in SASGaaS, checking here helps in case scripts are manually executed
# Globals:
#   BPM_IP - (sourced from vars file) IP of BPM SLA machine
#   CEBW_IP - (sourced from vars file) IP of single VM (which contains EE,
#     Chef & BPM together)
#   CHEF_IP - (sourced from vars file) IP of Chef SLA machine
#   SASG_IP_1 - (sourced from vars file) SASG IP. If set indicates that SASG
#     is present for current customer
#   EE_IP - (sourced from vars file) IP of EE SLA machine
# Arguments:
#   None
# Returns:
#   0 - data from vars was successfully validated
#   1 - data from vars is wrong
#######################################
function input_data_validation() {
# 28JUN2019 - 5.06 - do nothing for now - decoupling tools server reqmts from sasfw -hotfix 365
#  if [[ -n "${SASG_IP_1}" ]]; then
#    if [[ -z "${CEBW_IP}" ]] \
#      && [[ -z "${EE_IP}" ]] || [[ -z "${CHEF_IP}" ]] || [[ -z ${BPM_IP} ]] \
#    ; then
#      echo -e "\nDATA ERROR: SASG case require either single VM all all three SLA components"
#      return 1
#    fi
#  fi
#
  return 0
}

if [ ! -f "./vars" ];then
  echo -e "\nERROR: ./vars file not found!"
  exit 1
fi
source ./vars

if ! input_data_validation; then
  echo -e "\nERROR: Input data could not be validated"
  exit 1
fi

if [ ! -f "./sasg_client/sasg_common.sh" ];then
  echo -e "\nERROR: ./sasg_client/sasg_common.sh file not found!"
  exit 1
else
  echo -e "\ncopying ./sasg_client/sasg_common.sh to current build directory ..."
  cp ./sasg_client/sasg_common.sh .
  if [ "$?" -ne 0 ];then
    echo -e "ERROR:  cp ./sasg_client/sasg_common.sh . failed.  Required for multiple config scripts..exiting."
    exit 1
  fi
fi

# add SASFW short hostname to sasg_common file so it gets into the sasg_client copy
# and can be used in the rsyslog config for firewall log entries.
SASFW_HOST=$(hostname -s)
echo -e "\nappending SASFW_HOST=$SASFW_HOST to sasg_common.sh..."
echo "SASFW_HOST=${SASFW_HOST}" >> sasg_common.sh
echo "SASFW_HOST=${SASFW_HOST}" >> ./sasg_client/sasg_common.sh

# --- Init values ----------------
  case "${TUNNEL_TYPE}" in
    "model5") TUNNEL_TYPE=ipsec
              DVPN=YES
              echo "DVPN=YES" >> sasg_common.sh
      ;;
    "ipsec")
      DOCKER_COMPOSE_CONFIG="docker-compose-ipsec.yml"
      ;;
    "openvpn")
      ;&
    *)
      DOCKER_COMPOSE_CONFIG="docker-compose.yml"
      ;;
  esac
# --------------------------------

#IAMaaS section
if [[ -z "$IAMAAS_PRIMARY_SUBNET" && -z "$IAMAAS_PORTABLE_SUBNET" ]]; then
   echo "IAMaaS=NO" >> sasg_common.sh
elif [[ -z "$JUNIPER_VPN_IP" || -z "$IAMAAS_MAPPING" || -z "$LB_JUNCTION" ]]; then
    echo -e "\nERROR: Check if you specified all IAMaaS variables: JUNIPER_VPN_IP, IAMAAS_MAPPING, LB_JUNCTION."
    exit 1
elif [[ ${#IAMAAS_IPSEC_DESCR} -gt 20 ]]; then
     echo -e "\nERROR: Length of the IAMAAS_IPSEC_DESCR must be less than or equal to 20"
     exit 1
else
    if [ "${DVPN^^}" == "YES" ]; then #must be removed when Model 5 supports IAMaaS
       echo -e "\nERROR: DVPN doesn't support IAMaaS. Please remove IAMaas related variables from vars file."
       exit 1
    else
       ###### check if mapping defined for all customer subnets
       if [ -z $IAMaaS_SASG ]; then
          IAMaaS_SASG=0
          for ((INDEX=1; INDEX<${#CUSTOMER_SUBNETS[@]}; INDEX++))
             do
               IAMaaS_SASG="$IAMaaS_SASG $INDEX"
             done
       fi
       
       declare -A MAP
       for OCTET in $IAMAAS_MAPPING
       do
         CUSTOMER_OCTET=$(echo $OCTET | cut -d ";" -f1)
         IAMAAS_OCTET=$(echo $OCTET | cut -d ";" -f2)
         MAP[$CUSTOMER_OCTET]=$IAMAAS_OCTET
       done
       for INDEX in $IAMaaS_SASG
       do  
         SASG_SUBNETS=(${CUSTOMER_SUBNETS[INDEX]})
         for SUBNET in "${SASG_SUBNETS[@]}"
         do
           CUSTOMER_OCTET=$(echo $SUBNET | cut -d"." -f1)
           if [ -z ${MAP[$CUSTOMER_OCTET]} ]; then
              echo "No mapping deffined for customer subnet $SUBNET"
              exit 1
           fi
        done
       done   
       echo "IAMaaS=YES" >> sasg_common.sh
    fi
fi
#end IAMaaS section

#DVPN section
if [[ "${DVPN^^}" == "YES" ]]; then
   TUNNEL_TYPE=ipsec
   #must be removed when Model 5 supports RCP, CSC
   if [ ! -z ${CUSTPREM_TICKETING_IP[0]} ]; then
      echo -e "\nERROR: DVPN doesn't support Ticketing on the customer premise network."
      exit 1
   fi
fi

source ./sasg_common.sh

EXIT_FLAG=false

while [[ $# -gt 1 ]]
do
    key="$1"

    case $key in
        -n|--net_test)
            SERVER_ARRAY="$2"
            shift # past argument

            ./net_test.sh $SERVER_ARRAY
            EXIT_FLAG=true
        ;;
        *)
            # unknown option
        ;;
    esac
    shift # past argument or value
done

[ "$EXIT_FLAG" == "true" ] && exit 0

LOGEXIT(){
  MSG="$1"
  ROLLBACK="$2"
  echo -e "\nERROR: $MSG"
  if [ "$ROLLBACK" == "YES" ]; then
     echo -e "\n Starting config rollback...."
     sudo su - root -c " tar -C /etc/ipsec.d/ --strip-components=2 -xzf ${BACKUP} etc/ipsec.d/" && echo -e "\n ipsec config is restored"
     sudo su - root -c " tar -C /sasg/configs/ --strip-components=2 -xzf ${BACKUP} sasg/configs/server_vtun*" && echo -e "\n openvpn config is restored"
     sudo su - root -c " tar -C /etc/sysconfig --strip-components=2 -xzf ${BACKUP} etc/sysconfig/" && echo -e "\n ipset/iptables configs are restored"
     sudo su - root -c "systemctl stop iptables"
     sudo su - root -c "systemctl stop ipset"
     sudo su - root -c "systemctl start ipset"
     sudo su - root -c "systemctl start iptables"
     sudo su - root -c "systemctl restart ip6tables"
  fi
  exit 1
}


# expect to be run as sasauto id with full sasauto environment - if anything else, exit with error
[ "$USER" != "$SASOWNER" ] && LOGEXIT "Must run as user $SASOWNER"
[ ! -z "$SUDO_USER" ]  && LOGEXIT "Must run as user $SASOWNER with environment of $SASOWNER - use sudo su - $SASOWNER"

# Script Variables Section
if [ "${DVPN^^}" != "YES" ]; then
   if [[ -z $SASG_IP_1 ]] ; then
      echo Customer Network Info False in Vyos script
      CUSTOMER_NETWORK_INFO=false
   else
      echo Customer Network Info True in Vyos Script
      CUSTOMER_NETWORK_INFO=true
   fi
else
    if [[ -z $CUSTOMER_SUBNETS_MASQ_IP ]] ; then
      echo Customer Network Info False in Vyos script
      CUSTOMER_NETWORK_INFO=false
      echo "CUSTOMER_NETWORK_INFO is false but TUNNEL_TYPE is model 5. Exiting installation"
      exit 1
    else
      echo Customer Network Info True in Vyos Script
      CUSTOMER_NETWORK_INFO=true
    fi
fi #[ "${DVPN^^}" != "YES" ]

if [ -f "$SAS_CONFIGURE_LOG" ];then
  mv $SAS_CONFIGURE_LOG $SAS_CONFIGURE_LOG.previous
  if [ "$?" -ne 0 ];then
    echo -e "\nERROR: mv $SAS_CONFIGURE_LOG $SAS_CONFIGURE_LOG.previous  failed.  exiting."
    exit 1
  fi
fi
touch $SAS_CONFIGURE_LOG
chmod 666 $SAS_CONFIGURE_LOG

################################################################################
# START SASFW INSTALLATION
################################################################################

main(){
echo -e "\n$DATE\n"
echo ' ____    _    ____   _____  __          __                              '
echo '/ ___|  / \  / ___| |  ___| \ \   __   / /                              '
echo '\___ \ / _ \ \___ \ | |___   \ \ /  \ / /                               '
echo ' ___) / ___ \ ___)  | ____|   \ V /\ / /                                '
echo '|____/_/   \_\____/ |_|        \_/  \_/                                 '
echo '                                                                        '
echo '  ____ ___  _   _ _____ ___ ____ _   _ ____      _  _____ ___ ___  _   _       '
echo ' / ___/ _ \| \ | |  ___|_ _/ ___| | | |  _ \    / \|_   _|_ _/ _ \| \ | |      '
echo '| |  | | | |  \| | |_   | | |  _| | | | |_) |  / _ \ | |  | | | | |  \| |      '
echo '| |__| |_| | |\  |  _|  | | |_| | |_| |  _ <  / ___ \| |  | | |_| | |\  |      '
echo ' \____\___/|_| \_|_|   |___\____|\___/|_| \_\/_/   \_\_| |___\___/|_| \_| (_)  '
echo
echo '                                                       © IBM Corporation 2016  '
echo
echo -e "Automation Version: v${VERSION}\n"
#echo 'Terms & Conditions ... -> yes'

###############################################################################################
echo -e "\nCreating directories as needed, removing old configs and copying new files..."

CheckDir(){
  DIR2CHECK="$1"
  if [ ! -d "$DIR2CHECK" ];then
    echo -e "  directory $DIR2CHECK not found..creating..."
    mkdir -p $DIR2CHECK
    [ "$?" -ne 0 ] && LOGEXIT "mkdir -p $DIR2CHECK failed...exiting."
  else
    echo -e "  directory $DIR2CHECK ok..."
  fi
}

# check if top level directory exists then chown -R & chmod -R on it so we can create sub-directories
# as needed without having to sudo
if [ ! -d "$SAS_TOP" ];then
  echo -e "\n$SAS_TOP not found..creating and setting ownership to ${SASOWNER}.${SASOWNER} ..."
  sudo mkdir -p $SAS_TOP
  [ "$?" -ne 0 ] && LOGEXIT "sudo mkdir -p $SAS_TOP failed...exiting."

  sudo chmod -R 750 $SAS_TOP
  [ "$?" -ne 0 ] && LOGEXIT "sudo chmod -R 754 $SAS_TOP failed...exiting."
fi
echo -e "\nSetting $SAS_TOP ownership to $SASOWNER ..."
sudo chown -R ${SASOWNER}.${SASOWNER} $SAS_TOP
if [ "$?" -ne 0 ];then
  echo -e "\nERROR:  sudo chown -R ${SASOWNER}.${SASOWNER} $SAS_TOP  failed.  Exiting..."
  exit 1
fi
# created top-level, now create backup dir then make backups, delete any old files/dirs
# then create new directories & set auths
CheckDir "$SAS_BACKUP"

##
# Make backup of all sasfw configs files
##
echo -e "\nBacking up any existing configuration files and root sasg cronjobs ..."
# get any existing sasfw cronjobs & add those to backup
sudo crontab -l |grep "/sasg/bin" >/tmp/sasfw_root.cron
sudo su - root -c "tar -zcvf /sasg/backup/${SHOST}_${DATE}_backup.tar.gz --exclude="/sasg/backup/*" --exclude="/sasg/logs/*" --exclude="/sasg/migrate" /etc/openvpn /sasg /etc/sysconfig/iptables /etc/sysconfig/ip6tables /etc/sysconfig/ipset /etc/ipsec.conf /etc/ipsec.secrets /etc/ipsec.d/* /tmp/sasfw_root.cron /etc/rsyslog.d/sasgfw.conf /etc/logrotate.d/syslog /etc/logrotate.d/sasgfw /etc/rsyslog.conf &>/dev/null"

sudo chown -R ${SASOWNER}.${SASOWNER} /sasg/backup/${SHOST}_${DATE}_backup.tar.gz
echo -e "\nBackup created: /sasg/backup/${SHOST}_${DATE}_backup.tgz"
BACKUP="/sasg/backup/${SHOST}_${DATE}_backup.tar.gz"

################################################
# v3.2.01 chg - GDPR change for firewall revalidations
# Take snapshot of current iptables/ipset configurations in memory
# if an existing snapshot file for this code version doesn't already exist:
IPTABVALFILE="${SAS_BACKUP}/iptables_Validate_${SHOST}_Pre-$(echo "${VERSION}" | sha256sum - | awk '{print $1}')"
IPSETVALFILE="${SAS_BACKUP}/ipset_Validate_${SHOST}_Pre-$(echo "${VERSION}" | sha256sum - | awk '{print $1}')"

if [ ! -f "${IPTABVALFILE}" ];then
  if [ ! -f "${IPTABSAVECMD}" ];then
     # iptables-save command not found - likely new install
     echo -e "${IPTABSAVECMD} not found - new install." > "${IPTABVALFILE}"
  else
     echo -e "\nSaving current iptables configuration in memory to ${IPTABVALFILE} ..."
     sudo "${IPTABSAVECMD}" > "${IPTABVALFILE}"
     chmod 000 "${IPTABVALFILE}"
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
################################################
# clean up old config files so we can install new stuff
# **Note - not wiping any old files in /config/auth/client itself -new sasg code goes into sasg_client subdir
if [ -f "/tmp/$SAS_INSTALL_FILE" ];then
  echo -e "\n  deleting old /tmp/$SAS_INSTALL_FILE ..."
  rm -f /tmp/$SAS_INSTALL_FILE
  if [ "$?" -ne 0 ];then
    echo -e "WARNING: Failed to remove old install file /tmp/$SAS_INSTALL_FILE, trying with sudo.."
    sudo rm -f /tmp/$SAS_INSTALL_FILE
    [ "$?" -ne 0 ] && LOGEXIT "Sudo failed to remove old install file /tmp/$SAS_INSTALL_FILE ..exiting."
  fi
fi
# these removes should work since we already changed ownership successfully to $SASOWNER
echo -e "removing old install image: $SAS_CLIENT_IMAGE_DIR/$SAS_INSTALL_FILE ..."
rm -f $SAS_CLIENT_IMAGE_DIR/$SAS_INSTALL_FILE
# must be recursive remove for sasg_client dir as there are some subdirs & will error otherwise.
echo -e "removing previous sasg config scripts: $SAS_CLIENT_DIR/* ..."
rm -rf $SAS_CLIENT_DIR/*

# Create all proper subdirectories under top-level dir 
CheckDir "$SAS_BIN"
CheckDir "$SAS_CONFIG"
CheckDir "$SAS_LOGS"
CheckDir "$SAS_FWLOG_DIR"
CheckDir "$SAS_VPNLOG_DIR"
CheckDir "$SAS_TLSRSA_DIR"
CheckDir "$SAS_TLSAUTH_DIR"
CheckDir "$SAS_CLIENT_TOP"
CheckDir "$SAS_CLIENT_DIR"
CheckDir "$SAS_CLIENT_IMAGE_DIR"
CheckDir "$SAS_CLIENT_TLSKEYS_DIR"
CheckDir "$SAS_IPSECPSK_DIR"
CheckDir "$SAS_IPSECPSK_DIR_IAM"

# copy all install/config code to proper dir on sasfw
echo -e "copying new sasfw & sasg config scripts to $SAS_CLIENT_TOP ..."
cp -a ./* $SAS_CLIENT_TOP

#########################################################################################################
# Initial Sanity check of vars file - if doing update mode - can't be changing openvpn tunnel port or type
# as update mode doesn't delete interfaces.  If you change the openvpn port or type of tunnel, have to comment
# out INSTALL_MODE !

if [ "$INSTALL_MODE" == "update" ];then
  if [ "$TUNNEL_TYPE" == "ipsec" ];then

    #check if any VTUN entries exist in iptables - if so means
    # we're currently configured for openvpn not ipsec - cant switch when update mode selected
    sudo grep -q "\-o vtun0" /etc/sysconfig/iptables
    if [ "$?" -ne 0 ];then
      ls ${SAS_CONFIG}/server_vtun*.conf
      [ "$?" -eq 0 ] && LOGEXIT "openvpn firewall rules found in iptables & conf files found in ${SAS_CONFIG} - server configured for openvpn - can not switch to IPsec using INSTALL_MODE=update."
    fi
    
  else
    # update mode & openvpn tunnel type selected - loop thru sasg_ip arrays & check current vpn port against one defined in vars
    for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
    do
      # if vars vtun port variable not set for this sasg site use default of 1194
      if [ -z ${VTUN_PORT[$INDEX]} ];then
        USE_PORT=1194
        echo -e "no value found for VTUN_PORT[$INDEX] in vars file, using default of $USE_PORT .."
      else
        USE_PORT=${VTUN_PORT[$INDEX]}
      fi

      if [ ! -f "${SAS_CONFIG}/server_vtun${INDEX}.conf" ];then
         LOGEXIT "update mode selected but no current ${SAS_CONFIG}/server_vtun${INDEX}.conf file found."
      else
         CURRENTPORT=$(grep lport ${SAS_CONFIG}/server_vtun${INDEX}.conf | awk '{print $2}')
         if [ $USE_PORT != $CURRENTPORT ];then
           LOGEXIT "update mode selected but listener port found in current ${SAS_CONFIG}/server_vtun${INDEX}.conf file does NOT match current vars file setting of $USE_PORT."
         fi
      fi
    done

  fi
  #IAMaaS section TBD!!!!

    if [ "$IAMaaS" == "NO" ]; then
       interface=$(ip addr | grep vti1)
       if [[ "$interface" != "" ]]; then
          LOGEXIT "Update mode is selected. IAMaas variables isn't specified in the vars but IAMaas ipsec tunnel exists and up on the sasfw."
       fi  
    fi
    #end IAMaaS section
fi

# whether in install mode or not - give error if VTUN_PORT is specified but TUNNEL_TYPE is set to ipsec
if [ ! -z "${VTUN_PORT[0]}" ];then
  [ "$TUNNEL_TYPE" == "ipsec" ] && LOGEXIT "VTUN_PORT[0] is defined but TUNNEL_TYPE is set to ipsec.  If using tunnel type ipsec, comment out VTUN_PORT or make sure it's blank."
fi

#########################################################################################################
# Check for required software on sasfw & install if not already installed
# no need to sudo to root - checkpkgs runs yum with sudo su - root -c
./checkpkgs_sasfw.sh
if [ $? -ne 0 ]; then
    echo -e "\nCan not proceed without installing all required packages\n"
    exit 1
fi

################################################################################
# Enable ip Forward 
################################################################################

echo "Enabling IP Forward..."
FWCNT=$(sudo cat /etc/sysctl.conf |grep "net.ipv4.ip_forward = 1" |wc -l|awk '{print $1}')
if [ $FWCNT -ge 1 ];then
  echo -e "\nmore than one net.ipv4.ip_forward = 1  line in /etc/sysctl.conf...cleaning up..."
  sudo su - root -c "cp /etc/sysctl.conf /etc/sysctl.conf.prev"
  sudo su - root -c "cat /etc/sysctl.conf.prev |grep -v \"net.ipv4.ip_forward = 1\" > /etc/sysctl.conf"
  sudo su - root -c "echo net.ipv4.ip_forward = 1 >> /etc/sysctl.conf"
else
  echo -e "\nadding net.ipv4.ip_forward = 1 to /etc/sysctl.conf..."
  sudo su - root -c "echo net.ipv4.ip_forward = 1 >> /etc/sysctl.conf"
fi

echo -e "restarting sysctl..."
sudo su - root -c "/usr/sbin/sysctl -p /etc/sysctl.conf"

#########################################################################################################
if [[ "$CUSTOMER_NETWORK_INFO" = true || "${DVPN^^}" == "YES" ]] ; then
  # remove old openvpn and ipsec config files if existing
  for conf_file in $(ls ${SAS_CONFIG} |  egrep "server_vtun[0-9]{1,}.conf")
  do
    echo -e "removing ${SAS_CONFIG}/$conf_file"
    RET=$(rm -f ${SAS_CONFIG}/server_vtun*.conf)
    [ "$?" -ne 0 ] && echo -e "WARNING: error removing ${SAS_CONFIG}/$conf_file - $RET"
  done

  RET=$(sudo su - root -c "ls /etc/ipsec.d/site*.conf")
  if [ "$?" -eq 0 ];then
    # some ipsec configs exist - remove them before continuing on with our new configuration as these will already
    # be in the backup.
    echo -e "removing /etc/ipsec.d/site*.conf"
    RET=$(sudo su - root -c "rm -f /etc/ipsec.d/site*.conf")
    [ "$?" -ne 0 ] && echo -e "WARNING: error removing /etc/ipsec.d/site*.conf - $RET"

    echo -e "removing /etc/ipsec.d/v6neighbor*.conf"
    RET=$(sudo su - root -c "rm -f /etc/ipsec.d/v6neighbor*.conf")
    [ "$?" -ne 0 ] && echo -e "WARNING: error removing /etc/ipsec.d/v6neighbor*.conf - $RET"

    echo -e "removing /etc/ipsec.d/site*.secrets"
    RET=$(sudo su - root -c "rm -f /etc/ipsec.d/site*.secrets")
    [ "$?" -ne 0 ] && echo -e "WARNING: error removing /etc/ipsec.d/site*.secrets - $RET"
  fi #if [ "$?" -eq 0  ....

  # if setting up ipsec tunnel, create ipsec secrets file otherwise generate rsa keys for openvpn
  if [[ "$TUNNEL_TYPE" == "ipsec" || "$IAMaaS" == "YES" || "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
    echo -e "\n#############################################################################"
    echo -e "Calling IPsec PSK Configuration Script...."
    ./ipsec_psk.sh 2>&1
    [ "$?" -ne 0 ] && LOGEXIT "ipsec_psk.sh failed" "YES"

    echo -e "\n#############################################################################"
    echo -e "Calling IPsec Server Tunnel Configuration Script...."
    # successfully built ipsec psk, now build ipsec server config files
    ./ipsec_server.sh 2>&1
    [ "$?" -ne 0 ] && LOGEXIT "ipsec_server.sh failed" "YES"
  fi

  if [ "$TUNNEL_TYPE" != "ipsec" ]; then  
    echo -e "\n#############################################################################"
    echo -e "Calling Openvpn RSA Key Configuration Script...."
    ./openvpn_rsa.sh 2>&1
    [ "$?" -ne 0 ] && LOGEXIT "openvpn_rsa.sh failed" "YES"

    echo -e "\n#############################################################################"
    echo -e "Calling Openvpn Server Tunnel Configuration Script...."
    # successfully built openvpn keys, now build openvpn server config files
    ./openvpn_server.sh 2>&1
    [ "$?" -ne 0 ] && LOGEXIT "openvpn_server.sh failed" "YES"

  fi # if [ "$TUNNEL_TYPE" == "ipsec"...
fi

  # Call main SASFW ipset/iptables configuration script
  echo -e "\n#############################################################################"
  echo -e "Calling ipset / iptables Config Script...."
  ./cds_sasfw_setup.sh 2>&1
  [ "$?" -ne 0 ] && LOGEXIT "cds_sasfw_setup.sh failed." "YES"
  echo -e "Calling cfgip6tables Script...."
  ./cfgip6tables.sh 2>&1
  [ "$?" -ne 0 ] && LOGEXIT "cfgip6tables.sh failed." "YES"

  # Call dnsmasq_setup.sh to configure local dnsmasq service for updating ipset lists 
  # used for whitelisting on sasfw
  echo -e "\n#############################################################################"
  echo -e "Calling dnsmasq_setup.sh Config Script...."
  ./dnsmasq_setup.sh 2>&1
  [ "$?" -ne 0 ] && LOGEXIT "dnsmasq_setup.sh failed." "YES"


################################################################################
# Install MRTG code, update roots crontab with mrtg
################################################################################
echo -e "\n#############################################################################"
echo -e "Unpacking MRTG Tar and configuring root crontab..."
# grab mrtg tar file from sasg client dir - same code
MRTG_TAR="./sasg_client/sasgMRTG_rh7.tar.gz"

if [ ! -f "$MRTG_TAR" ];then
  echo -e "\nError - $MRTG_TAR not found !\n"
else
  echo -e "Installing MRTG - untar'ing $MRTG_TAR files to /sasg/ "
  #untar mrtg files - shouldn't need root to untar - already set ownership of /sasg & all
  #mrtg files go to /sasg/MRTG
  tar -zxvf ${MRTG_TAR} -C $SAS_TOP
  if [ "$?" -ne 0 ];then
    echo -e "\nERROR: tar -zxvf ${MRTG_TAR} -C /sasg unsuccessful - manual intervention required!\n"
  else
    echo -e "Success:  successfully extracted MRTG files under $SAS_TOP.\n"
  fi
fi

cp ./sasg_common.sh $SAS_BIN
cp ./VERSION $SAS_BIN
chmod 754 $SAS_BIN/*
cp sasfwcheck $SAS_BIN
chmod 755 $SAS_BIN/sasfwcheck
# as root, if /usr/local/bin/sasfwcheck symlink doesn't exist, create it
ls -l /usr/local/bin/sasfwcheck | grep -q "^l"
if [ "$?" -ne 0 ];then
  echo -e "creating /usr/local/bin/sasfwcheck -> $SAS_BIN/sasfwcheck symlink..."
  RET=$(sudo su - root -c "ln -s /sasg/bin/sasfwcheck /usr/local/bin/sasfwcheck")
  [ "$?" -ne 0 ] && echo -e "WARNING: failed to create /usr/local/bin/sasfwcheck -> $SAS_BIN/sasfwcheck symlink - $RET"
fi

sudo crontab -l &>/dev/null
if [ "$?" -ne 0 ];then
   echo -e "\nno current root crontab, creating new crontab with keepalived monitors and mrtg tool...."
   # no current crontab - create new crontab file to load
      
cat > /tmp/sasfw_root.cron <<EOL
*/5 * * * * /sasg/MRTG/scripts/generic.pl >/dev/null 2>/dev/null
EOL

else
   # already an existing crontab
   echo -e "\ncurrent root crontab exists, replacing all entries with /sasg - original file written to /tmp/sasfw_root"
   # get root cronjobs except for those with /sasg in them & write to temp file - ownership will be sasauto
   # this way we can replace sasg cronjobs without overwriting existing other root cron entries
   sudo crontab -l|egrep -v "/sasg" >/tmp/sasfw_root.cron
   echo "*/5 * * * * /sasg/MRTG/scripts/generic.pl >/dev/null 2>/dev/null" >>/tmp/sasfw_root.cron
fi

sudo crontab /tmp/sasfw_root.cron
[ "$?" -ne 0 ] && LOGEXIT "sudo crontab /tmp/sasfw_root.cron failed..exiting"
###############################################################################


################################################################################
# Configure logrotate / rsyslogd
################################################################################
echo -e "\n#############################################################################"
echo -e "Configuring rsyslogd and logrotate"
BUILDDIR=$(pwd)
sudo su - root -c "$BUILDDIR/syslog_config.sh 2>&1"
[ "$?" -ne 0 ] && LOGEXIT "sudo su - root -c \"$BUILDDIR/syslog_config.sh 2>&1\" failed: $RET"


################################################################################
# Copy tls/ipsec keys to proper places & build sasg package
################################################################################

# add check - if no sasg_ip is defined then this is likely ipcenter tactical or rcp only deploy
# with no jumphost (sasg), hence no need to build a sasg_install.sh package
if [[ "$CUSTOMER_NETWORK_INFO" = true && "${DVPN^^}" != "YES" ]] ; then
   echo -e "\n#############################################################################"
   echo -e "Generating client package...."
   # v4.08 - force creating of dockerized sasg code if sasg_ip is set
   DOCKER_CODE_DIR="${SAS_CLIENT_TOP}/docker_client"

   if [ ! -d "${DOCKER_CODE_DIR}" ];then
       mkdir ${DOCKER_CODE_DIR}
   else
       rm -rf ${DOCKER_CODE_DIR}/*
   fi
   cp ./VERSION $DOCKER_CODE_DIR
   cp ./vars $DOCKER_CODE_DIR
   cp ./docker_main.sh $DOCKER_CODE_DIR
   cp ./podman_main.sh $DOCKER_CODE_DIR
   cp ./logrotate-docker.sh $DOCKER_CODE_DIR

   cp ./"${DOCKER_COMPOSE_CONFIG}" $DOCKER_CODE_DIR
   cp --recursive ./HA/* "${DOCKER_CODE_DIR}/"
   cp --recursive ./container-resiliency/* "${DOCKER_CODE_DIR}/"
   cp --recursive ./autoupdate/* "${DOCKER_CODE_DIR}/"
   mkdir "${DOCKER_CODE_DIR}/gcm"
   cp --recursive ./gcm/* "${DOCKER_CODE_DIR}/gcm"
   cp sasg_client/install-gcm-infrastructure.sh "${DOCKER_CODE_DIR}/"

   echo -e "\nList of files to include:"
   find "${DOCKER_CODE_DIR}"
   echo -e "\n"

   # short hostname of sasfw needed in vars file - used to build client docker dir on sasg
   echo -e "\nDOCKER_SASFW=$SHOST" >>${DOCKER_CODE_DIR}/vars

   # Stage logpush keys/certs on SASFW
   mkdir --parent /sasg/configs/auth-logpush
   for cred_file in ./ca.key ./ca.crt ./server.key ./server.crt ./client.key ./client.crt; do
    if [[ ! -f "/sasg/configs/auth-logpush/${cred_file}" ]]; then
      echo "${cred_file} is missing in /sasg/configs/auth-logpush. Replacing all files"
      mv --force \
        ./ca.key \
        ./ca.crt \
        ./server.key \
        ./server.crt \
        ./client.key \
        ./client.crt \
        /sasg/configs/auth-logpush
      break
    fi
   done
     
   rm -rf "${DOCKER_CODE_DIR}/auth-logpush" 
   mkdir "${DOCKER_CODE_DIR}/auth-logpush"
   cp /sasg/configs/auth-logpush/client.* "${DOCKER_CODE_DIR}/auth-logpush"
   sha256sum "${DOCKER_CODE_DIR}/auth-logpush"/*

   # create docker keys dir & copy appropriate files
   mkdir ${DOCKER_CODE_DIR}/keys
   if [ "$TUNNEL_TYPE" == "ipsec" ]; then
   
     # copy secrets file for each tunnel to ipsec.d
    sudo su - root -c "/usr/bin/cp ${SAS_IPSECPSK_DIR}/site*.secrets $SAS_IPSECCONF_DIR"
    [ "$?" -ne 0 ] && LOGEXIT "sudo su - root -c \"/usr/bin/cp ${SAS_IPSECPSK_DIR}/site*.secrets $SAS_IPSECCONF_DIR\" failed." 
    echo -e "\ncopied ipsec secrets ${SAS_IPSECPSK_DIR}/site*.secrets to $SAS_IPSECCONF_DIR"

    # TODO get secrets for ipsec
     echo -e "\ncopying $SAS_IPSECPSK_DIR/ipsec.* to ${DOCKER_CODE_DIR}/keys"
     cp ${SAS_IPSECPSK_DIR}/* ${DOCKER_CODE_DIR}/keys
     [ "$?" -ne 0 ] && LOGEXIT "cp ${SAS_IPSECPSK_DIR}/.* ${DOCKER_CODE_DIR}/keys failed, exiting."
     echo "IPSec keys:  $(ls "${DOCKER_CODE_DIR}/keys")"
   else
     echo -e "copying $SAS_TLSRSA_DIR/keys/"$HOSTNAME".SASG.* to ${DOCKER_CODE_DIR}/keys"
     cp $SAS_TLSRSA_DIR/keys/"$HOSTNAME".SASG.* ${DOCKER_CODE_DIR}/keys
     [ "$?" -ne 0 ] && LOGEXIT "cp $SAS_TLSRSA_DIR/keys/"$HOSTNAME".SASG.* ${DOCKER_CODE_DIR}/keys failed, exiting."

     echo -e "copying $SAS_TLSRSA_DIR/keys/ca.crt to ${DOCKER_CODE_DIR}/keys"
     cp $SAS_TLSRSA_DIR/keys/ca.crt ${DOCKER_CODE_DIR}/keys
     [ "$?" -ne 0 ] && LOGEXIT "cp $SAS_TLSRSA_DIR/keys/ca.crt ${DOCKER_CODE_DIR}/keys failed, exiting."

   fi #if [ "$TUNNEL_TYPE" == "ipsec" ]; then

   if [ "${TUNNEL_TYPE^^}" == "MODEL6" ]; then
      CUR_DIR=$(pwd)
      sed '/route-host.route-client/,/;/{/route-host.route-client/!d}' /usr/libexec/ipsec/_updown.netkey |\
      sed '/unroute-host.unroute-client/,/;/{/unroute-host.unroute-client/!d}' |\
      sed '/route-host.route-client/a    \\ \t# connection to me or my client subnet being routed\
\taddvti\
\tuproute\
\t# Custom begin for Model6\
\tip addr add ${PLUTO_MY_CLIENT} dev ${VTI_IFACE}\
\t# Custom end for Model6\
\taddnflog\
\t;;'  |\
sed '/unroute-host.unroute-client/a    \\ \t# connection to me or my client subnet being unrouted\
\tdownroute\
\t# Custom begin for Model6\
\tip addr del ${PLUTO_MY_CLIENT} dev ${VTI_IFACE}\
\tip tunnel del ${VTI_IFACE}\
\t# Custom end for Model6\
\tdelsource\
\t;;' > ${CUR_DIR}/_updown.custom

      sudo su - root -c "/usr/bin/cp ${CUR_DIR}/_updown.custom /usr/libexec/ipsec/_updown.custom"
      sudo su - root -c "chmod 755 /usr/libexec/ipsec/_updown.custom"
      
      # copy secret file to ipsec.d
      if ls /sasg/configs/keys_ipsec/sites.secrets 1>/dev/null 2>&1; then
        sudo su - root -c "/usr/bin/cp ${SAS_IPSECPSK_DIR}/sites.secrets $SAS_IPSECCONF_DIR"
        [ "$?" -ne 0 ] && LOGEXIT "sudo su - root -c \"/usr/bin/cp ${SAS_IPSECPSK_DIR}/sites.secrets $SAS_IPSECCONF_DIR\" failed." 
        echo -e "\ncopied ipsec secrets ${SAS_IPSECPSK_DIR}/sites.secrets to $SAS_IPSECCONF_DIR"
        echo -e "\nIpsec secrets for all customer sites:"
        sudo su - root -c "/usr/bin/cat ${SAS_IPSECPSK_DIR}/sites.secrets"
      else
        echo "Could not find secrets in \"/sasg/configs/keys_ipsec/sites.secrets\" hence omitting the copying"
      fi

   fi #[ "${TUNNEL_TYPE^^}" == "MODEL6" ]
    # Build sasg self-extracting executable (gets created in temp build directory)
    ./bin/makeself.sh "${DOCKER_CODE_DIR}" "$SAS_INSTALL_FILE" "SASG Installation Script Generation" ./docker_main.sh

    # copy the sasg installer to tmp so sasgaas can pull it as well as separate dir for longer term storage
    cp $SAS_INSTALL_FILE $SAS_CLIENT_IMAGE_DIR
    cp $SAS_INSTALL_FILE /tmp
    chmod 755 /tmp/$SAS_INSTALL_FILE
    echo -e "\n#############################################################################"
    echo -e "SASG docker client configuration package has been generated in:\n\t/tmp/$SAS_INSTALL_FILE"

else
       if [ "${DVPN^^}" == "YES" ]; then
       echo -e "\n#############################################################################"
       echo -e "SASG installation package has NOT been generated as DVPN is beeing deployed"
       echo -e "\n#############################################################################"
       CUR_DIR=$(pwd)
      sed '/route-host.route-client/,/;/{/route-host.route-client/!d}' /usr/libexec/ipsec/_updown.netkey |\
      sed '/unroute-host.unroute-client/,/;/{/unroute-host.unroute-client/!d}' |\
      sed '/route-host.route-client/a    \\ \t# connection to me or my client subnet being routed\
\taddvti\
\t# Custom Begin for DVPN\
\t#uproute\
\tsysctl -w net.ipv4.conf.all.rp_filter=0\
\tif ! grep -q rt-${VTI_IFACE} /etc/iproute2/rt_tables; then\
\t     echo $((${VTI_IFACE//vti})) rt-${VTI_IFACE} >> /etc/iproute2/rt_tables\
\tfi\
\tif ! ip rule list | grep -q rt-${VTI_IFACE}; then\
\t     ip rule add fwmark $((${VTI_IFACE//vti})) table rt-${VTI_IFACE}\
\tfi\
\tip route add default dev ${VTI_IFACE} table rt-${VTI_IFACE}\
\t# Custom End for DVPN\
\taddnflog\
\t;;' |\
sed '/unroute-host.unroute-client/a    \\ \t# connection to me or my client subnet being unrouted\
\t# Custom Begin for DVPN\
\t#downroute\
\tip route del default dev ${VTI_IFACE} table rt-${VTI_IFACE}\
\tip rule del fwmark $((${VTI_IFACE//vti})) table rt-${VTI_IFACE}\
\tsed -i /rt-${VTI_IFACE}/d /etc/iproute2/rt_tables\
\tsysctl -w net.ipv4.conf.all.rp_filter=1\
\tip tunnel del ${VTI_IFACE}\
\t# Custom End for DVPN\
\tdelsource\
\t;;' > ${CUR_DIR}/_updown.custom
      
      sudo su - root -c "/usr/bin/cp ${CUR_DIR}/_updown.custom /usr/libexec/ipsec/_updown.custom"
      sudo su - root -c "chmod 755 /usr/libexec/ipsec/_updown.custom"
      
      # copy secret file to ipsec.d
      if ls /sasg/configs/keys_ipsec/dvpn_sites.secrets 1>/dev/null 2>&1; then
        sudo su - root -c "/usr/bin/cp ${SAS_IPSECPSK_DIR}/dvpn_sites.secrets $SAS_IPSECCONF_DIR"
        [ "$?" -ne 0 ] && LOGEXIT "sudo su - root -c \"/usr/bin/cp ${SAS_IPSECPSK_DIR}/dvpn_sites.secrets $SAS_IPSECCONF_DIR\" failed." 
        echo -e "\ncopied ipsec secrets ${SAS_IPSECPSK_DIR}/dvpn_sites.secrets to $SAS_IPSECCONF_DIR"
        echo -e "\nIpsec secrets for all customer sites:"
        sudo su - root -c "/usr/bin/cat ${SAS_IPSECPSK_DIR}/dvpn_sites.secrets"
      else
        echo "Could not find secrets in \"/sasg/configs/keys_ipsec/dvpn_sites.secrets\" hence omitting the copying"
      fi
      else
         echo -e "\n#############################################################################"
         echo -e "SASG installation package has NOT been generated as no customer network info (SASG_IP) was defined."
         echo -e "\n#############################################################################"
      fi
fi #if [ "$CUSTOMER_NETWORK_INFO" = true....

#########################################################################################################
# check if Bandwidth settings were specified, if so, call BwSetup.sh to run tc (traffic control) commands.
#########################################################################################################
SETTC=0

cp ./BwSetup.sh ${SAS_BIN}
chmod 740 ${SAS_BIN}/BwSetup.sh
#echo -e "SETTC=$SETTC\nTUN_IN_CNT=${#TP_TUN_IN_BW[@]}\nTUN_OUT_CNT=${#TP_TUN_OUT_BW[@]}\n"
[[ "${#TP_TUN_IN_BW[@]}" -gt 0 ]] && SETTC=1
[[ "${#TP_TUN_OUT_BW[@]}" -gt 0 ]] && SETTC=1

if [ "$SETTC" != "0" ];then
  echo -e "\nSetting traffic control configs based on bandwidth variables in vars file."

#  echo -e "SETTC=$SETTC\nTUN_IN_CNT=${#TP_TUN_IN_BW[@]}\nTUN_OUT_CNT=${#TP_TUN_OUT_BW[@]}\n"

  # loop based on number of sasg sites - since bandwidth would be set per vtun
  # for openvpn.  Not sure if can set per individual tunnel with ipsec since can
  # have multiple tunnels per virtual tunnel interface.
  for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
  do
    if [ ! -z "${TP_TUN_IN_BW[$INDEX]}" ];then
       IN_BW=$(echo ${TP_TUN_IN_BW[$INDEX]} | tr A-Z a-z | tr -d ' ')
    else
       # use default of 100mbit
       IN_BW=100mbit
    fi
    if [ ! -z "${TP_TUN_OUT_BW[$INDEX]}" ];then
       OUT_BW=$(echo ${TP_TUN_OUT_BW[$INDEX]} | tr A-Z a-z | tr -d ' ')
    else
       # use default of 100mbit
       OUT_BW=100mbit
    fi
    if [ ! -z "${TP_TUN_BURST[$INDEX]}" ];then
       BURST=$(echo ${TP_TUN_BURST[$INDEX]} | tr A-Z a-z | tr -d ' ')
    else
       # use default of 100mbit
       BURST=15k
    fi

    if [ "$TUNNEL_TYPE" == "ipsec" ];then
      # always vti0 for JH connections so only set once
      if [ -z "$VTISET" ];then
        echo -e "\ncreating $SAS_CONFIG/tc_vti0.conf"
        echo -e "dev=vti0\nrate_out=$OUT_BW\nrate_in=$IN_BW\nburst=$BURST" >$SAS_CONFIG/tc_vti0.conf
        VTISET=1
      fi

    else
      # for tls (openvpn), set for each sasg site tunnel
      echo -e "\ncreating $SAS_CONFIG/tc_vtun${INDEX}.conf"
      echo -e "dev=vtun${INDEX}\nrate_out=$OUT_BW\nrate_in=$IN_BW\nburst=$BURST" >$SAS_CONFIG/tc_vtun${INDEX}.conf
    fi
  done

else
  echo -e "\nNo traffic control (bandwidth) settings in vars..skipping."
fi


####################################################################################################
#                         creating openvpn/ipsec systemd services                                  #
#                                                                                                  #

if [[ "$TUNNEL_TYPE" == "ipsec" || "$IAMaaS" == "YES" || "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
   sudo su - root -c "cp ${BUILDDIR}/vpn-services/ipsec.service /etc/systemd/system"
   sudo su - root -c "systemctl daemon-reload"
   sudo su - root -c "systemctl enable ipsec"
fi

if [[ "$TUNNEL_TYPE" != "ipsec" ]]; then
   sudo su - root -c "cp ${BUILDDIR}/vpn-services/openvpn-server@.service /etc/systemd/system"
   sudo su - root -c "systemctl daemon-reload"
  for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
  do
     echo "systemctl enable openvpn-server@vtun${INDEX}"
     sudo su - root -c "systemctl enable openvpn-server@vtun${INDEX}"
  done
fi
sudo chown -R ${SASOWNER}.${SASOWNER} "$SAS_VPNLOG_DIR"

#                                                                                                  #
####################################################################################################



####################################################################################################
#                               Killing deprecated tlsmon, ipsecmon processes 
#
                                                                                              
ps -ef|grep "tlsmon.sh"| grep "$SAS_TOP" |grep -v grep |awk '{print $2}' | while read MON_PID
do
  sudo su - root -c "/usr/bin/kill $MON_PID"
done

if [ "$INSTALL_MODE" != "update" ];then
   ps -ef|grep "/sbin/openvpn"| grep "sasvpn" |grep -v grep |awk '{print $2}' | while read VPN_PID
   do
     sudo su - root -c "kill $VPN_PID"
   done
fi

ps -ef|grep "ipsecmon.sh"| grep "$SAS_TOP" |grep -v grep |awk '{print $2}' | while read MON_PID
do
  sudo su - root -c "/usr/bin/kill $MON_PID"
done

#
####################################################################################################



####################################################################################################
#                                        IAMaaS section

if [ "$IAMaaS" == "YES" ]; then
      
      # copy secrets file for IAMaaS tunnel to ipsec.d
      sudo su - root -c "/usr/bin/cp ${SAS_IPSECPSK_DIR_IAM}/site*.secrets $SAS_IPSECCONF_DIR"
      [ "$?" -ne 0 ] && LOGEXIT "sudo su - root -c \"/usr/bin/cp ${SAS_IPSECPSK_DIR_IAM}/site*.secrets $SAS_IPSECCONF_DIR\" failed."
      echo -e "\ncopied ipsec secrets ${SAS_IPSECPSK_DIR_IAM}/site*.secrets to $SAS_IPSECCONF_DIR"
      
      #Generating vyatta ipsec commands
      ./generate_iamaas_juniper_ipsec_conf.sh
fi
#end IAMaaS section

#########################################################################################################
# If install_mode is not selected, then don't stop existing tunnels, just update all configs - give
# message that if update mode & routes were changed or tunnels added then the tunnel should be restarted manually.
#

if [ "$INSTALL_MODE" != "update" ];then
  if [[ "$TUNNEL_TYPE" == "ipsec" || "$IAMaaS" == "YES" || "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
    echo -e "Update mode not selected, restarting current ipsec service for changes to take effect..."
    RET=$(sudo su - root -c "systemctl restart ipsec 2>&1")
    [ "$?" -ne 0 ] && LOGEXIT "Failed to restart ipsec service - $RET"
    echo -e "IPsec service restarted."
  fi

  if [[ "$TUNNEL_TYPE" != "ipsec" ]]; then
    echo -e "Update mode not selected, restarting current openvpn services for changes to take effect..."
    for openvpn_service in $(systemctl list-units --type=service | grep openvpn-server | awk '{print $1}')
    do
      RET=$(sudo su - root -c "systemctl stop ${openvpn_service}")
      [ "$?" -ne 0 ] && LOGEXIT "Failed to stop ${openvpn_service} service - $RET"
      echo -e "${openvpn_service} service stopped."
    done
    for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
    do
     echo "systemctl start openvpn-server@vtun${INDEX}"
     sudo su - root -c "systemctl start openvpn-server@vtun${INDEX}"
     echo "systemctl status openvpn-server@vtun${INDEX}"
     sudo su - root -c "systemctl status openvpn-server@vtun${INDEX}"
    done
  fi
else
  echo -e "WARNING: Update mode selected - current vpn tunnels are NOT restarted in this mode."
  echo -e "         All VPN Config files are updated"
  echo -e "         Manual restart of the tunnels is required for new routes / tunnel changes to take effect!"
fi 

#
#######################################################################################################

#######################################################################################################
# Adding ipsec secrets to the log file 
if [[ "$TUNNEL_TYPE" == "ipsec" || "$IAMaaS" == "YES" || "${TUNNEL_TYPE^^}" == "MODEL6" ]]; then
   echo -e "\nINFO: PSK key for all ipsec tunnels configured:"
   sudo su - root -c "/usr/bin/cat $SAS_IPSECCONF_DIR/*site*.secrets"
fi
#
#######################################################################################################
  # Install listener only if at least one SASG is present
  if [[ -n "${SASG_VIP1[0]}" ]]; then
    if ! ( chmod +x "./listener-native/listener-install.sh" && sudo "$_" ); then
      echo -e "\nERROR: Could not install SASG listener"
      exit 1
    fi
  fi

#remove mist warnings and errors 
echo -e "\nINFO: Removing all existing warnings and errors files"
rm -f /sasg/logs/warnings*
rm -f /sasg/logs/errors*

#########################################################################################################
# Final messages...
#########################################################################################################

    echo -e "Configure customer's SASG servers in on-premise data centers."
    echo -e "SASFW is configured successfully!"
    echo -e "SUCCESS"

} #main() routine

main 2>&1 | tee -a $SAS_CONFIGURE_LOG
