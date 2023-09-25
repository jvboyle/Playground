#!/bin/bash
#
# Simple script to configure dnsmasq on sasfw to update ipset lists used for white-listing
# egress IPs
# History:  03/22/19 - SBraun - orig script
#           05/14/19 - added dl_fedoraproject.org
#
# ===============================================================================================
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )" # get current dir
DMASQ="/etc/dnsmasq.conf"
TDMASQ="$DIR/temp_dnsmasq.conf"
CLEANUP="/sasg/bin/wl_cleanup.sh" # name of script to run in background and clean up ipset lists every x seconds
CLEANUP_START="/sasg/bin/start_wlcleanup.sh" # name of script to run via cron which restarts the whitelist cleanup script if it's down
DATE=$(date +"%F_%T")

LOGERR(){
  MSG="$1"
  echo -e "ERROR: $MSG"
  exit 1
}

# backup current dnsmasq config file
if [ -f "$DMASQ" ];then
  sudo mv $DMASQ ${DMASQ}.${DATE}
fi

# write new dnsmasq config to temp file
cat > $TDMASQ <<EOL
# Configuration file for dnsmasq.
#
# Format is one option per line, legal options are the same
# as the long options legal on the command line. See
# "/usr/sbin/dnsmasq --help" or "man 8 dnsmasq" for details.

# Change this line if you want dns to get its upstream servers from
server=10.0.80.11
server=10.0.80.12

# Add domains which you want to force to an IP address here.
# The example below send any host in double-click.net to a local
# web-server.
#address=/double-click.net/127.0.0.1

# Add the IPs of all queries to yahoo.com, google.com, and their
# subdomains to the vpn and search ipsets:
#ipset=/yahoo.com/google.com/vpn,search
ipset=/liveupdate.symantecliveupdate.com/symantecliveupdate_com_masq
ipset=/liveupdate.symantec.com/symantec_com_masq
ipset=/download.fedoraproject.org/dl_fedoraproject_masq
ipset=/dl.fedoraproject.org/dl_fedoraproject_masq
ipset=/repo.r1soft.com/r1soft_com_masq
ipset=/service.networklayer.com/networklayer_com_masq
ipset=/packages.wazuh.com/wazuh_com_masq
ipset=/ismnac.ibm.com/ismnac_ibm_com_masq
ipset=/smtp.sendgrid.net/smtp_sendgrid_net_masq
ipset=/idaas.iam.ibm.com/idaas_iam_ibm_com_masq
ipset=/na.artifactory.swg-devops.com/na_artifactoryr_masq
ipset=/eu.artifactory.swg-devops.com/eu_artifactoryr_masq
ipset=/gts-tia-blue-integrate-docker-local.artifactory.swg-devops.com/na_artifactoryr_masq
ipset=/gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/na_artifactoryr_masq
ipset=/gts-tia-rcp-docker-local.artifactory.swg-devops.com/na_artifactoryr_masq
ipset=/prepiam.toronto.ca.ibm.com/prepiam_toronto_ca_ibm_com_masq
ipset=/prepiam.ice.ibmcloud.com/prepiam_ice_ibmcloud_com_masq
ipset=/w3id.sso.ibm.com/w3ids_sso_ibm_com
ipset=/status.geotrust.com/status_geotrust_com
ipset=/database.clamav.net/database_clamav_net
ipset=/sensors.genuine-sheeps.my.cbcloud.de/sensors_genuine_sheeps_cbcloud
ipset=/ts01-lanner-lion.cloudsink.net/lfodown01-lanner-lion.cloudsink.net/crowdstrike_instances
ipset=/login.ibm.com/login_ibm_com
ipset=/vserv-us.sos.ibm.com/vserv-eu.sos.ibm.com/VAULTaaS
ipset=/rpm.newrelic.com/newrelic_com
ipset=/service.newrelic.com/newrelic_com
ipset=/patch-advisories.mybluemix.net/patch_advisories
EOL

# copy new dnsmasq temp config to normal location via sudo
echo "copying new configuration to $DMASQ ..."
sudo su - root -c "cp $TDMASQ $DMASQ"
[[ "$?" -ne 0 ]] && LOGERR "failed to update $DMASQ - manual intervention required."

# update resolve.conf
if [ -f "/etc/resolv.conf" ];then
  echo "updating /etc/resolv.conf ..."
  sudo su - root -c "cp /etc/resolv.conf /etc/resolv.conf.${DATE}"
  sudo su - root -c "echo \"nameserver 127.0.0.1\" > /etc/resolv.conf"
  [[ "$?" -ne 0 ]] && LOGERR "Failed to update /etc/resolv.conf - manual intervention required."
else
  echo "writing new /etc/resolv.conf ..."
  sudo su - root -c "echo \"nameserver 127.0.0.1\" > /etc/resolv.conf"
  sudo su - root -c "chmod 644 /etc/resolv.conf"
fi

# enable and restart dnsmasq service
echo "enabling and restarting dnsmasq service ..."
sudo systemctl enable dnsmasq
sudo systemctl restart dnsmasq
[[ "$?" -ne 0 ]] && LOGERR "Error restarting dnsmasq service..manual intervention required."

# for each fqdn listed in new dnsmasq conf file, run nslookup (or getent hosts if nslookup unavailable) to 
# force initial ipset list population
echo "running nslookups to do initial population of whitelist ipset lists ..."
TOLOOKUP=("liveupdate.symantecliveupdate.com" "liveupdate.symantec.com" "download.fedoraproject.org" "dl.fedoraproject.org" "repo.r1soft.com" \
"service.networklayer.com" "packages.wazuh.com" "ismnac.ibm.com" "smtp.sendgrid.net" "idaas.iam.ibm.com" "na.artifactory.swg-devops.com" \
"eu.artifactory.swg-devops.com" "prepiam.toronto.ca.ibm.com" "w3id.sso.ibm.com" "gts-tia-blue-integrate-docker-local.artifactory.swg-devops.com" \
"gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com" "gts-tia-rcp-docker-local.artifactory.swg-devops.com" "status.geotrust.com" \
"database.clamav.net" "sensors.genuine-sheeps.my.cbcloud.de")
LOOKUP="/usr/bin/nslookup"
[[ ! -f "$LOOKUP" ]] && LOOKUP="/usr/bin/getent hosts"
for i in ${TOLOOKUP[@]}
do
  $LOOKUP $i
done

# create ipset cleanup script that looks at ipset entries in dnsmasq config and for each ipset group, if more than
# one ip is listed, remove all the IPs from the whitelist ipset lists so they get repopulated next time an app does a request.
echo "creating cleanup script to maintain ipset whitelist ipset lists ..."
if [ -f "$CLEANUP" ];then
  mv $CLEANUP ${CLEANUP}.prev
fi
cat > $CLEANUP <<EOL
#!/bin/bash
IPSETLIST="white_list"
DNSMASQ="/etc/dnsmasq.conf"
SLEEP=60  # secs between checks/clean-ups of ipset whitelist lists

while(true)
do

  for LIST_NAME in \`cat \$DNSMASQ|grep "^ipset"|awk -F'/' '{print \$NF}'\`
  do
    MEMBERS=\$(sudo ipset list \$LIST_NAME 2>&1|grep -A5 "Members"|grep -v "^Members")
    [[ "\$?" -ne 0 ]] && continue
    MEMBERSCNT=\$(echo "\$MEMBERS"|wc -l|awk '{print \$1}')
    if [[ \$MEMBERSCNT -gt 1 ]];then
      for memberip in \$MEMBERS
      do
        echo "removing \$memberip from \$LIST_NAME"
        sudo ipset del \$LIST_NAME \$memberip
      done
    fi
  done
  sleep \$SLEEP
done
EOL


if [ -f "$CLEANUP_START" ];then
  mv $CLEANUP_START ${CLEANUP_START}.prev
fi
# create script to restart the iptables whitelist cleanup script
cat > $CLEANUP_START << EOL
#!/bin/bash
#
# Simple script to be run via cron - starts up openvpn monitor script if not already
# running - prevents multiple instances.
# 
# cron example:
#  */5 * * * * $CLEANUP_START &>/dev/null
#

TOSTART="$CLEANUP"

ps -ef|grep -v grep|grep -qw "bash \$TOSTART"
if [ \$? -ne 0 ];then
  nohup \${TOSTART} &
fi
exit 0
EOL

echo "setting permissions on $CLEANUP and $CLEANUP_START ..."
chmod 754 $CLEANUP
chmod 754 $CLEANUP_START

# add cronjob for sasauto id to run the cleanup start script
echo "adding cronjob for $CLEANUP_START ..."
if [ -f "/home/sasauto/cronjobs" ];then
  mv /home/sasauto/cronjobs /home/sasauto/cronjobs.$DATE
fi
crontab -l | grep -v "$CLEANUP_START" >/home/sasauto/cronjobs
echo "*/5 * * * * $CLEANUP_START &>/dev/null" >>/home/sasauto/cronjobs
crontab /home/sasauto/cronjobs
[[ "$?" -ne 0 ]] && LOGERR "Error updating sasauto cron to run $CLEANUP_START"


exit 0
