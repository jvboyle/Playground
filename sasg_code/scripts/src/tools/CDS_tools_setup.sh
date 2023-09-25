#!/bin/bash
###########################################################################
# Description: Generate keepalived.conf for Sasg
# Author: Joe Boyle
# Date: 2016.08.17
#SCRIPT_INFO="CDS_tools.setup.sh v3.0 (11/03/2016)"
# Config: vars file
# Main: ./CDS_tools.setup.sh
# Standalone Usage: Run each script alone
# History:
#    2016.08.17 - Original script.
#    2016.10.10 - Added route to MS Big Fix, added RCP servers to CDS, added comments to ipset and iptables config for version
#    2016.10.19 - Added -p command to mkdir for ipset, in case it already exists.
#               - Added mv command to mv the ipset config for backup
#    2016.11.03 - Removed individual routes to mgmt servers
#               - Added routes to mgmt subnets
#               - Added routes to mgmt portable IP ranges
#               - Added logic to only add servers listed in vars
# 	             - Added docker rules
#    2017.01.31 - Added check for firewalld.
#    2017.03.15 - added New Route script and cleanup old values
#    2017.05.19 - added check if default route set to vyos, assume already set up - check if all
#               - cds server ips in ipset -if not, set them otherwise only run add_Route.sh & exit.
#    2017.06.01 - SBraun - commented out all MRTG setup per J.Boyle
#    2017.06.09 - SBraun - fixed checks for existing cds servers in ipset - handle null vars
#    2017.06.09 - Fixed sed for ifcfg - issue where BCR_IP IP matched IPADDR and GATEWAY
#    2017.07.09 - Added code to copy automate key built on sasgaas to appropriate dir for automate id for sasg log pulls
#    2017.25.09 - Added code to set up log puller if on EE server to pull sasg firewall logs.
#    2018.14.03 - v3.1.07.03 - added creation of /sasg/bin/deploy_test.sh script to EE server.  Part of
#               - UCD automation - will ssh to ee server & run this to validate connectivity to jumphosts.
#    2018.29.03 - v3.1.07.03 - added log entries to iptables filter rules.
#    2018.11.04 - v3.2.1 - Added check if no logging enabled in current iptables then force
#                  update of ipset & iptables.
#    2018.11.04 - v3.2.1 - set up sasg logpuller cronjob to run every hour
#    2018.23.04 - v3.2.02 - Fix - write ipset to standard /etc/sysconfig/ipset vs old /etc/ipset/ipset, commented
#                 creation of ipset.start-stop script in /usr/libexec/ipset  as this is done by ipset-service rpm
#                 now.
#    2018.05.03 - SBraun - 3.2.03 - Support for CEBW_IP - consolidated Chef, EE, BPM servers
#    2018.05.04 - SBraun - 3.2.03 - Support for RCP_IP - consolidated RCP_BPM, RCP_ROR servers
#    2018.05.04 - SBraun - 3.2.03 - if ee server doesn't have ~sasauto/Puller dir, copy in new
#                 sasauto key pair - used for new installs - make sure we set unique key for sasauto
#    2018.05.09 - SBraun - 3.2.03 - add NA mgmt vyatta new & old VIPs to MANAGEMENT_SEGMENT ipset
#    2018.05.11 - SBraun - 3.2.03 - moved section to create /sasg/bin to main script so its run on
#                  every CDS
#    2018.05.17 - SBraun - 3.2.04 - Removed yum -y update -  kernel updates being applied & causing
#                          issues with tool server reboots.
#    2018.06.15 - SBraun - 3.3 - CSC - added check - if CSC_IP set, make sure it's in DEDICATED_SEGMENT list
#    2018.08.15 - SBraun - 3.3 - if no ipset/iptables changes are needed, still check if iptables/ipset are
#                                enabled to start on reboot and are currently running.
#    2018.09.05 - SBraun - 3.3 - added logic to add proper NA vyatta vrrp ip if old one is specified in vars
#    2018.11.19 - SBraun - v4 - added logic to change ipset start-stop script to point to /etc/sysconfig/ipset if
#                          currently pointing to old /etc/ipset/ipset.
#    2018.11.19 - SBraun - v4 - changed filter rules to zero-trust model, rule #s follow netwk arch spreadsheet, only required
#                             - ipset lists and rules are added on each SDS
#                             - write new ipset/iptables configs to .new files then diff against existing to see if
#                             - an update/restart is required.
#                             - pull server DC location from hostname if new LOCATION variable not defined
#                             - added chg of ipset.start-stop file to point to /etc/sysconfig location if using old /etc/ipset dir
#                             - Minor update to rcp-ror & rcp-bpm ports - rcp-bpm uses 8443,  ror only 443
#                             - fixed minor bug for rcp-shared -had adding of bpm ip/mac to ipset in wrong place - was trying to add for shared and non-shared rcp but only exists in shared.
#                             - added rcp-bpm -> rcp-ror tcp2222,  ms_ras -> rcp-bpm tcp9443
#    2018.12.10 - SBraun - v4.02 - lot of rule changes -many specific rules changed to DOCKER-USER filter vs INPUT.
#    2018.12.11 - SBraun - v4.03 - input & docker-user rule additions - 4.x/172.x to cci ip, 4.x/172.x to 10.0.0.0/8,  additional bpm to chef on 8443 docker-user filter
#    2018.12.11 - SBraun - v4.04 - docker-user rule modification - 4.x/172.x to 10.0.0.0/8 changed to 4.x/172.x to any (0.0.0.0/0)
#    2018.12.14 - jvboyle - v4.06 - docker-user rule modification CSC - 4.x/172.x to 10.0.0.0/8 changed to 4.x/172.x to any (0.0.0.0/0)
#    2018.12.11 - SBraun - v4.08 - updated ipset lists for each sds to use ip addr for start & end range so can only include the one ip
#    2018.12.11 - SBraun - v4.09 - Per issue 116 - changed BPM_to_CSC_Port from 443 to 9443
#    2019.01.08 - SBraun - v4.10 - Per issues 123,124 - updated sshd port config to not just append listener port, also
#                                - will restore original config if initial sshd restart fails.  Also removed sasgpuller
#                                - cronjob if on EE server as it's no longer needed.
#    2019.01.09 - SBraun - v4.10 - Fixed issue 127, added CEBW, RCP to case statement & set up specific rules for all external connections - internal docker to docker
#                                  connections handled via the docker input/docker-user 4.x, 172.x filters.
#    2019.01.22 - SBraun - v4.10 - Hotfix to v4.10 - fixed incorrect vrrp ip for MS_MON01_IP
#    2019.05.17 - SBraun - Issue 279 - add connectivity from NA Mgmt Segment to TCP 10050 for Zabbix Monitoring agent.
#    2019.06.03 - SDubrouskaya - RCP Shared HA Support
#    2019.08.30 - SBanaruc - change JP Mgmt Segment IP 10.132.239.119 
# Notes:
#    Make sure ipset.service and ipset.start-stop are in the same dir as setup
###########################################################################

source ./vars

function cleanup_containerize_listener() {
  local LISTENER_CERTS_DIR="/sasg/certificates/sas-upload-listener"
  local LISTENER_DIR="/sasg/apps/sas-upload-listener"
  local DOCKER_COMPOSE_EXEC_PATHS=(
    "/usr/local/bin/docker-compose"
    "/usr/bin/docker-compose"
  )

  [[ ! -d "${LISTENER_DIR}" ]] && return # exit silently if there is nothing to cleanup
  ORIG_DIR="$(pwd)"

  local docker_compose_exec
  for possible_compose_location in "${DOCKER_COMPOSE_EXEC_PATHS[@]}"; do
    if [[ -f "${possible_compose_location}" ]]; then
      docker_compose_exec="${possible_compose_location}"
      break
    fi
  done

  if [[ ! -f "${docker_compose_exec}" ]]; then
    echo "Could not find docker compose executable"
    echo "Aborting listener cleanup"
    cd "${ORIG_DIR}"
    return
  fi

  echo "Performing listener cleanup"

  cd "${LISTENER_DIR}"
  if ! "${docker_compose_exec}" down -v; then
    echo "Could not stop docker compose"
    echo "Aborting listener cleanup"
    cd "${ORIG_DIR}"
    return
  fi
  cd ..

  rm -rf "${LISTENER_DIR}"
  [[ -d "${LISTENER_CERTS_DIR}" ]] && rm -rf "${LISTENER_CERTS_DIR}"

  echo "Listener cleanup complete"
  cd "${ORIG_DIR}"
  return
}


SCRIPT_INFO="CDS_tools.setup.sh $VERSION"
THISIP=$(ip addr show dev eth0 |grep "inet "|awk '{print $2}'|cut -f1 -d'/')
THIS_SDS=$(grep -w "$THISIP" ./vars|grep -v "^#"|tail -1|awk -F'_IP' '{print $1}')
echo -e `date` " - Configuring $THIS_SDS tools server $THISIP, $SCRIPT_INFO\n"
IPSET="/etc/sysconfig/ipset"
IPTABLES="/etc/sysconfig/iptables"
[[ -z ${RESTART_IPTABLES} ]] || [[ ${RESTART_IPTABLES^^} != "TRUE" ]] && RESTART_IPTABLES=false

# if no mac is specified for in vars for this server, exit with error - required for ipset lists
if [ ${THIS_SDS} = "RCP_PROXY" ]; then
   for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
   do
       if [ "${RCP_PROXY_IP[INDEX]}" == "${THISIP}" ]; then
          THISMAC=${RCP_PROXY_MAC[INDEX]}
          break
       fi
   done
else   
   THISMAC=$(grep "${THIS_SDS}_MAC=" ./vars |grep -v "^#" | cut -f2 -d'=')
fi
[[ -z "$THISMAC" ]] && echo -e "\nERROR - Required ${THIS_SDS}_MAC variable not found or is blank in vars, exiting.\n" && exit 1

# **IF LOCATION not set in vars file, get LOCATION info from hostname if possible
# DC name should be last part of hostname just before domain name
# ie: sla-p-la119-asb-dal09.sdad.sl.ibm.com,  DC=dal09
# if it is set, translate it to all upper case - just to make sure we're consistent.
if [ -z "$LOCATION" ];then
  HNAME=$(hostname)
  # use grep with pattern to pull out the location from the hostname - looks for anything
  # with a period or a dash (found some hosts specified incorrectly), followed by 3 letters then one to 3 digits followed by a dash.
  DC=$(echo "$HNAME"|grep -E -o "[-.]([a-zA-Z]){1,3}([0-9]){1,3}[.]"|sed "s/[0-9.\-]//g" | tr '[:lower:]' '[:upper:]')
  if [ -z "$DC" ];then
    echo -e "\nERROR - unable to determine DC from server hostname: $HNAME, exiting."
    exit 1
  fi
else
  DC=$(echo "$LOCATION" | tr '[:lower:]' '[:upper:]'|sed "s/[0-9]//g")
fi

if [ -z "$DC" ];then
  echo -e "\nERROR - no location found for server - unable to continue as rulebase is dependent on what geo the server is in.  Exiting."
  exit 1
fi

echo "LOCATION=<$LOCATION>, DC=<$DC>"

# 3.2.03 - support for CEBW_IP - consolidated chef, ee, bpm services in one vm
if [ ! -z "$CEBW_IP" ];then
  echo -e "\nCEBW_IP defined, setting variables for consolidate chef, ee, bpm services..."
  BPM_IP=$CEBW_IP
  BPM_MAC=$CEBW_MAC
  CHEF_IP=$CEBW_IP
  CHEF_MAC=$CEBW_MAC
  EE_IP=$CEBW_IP
  EE_MAC=$CEBW_MAC
fi
if [ ! -z "$RCP_IP" ];then
  echo -e "\nRCP_IP defined, setting variables for consolidated rcp services into single vm..."
  RCP_BPM_IP=$RCP_IP
  RCP_BPM_MAC=$RCP_MAC
  RCP_ROR_IP=$RCP_IP
  RCP_ROR_MAC=$RCP_MAC
fi

[[ -z ${LDAP_PORT} ]] && LDAP_PORT[0]=636

# v4 if we find ipset startup to point to old ipset config file, change the start-stop script to point to the new /etc/sysconfig/ipset  file
grep -q "IPSET_DATA=/etc/\${IPSET}/\${IPSET}" /usr/libexec/ipset/ipset.start-stop
if [ "$?" -eq 0 ];then
  echo -e "Found /usr/libexec/ipset/ipset.start-stop configured to read old /etc/ipset/ipset file, updating to /etc/sysconfig/ipset"
  sed -i.bak "s@IPSET_DATA=/etc/\${IPSET}/\${IPSET}@IPSET_DATA=/etc/sysconfig/\${IPSET}@g" /usr/libexec/ipset/ipset.start-stop
  [[ "$?" -eq 0 ]] && rm -f /usr/libexec/ipset/ipset.start-stop.bak
fi

# Assign MMS ips. We explicitly allow ops to provide several values via vars file
# hence the last reference to array is uncommented (since they will provide several
# values via commented out line with spaces, not via array)
[[ -z ${MS_WDC04_IP} ]] && MS_WDC04_IP=("10.149.99.229") || MS_WDC04_IP=("10.149.99.229" ${MS_WDC04_IP[@]})
[[ -z ${MS_MEL01_IP} ]] && MS_MEL01_IP="10.118.186.111"
[[ -z ${MS_SYD05_IP} ]] && MS_SYD05_IP="10.195.44.229"
[[ -z ${MS_AMS03_IP} ]] && MS_AMS03_IP="10.175.8.23"
# [[ -z ${MS_FRA02_IP} ]] && MS_FRA02_IP="10.85.112.193" # decommitted
[[ -z ${MS_MON01_IP} ]] && MS_MON01_IP="10.140.229.130"
[[ -z ${MS_CHE01_IP} ]] && MS_CHE01_IP="10.162.74.153"
[[ -z ${MS_TOK02_IP} ]] && MS_TOK02_IP="10.132.239.119"
tmp_test_ips=("10.190.84.216" "10.190.84.246" "10.149.99.236" "10.190.17.89")
[[ -z ${MS_TEST_IP} ]] && MS_TEST_IP=("${tmp_test_ips[@]}") || MS_TEST_IP=("${tmp_test_ips[@]}" ${MS_TEST_IP[@]})



##############################################
# START OF SECTION ONLY TO BE DONE ON EE SERVERS
#
# copy automate id_rsa built on SasGaas to appropriate dir if it doesn't exist already
# if running on CDS EE server only.
if [[ "$THISIP" == "$EE_IP" ]];then
  AUTOMATE_KEYDIR="/home/sasauto/.ssh"
  AUTOMATE_KEY="id_rsa"

  # 3.2.03
  # if sasauto/Puller dir doesnt exist we assume the sasauto id's key was never
  # created/added to the jumphosts so set OVERWRITE_SASKEY flag to true so we
  # copy over a new key.
  if [ ! -d "/home/sasauto/Puller" ];then
      echo -e "\n /home/sasauto/Puller directory does not exist...creating...\n"
      mkdir -p /home/sasauto/Puller
      OVERWRITE_SASKEY="true"
  fi

  if [ ! -f "${AUTOMATE_KEYDIR}/${AUTOMATE_KEY}" ];then
    echo -e "\nssh key ${AUTOMATE_KEYDIR}/${AUTOMATE_KEY} does not exist - copying new keys.\n"
    cp -p ./automate_keys/*  $AUTOMATE_KEYDIR
    chown sasauto.sasauto ${AUTOMATE_KEYDIR}/${AUTOMATE_KEY}*
    chmod 644 $AUTOMATE_KEYDIR/${AUTOMATE_KEY}.pub
    chmod 600 $AUTOMATE_KEYDIR/${AUTOMATE_KEY}
  else
    if [[ "$OVERWRITE_SASKEY" == "true" ]];then
      echo -e "\nAutomate ssh key ${AUTOMATE_KEYDIR}/${AUTOMATE_KEY} already exists..but OVERWRITE_SASKEY=True - backing up existing keys to $AUTOMATE_KEYDIR/oldkeys and replacing existing $AUTOMATE_KEY\n"
      if [ ! -d "$AUTOMATE_KEYDIR/oldkeys" ];then
        mkdir $AUTOMATE_KEYDIR/oldkeys
      fi
      mv $AUTOMATE_KEYDIR/id_rsa* $AUTOMATE_KEYDIR/oldkeys
      chown -R sasauto.sasauto $AUTOMATE_KEYDIR/oldkeys
      cp -p ./automate_keys/*  $AUTOMATE_KEYDIR
      chown sasauto.sasauto $AUTOMATE_KEYDIR/${AUTOMATE_KEY}*
      chmod 644 $AUTOMATE_KEYDIR/${AUTOMATE_KEY}.pub
      chmod 600 $AUTOMATE_KEYDIR/${AUTOMATE_KEY}
    else
      echo -e "\nAutomate ssh key ${AUTOMATE_KEYDIR}/${AUTOMATE_KEY} already exists..not copying new keys.\n"
    fi
  fi

  ###################################################################
  # if we don't have the sasg_serverlist file in place
  if [ ! -f "/home/sasauto/Puller/sasg_serverlist" ];then

    # Now copy over sasgpuller.sh for pulling firewall logs from the sasg & set up cronjob under sasauto id.
    echo -e "\nsetting up sasg log puller script..\n"
    cp -p ./sasgpuller.sh /home/sasauto/Puller/sasgpuller.sh
    if [ "$?" -ne 0 ];then
      echo -e "Error copying ./sasgpuller.sh to /home/sasauto/Puller\n"
    fi
    chmod 750 /home/sasauto/Puller/sasgpuller.sh

    # create sasg serverlist for the logpuller to read
cat >/home/sasauto/Puller/sasg_serverlist <<EOL
#Simple list of all SASG servers to pull firewall/vpn logs from
#
# Port# IP ServerName
#
#   ** note - servername is what the directory will be called where the logs are stored so don't use
# fully qualified domain name - just short hostname.
# Blank lines & lines starting with #  are ignored.
############################################################
EOL

    # loop through jumphosts and add IPs to the sasg_serverlist
    for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
    do
      echo -e "22 ${SASG_IP_1[$INDEX]} ${SASG_IP_1[$INDEX]}" >>/home/sasauto/Puller/sasg_serverlist
      if [ ! -z "${SASG_IP_2[$INDEX]}" ];then
        echo -e "22 ${SASG_IP_2[$INDEX]} ${SASG_IP_2[$INDEX]}" >>/home/sasauto/Puller/sasg_serverlist
      fi
    done

  fi # if [ ! -f "/home/sasauto/Puller/sasg_serverlist" ];then

  ###################################################################

  # create cronjob for sasauto to run log puller - can run this every time - that way if we decide to
  # change the code for whatever reason - timer, etc can do that.
  if [ -f "/home/sasauto/sasauto.crontab" ];then
    echo -e "moving /home/sasauto/sasauto.crontab to /home/sasauto/sasauto.crontab.prev"
    mv /home/sasauto/sasauto.crontab /home/sasauto/sasauto.crontab.prev
  fi

  # no longer need sasgpuller cronjob in v4+ code - jh logs pushed from jh to chef - remove sasgpuller cronjob if one 
  # exists.
  su - sasauto -c "/bin/crontab -l" |grep -v "Puller/sasgpuller.sh" > /home/sasauto/sasauto.crontab


#cat > /home/sasauto/sasauto.crontab <<EOL
#5 * * * * source /home/sasauto/.bash_profile;/home/sasauto/Puller/sasgpuller.sh >/home/sasauto/Puller/pull.log 2>&1
#EOL

  chmod 755 /home/sasauto/sasauto.crontab
  chown sasauto.sasauto /home/sasauto/sasauto.crontab
  su - sasauto -c "/bin/crontab /home/sasauto/sasauto.crontab"
  if [ "$?" -ne 0 ];then
    echo -e "\nError setting sasauto cronjob to run sasgpuller.sh.  Manual intervention required.\n"
  else
    echo -e "\nSuccess setting up sasauto cronjob to run sasgpuller.sh\n"
    su - sasauto -c "/bin/crontab -l"
  fi

  # chg ownership & permissions on everything related to sasg log puller
  chown -R sasauto.sasauto /home/sasauto/Puller
  chmod -R 754 /home/sasauto/Puller
  ls -lR /home/sasauto
  echo -e "\ncontents of sasg_serverlist:"
  cat /home/sasauto/Puller/sasg_serverlist

  # 3.1.07.03 - new code for adding script to be run by UCD to ping JH VIP & return success/fail
  cp ./deploy_test.sh /sasg/bin
  [[ "$?" -ne 0 ]] && echo -e "ERROR copying deploy_test.sh to /sasg/bin"
  chmod 755 /sasg/bin/deploy_test.sh
  [[ "$?" -ne 0 ]] && echo -e "ERROR chmod 755 /sasg/bin/deploy_test.sh failed"

  # now write out jumphost vip to ping using deploy_test.sh
  SASGVIPS="/sasg/bin/sasg_vips"
  if [ -f "$SASGVIPS" ];then
    echo -e "$SASGVIPS exists..copying to .prev"
    mv $SASGVIPS ${SASGVIPS}.prev
    [[ "$?" -ne 0 ]] && echo -e "ERROR - mv $SASGVIPS ${SASGVIPS}.prev failed."
  fi

  for i in "${SASG_VIP1[@]}"
  do
    if [ ! -z "$i" ];then
      echo -e "$i" >>$SASGVIPS
      [[ "$?" -ne 0 ]] && echo -e "ERROR - unable to append sasg vip to $SASGVIPS"
    fi
  done

fi # if [[ "$THISIP" == "$EE_IP" ...
#
# END OF SECTION ONLY TO BE DONE ON EE SERVERS
##############################################

DEFROUTE=`ip route |grep "^default"`
DEFROUTEIP=`echo $DEFROUTE|grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}"`
IPSETCONF="$IPSET"

echo -e "defrouteip=$DEFROUTEIP, privatevyosip=$PRIVATE_VYOS_IP\n"
if [ "$DEFROUTEIP" != "$PRIVATE_VYOS_IP" ];then
  FIRSTTIME=true
  UPDATEIPSET="True"
else
  FIRSTTIME=false
  echo -e "Default route already set to private sasfw ip, assuming not the first run..."
  UPDATEIPSET="False"

fi

# if first time run, then do yum installs, firewall update, etc.
if [ "$FIRSTTIME" == true ] ; then
  echo "installing packages........"
# v3.2.04 -removed yum update to prevent reboot issues due to kernel updates.
#  yum -y update
  yum -y install iptables-services
  yum -y install ipset

  if [[ -n `which firewalld 2>/dev/null` ]]; then
     echo "disabling firewalld..."
     systemctl stop firewalld
     systemctl disable firewalld
  else
     echo "INFO: firewalld isn't installed." | tee -a $SASG_LOG
  fi

  echo "enabling iptables and ipset....."
  systemctl enable ipset
  systemctl start ipset
  systemctl enable iptables
  systemctl start iptables

  echo "making some backups of original ifcfg-eth0 and route-eth0 ........"
  cp /etc/sysconfig/network-scripts/ifcfg-eth0 /etc/sysconfig/network-scripts/orig.ifcfg-eth0
  mv /etc/sysconfig/network-scripts/route-eth0 /etc/sysconfig/network-scripts/org_route-eth0
else
  echo -e "\nNot first time run, skipping yum installs, disabling firewalld, enabling iptables.\n"
fi

# doesn't hurt to run this every time - will just back up existing route file & add new ones if any
echo "adding Routes........."
echo "# Generated by $SCRIPT_INFO on $TIMESTAMP" >> /etc/sysconfig/network-scripts/route-eth0
./add_RepoRoute.sh

chmod 644 /etc/sysconfig/network-scripts/route-eth0


####################################################################################
# Define functions to add ipset lists.  Done in functions to avoid duplicating
# lines since each tools server has specific rules to be added.
####################################################################################
IPSETADD(){
  echo "$1" |tee -a ${IPSET}.new
}
IPTABLESADD(){
  echo "$1" |tee -a ${IPTABLES}.new
}

ADD_SL_SERVICES(){
  IPSETADD "create SL_SERVICES hash:net family inet hashsize 1024 maxelem 65536"
  IPSETADD "add SL_SERVICES 100.100.0.0/20"
  IPSETADD "add SL_SERVICES 100.100.32.0/20"
  IPSETADD "add SL_SERVICES 10.0.64.0/19"
  IPSETADD "add SL_SERVICES 10.1.128.0/19"
  IPSETADD "add SL_SERVICES 10.1.160.0/20"
  IPSETADD "add SL_SERVICES 10.1.176.0/20"
  IPSETADD "add SL_SERVICES 10.1.192.0/20"
  IPSETADD "add SL_SERVICES 10.1.208.0/20"
  IPSETADD "add SL_SERVICES 10.1.64.0/19"
  IPSETADD "add SL_SERVICES 10.1.96.0/19"
  IPSETADD "add SL_SERVICES 10.200.0.0/20"
  IPSETADD "add SL_SERVICES 10.200.112.0/20"
  IPSETADD "add SL_SERVICES 10.200.128.0/20"
  IPSETADD "add SL_SERVICES 10.200.160.0/20"
  IPSETADD "add SL_SERVICES 10.200.16.0/20"
  IPSETADD "add SL_SERVICES 10.200.176.0/20"
  IPSETADD "add SL_SERVICES 10.200.64.0/20"
  IPSETADD "add SL_SERVICES 10.200.80.0/20"
  IPSETADD "add SL_SERVICES 10.200.96.0/20"
  IPSETADD "add SL_SERVICES 10.201.0.0/20"
  IPSETADD "add SL_SERVICES 10.201.112.0/20"
  IPSETADD "add SL_SERVICES 10.201.128.0/20"
  IPSETADD "add SL_SERVICES 10.201.16.0/20"
  IPSETADD "add SL_SERVICES 10.201.176.0/20"
  IPSETADD "add SL_SERVICES 10.201.192.0/20"
  IPSETADD "add SL_SERVICES 10.201.32.0/20"
  IPSETADD "add SL_SERVICES 10.201.48.0/20"
  IPSETADD "add SL_SERVICES 10.201.64.0/20"
  IPSETADD "add SL_SERVICES 10.201.80.0/20"
  IPSETADD "add SL_SERVICES 10.202.16.0/20"
  IPSETADD "add SL_SERVICES 10.2.112.0/20"
  IPSETADD "add SL_SERVICES 10.2.128.0/20"
  IPSETADD "add SL_SERVICES 10.2.144.0/20"
  IPSETADD "add SL_SERVICES 10.2.160.0/20"
  IPSETADD "add SL_SERVICES 10.2.176.0/20"
  IPSETADD "add SL_SERVICES 10.2.32.0/20"
  IPSETADD "add SL_SERVICES 10.2.48.0/20"
  IPSETADD "add SL_SERVICES 10.2.64.0/20"
  IPSETADD "add SL_SERVICES 10.2.80.0/20"
  IPSETADD "add SL_SERVICES 10.3.112.0/20"
  IPSETADD "add SL_SERVICES 10.3.128.0/20"
  IPSETADD "add SL_SERVICES 10.3.144.0/20"
  IPSETADD "add SL_SERVICES 10.3.160.0/20"
  IPSETADD "add SL_SERVICES 10.3.176.0/20"
  IPSETADD "add SL_SERVICES 10.3.192.0/24"
  IPSETADD "add SL_SERVICES 10.3.64.0/20"
  IPSETADD "add SL_SERVICES 10.3.80.0/20"
  IPSETADD "add SL_SERVICES 10.3.96.0/20"
  IPSETADD "add SL_SERVICES 161.26.0.0/16"
  IPSETADD "add SL_SERVICES 166.8.0.0/14"

} # ADD_SL_SERVICES()

ADD_SL_SSLVPNS(){
  IPSETADD "create SL_SSLVPNS hash:net family inet hashsize 1024 maxelem 65536"
  IPSETADD "add SL_SSLVPNS 100.101.132.0/24"
  IPSETADD "add SL_SSLVPNS 10.1.0.0/23"
  IPSETADD "add SL_SSLVPNS 10.1.16.0/23"
  IPSETADD "add SL_SSLVPNS 10.1.224.0/23"
  IPSETADD "add SL_SSLVPNS 10.1.232.0/24"
  IPSETADD "add SL_SSLVPNS 10.1.236.0/24"
  IPSETADD "add SL_SSLVPNS 10.1.24.0/23"
  IPSETADD "add SL_SSLVPNS 10.1.56.0/23"
  IPSETADD "add SL_SSLVPNS 10.1.8.0/23"
  IPSETADD "add SL_SSLVPNS 10.200.192.0/24"
  IPSETADD "add SL_SSLVPNS 10.200.196.0/24"
  IPSETADD "add SL_SSLVPNS 10.200.200.0/24"
  IPSETADD "add SL_SSLVPNS 10.200.204.0/24"
  IPSETADD "add SL_SSLVPNS 10.200.208.0/24"
  IPSETADD "add SL_SSLVPNS 10.200.212.0/22"
  IPSETADD "add SL_SSLVPNS 10.200.216.0/22"
  IPSETADD "add SL_SSLVPNS 10.200.220.0/22"
  IPSETADD "add SL_SSLVPNS 10.200.224.0/22"
  IPSETADD "add SL_SSLVPNS 10.200.228.0/24"
  IPSETADD "add SL_SSLVPNS 10.200.232.0/24"
  IPSETADD "add SL_SSLVPNS 10.200.236.0/24"
  IPSETADD "add SL_SSLVPNS 10.201.208.0/24"
  IPSETADD "add SL_SSLVPNS 10.201.212.0/24"
  IPSETADD "add SL_SSLVPNS 10.201.224.0/24"
  IPSETADD "add SL_SSLVPNS 10.201.228.0/24"
  IPSETADD "add SL_SSLVPNS 10.2.192.0/23"
  IPSETADD "add SL_SSLVPNS 10.2.200.0/23"
  IPSETADD "add SL_SSLVPNS 10.2.208.0/23"
  IPSETADD "add SL_SSLVPNS 10.2.216.0/24"
  IPSETADD "add SL_SSLVPNS 10.2.220.0/24"
  IPSETADD "add SL_SSLVPNS 10.2.224.0/24"
  IPSETADD "add SL_SSLVPNS 10.2.228.0/24"
  IPSETADD "add SL_SSLVPNS 10.2.232.0/24"
  IPSETADD "add SL_SSLVPNS 10.2.236.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.200.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.204.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.212.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.216.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.220.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.224.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.228.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.232.0/24"
  IPSETADD "add SL_SSLVPNS 10.3.236.0/24"

} #ADD_SL_SSLVPNS()

ADD_MS_WDC04_IP(){
  IPSETADD "create MS_WDC04_IP hash:net family inet hashsize 1024 maxelem 65536"
  for ms_ip in ${MS_WDC04_IP[@]}; do IPSETADD "add MS_WDC04_IP ${ms_ip}"; done
} #ADD_MS_WDC04_IP()

ADD_MS_MEL01_IP(){
  IPSETADD "create MS_MEL01_IP hash:net family inet hashsize 1024 maxelem 65536"
  IPSETADD "add MS_MEL01_IP ${MS_MEL01_IP}"
} # ADD_MS_MEL01_IP()

ADD_MS_SYD05_IP(){
  IPSETADD "create MS_SYD05_IP hash:net family inet hashsize 1024 maxelem 65536"
  IPSETADD "add MS_SYD05_IP ${MS_SYD05_IP}"
} # ADD_MS_SYD05_IP()

ADD_MS_AMS03_IP(){
  IPSETADD "create MS_AMS03_IP hash:net family inet hashsize 1024 maxelem 65536"
  IPSETADD "add MS_AMS03_IP ${MS_AMS03_IP}"
} # ADD_MS_AMS03_IP()

# MS_FRA02_IP decommitted
# ADD_MS_FRA02_IP(){
#   IPSETADD "create MS_FRA02_IP hash:net family inet hashsize 1024 maxelem 65536"
#   IPSETADD "add MS_FRA02_IP ${MS_FRA02_IP}"
# } # ADD_MS_FRA02_IP()

ADD_MS_MON01_IP(){
  IPSETADD "create MS_MON01_IP hash:net family inet hashsize 1024 maxelem 65536"
  IPSETADD "add MS_MON01_IP ${MS_MON01_IP}"
} # ADD_MS_MON01_IP()

ADD_MS_CHE01_IP(){
  IPSETADD "create MS_CHE01_IP hash:net family inet hashsize 1024 maxelem 65536"
  IPSETADD "add MS_CHE01_IP ${MS_CHE01_IP}"
} # ADD_MS_CHE01_IP()

ADD_MS_TOK02_IP(){
  IPSETADD "create MS_TOK02_IP hash:net family inet hashsize 1024 maxelem 65536"
  IPSETADD "add MS_TOK02_IP ${MS_TOK02_IP}"
} # ADD_MS_TOK02_IP()

# if LOCATION (DC) = TEST - add test network vyatta vrrp
ADD_MS_TEST_IP(){
  IPSETADD "create MS_TEST_IP hash:net family inet hashsize 1024 maxelem 65536"
  for ms_ip in ${MS_TEST_IP[@]}; do IPSETADD "add MS_TEST_IP ${ms_ip}"; done
} # ADD_MS_TOK02_IP()

####################################################################################
# Define functions to add ipset lists for each tools server
# with server ip and mac address  Done in functions as each server requires
# different lists.
# v4.08 - changed range to use sds server ip for start/end ip range vs tools_subnet
# as tools_subnet could have mask too broad for bitmap:ip,mac ipset list
####################################################################################
ADD_BPM_IP(){
  [[ -z "${BPM_IP}" ]] && return
  IPSETADD "create BPM_IP bitmap:ip,mac range ${BPM_IP}-${BPM_IP}"
  [[ -z "$BPM_MAC" ]] && echo -e "\nERROR - required BPM_MAC not in vars, exiting." && exit 1
  IPSETADD "add BPM_IP ${BPM_IP},${BPM_MAC}"
} # ADD_BPM_IP()

ADD_CHEF_IP(){
  [[ -z "${CHEF_IP}" ]] && return
  IPSETADD "create CHEF_IP bitmap:ip,mac range ${CHEF_IP}-${CHEF_IP}"
  [[ -z "$CHEF_MAC" ]] && echo -e "\nERROR - required CHEF_MAC not in vars, exiting." && exit 1
  IPSETADD "add CHEF_IP ${CHEF_IP},${CHEF_MAC}"
} # ADD_CHEF_IP()

ADD_EE_IP(){
  [[ -z "${EE_IP}" ]] && return
  IPSETADD "create EE_IP bitmap:ip,mac range ${EE_IP}-${EE_IP}"
  [[ -z "$EE_MAC" ]] && echo -e "\nERROR - required EE_MAC not in vars, exiting." && exit 1
  IPSETADD "add EE_IP ${EE_IP},${EE_MAC}"
} # ADD_EE_IP()

ADD_CEBW_IP(){
  [[ -z "${CEBW_IP}" ]] && return
  IPSETADD "create CEBW_IP bitmap:ip,mac range ${CEBW_IP}-${CEBW_IP}"
  [[ -z "$CEBW_MAC" ]] && echo -e "\nERROR - required CEBW_MAC not in vars, exiting." && exit 1
  IPSETADD "add CEBW_IP ${CEBW_IP},${CEBW_MAC}"
} # ADD_CEBW_IP()

ADD_ASB_IP(){
  [[ -z "${ASB_IP}" ]] && return
  IPSETADD "create ASB_IP bitmap:ip,mac range ${ASB_IP}-${ASB_IP}"
  [[ -z "$ASB_MAC" ]] && echo -e "\nERROR - required ASB_MAC not in vars, exiting." && exit 1
  IPSETADD "add ASB_IP ${ASB_IP},${ASB_MAC}"
} # ADD_ASB_IP()

ADD_RCP_PROXY_IP(){
  for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
  do
     IPSETADD "create RCP_PROXY_IP_${INDEX} bitmap:ip,mac range ${RCP_PROXY_IP[INDEX]}-${RCP_PROXY_IP[INDEX]}"
     [[ -z "${RCP_PROXY_MAC[INDEX]}" ]] && echo -e "\nERROR - required RCP_PROXY_MAC not in vars, exiting." && exit 1
     IPSETADD "add RCP_PROXY_IP_${INDEX} ${RCP_PROXY_IP[INDEX]},${RCP_PROXY_MAC[INDEX]}"
  done
} # ADD_RCP_PROXY_IP()

ADD_RCP_BPM_IP(){
  [[ -z "${RCP_BPM_IP}" ]] && return
  IPSETADD "create RCP_BPM_IP bitmap:ip,mac range ${RCP_BPM_IP}-${RCP_BPM_IP}"
  [[ -z "$RCP_BPM_MAC" ]] && echo -e "\nERROR - required RCP_BPM_MAC not in vars, exiting." && exit 1
  IPSETADD "add RCP_BPM_IP ${RCP_BPM_IP},${RCP_BPM_MAC}"
} # ADD_RCP_BPM_IP()

ADD_RCP_ROR_IP(){
  [[ -z "${RCP_ROR_IP}" ]] && return
  IPSETADD "create RCP_ROR_IP bitmap:ip,mac range ${RCP_ROR_IP}-${RCP_ROR_IP}"
  [[ -z "$RCP_ROR_MAC" ]] && echo -e "\nERROR - required RCP_ROR_MAC not in vars, exiting." && exit 1
  IPSETADD "add RCP_ROR_IP ${RCP_ROR_IP},${RCP_ROR_MAC}"
} # ADD_RCP_ROR_IP()

ADD_RCP_IP(){
  [[ -z "${RCP_IP}" ]] && return
  IPSETADD "create RCP_IP bitmap:ip,mac range ${RCP_IP}-${RCP_IP}"
  [[ -z "$RCP_MAC" ]] && echo -e "\nERROR - required RCP_MAC not in vars, exiting." && exit 1
  IPSETADD "add RCP_IP ${RCP_IP},${RCP_MAC}"
} # ADD_RCP_IP()

ADD_PRIVATE_VYOS_IP(){
  IPSETADD "create PRIVATE_VYOS_IP bitmap:ip,mac range ${PRIVATE_VYOS_IP}-${PRIVATE_VYOS_IP}"
  [[ -z "$PRIVATE_VYOS_MAC" ]] && echo -e "\nERROR - required PRIVATE_VYOS_MAC not in vars, exiting." && exit 1
  IPSETADD "add PRIVATE_VYOS_IP ${PRIVATE_VYOS_IP},${PRIVATE_VYOS_MAC}"
} # ADD_PRIVATE_VYOS_IP()

ADD_CSC_IP(){
  [[ -z "${CSC_IP}" ]] && return
  IPSETADD "create CSC_IP bitmap:ip,mac range ${CSC_IP}-${CSC_IP}"
  [[ -z "$CSC_MAC" ]] && echo -e "\nERROR - required CSC_MAC not in vars, exiting." && exit 1
  IPSETADD "add CSC_IP ${CSC_IP},${CSC_MAC}"
} # ADD_CSC_IP()

##################################################################################################
#  START OF WRITING NEW IPSET AND IPTABLES RULES TO $IPSET.new
#  will compare new & existing rules at the end to determine if the
#  rules have changed and services restart is required.
##################################################################################################

  echo -e "\nwriting config to ${IPSET}.new and will run diff against installed config after."
  [[ -f "${IPSET}.new" ]] && mv ${IPSET}.new ${IPSET}.prev
  [[ -f "${IPTABLES}.new" ]] && mv ${IPTABLES}.new ${IPTABLES}.prev

  ADD_SL_SERVICES
  ADD_SL_SSLVPNS

  # Every tool server gets these groups for connectivity from SASGaaS and RAS
  ADD_MS_WDC04_IP
  ADD_MS_MEL01_IP
  ADD_MS_SYD05_IP
  ADD_MS_AMS03_IP


  # every tool server gets this for APM monitor traffic
  #ADD_APM_IP

  # Create Location specific ipset groups & set variables to use in the filter rules
  # so the proper ipset group and rule number gets used
  case $DC in
  DAL|SEA|TOR)
     #wdc, mel & ams already added for ras access
     BIGFIX_GROUP="MS_WDC04_IP"
     R1SOFT_GROUP="MS_WDC04_IP"
     MS_APIE_GROUP="MS_WDC04_IP"
     ;;
  AMS|LON|FRA)
     #wdc, mel & ams already added for ras access
     BIGFIX_GROUP="MS_AMS03_IP"
     R1SOFT_GROUP="MS_AMS03_IP"
     MS_APIE_GROUP="MS_AMS03_IP"
     ;;
  CHE|TOK)
     #wdc, mel & ams already added for ras access
     BIGFIX_GROUP="MS_WDC04_IP"
     if [ "$DC" == "TOK" ];then
       ADD_MS_TOK02_IP
       R1SOFT_GROUP="MS_TOK02_IP"
       MS_APIE_GROUP="MS_TOK02_IP"
     else
       ADD_MS_CHE01_IP
       R1SOFT_GROUP="MS_SYD05_IP"
       MS_APIE_GROUP="MS_CHE01_IP"
     fi
     ;;
  # adding in common mis-spelling in hostname for sydney - SDY instead of SYD
  HKG|SEO|SNG|SYD|SDY)
     #wdc, mel & ams already added for ras access
     ADD_MS_TOK02_IP
     BIGFIX_GROUP="MS_WDC04_IP"
     R1SOFT_GROUP="MS_SYD05_IP"
     MS_APIE_GROUP="MS_SYD05_IP"
     ;;
  TEST|*)
     ADD_MS_TEST_IP
     BIGFIX_GROUP="MS_TEST_IP"
     R1SOFT_GROUP="MS_TEST_IP"
     MS_APIE_GROUP="MS_TEST_IP"
     ;;
esac
  # Define all Port Groups - Every SDS Tool server gets all these
  # for Inbound traffic from managment segment.
  IPSETADD "create MS_SASGaaS_EE_MIST_Port bitmap:port range 1-65535"
  IPSETADD "add MS_SASGaaS_EE_MIST_Port 2222"
  IPSETADD "create MS_RAS_Port bitmap:port range 1-65535"
  IPSETADD "add MS_RAS_Port 2222"
  IPSETADD "add MS_RAS_Port 3333"
  IPSETADD "create MS_BigFix_Port bitmap:port range 1-65535"
  IPSETADD "add MS_BigFix_Port 52311"
  IPSETADD "create MS_R1Soft_Port bitmap:port range 1-65535"
  IPSETADD "add MS_R1Soft_Port 1167"
  IPSETADD "create MS_Zabbix_Port bitmap:port range 1-65535"
  IPSETADD "add MS_Zabbix_Port 10050"


  # start writing new iptables - don't change first line!  We
  # grep out this string later from diff output between existing & new
  # iptables files to see if we need to copy in the new file & restart
  IPTABLESADD "# Generated by $SCRIPT_INFO on $TIMESTAMP"

  IPTABLESADD "*filter"
  IPTABLESADD ":INPUT ACCEPT [0:0]"
  IPTABLESADD ":FORWARD ACCEPT [0:0]"
  IPTABLESADD ":OUTPUT ACCEPT [0:0]"
  IPTABLESADD ":DOCKER-USER - [0:0]"
  RN=0

  ((RN=RN+10))
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow SoftLayer Service connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set SL_SERVICES src -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set SL_SERVICES src -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow SoftLayer SSL VPN connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set SL_SSLVPNS src -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set SL_SSLVPNS src -j ACCEPT"

  # if in test env, make sure to use test vyatta vrrp for sasgaas/ras filter rules
  if [ "$DC" == "TEST" ];then
   SASGAAS_SET="MS_TEST_IP"
   RAS_NA_SET="MS_TEST_IP"
  else
   SASGAAS_SET="MS_WDC04_IP"
   RAS_NA_SET="MS_WDC04_IP"
  fi

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow SASGaaS and EE connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $SASGAAS_SET src -m set --match-set MS_SASGaaS_EE_MIST_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $SASGAAS_SET src -m set --match-set MS_SASGaaS_EE_MIST_Port dst -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow MS RAS (NA) connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_Port dst -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow MS RAS (NA) Zabbix connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_Zabbix_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_Zabbix_Port dst -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow MS RAS (AMS) connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_Port dst -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow MS RAS (MEL) connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_Port dst -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow MS RAS (SYD) connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_Port dst -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow MS BigFixRelay connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p udp -m set --match-set $BIGFIX_GROUP src -m set --match-set MS_BigFix_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p udp -m set --match-set $BIGFIX_GROUP src -m set --match-set MS_BigFix_Port dst -j ACCEPT"

  ((RN=RN+10))
  IPTABLESADD "# RN ${RN} allow MS R1Soft connections"
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $R1SOFT_GROUP src -m set --match-set MS_R1Soft_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
  IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $R1SOFT_GROUP src -m set --match-set MS_R1Soft_Port dst -j ACCEPT"

###############
# Add Tool Server Specific ipset groups and iptables rules
###############
  case $THIS_SDS in
    CEBW)
       ADD_CEBW_IP
       ADD_PRIVATE_VYOS_IP
       IPSETADD "create Public_Port bitmap:port range 1-65535"
       IPSETADD "add Public_Port 443"
       # add port for EE to BPM REST request
       IPSETADD "create BPM_ADMIN_PORT bitmap:port range 1-65535"
       IPSETADD "add BPM_ADMIN_PORT 9443"
       IPSETADD "create DockerEE_Port bitmap:port range 1-65535"
       IPSETADD "add DockerEE_Port 443"
       IPSETADD "create CHEF_Port bitmap:port range 1-65535"
       IPSETADD "create MS_RAS_BPM_Port bitmap:port range 1-65535"
       IPSETADD "add MS_RAS_BPM_Port 9443"
       IPSETADD "add MS_RAS_BPM_Port 9043"
       if echo "${CHEF_PORT[*]}" | grep -wq "443"; then
         IPSETADD "add CHEF_Port 443"
       fi
       IPSETADD "add CHEF_Port 8443"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Management segment to BPM REST Request connections"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${CEBW_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${CEBW_IP}/32 -j ACCEPT"
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${CEBW_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${CEBW_IP}/32 -j ACCEPT"


       #add docker filters
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} BPM Listener"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set Public_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set Public_Port dst -j ACCEPT"
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} MS Global Compliance Dashboard to EE"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set DockerEE_Port dst -j ACCEPT"
      # Frankfurt decommitted
      #  if [ "$MS_APIE_GROUP" != "MS_FRA02_IP" ];then
         # note - put this in if-then - we don't want to add the same source group/rule if on a FRA system

        # Add MS_FRA for MS Global Compliance Dashboard connection
        #  ADD_MS_FRA02_IP
        #  ((RN=RN+10))
        #  IPTABLESADD "# RN ${RN} MS Global Compliance Dashboard to EE"
        #  IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_FRA02_IP src -m set --match-set DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
        #  IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_FRA02_IP src -m set --match-set DockerEE_Port dst -j ACCEPT"
      #  fi
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Endpoints to EE via SASFW connections"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set DockerEE_Port dst -j ACCEPT"
       if [ ! -z "$CSC_IP" ];then
         ((RN=RN+10))
         IPTABLESADD "# RN ${RN} CSC to EE for CP Ticketing System"
         IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set CSC_IP src,src -m set --match-set CSC_to_DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set CSC_IP src,src -m set --match-set CSC_to_DockerEE_Port dst -j ACCEPT"
       fi

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Endpoints to Chef via SASFW connections"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set CHEF_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set CHEF_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j ACCEPT"
       ((RN=RN+10)) 
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 5.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\"" 
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 5.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"


       # Moved from SLA UCD deployment process here as it's near to impossible to manage there
       # after discussing with Miguel (msang@us.ibm.com)
       SAS_DOCKER_APP_DIR="/sasg/apps/sas-upload-listener"
       DOCKER_ENV_FILE="${SAS_DOCKER_APP_DIR}/.env"

       mkdir --parent "${SAS_DOCKER_APP_DIR}"
       touch "${DOCKER_ENV_FILE}"
       sed --in-place "/^ENV_ALLOWED_IPS=.*/d" "${DOCKER_ENV_FILE}"
       # Allow only SASFW to communicate w/ listener (connection from SASG comes via SASFW)
       echo "ENV_ALLOWED_IPS=${PRIVATE_VYOS_IP}" >> "${DOCKER_ENV_FILE}"
       # End Moved from SLA UCD deployment process...
       
       cleanup_containerize_listener
       ;;


    BPM)
       ADD_BPM_IP
       ADD_EE_IP
       ADD_PRIVATE_VYOS_IP
       IPSETADD "create Public_Port bitmap:port range 1-65535"
       IPSETADD "add Public_Port 443"

       # add port for EE to BPM REST request
       IPSETADD "create BPM_ADMIN_PORT bitmap:port range 1-65535"
       IPSETADD "add BPM_ADMIN_PORT 9443"

       IPSETADD "create MS_RAS_BPM_Port bitmap:port range 1-65535"
       IPSETADD "add MS_RAS_BPM_Port 9443"
       IPSETADD "add MS_RAS_BPM_Port 9043"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Management segment to BPM REST Request connections"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       [[ -n "${EE_IP}" ]] && ((RN=RN+10))
       [[ -n "${EE_IP}" ]] && IPTABLESADD "# RN ${RN} EE to BPM REST Request connections"
       [[ -n "${EE_IP}" ]] && IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set BPM_ADMIN_PORT dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       [[ -n "${EE_IP}" ]] && IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set BPM_ADMIN_PORT dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${BPM_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${BPM_IP}/32 -j ACCEPT"

       #add docker filters
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set Public_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set Public_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"

       ;;

    EE)
       ADD_PRIVATE_VYOS_IP
       ADD_BPM_IP

       IPSETADD "create DockerEE_Port bitmap:port range 1-65535"
       IPSETADD "add DockerEE_Port 443"
       IPSETADD "create DockerEEKafka_Port bitmap:port range 1-65535"
       if [ -z "$KAFKA_PORT" ];then
          KAFKA_PORT=9093
       fi
       IPSETADD "add DockerEEKafka_Port $KAFKA_PORT"
       [[ -n "${BPM_IP}" ]] && IPSETADD "create BPM_to_DockerEE_Port bitmap:port range 1-65535"
       [[ -n "${BPM_IP}" ]] && IPSETADD "add BPM_to_DockerEE_Port 443"
       [[ -n "${BPM_IP}" ]] && IPSETADD "add BPM_to_DockerEE_Port 10001"
       if [ ! -z "$CSC_IP" ];then
         ADD_CSC_IP
         IPSETADD "create CSC_to_DockerEE_Port bitmap:port range 1-65535"
         IPSETADD "add CSC_to_DockerEE_Port 443"
       fi

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${EE_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${EE_IP}/32 -j ACCEPT"

       #add docker filters
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} MS Global Compliance Dashboard to EE"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set DockerEE_Port dst -j ACCEPT"

      # Frankfurt decommitted
      #  if [ "$MS_APIE_GROUP" != "MS_FRA02_IP" ];then
         # note - put this in if-then - we don't want to add the same source group/rule if on a FRA system

        # Add MS_FRA for MS Global Compliance Dashboard connection
        #  ADD_MS_FRA02_IP
        #  ((RN=RN+10))
        #  IPTABLESADD "# RN ${RN} MS Global Compliance Dashboard to EE"
        #  IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_FRA02_IP src -m set --match-set DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
        #  IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_FRA02_IP src -m set --match-set DockerEE_Port dst -j ACCEPT"
      #  fi

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} MS APIE(BI) to EE"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $MS_APIE_GROUP src -m set --match-set DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $MS_APIE_GROUP src -m set --match-set DockerEE_Port dst -j ACCEPT"

       [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} Internet to Docker:EE via BPM Proxy connections"
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set BPM_to_DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set BPM_to_DockerEE_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Endpoints to EE via SASFW connections"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set DockerEE_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Endpoints to EE Kafka via SASFW"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set DockerEEKafka_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set DockerEEKafka_Port dst -j ACCEPT"

       if [ ! -z "$CSC_IP" ];then
         ((RN=RN+10))
         IPTABLESADD "# RN ${RN} CSC to EE for CP Ticketing System"
         IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set CSC_IP src,src -m set --match-set CSC_to_DockerEE_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set CSC_IP src,src -m set --match-set CSC_to_DockerEE_Port dst -j ACCEPT"
       fi

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"
       ((RN=RN+10)) 
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 5.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\"" 
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 5.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"
       ;;
       
    CHEF)
       ADD_EE_IP
       ADD_BPM_IP
       ADD_PRIVATE_VYOS_IP
       [[ -n "${EE_IP}" ]] && IPSETADD "create EE_to_CHEF_Port bitmap:port range 1-65535"
       [[ -n "${EE_IP}" ]] && IPSETADD "add EE_to_CHEF_Port 8443"
       [[ -n "${EE_IP}" ]] && IPSETADD "add EE_to_CHEF_Port 443"
       IPSETADD "create LDAP_Port bitmap:port range 1-65535"
       for port in "${LDAP_PORT[@]}"; do
           IPSETADD "add LDAP_Port ${port}"
       done

       IPSETADD "create CHEF_Port bitmap:port range 1-65535"
       [[ -n "${BPM_IP}" ]] && IPSETADD "create BPM_to_CHEF_Port bitmap:port range 1-65535"
       if echo "${CHEF_PORT[*]}" | grep -wq "443"; then
         IPSETADD "add CHEF_Port 443"
         [[ -n "${BPM_IP}" ]] && IPSETADD "add BPM_to_CHEF_Port 443"
       fi
       IPSETADD "add CHEF_Port 8443"
       [[ -n "${BPM_IP}" ]] && IPSETADD "add BPM_to_CHEF_Port 8443"
       
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${CHEF_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${CHEF_IP}/32 -j ACCEPT"

       # add docker rules
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"

       [[ -n "${EE_IP}" ]] && ((RN=RN+10))
       [[ -n "${EE_IP}" ]] && IPTABLESADD "# RN ${RN} EE to Chef connections"
       [[ -n "${EE_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set EE_to_CHEF_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       [[ -n "${EE_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set EE_to_CHEF_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Endpoints to Chef via SASFW connections"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set CHEF_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set PRIVATE_VYOS_IP src,src -m set --match-set CHEF_Port dst -j ACCEPT"

       [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} BPM to Chef ldap port connections"
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set LDAP_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set LDAP_Port dst -j ACCEPT"

       [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} BPM to Chef connections"
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set BPM_to_CHEF_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set BPM_to_CHEF_Port dst -j ACCEPT"

       [[ -n "${EE_IP}" ]] && ((RN=RN+10))
       [[ -n "${EE_IP}" ]] && IPTABLESADD "# RN ${RN} EE to Chef connections"
       [[ -n "${EE_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set LDAP_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       [[ -n "${EE_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set LDAP_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"

       # Moved from SLA UCD deployment process here as it's near to impossible to manage there
       # after discussing with Miguel (msang@us.ibm.com)
       SAS_DOCKER_APP_DIR="/sasg/apps/sas-upload-listener"
       DOCKER_ENV_FILE="${SAS_DOCKER_APP_DIR}/.env"

       mkdir --parent "${SAS_DOCKER_APP_DIR}"
       touch "${DOCKER_ENV_FILE}"
       sed --in-place "/^ENV_ALLOWED_IPS=.*/d" "${DOCKER_ENV_FILE}"
       # Allow only SASFW to communicate w/ listener (connection from SASG comes via SASFW)
       echo "ENV_ALLOWED_IPS=${PRIVATE_VYOS_IP}" >> "${DOCKER_ENV_FILE}"
       # End Moved from SLA UCD deployment process...
       
       cleanup_containerize_listener
       ;;

    ASB)
       ADD_BPM_IP
       [[ -n "${BPM_IP}" ]] && IPSETADD "create BPM_to_ASB_Port bitmap:port range 1-65535"
       [[ -n "${BPM_IP}" ]] && IPSETADD "add BPM_to_ASB_Port 443"
       [[ -n "${BPM_IP}" ]] && IPSETADD "add BPM_to_ASB_Port 80"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${ASB_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${ASB_IP}/32 -j ACCEPT"

       # add docker rules
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"

       [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} Internet to ASB via BPM Proxy connections"
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set BPM_to_ASB_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set BPM_to_ASB_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"

       ;;

    RCP_PROXY)
       RCP_PROXY_IP=${THISIP}

       IPSETADD "create Public_Port bitmap:port range 1-65535"
       IPSETADD "add Public_Port 443"
       RN=0

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Internet to RCP-PROXY via SASFW connections"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set Public_Port dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set Public_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${RCP_PROXY_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${RCP_PROXY_IP}/32 -j ACCEPT"

       # add docker rules
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"

       ;;

    RCP_BPM)
       ADD_RCP_ROR_IP

       # Proxy_to_RCP_BPM_Port - specifies port either proxy or bpm server uses to reach rcp_bpm / rcp_ror servers - ror uses 443, rcp-bpm uses 8443
       IPSETADD "create Proxy_to_RCP_BPM_Port bitmap:port range 1-65535"
       IPSETADD "add Proxy_to_RCP_BPM_Port 8443"

       # define port for rcp-ror to reach rcp-bpm
       [[ -n "${RCP_ROR_IP}" ]] && IPSETADD "create RCP_ROR_to_RCP-BPM_Port bitmap:port range 1-65535"
       [[ -n "${RCP_ROR_IP}" ]] && IPSETADD "add RCP_ROR_to_RCP-BPM_Port 8443"

       # if on rcp-bpm server, add 9443 to the allowed management segment ras to bpm ports for admin console access

       IPSETADD "create MS_RAS_BPM_Port bitmap:port range 1-65535"
       IPSETADD "add MS_RAS_BPM_Port 9443"
       IPSETADD "add MS_RAS_BPM_Port 9043"
       
       #Creating IPSET MS_RCP_Metrics ruleset

       IPSETADD "create MS_RCP_Metrics bitmap:port range 1-65535"
       IPSETADD "add MS_RCP_Metrics 3030"
       
       # Creating Prometheus port ruleset
       
       IPSETADD "create MS_Prometheus bitmap:port range 1-65535"
       IPSETADD "add MS_Prometheus 443"
       IPSETADD "add MS_Prometheus 8443"
       IPSETADD "add MS_Prometheus 8444"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${RCP_BPM_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${RCP_BPM_IP}/32 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${RCP_BPM_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${RCP_BPM_IP}/32 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "#Allow MS_RCP_Metrics (AMS) connections"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_AMS03_IP src -m set --match-set MS_RCP_Metrics dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_AMS03_IP src -m set --match-set MS_RCP_Metrics dst  -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "#Allow connections for Prometheus"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_WDC04_IP src -m set --match-set MS_Prometheus dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_WDC04_IP src -m set --match-set MS_Prometheus dst  -j ACCEPT"

       # add docker rules
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"
       
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_WDC04_IP src -d 172.16.0.0/12 -m set --match-set MS_Prometheus dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_WDC04_IP src -d 172.16.0.0/12 -m set --match-set MS_Prometheus dst -j ACCEPT"
       
       if [ ! -z "$RCP_PROXY_IP" ];then
         # SHARED-RCP - HAVE PROXY DEFINED
         ADD_RCP_PROXY_IP

         for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
         do
            ((RN=RN+10))
            IPTABLESADD "# RN ${RN} Internet to paired RCP_BPM via RCP_Proxy connections"
            IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_PROXY_IP_${INDEX} src,src -m set --match-set Proxy_to_RCP_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
            IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_PROXY_IP_${INDEX} src,src -m set --match-set Proxy_to_RCP_BPM_Port dst -j ACCEPT"
         done
       else
         ADD_BPM_IP
         # Not Shared - add bpm to rcp-bpm filter
         [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} Internet to RCP_BPM via BPM Proxy connections"
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set Proxy_to_RCP_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set Proxy_to_RCP_BPM_Port dst -j ACCEPT"
       fi

         [[ -n "${RCP_ROR_IP}" ]] && ((RN=RN+10))
         [[ -n "${RCP_ROR_IP}" ]] && IPTABLESADD "# RN ${RN} RCP_ROR to RCP_BPM connections"
         [[ -n "${RCP_ROR_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_ROR_IP src,src -m set --match-set RCP_ROR_to_RCP-BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${RCP_ROR_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_ROR_IP src,src -m set --match-set RCP_ROR_to_RCP-BPM_Port dst -j ACCEPT"

       # if Not Shared rcp but CP Ticketing system then add ee & csc and filter rules
       if [ ! -z "$CUSTPREM_TICKETING_IP" -a -z "$RCP_PROXY_IP" ];then
         ADD_EE_IP
         ADD_CSC_IP

         [[ -n "${EE_IP}" ]] && IPSETADD "create EE_to_RCP_BPM_Port bitmap:port range 1-65535"
         [[ -n "${EE_IP}" ]] && IPSETADD "add EE_to_RCP_BPM_Port 8443"
         [[ -n "${CSC_IP}" ]] && IPSETADD "create CSC_to_RCP_BPM_Port bitmap:port range 1-65535"
         [[ -n "${CSC_IP}" ]] && IPSETADD "add CSC_to_RCP_BPM_Port 8443"

         [[ -n "${EE_IP}" ]] && ((RN=RN+10))
         [[ -n "${EE_IP}" ]] && IPTABLESADD "# RN ${RN} EE to RCP_BPM for CP Ticketing System"
         [[ -n "${EE_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set EE_to_RCP_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${EE_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set EE_to_RCP_BPM_Port dst -j ACCEPT"
         [[ -n "${CSC_IP}" ]] && ((RN=RN+10))
         [[ -n "${CSC_IP}" ]] && IPTABLESADD "# RN ${RN} CSC to RCP_BPM for CP Ticketing System"
         [[ -n "${CSC_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set CSC_IP src,src -m set --match-set CSC_to_RCP_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${CSC_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set CSC_IP src,src -m set --match-set CSC_to_RCP_BPM_Port dst -j ACCEPT"
       fi

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} AMS MS RCP Metrics to RCP"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -d 172.16.0.0/12 -m set --match-set MS_RCP_Metrics dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -d 172.16.0.0/12 -m set --match-set MS_RCP_Metrics dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Management segment to BPM REST Request connections"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j ACCEPT"

       ;;

    RCP_ROR)
       ADD_RCP_BPM_IP

       # Proxy_to_RCP_BPM_Port - specifies port either proxy or bpm server uses to reach rcp_bpm / rcp_ror servers - ror uses 443, rcp-bpm uses 8443
       IPSETADD "create Proxy_to_Docker_RCP_ROR_Port bitmap:port range 1-65535"
       IPSETADD "add Proxy_to_Docker_RCP_ROR_Port 8443"

       # define port for rcp-bpm to reach rcp-ror -  ror uses port 443, rcp-bpm uses 8443
       [[ -n "${RCP_BPM_IP}" ]] && IPSETADD "create RCP_BPM_to_Docker_RCP_ROR_Port bitmap:port range 1-65535"
       [[ -n "${RCP_BPM_IP}" ]] && IPSETADD "add RCP_BPM_to_Docker_RCP_ROR_Port 8443"

       [[ -n "${RCP_BPM_IP}" ]] && IPSETADD "create RCP_BPM_to_RCP_ROR_SCP bitmap:port range 1-65535"
       [[ -n "${RCP_BPM_IP}" ]] && IPSETADD "add RCP_BPM_to_RCP_ROR_SCP 2222"

       #Creating IPSET MS_RCP_Metrics ruleset

       IPSETADD "create MS_RCP_Metrics bitmap:port range 1-65535"
       IPSETADD "add MS_RCP_Metrics 3030"

       # Creating Prometheus port ruleset
       
       IPSETADD "create MS_Prometheus bitmap:port range 1-65535"
       IPSETADD "add MS_Prometheus 443"
       IPSETADD "add MS_Prometheus 8443"
       IPSETADD "add MS_Prometheus 8444"

       [[ -n "${RCP_BPM_IP}" ]] && ((RN=RN+10))
       [[ -n "${RCP_BPM_IP}" ]] && IPTABLESADD "# RN ${RN} Paired RCP_BPM to RCP_ROR connections"
       [[ -n "${RCP_BPM_IP}" ]] && IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_BPM_IP src,src -m set --match-set RCP_BPM_to_RCP_ROR_SCP dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       [[ -n "${RCP_BPM_IP}" ]] && IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_BPM_IP src,src -m set --match-set RCP_BPM_to_RCP_ROR_SCP dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${RCP_ROR_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${RCP_ROR_IP}/32 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${RCP_ROR_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${RCP_ROR_IP}/32 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "#Allow MS_RCP_Metrics (AMS) connections"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_AMS03_IP src -m set --match-set MS_RCP_Metrics dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_AMS03_IP src -m set --match-set MS_RCP_Metrics dst  -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "#Allow connections for Prometheus"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_WDC04_IP src -m set --match-set MS_Prometheus dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_WDC04_IP src -m set --match-set MS_Prometheus dst  -j ACCEPT" 

       # add docker rules
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_WDC04_IP src -d 172.16.0.0/12 -m set --match-set MS_Prometheus dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_WDC04_IP src -d 172.16.0.0/12 -m set --match-set MS_Prometheus dst -j ACCEPT"

       if [ ! -z "$RCP_PROXY_IP" ];then
         # RCP-PROXY - SHARED RCP ENVIRONMENT
         ADD_RCP_PROXY_IP

         for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
         do
            ((RN=RN+10))
            IPTABLESADD "# RN ${RN} Internet to paired RCP_ROR via RCP_Proxy connections"
            IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_PROXY_IP_${INDEX} src,src -m set --match-set Proxy_to_Docker_RCP_ROR_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
            IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_PROXY_IP_${INDEX} src,src -m set --match-set Proxy_to_Docker_RCP_ROR_Port dst -j ACCEPT"
         done
       else
         # Not Shared - add bpm to rcp-bpm filter
         ADD_BPM_IP
         [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} Internet to RCP_ROR via BPM Proxy connections"
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set Proxy_to_Docker_RCP_ROR_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set Proxy_to_Docker_RCP_ROR_Port dst -j ACCEPT"
       fi

         [[ -n "${RCP_BPM_IP}" ]] && ((RN=RN+10))
         [[ -n "${RCP_BPM_IP}" ]] && IPTABLESADD "# RN ${RN} RCP_BPM to RCP_ROR connections"
         [[ -n "${RCP_BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_BPM_IP src,src -m set --match-set RCP_BPM_to_Docker_RCP_ROR_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${RCP_BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_BPM_IP src,src -m set --match-set RCP_BPM_to_Docker_RCP_ROR_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} AMS MS RCP Metrics to RCP"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -d 172.16.0.0/12 -m set --match-set MS_RCP_Metrics dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -d 172.16.0.0/12 -m set --match-set MS_RCP_Metrics dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j ACCEPT"

       ;;

    RCP)
       ADD_RCP_ROR_IP

       # Proxy_to_RCP_BPM_Port - specifies port either proxy or bpm server uses to reach rcp_bpm
       IPSETADD "create Proxy_to_RCP_BPM_Port bitmap:port range 1-65535"
       IPSETADD "add Proxy_to_RCP_BPM_Port 8443"
       # redundant but keeping in since possibility with combined ror/bpm into single vm, may need separate ports.
       # Proxy_to_RCP_ROR_Port - specifies port either proxy or bpm server uses to reach rcp_ror
       IPSETADD "create Proxy_to_Docker_RCP_ROR_Port bitmap:port range 1-65535"
       IPSETADD "add Proxy_to_Docker_RCP_ROR_Port 8443"


       # if on rcp-bpm server, add 9443 to the allowed management segment ras to bpm ports for admin console access
       IPSETADD "create MS_RAS_BPM_Port bitmap:port range 1-65535"
       IPSETADD "add MS_RAS_BPM_Port 9443"
       IPSETADD "add MS_RAS_BPM_Port 9043"

       #Creating IPSET MS_RCP_Metrics ruleset

       IPSETADD "create MS_RCP_Metrics bitmap:port range 1-65535"
       IPSETADD "add MS_RCP_Metrics 3030"

       # Creating Prometheus port ruleset
       
       IPSETADD "create MS_Prometheus bitmap:port range 1-65535"
       IPSETADD "add MS_Prometheus 443"
       IPSETADD "add MS_Prometheus 8443"
       IPSETADD "add MS_Prometheus 8444"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${RCP_BPM_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${RCP_BPM_IP}/32 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${RCP_BPM_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${RCP_BPM_IP}/32 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "#Allow MS_RCP_Metrics (AMS) connections"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_AMS03_IP src -m set --match-set MS_RCP_Metrics dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_AMS03_IP src -m set --match-set MS_RCP_Metrics dst  -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "#Allow connections for Prometheus"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_WDC04_IP src -m set --match-set MS_Prometheus dst -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -m set --match-set MS_WDC04_IP src -m set --match-set MS_Prometheus dst  -j ACCEPT" 

       # add docker rules
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_WDC04_IP src -d 172.16.0.0/12 -m set --match-set MS_Prometheus dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_WDC04_IP src -d 172.16.0.0/12 -m set --match-set MS_Prometheus dst -j ACCEPT"

       if [ ! -z "$RCP_PROXY_IP" ];then
         # SHARED-RCP - HAVE PROXY DEFINED
         ADD_RCP_PROXY_IP

         for ((INDEX=0; INDEX<${#RCP_PROXY_IP[@]}; INDEX++))
         do
            ((RN=RN+10))
            IPTABLESADD "# RN ${RN} Internet to paired RCP_BPM via RCP_Proxy connections"
            IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_PROXY_IP_${INDEX} src,src -m set --match-set Proxy_to_RCP_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
            IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_PROXY_IP_${INDEX} src,src -m set --match-set Proxy_to_RCP_BPM_Port dst -j ACCEPT"
            ((RN=RN+10))
            IPTABLESADD "# RN ${RN} Internet to paired RCP_ROR via RCP_Proxy connections"
            IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_PROXY_IP_${INDEX} src,src -m set --match-set Proxy_to_Docker_RCP_ROR_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
            IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set RCP_PROXY_IP_${INDEX} src,src -m set --match-set Proxy_to_Docker_RCP_ROR_Port dst -j ACCEPT"
         done
       else
         ADD_BPM_IP
         # Not Shared - add bpm to rcp-bpm filter
         [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} Internet to RCP_BPM via BPM Proxy connections"
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set Proxy_to_RCP_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set Proxy_to_RCP_BPM_Port dst -j ACCEPT"
         [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} Internet to RCP_ROR via BPM Proxy connections"
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set Proxy_to_Docker_RCP_ROR_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set Proxy_to_Docker_RCP_ROR_Port dst -j ACCEPT"

       fi

       # if Not Shared rcp but CP Ticketing system then add ee & csc and filter rules
       if [ ! -z "$CUSTPREM_TICKETING_IP" -a -z "$RCP_PROXY_IP" ];then
         ADD_EE_IP
         ADD_CSC_IP

         [[ -n "${EE_IP}" ]] && IPSETADD "create EE_to_RCP_BPM_Port bitmap:port range 1-65535"
         [[ -n "${EE_IP}" ]] && IPSETADD "add EE_to_RCP_BPM_Port 8443"
         [[ -n "${CSC_IP}" ]] && IPSETADD "create CSC_to_RCP_BPM_Port bitmap:port range 1-65535"
         [[ -n "${CSC_IP}" ]] && IPSETADD "add CSC_to_RCP_BPM_Port 8443"

         [[ -n "${EE_IP}" ]] && ((RN=RN+10))
         [[ -n "${EE_IP}" ]] && IPTABLESADD "# RN ${RN} EE to RCP_BPM for CP Ticketing System"
         [[ -n "${EE_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set EE_to_RCP_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${EE_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set EE_IP src,src -m set --match-set EE_to_RCP_BPM_Port dst -j ACCEPT"
         [[ -n "${CSC_IP}" ]] && ((RN=RN+10))
         [[ -n "${CSC_IP}" ]] && IPTABLESADD "# RN ${RN} CSC to RCP_BPM for CP Ticketing System"
         [[ -n "${CSC_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set CSC_IP src,src -m set --match-set CSC_to_RCP_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
         [[ -n "${CSC_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set CSC_IP src,src -m set --match-set CSC_to_RCP_BPM_Port dst -j ACCEPT"
       fi

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} AMS MS RCP Metrics to RCP"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -d 172.16.0.0/12 -m set --match-set MS_RCP_Metrics dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -d 172.16.0.0/12 -m set --match-set MS_RCP_Metrics dst -j ACCEPT"
       
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Management segment to BPM REST Request connections"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set $RAS_NA_SET src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_AMS03_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_MEL01_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"
       
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_BPM_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set MS_SYD05_IP src -m set --match-set MS_RAS_BPM_Port dst -j ACCEPT"
       
       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j ACCEPT"

       ;;


    CSC)
       ADD_CSC_IP
       ADD_BPM_IP
       [[ -n "${BPM_IP}" ]] && IPSETADD "create BPM_to_CSC_Port bitmap:port range 1-65535"
       [[ -n "${BPM_IP}" ]] && IPSETADD "add BPM_to_CSC_Port 9443"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${CSC_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d ${CSC_IP}/32 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to Host"
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${CSC_IP}/32 -j LOG --log-prefix \"[SG_INPUT-${RN}-A]\""
       IPTABLESADD "-A INPUT -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d ${CSC_IP}/32 -j ACCEPT"

       # add docker rules
       RN=0
       ((RN=RN+10))
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -m state --state RELATED,ESTABLISHED -j ACCEPT"

       [[ -n "${BPM_IP}" ]] && ((RN=RN+10))
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "# RN ${RN} Internet to CSC via BPM Proxy connections"
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set BPM_to_CSC_Port dst -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       [[ -n "${BPM_IP}" ]] && IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -p tcp -m set --match-set BPM_IP src,src -m set --match-set BPM_to_CSC_Port dst -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 4.0.0.0/8 -d 0.0.0.0/0 -j ACCEPT"

       ((RN=RN+10))
       IPTABLESADD "# RN ${RN} Docker to any"
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j LOG --log-prefix \"[SG_DOCKER-USER-${RN}-A]\""
       IPTABLESADD "-A DOCKER-USER -m comment --comment ETH0_IN-${RN} -s 172.16.0.0/12 -d 0.0.0.0/0 -j ACCEPT"

       ;;
esac


# Add accept for inbound on loopback
  IPTABLESADD "-A INPUT -i lo -j ACCEPT"

# Add accept for inbound on docker0
#  IPTABLESADD "-A INPUT -i docker0 -j ACCEPT"

# Add final input rejects & commit
  IPTABLESADD "-A INPUT -m comment --comment \"INPUT default-action reject\" -j LOG --log-prefix \"[SG_INPUT-default-R]\""
  IPTABLESADD "-A INPUT -j REJECT"
  IPTABLESADD "-A FORWARD -j REJECT"
  IPTABLESADD "-A DOCKER-USER -j REJECT --reject-with icmp-port-unreachable"
  IPTABLESADD "-A DOCKER-USER -j RETURN"
  IPTABLESADD "COMMIT"


#####################
# wrote initially to $IPSET.new - Now run diff between old & new & see if we need to
# restart due to ipset config differences.
#####################
echo -e "\nWrote config to ${IPSET}.new, now running diff between old and new"
DATE=$(date +"%d%b%Y_%H%M%S")
IPSETRESTART="false"
IPSETDIFF=$(diff $IPSET ${IPSET}.new)
if [ "$?" -ne 0 ];then
  # copy ipset original to backup, copy new file in place of old, restart ipset
  if [ -f "$IPSET" ];then
    echo -e "\n***Found generated ipset file differs from existing!"
    mv $IPSET ${IPSET}.${DATE}
    [[ "$?" -ne 0 ]] && echo -e "ERROR - Failed moving $IPSET to ${IPSET}.${DATE} - manual intervention required...exiting." && exit 1
    echo -e "Moved $IPSET to ${IPSET}.${DATE}"
    chmod 600 ${IPSET}.${DATE}
  fi
  cp ${IPSET}.new $IPSET
  [[ "$?" -ne 0 ]] && echo -e "ERROR - Failed copying ${IPSET}.new to $IPSET - manual intervention required...exiting." && exit 1
  echo -e "Copied ${IPSET}.new to $IPSET"

  chmod 644 $IPSET
  if [[ "${FIRSTTIME}" == "true" ]] || [[ "${RESTART_IPTABLES^^}" == "TRUE" ]]; then
     IPSETRESTART="true"
  else
     REFRESH_IPSET="true"
  fi
else
  echo "Generated ${IPSET}.new is same as existing ipset configuration, not replacing."
fi


##################################################################################################
#  END OF WRITING NEW IPSET AND IPTABLES RULES TO $IPSET.new
#  wrote initially to $IPTABLES.new - Now run diff between old & new & see if we need to
#  restart due to ipset config differences.
##################################################################################################
echo -e "\nWrote config to ${IPTABLES}.new, now running diff between old and new"
DATE=$(date +"%d%b%Y_%H%M%S")
# do the check a bit differently - we throw a version # & generated by script xyz at top of iptables config
# version changes with overall version of SAS Network code but doesn't mean tools iptables rules have changed
IPTABRESTART="false"
IPTABDIFF=$(diff ${IPTABLES} ${IPTABLES}.new 2>&1|egrep -v "^[0-9]|---"|grep -vi "Generated by")
if [ ! -z "$IPTABDIFF" ];then
  if [ -f "$IPTABLES" ];then
    # copy iptables original to backup, copy new file in place of old, restart iptables
    echo -e "\n***Found generated iptables file differs from existing!"
    mv $IPTABLES ${IPTABLES}.${DATE}
    [[ "$?" -ne 0 ]] && echo -e "ERROR - Failed moving $IPTABLES to ${IPTABLES}.${DATE} - manual intervention required...exiting." && exit 1
    echo -e "Moved $IPTABLES to ${IPTABLES}.${DATE}"
    chmod 600 ${IPTABLES}.${DATE}
  fi
  cp ${IPTABLES}.new $IPTABLES
  [[ "$?" -ne 0 ]] && echo -e "ERROR - Failed copying ${IPTABLES}.new to $IPTABLES - manual intervention required...exiting." && exit 1

  echo -e "Copied ${IPTABLES}.new to $IPTABLES"
  chmod 644 $IPTABLES
  if [[ "${FIRSTTIME}" == "true" ]] || [[ "${RESTART_IPTABLES^^}" = "TRUE" ]]; then
     IPTABRESTART="true"
  else
     REFRESH_IPTABLES="true"
   fi
else
  # iptables original same as new, not changing
  echo "Generated ${IPTABLES}.new is same as existing iptables configuration, not replacing."
fi # if [ ! -z "$IPTABDIFF" ];then

#############################################################################################################
# If IPSETRESTART or IPTABRESTART  are set to true then restart BOTH iptables & ipset to avoid issues with
# blank or corrupted ipset lists due to iptables holding lists active.
if [[ "${REFRESH_IPTABLES}" == "true" ]] || [[ "${REFRESH_IPSET}" == "true" ]]; then
   chmod +x ./refresh_iptables.sh
   ./refresh_iptables.sh
   if [ $? -ne 0 ]; then
      SUCCESS="false"
   fi
fi

if [ "$IPSETRESTART" == "true" -o "$IPTABRESTART" == "true" ];then
  echo -e "\nWARNING - Iptables was restarted to enable updated firewall rules.  If this was in production before, docker will need to be restarted for the container NATs to be re-defined!\n"
  systemctl stop iptables
  systemctl stop ipset
  # make sure ipset and iptables set to enabled to start on reboot
  systemctl enable ipset
  systemctl enable iptables
  systemctl start ipset
  systemctl start iptables

fi # if [ "$IPSETRESTART" == "true" -o "$IPTABRESTART" == "true" ] ..

# Copied new ipset in place and restarted ipset or just validated existing
# configuration is same as the new config so no restart required.  Now
# do quick check to make sure ipset is active, enabled & running ipset list contains
# an expected SL_SERVICES string

IPSETSTATE=$(systemctl status ipset|grep "Active: "|awk '{print $2}')
IPSETENABLED=$(systemctl status ipset|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
if [ "$IPSETSTATE" != "active" ];then
  echo -e "\nIpset not active...trying to start."
  RET=$(systemctl start ipset 2>&1)
  [[ "$?" -ne 0 ]] && echo -e "\nERROR - failed starting ipset, systemctl start ipset output: $RET" && exit 1
  echo -e "\nIpset started."
fi
if [ "$IPSETENABLED" != "enabled" ];then
  echo -e "\nIpset not enabled to start on reboot, setting to enabled."
  RET=$(systemctl enable ipset 2>&1)
  [[ "$?" -ne 0 ]] && echo -e "\nERROR - failed enabling ipset, systemctl enable ipset output: $RET" && exit 1
  echo -e "\nIpset set to enabled."
fi

#reload ipset
echo -e "\nReloading ipset"
RET=$(systemctl reload ipset 2>&1)
[[ "$?" -ne 0 ]] && echo -e "\nERROR - failed ipset reloading, systemctl reload ipset output: $RET" && exit 1

ipset list |grep -q "SL_SERVICES"
[[ "$?" -ne 0 ]] && echo -e "\nIpset running but expected SL_SERVICES list not found..manual intervention required." && exit 1
# show current ipset list
echo -e "\nShowing current ipset list in memory:\n"
ipset list
#############################################################################################################
# Copied new iptables in place and restarted iptables or just validated existing
# configuration is same as the new config so no restart required.  Now
# do quick check to make sure iptables is active, enabled & running iptables list contains
# an expected SL_SERVICES string
IPTABLESSTATE=$(sudo systemctl status iptables|grep "Active: "|awk '{print $2}')
IPTABLESENABLED=$(sudo systemctl status iptables|grep "Loaded: "|awk -F';' '{print $2}'|sed "s/ //g")
IPTABLESVALIDATE=$(sudo ls -tr /sasg/backup/iptab*|tail -1)

if [ "$IPTABLESSTATE" != "active" ];then
  echo -e "\nIptables not active...trying to start."
  chmod 754 /usr/libexec/iptables/iptables.init
  RET=$(systemctl start iptables 2>&1)
  [[ "$?" -ne 0 ]] && echo -e "\nERROR - failed starting iptables, systemctl start iptables output: $RET" && exit 1
  echo -e "\nWARNING - Iptables was not active but was started successfully. If this was in production before, docker will need to be restarted for the container NATs to be re-defined!\n"
fi
if [ "$IPTABLESENABLED" != "enabled" ];then
  echo -e "\nIptables not enabled to start on reboot, setting to enabled."
  RET=$(systemctl enable iptables 2>&1)
  [[ "$?" -ne 0 ]] && echo -e "\nERROR - failed enabling iptables, systemctl enable iptables output: $RET" && exit 1
  echo -e "\nIptables set to enabled."
fi

iptables -L |grep -q "SL_SERVICES"
[[ "$?" -ne 0 ]] && echo -e "\nIptables running but expected SL_SERVICES list not found..manual intervention required." && exit 1

# show current iptables filter list
echo -e "Showing current iptables list in memory:\n"
iptables -nvL


# only set ssh port to 2222, update gateway & restart network on first time script is run.
if [ "$FIRSTTIME" == true ] ; then
  SSH_CONF="/etc/ssh/sshd_config"

  cp -p $SSH_CONF ${SSH_CONF}.bak
  echo "configuring sshd to listen on 2222........"
  [[ `grep -w "^Port 22" $SSH_CONF` ]] && echo "found un-commented Port 22, changing to 2222" && sed -i.bak "s/Port 22/Port 2222/g" $SSH_CONF
  [[ `grep -w "^#Port 22" $SSH_CONF` ]] && echo "found commented Port 22, changing to 2222" && sed -i.bak "s/^#Port 22/Port 2222/g" $SSH_CONF

  echo "restarting sshd......."
  RET=$(systemctl restart sshd)
  if [ "$?" -ne 0 ];then
    echo -e "ERROR - sshd restart failed. <$RET>, restoring original sshd_config and restarting sshd."
    cp -p ${SSH_CONF}.bak $SSH_CONF
    RET=$(systemctl restart sshd)
    if [ "$?" -ne 0 ];then
      echo -e "ERROR - sshd restart failed after restoring sshd_config."
    else
      echo -e "ERROR - sshd restart successful after restoring sshd_config but sshd not listening on proper port!"
    fi
    exit 1
  else
   echo "sshd restart successful."
  fi

  echo "updating the Gateway (default route) to point to the SASFW........"
  sed -i.bak s/^GATEWAY=$BCR_IP/GATEWAY=$PRIVATE_VYOS_IP/g /etc/sysconfig/network-scripts/ifcfg-eth0

  echo "restarting network........."
  RET=$(systemctl restart network)
  [[ "$?" -ne 0 ]] && echo -e "ERROR - network exited with error <$RET>" && exit 1

else
  echo -e "\nNo changes required to sshd, default gateway - no network restart required."
fi

#########################################################################
# if we get here, means we didn't exit due to any errors so echo all good.
echo -e `date` " - Successful $THIS_SDS Server Configuration"
# exit with 0 so it returns quicker to calling script
if [ "${SUCCESS}" == "false" ]; then
   exit 1
else
   exit 0
fi
