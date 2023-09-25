#!/bin/bash
################################################################################
# Description: Configure Tools Servers
# Author: Jinho Hwang
# Date: 2016.08.16
# Main: ./sasg_main.sh
# History:
#    2016.08.16 - Original script.
#    2018.29.03 - Added creation of /sasg/log/Firewall directory & calling of cds_syslog_config.sh
#    2018.29.03 - Added call to new checkpkgs_tools.sh to install required SW if missing from base redhat image.
#    2018.04.11 - SBraun - v3.2.01 - added dump of in-memory ipset/iptables configs to /sasg/backup for future firewall revalidation.
#    2018.05.11 - SBraun - v3.2.03 - create /sasg/bin dir, copy version file
#    2018.05.11 - SBraun - v3.2.08 - fix - tools server deploy - call to CDS_tools_setup.sh should've come after check/creation of 
#                                  - /sasg/bin dir, backup dir, validation file creation.
#    2019.03.22 - SBraun - v5.0    - update resolv.conf on tools server to point to sasfw private ip before SL dns
# Notes:
#    This is the main script to run all other configuration scripts.
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

echo ' ____    _    ____   ____   _____ ___   ___  _     ____                        '
echo '/ ___|  / \  / ___| / ___| |_   _/ _ \ / _ \| |   / ___|                       '
echo '\___ \ / _ \ \___ \| |  _    | || | | | | | | |   \___ \                       '
echo ' ___) / ___ \ ___) | |_| |   | || |_| | |_| | |___ ___) |                      '
echo '|____/_/   \_\____/ \____|   |_| \___/ \___/|_____|____/                       '
echo '                                                                               '
echo '  ____ ___  _   _ _____ ___ ____ _   _ ____      _  _____ ___ ___  _   _       '
echo ' / ___/ _ \| \ | |  ___|_ _/ ___| | | |  _ \    / \|_   _|_ _/ _ \| \ | |      '
echo '| |  | | | |  \| | |_   | | |  _| | | | |_) |  / _ \ | |  | | | | |  \| |      '
echo '| |__| |_| | |\  |  _|  | | |_| | |_| |  _ <  / ___ \| |  | | |_| | |\  |      '
echo ' \____\___/|_| \_|_|   |___\____|\___/|_| \_\/_/   \_\_| |___\___/|_| \_| (_)  '
echo
echo '                                                       © IBM Corporation 2016  '
echo

echo 'Terms & Conditions ... -> yes'

#echo 'Checking information (os and some other stuffs) here'

if [ ! -f "vars" ]; then
    echo 'ERROR: Please provide a user configuration file "vars"'
    exit -1
fi

TOOLS_CONFIGURE_LOG=/tmp/sasg_tools_configure.log
if [ ! -z "$1" ]; then
    TOOLS_CONFIGURE_LOG=/tmp/$1.log
fi

touch $TOOLS_CONFIGURE_LOG
chmod 666 $TOOLS_CONFIGURE_LOG

################################################################################
# START - SCRIPT EXECUTION
################################################################################
set -o pipefail

# NOTE: DO NOT USE sasg_build.sh anymore.
#./sasg_build.sh 2>&1 | tee $TOOLS_CONFIGURE_LOG

source ./vars

if ! input_data_validation; then
  echo -e "\nERROR: Input data could not be validated"
  exit 1
fi

set -o verbose

# check and install required rpms
./checkpkgs_tools.sh | tee -a $TOOLS_CONFIGURE_LOG

# Run only if not testing.
if [ -z "$TESTING" ] || [ "$TESTING" == "false" ]; then

# 3.2.03 - writing fw logs to default - goes to /var/log/messages
#if [ ! -d "/sasg/logs/Firewall" ];then
#  mkdir -p /sasg/logs/Firewall
#  if [ "$?" -ne 0 ];then
#     echo -e "ERROR - failed to create /sasg/logs/Firewall\n" | tee -a $TOOLS_CONFIGURE_LOG
#  fi
#fi

if [ ! -d "/sasg/bin" ];then
  sudo mkdir -p /sasg/bin
  [[ "$?" -ne 0 ]] && echo -e "ERROR creating /sasg/bin directory!"
fi
cp ./VERSION /sasg/bin

SAS_BACKUP="/sasg/backup"
if [ ! -d "$SAS_BACKUP" ];then
  mkdir -p $SAS_BACKUP
  if [ "$?" -ne 0 ];then
     echo -e "ERROR - failed to create /sasg/backup\n" | tee -a $TOOLS_CONFIGURE_LOG
  fi
fi
chown -R sasauto.sasauto /sasg
if [ "$?" -ne 0 ];then
   echo -e "ERROR - chown sasauto.sasauto /sasg failed" | tee -a $TOOLS_CONFIGURE_LOG
fi
################################################
# v3.2.01 chg - GDPR change for firewall revalidations
# Take snapshot of current iptables/ipset configurations in memory
# if an existing snapshot file for this code version doesn't already exist:
SHOST=$(hostname -s)
IPTABVALFILE="${SAS_BACKUP}/iptables_Validate_${SHOST}_Pre-${VERSION}"
IPSETVALFILE="${SAS_BACKUP}/ipset_Validate_${SHOST}_Pre-${VERSION}"
IPTABSAVECMD="/usr/sbin/iptables-save"
IPSETCMD="/usr/sbin/ipset"

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
     # ipset command not found - likely new install
     echo -e "${IPSETCMD} not found - new install." > ${IPSETVALFILE}
  else
     echo -e "\nSaving current iptables configuration in memory to ${IPSETVALFILE} ..."
     sudo ${IPSETCMD} save > ${IPSETVALFILE}
     chmod 000 ${IPSETVALFILE}
  fi
fi

################################################################################
# Call CDS_tools_setup to configure network, routes, etc
# v3.2.08 - sjb - was in wrong spot & was getting called before some systems even had
# the /sasg/bin dir created.
################################################################################
./CDS_tools_setup.sh 2>&1 | tee -a $TOOLS_CONFIGURE_LOG
RET=${PIPESTATUS[0]}
if [ ! $RET  -eq 0 ]; then 
    echo "CDS_tools_setup.sh failed: $RET" | tee -a $TOOLS_CONFIGURE_LOG
    echo "Please find the log file in $TOOLS_CONFIGURE_LOG"
    echo "ERROR" | tee -a $TOOLS_CONFIGURE_LOG
    exit $RET
fi
  echo -e "Calling cfgip6tables Script...."
  ./cfgip6tables.sh 2>&1
  [ "$?" -ne 0 ] && echo "cfgip6tables.sh failed." && exit 1


################################################################################
# Configure logrotate / rsyslogd
################################################################################
echo -e "\n#############################################################################"
echo -e "Configuring rsyslogd and logrotate"
BUILDDIR=$(pwd)
sudo su - root -c "$BUILDDIR/cds_syslog_config.sh 2>&1"
[ "$?" -ne 0 ] && LOGEXIT "sudo su - root -c \"$BUILDDIR/cds_syslog_config.sh 2>&1\" failed: $RET"


fi

################################################################################
# Update /etc/resolv.conf to point to sasfw first.
################################################################################
grep "^nameserver" /etc/resolv.conf | head -1 |grep -qw "$PRIVATE_VYOS_IP"
if [ "$?" -ne 0 ];then
  echo "updating /etc/resolv.conf to point to sasfw private ip first then SL dns" |  tee -a $TOOLS_CONFIGURE_LOG
  sudo su - root -c "cp -p /etc/resolv.conf /etc/resolv.conf.prev"
  sudo sed -i "1s/^/nameserver $PRIVATE_VYOS_IP\n#do not change entry above or egress internet traffic will break./" /etc/resolv.conf
  echo "new resolv.conf:" |  tee -a $TOOLS_CONFIGURE_LOG
  cat /etc/resolv.conf |  tee -a $TOOLS_CONFIGURE_LOG
else
  echo "found private vyos ip already in /etc/resolv.conf, not updating.  Current resolv.conf:" |  tee -a $TOOLS_CONFIGURE_LOG
  cat /etc/resolv.conf |  tee -a $TOOLS_CONFIGURE_LOG
fi


################################################################################
# END - SCRIPT EXECUTION
################################################################################

echo "IPTable is configured successfully!" | tee -a $TOOLS_CONFIGURE_LOG

################################################################################
# Configure logpusher certs on Chef machine only
################################################################################

echo "SUCCESS" | tee -a $TOOLS_CONFIGURE_LOG
