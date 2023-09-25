#!/bin/bash
#
# Simple script that can be run on sasfw or any tools server & depending on server type, will run various functions
# which write out xml tags to a file to be pulled back into a central report on the SASGaaS server.
#
# History - orig - 30OCT2018 - SBraun
# ===============================================================================================
RUNINTERVAL=3600  # Run every half hour.  Note - RUNINTERVAL must come before sourcing in sasmon.common!
#RUNINTERVAL=60  # Run every 60 seconds for testing
source /sasg/bin/sasmon/sasmon.common
#echo -e "running on host: $FQDN \n"

PWD=$(pwd)
XMLLOG="${LOGDIR}/sasdata.xml"
JHCOUNT=0  # number of jumphosts defined
JHIPS=""  # IP addresses of jumphosts concatenated with semicolons and no spaces
OBLIST="/tmp/oblist" # file full list of onboarded endpoints is stored in.
OBSLEEP=10800  # 3 hrs sleep time between getting new onboarded servers list so we don't run this too often.
#OBSLEEP=60  # 60 secs sleep time between getting new onboarded servers list - used for testing.
JHFWLOGSTR="sasgfw*.gz"   # match string used when querying for latest firewall logs
JHFWLOGMAXAGE=10800  # 3 hrs (in seconds) max age of the latest firewall log before generating alert
#JHFWLOGMAXAGE=60  # 60 secs max age of the latest firewall log - just for testing
SASVER=""


if [ ! -d "$LOGDIR" ];then
  sudo mkdir -p $LOGDIR
  sudo chown -R sasauto.sasauto $LOGDIR
fi


[[ -f "$XMLLOG" ]] && mv $XMLLOG ${XMLLOG}.prev

LOGXML(){
  echo "$1"| egrep -qi "<server|</server"
  if [ "$?" -eq 0 ];then
     echo -e "$1" >>$XMLLOG
  else
     echo -e "   $1" >>$XMLLOG
  fi
}


#THIS=$(/usr/sbin/ip addr show dev eth0 |grep "inet "|awk '{print $2}'|cut -f1 -d'/')
# checking via ifcfg file since some accounts have alias on private nic to support tools servers
# that were added on a different subnet.
THIS=$(sudo cat /etc/sysconfig/network-scripts/ifcfg-eth0 |grep -w IPADDR|awk -F'=' '{printf("%s\n",$2)}'|head -1)
LOGXML "<server id=\"${THIS}\">"

GetIPS(){
  # Print fqdn & private ip & any aliases
  LOGXML "<fqdn>${FQDN}</fqdn>"

  sudo cat /etc/sysconfig/network-scripts/ifcfg-eth0 |grep IPADDR|grep -vw IPADDR |awk -F'=' '{printf("%s\n",$2)}'|while read A
  do
     count=$((count+1))
     IPS[$count]="$A"
#     [[ $count -eq 1 ]] && LOGXML "<priv_ip>${IPS[1]}</priv_ip>"
     [[ ! -z "${IPS[$count]}" ]] && LOGXML "<priv_ip_alias>${IPS[$count]}</priv_ip_alias>"
  done

  ip addr |grep -q eth1
  if [ "$?" -eq 0 ];then
   sudo cat /etc/sysconfig/network-scripts/ifcfg-eth1 |grep IPADDR|awk -F'=' '{printf("%s\n",$2)}'|while read A
   do
     count=$((count+1))
     IPS[$count]="$A"
     [[ $count -eq 1 ]] && LOGXML "<pub_ip>${IPS[1]}</pub_ip>"
     [[ $count -gt 1 ]] && LOGXML "<pub_ip_alias>${IPS[$count]}</pub_ip_alias>"
   done
  fi
} # GetIPS()

SASFWVersion(){
    if [ -f "/sasg/bin/VERSION" ];then
      SASVER=$(cat /sasg/bin/VERSION|grep "^[0-9]"|head -1)
      LOGXML "<sasversion>${SASVER}</sasversion>"
    elif [ -f "/config/auth/client/VERSION" ];then
      SASVER=$(cat /config/auth/client/VERSION|grep "^[0-9]"|head -1)
      LOGXML "<sasversion>${SASVER}</sasversion>"
    else
      # in case we need sudo auths to get from /config if nobody chown'd /config to sasauto.sasauto:
      SASVER=$(sudo "cat /config/auth/client/VERSION|grep "^[0-9]"|head -1")
      LOGXML "<sasversion>${SASVER}</sasversion>"
    fi
} # SASFWVersion

CDSVersion(){
   if [ -f "/sasg/bin/VERSION" ];then
      SASVER=$(cat /sasg/bin/VERSION)
      LOGXML "<sasversion>${SASVER}</sasversion>"
   else
      # no current version file - in 3.2.02 even, didn't write version out to /sasg/bin on cds's - only in 3.2.03
      # so if updated to 3.2.02, have to check if iptables/ipset validate file is there & if so, grab version # from that filename
      ls -tr /sasg/backup/iptables_Validate* >/dev/null 2>&1
      if [ "$?" -eq 0 ];then
         SASVER=$(ls -tr /sasg/backup/iptables_Validate*|awk -F'_Pre-' '{print $2}'|tail -1)
         #echo "pulling version from iptables_Validate filename..."
         LOGXML "<sasversion>${SASVER}</sasversion>"
      else
         #echo "No iptables validate file no good way to get exact code version but definitely PRE-v3.2..."
         LOGXML "<sasversion>Pre-3.2</sasversion>"
      fi

   fi 
} # CDSVersion(){

CheckSAVConnection(){
   # check connectivity to symantec antivirus liveupdate site, report connected/failed
   nc -v -i1 -w2 liveupdate.symantecliveupdate.com 80 2>&1| grep "Connected to"
   if [ "$?" -ne 0 ];then
      LOGXML "<sav>failed</sav>"
   else
      LOGXML "<sav>connected</sav>"
   fi

} #CheckSAVConnection()

CheckQradar(){
   # check mss configuration file
   QRADAR=$(sudo su - root -c "cat /etc/rsyslog.d/qradar.conf |grep "10.148.11"|tail -1")
   if [ -z "$QRADAR" ];then
      LOGXML "<qradar>none</qradar>"
   else
      LOGXML "<qradar>${QRADAR}</qradar>"
   fi
} #CheckQradar()

GetJHIPInfo(){
  # in new env, ee may not be defined yet could still have jumphosts used for IAM.  Check for jh ip's in  
  # vars file on sasfw - if on EE since we don't copy out vars to each tools server, check old serverlist file used
  # for log pulls.
  echo "$SHNAME" | egrep -q "\-sasfw|\-vyos"
  if [ "$?" -eq 0 ];then
    # on sasfw - get jumphost ip's from vars & write to sasdata log
    JHIPS=""
    VFILE="/sasg/configs/client/vars"
    for i in `grep "^SASG_IP_" $VFILE| grep -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}"`
    do
      if [ -z "$JHIPS" ];then
        JHIPS="$i"
      else
        JHIPS="$JHIPS;$i"
      fi
    done
    JHCOUNT=$(echo $JHIPS|awk -F';' '{print NF}')
    [[ $JHCOUNT -eq 0 ]] && JHIPS="none"
    LOGXML "<jhcount>$JHCOUNT</jhcount>"
    LOGXML "<jhips>$JHIPS</jhips>"
  fi

    
  # on EE server - since we don't have a vars file on ee, check for jumphost ips in old sasg puller serverlist as its
  # still updated via automation - just to get jh ips and count info used to check onboard status
  echo "$SHNAME" | grep -q "\-ee"
  if [ "$?" -eq 0 ];then
    JHCOUNT=$(cat $SERVERLIST |egrep -v "^$|^#"|grep "^2"|grep "[0-9][.][0-9]"|wc -l|awk '{print $1}')
    JHIPS=$(cat $SERVERLIST|egrep -v "^$|^#"|awk '{printf("%s;",$2)}'|sed "s/;$//")
  fi
} #GetJHIPInfo


# get list of onboarded servers and check jumphost onboarded status.
GetObList(){

  if [ -z "$JHIPS" ];then
    # No jumphosts listed in sasg_serverlist - either IPCenter Tactical or RCP only account
    #echo -e "No jumphosts listed in sasg_serverlist, marking jhonboardnum as N/A."
    LOGXML "<jhonboardnum>NA</jhonboardnum>"
    return
  fi

  # check modify time on onboarded servers list & if within last 3 hours dont run this function
  if [ -f "$OBLIST" ];then
     AGE=$(($(date +%s)-$(date -r $OBLIST +%s)))
     #echo -e "\n$OBLIST file age in seconds: $AGE"
     if [ $AGE -lt $OBSLEEP ];then
        echo "$AGE lt $OBSLEEP seconds, not running check for onboarded jumphosts."
       # return
     else
       if [ -f "$OBLIST" ];then
         mv $OBLIST ${OBLIST}.prev
       fi
        echo "$AGE ge $OBSLEEP seconds, running new onboarded server list and checking for jumphost IPs."
        sudo docker exec -i -u cobalt xeng bash -l -c 'rails c <<< '"'"'ManagedServer.all.each {|s| puts "#{s.fqdn}, #{s.server_platform.name}, #{s.managed_server_status.name}, #{s.ip_address}"};nil'"'" >> $OBLIST
        if [ "$?" -ne 0 ];then
          #echo -e "ERROR trying to get onboarded server list."
          LOGXML "<jhonboardnum>0</jhonboardnum>"
          LOGXML "<jhonboarddetail>OnboardedServersQueryFailed</jhonboarddetail>"
          return
        fi
     fi   
  fi

  
  # if we get here means there are jumphosts
    chmod 740 $OBLIST
    #echo -e "SUCCESS getting onboarded server list."
    for JH in `echo "$JHIPS"|sed "s/;/ /g"`
    do
      #echo "checking $JH"
      JHOBINFO=$(grep -w "$JH" $OBLIST |sed "s/,//g")
      if [ ! -z "$JHOBINFO" ];then
         # got a match to the ip in the onboarded server list
         if [ -z "$JHONBOARDDETAIL" ];then
            # first onboarded jh detail - just add new info to JHONBOARDDETAIL
            JHONBOARDDETAIL="${JHOBINFO}"
         else
            #already info in JHONBOARDDETAIL, append with semicolon in between
            JHONBOARDDETAIL="${JHONBOARDDETAIL};${JHOBINFO}"
         fi
         echo "$JHOBINFO"|grep -qw "Onboarded"
         [[ "$?" -eq 0 ]] && JHONBOARDNUM=$((JHONBOARDNUM+1))
      fi
    done

    if [ -z "$JHONBOARDDETAIL" ];then
      JHONBOARDDETAIL="NA"
      JHONBOARDNUM=0
    fi
    LOGXML "<jhonboardnum>${JHONBOARDNUM}</jhonboardnum>"
    LOGXML "<jhonboarddetail>${JHONBOARDDETAIL}</jhonboarddetail>"
    if [ "$JHONBOARDNUM" -lt "$JHCOUNT" ];then
       echo -e "ERROR: JHCOUNT=$JHCOUNT, JHONBOARDNUM=$JHONBOARDNUM"
       #LOGALERT "WARNING" "jhonboarding" "JH Count: $JHCOUNT;JH Onboarded Count: $JHONBOARDNUM"

     # asof 5mar2019, clear any prev warning msgs for jhlogpulls/jhonboardcount - just log in reports.
       CLEARALERT "WARNING" "jhonboarding"

    else
       CLEARALERT "WARNING" "jhonboarding"
       #echo "JHCOUNT=$JHCOUNT, JHONBOARDNUM=$JHONBOARDNUM, clearing alert"
    fi
} #GetObList()


# get list of jumphost ips and for each try to connect to query openvpn processes running
# if one is found that doesn't contain string "sasg" then log as non sas vpn
JHNonSASGVPNCheck(){
 IPLIST=$(egrep -v "^$|^#" $SERVERLIST | awk '{printf("%s ",$2)}')
 if [ -f "$SERVERIDFILE" ];then
  SERVERID=$(cat $SERVERIDFILE | egrep -v "^$|^#" | head -1 | awk '{print $1}')
 else
  SERVERID="automate"
 fi
 if [ -f "/home/sasauto/non_sas_openvpns" ];then
   #echo -e "copying non_sas_openvpns to .prev"
   mv /home/sasauto/non_sas_openvpns /home/sasauto/non_sas_openvpns.prev
 fi
 for IP in $IPLIST
 do
  #echo -e "\nchecking $IP"
  JHNAME=$(ssh -o ConnectTimeout=5 -o BatchMode=no -o ServerAliveCountMax=1 -o ServerAliveInterval=5 -o StrictHostKeyChecking=no -p 22 ${SERVERID}@${IP} "hostname -s")
  if [ "$?" -ne 0 ];then
    LOGXML "<jh_nonsas_vpns>${IP}_ssh-failed</jh_nonsas_vpns>"
  else
     OPENVPNS=$(ssh -o ConnectTimeout=5 -o BatchMode=no -o ServerAliveCountMax=1 -o ServerAliveInterval=5 -o StrictHostKeyChecking=no -p 22 ${SERVERID}@${IP} "ps -ef|grep openvpn|egrep -v \"sasg|grep\"")
     RHVER=$(ssh -o ConnectTimeout=5 -o BatchMode=no -o ServerAliveCountMax=1 -o ServerAliveInterval=5 -o StrictHostKeyChecking=no -p 22 ${SERVERID}@${IP} "cat /etc/redhat-release")

     #if [ -z "$OPENVPNS" ];then
     if [ ! -z "$OPENVPNS" ];then
#        echo -e "no jumphosts with other openvpn sessions running besides SAS"
#     else
        #echo -e "Found other openvpn session running, assuming DA vpn, appending ps output to ~sasauto/non_sas_openvpns"
        echo "$IP, $JHNAME, $OPENVPNS" >>/home/sasauto/non_sas_openvpns
        LOGXML "<jh_nonsas_vpns>${IP}_${JHNAME}</jh_nonsas_vpns>"
     fi
     if [ ! -z "$RHVER" ];then
        LOGXML "<jh_redhatver>${RHVER}</jh_redhatver>"
     fi
  fi
 done

} # JHNonSASGVPNCheck()

CheckCobaltID(){
#get automation id defined on ee server
  if [ -f "/usr/ccssd/ee/execution_engine.env" ];then
     AUSER=$(sudo grep COBALT_AUTOMATION_USER /usr/ccssd/ee/execution_engine.env | grep -v "^#"|awk -F'=' '{print $2}')
  fi
  if [ -f "/cobalt/execution_engine.env" ];then
     AUSER=$(sudo grep COBALT_AUTOMATION_USER /cobalt/execution_engine.env | grep -v "^#" |awk -F'=' '{print $2}')
  fi
  LOGXML "<automation_id>${AUSER}</automation_id>"
} # CheckCobaltID(){

CheckJHLogs(){
   # check jumphost count - if one or more jumphosts listed in sasg_serverlist then 
   # check logs pulled/pushed from jumphosts (logrepo dir)
   VER=${SASVER:0:1}
   if [ "$JHCOUNT" -eq 0 -o $VER -ge 4 ];then
     LOGXML "<sasgfw_logcount>NA</sasgfw_logcount>"
     LOGXML "<sasgfw_mostrecent>NA</sasgfw_mostrecent>"
     LOGXML "<sasgfw_logstatus>NA</sasgfw_logstatus>"
     return
   fi
   LOGCOUNT=$(find $JHLOGDIR -name "$JHFWLOGSTR" | wc -l | awk '{print $1}')
   if [ "$LOGCOUNT" -gt 0 ];then
     LOGXML "<sasgfw_logcount>${LOGCOUNT}</sasgfw_logcount>"
     # so we have some firewall logs, list most recent logs pulled
     #for i in `ls /home/sasauto/logrepo/Firewall`
     for i in `ls $JHFWLOGDIR`
     do
       NEWESTLOG=$(ls -tr $JHFWLOGDIR/$i | tail -1)
       # check time on newest log - if over MAXJHLOG time or blank, then add to ALERT string.
       if [ -z "$NEWESTLOG" ];then
          #JHLOGALERT="$JHLOGALERT\n$i - No Jumphost Firewall Logs Found"
          echo -e "ERROR - ${JHFWLOGDIR}/${i} - no logs"
       else
          JHLOGAGE=$(($(date +%s)-$(date -r ${JHFWLOGDIR}/${i}/${NEWESTLOG} +%s)))
          #echo -e "\n${JHFWLOGDIR}/${i}/${NEWESTLOG} file age in seconds: $JHLOGAGE, maxage: $JHFWLOGMAXAGE"
          if [ ! -z "$JHLOGAGE" ];then
            if [ $JHLOGAGE -gt $JHFWLOGMAXAGE ];then
              #JHLOGALERT="$JHLOGALERT\n$i - Jumphost Firewall Log $NEWESTLOG older than $JHFWLOGMAXAGE seconds"
              echo -e "ERROR - ${JHFWLOGDIR}/${i}/${NEWESTLOG} age: $JHLOGAGE -gt maxage: $JHFWLOGMAXAGE"
            fi
          fi
       fi

       if [ -z "$MOSTRECENT" ];then
         MOSTRECENT="${i}:${NEWESTLOG}"
       else
         MOSTRECENT="${MOSTRECENT};${i}:${NEWESTLOG};"
       fi
     done
     LOGXML "<sasgfw_mostrecent>${MOSTRECENT}</sasgfw_mostrecent>"
     if [ -z "$JHLOGALERT" ];then
       # no alerts on firewall log pulls...call clear
       #echo -e "No alerts on firewall log pulls - all recent...calling clear alert"
       CLEARALERT "WARNING" "jhfwlogpull"
     #  LOGXML "<sasgfw_logstatus>OK</sasgfw_logstatus>"
     else
     #  LOGALERT "WARNING" "jhfwlogpull" "$JHLOGALERT"

     # asof 5mar2019, clear any prev warning msgs for jhlogpulls/jhonboardcount - just log in reports.
       CLEARALERT "WARNING" "jhfwlogpull"

       LOGXML "<sasgfw_logstatus>OLD</sasgfw_logstatus>"
     fi

   else
     #echo -e "no sasg firewall logs pulled to ee.\n"
     LOGXML "<sasgfw_logcount>0</sasgfw_logcount>"
     LOGXML "<sasgfw_mostrecent>${MOSTRECENT}</sasgfw_mostrecent>" 
     LOGXML "<sasgfw_logstatus>NoLogs</sasgfw_logstatus>"
   fi
} # CheckJHLogs()

check_wazuh_agent()
{
  #get info about osssec that is related to the Wazuh agent
  #<ps -ef | grep osssec>
  #
  #output:
  #root      2495     1  0  2018 ?        00:03:26 /var/ossec/bin/ossec-execd
  #ossec     2503     1  0  2018 ?        01:40:14 /var/ossec/bin/ossec-agentd
  #root      2509     1  0  2018 ?        00:43:22 /var/ossec/bin/ossec-syscheckd
  #root      2522     1  0  2018 ?        00:48:25 /var/ossec/bin/ossec-logcollector
  #root      2535     1  0  2018 ?        00:02:38 /var/ossec/bin/wazuh-modulesd

  if [ "$(ps -ef | grep ossec | grep -v grep)" ]; then
     WAZUH_AGENT="Installed"
  else
     WAZUH_AGENT="Not installed"
  fi
  LOGXML "<wazuh>${WAZUH_AGENT}</wazuh>"
#  echo -e "\n--- Wazuh agent:            ${WAZUH_AGENT}"
#  ps -ef | grep osssec | grep -v grep
} # check_wazuh_agent

check_sas_chef_containers()
{
  MAINVER=${SASVER:0:1}
  SUBVER=$(echo "$SASVER"|cut -f2 -d'.')
  # if newer than v5.07 then log listener is on sasfw, just return
  if [ $MAINVER -ge 5 -a $SUBVER -gt 6 ];then
    return
  fi

  PS_STATUS=""
  #get info about chef-sidecar-config-analyzer 
  CHEF_ANALYZER_IMAGE=$(sudo docker images --filter reference='*/chef-sidecar-config-analyzer' --format "{{.Repository}} {{.Tag}}" | tr ' ' '_'|cut -f2 -d'/'|head -1)
  [[ -z "$CHEF_ANALYZER_IMAGE" ]] && LOGXML "<chef_analyzer_image>not_installed</chef_analyzer_image>"
  [[ ! -z "$CHEF_ANALYZER_IMAGE" ]] && LOGXML "<chef_analyzer_image>${CHEF_ANALYZER_IMAGE}</chef_analyzer_image>"

  #get info about sas-upload-listener images
  UPLOAD_LISTENER_IMAGE=$(sudo docker images --filter reference='*/sas-upload-listener' --format "{{.Repository}} {{.Tag}}" | tr ' ' '_'|cut -f2 -d'/'|head -1)
  [[ -z "$UPLOAD_LISTENER_IMAGE" ]] && LOGXML "<chef_listener_image>not_installed</chef_listener_image>"
  [[ ! -z "$UPLOAD_LISTENER_IMAGE" ]] && LOGXML "<chef_listener_image>${UPLOAD_LISTENER_IMAGE}</chef_listener_image>"

  #get info about sas-upload-listener images
  CHEF_WRITER_IMAGE=$(sudo docker images --filter reference='*/chef-sidecar-syslog-writer' --format "{{.Repository}} {{.Tag}}" | tr ' ' '_'|cut -f2 -d'/'|head -1)
  [[ -z "$CHEF_WRITER_IMAGE" ]] && LOGXML "<chef_writer_image>not_installed</chef_writer_image>"
  [[ ! -z "$CHEF_WRITER_IMAGE" ]] && LOGXML "<chef_writer_image>${CHEF_WRITER_IMAGE}</chef_writer_image>"

  # get all running container processes with sas-upload-listener in name
  ALL_LISTENER_PS=$(sudo docker ps |grep sas-upload-listener)

  #get info about sas-upload-listener containers status
#  CHEF_ANALYZER_PS=$(sudo docker ps -f name=sasuploadlistener_logs-analyzer --format "{{.Image}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}")
  CHEF_ANALYZER_PS=$(echo "$ALL_LISTENER_PS"|grep "analyzer")
  [[ -z "$CHEF_ANALYZER_PS" ]] && PS_STATUS="$PS_STATUS chef_analyzer"

  #get info about chef-sidecar-config-analyzer container status
#  UPLOAD_LISTENER_PS=$(sudo docker ps -f name=sasuploadlistener_nginx --format "{{.Image}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}")
  UPLOAD_LISTENER_PS=$(echo "$ALL_LISTENER_PS"|grep "nginx")
  [[ -z "$UPLOAD_LISTENER_PS" ]] && PS_STATUS="$PS_STATUS chef_listener"

  #get info about chef-sidecar-syslog-writer container status
#  CHEF_WRITER_PS=$(sudo docker ps -f name=sasuploadlistener_logwriter --format "{{.Image}}\t{{.Names}}\t{{.RunningFor}}\t{{.Status}}")
  CHEF_WRITER_PS=$(echo "$ALL_LISTENER_PS"|grep "logwriter")
  [[ -z "$CHEF_WRITER_PS" ]] && PS_STATUS="$PS_STATUS chef_writer"

  [[ ! -z "$PS_STATUS" ]] && LOGXML "<chef_loglistener_status>Not_running: $PS_STATUS</chef_loglistener_status>"
  [[ -z "$PS_STATUS" ]] && LOGXML "<chef_loglistener_status>Listeners_running</chef_loglistener_status>"

} # check_sas_chef_containers

check_sasg_containers()
{
  MAINVER=${SASVER:0:1}
  SUBVER=$(echo "$SASVER"|cut -f2 -d'.')

  if [[ $MAINVER -lt 4 ]];then
     LOGXML "<chef_sidecar-checker_heartbeat>NA</chef_sidecar-checker_heartbeat>"
     LOGXML "<chef_sasg_audit_logs>NA</chef_sasg_audit_logs>"
     LOGXML "<chef_sasg_messages_logs>NA</chef_sasg_messages_logs>"
     return
  fi
  # if newer than v5.07 then log listener is on sasfw, just return
  if [ $MAINVER -ge 5 -a $SUBVER -gt 6 ];then
    return
  fi

  #check that sasg-sidecar-checker is started
  SASG_DIR_LIST=$(sudo docker exec -it sasuploadlistener_logs-analyzer_1 find  /nginx/upload/ -type d -maxdepth 1 -mindepth 1)
  HEARTBEAT_STATUS="Down"
  for directory in SASG_DIR_LIST
  do
    if [ "$(sudo docker exec -it sasuploadlistener_logs-analyzer_1 find  $directory -type f -name heartbeat-missing)" == "" ]; then
       HEARTBEAT_STATUS="Up"
       break
    fi
  done
  echo -e "\n--- sasg-sidecar-checker heartbeat: $HEARTBEAT_STATUS"
  LOGXML "<chef_sidecar-checker_heartbeat>${HEARTBEAT_STATUS}</chef_sidecar-checker_heartbeat>"
  #check that sasg audit logs are added to the /var/log/messages on the chef host
if [ "$(sudo cat /var/log/messages | grep SASG | grep AUDIT | head -1)" == "" ]; then
   echo -e "\n--- Sasg audit logs in /var/log/messages:  NO"
  LOGXML "<chef_sasg_audit_logs>NO</chef_sasg_audit_logs>"
else
   echo -e "\n--- Sasg audit logs in /var/log/messages:  YES"
  LOGXML "<chef_sasg_audit_logs>YES</chef_sasg_audit_logs>"
fi
  #check that sasg messages logs are added to the /var/log/messages on the chef host
if [ "$(sudo cat /var/log/messages | grep SASG | grep MESSAGES | head -1)" == "" ]; then
   echo -e "\n--- Sasg messages logs in /var/log/messages:  NO"
  LOGXML "<chef_sasg_messages_logs>NO</chef_sasg_messages_logs>"
else
   echo -e "\n--- Sasg messages logs in /var/log/messages:  YES"
  LOGXML "<chef_sasg_messages_logs>YES</chef_sasg_messages_logs>"
fi

} # check_sasg_containers

check_sasg_loglistener(){
  # check if sasg log listener service is defined on system
  SERVICE_NAME="sasg-listener.service"
  LISTENER_SERVICE="/usr/lib/systemd/system/${SERVICE_NAME}"

  if [ ! -f "$LISTENER_SERVICE" ];then
    LOGXML "<sasfw_sasg_loglistener>NA</sasfw_sasg_loglistener>"
    return
  fi

  LISTENER_STATE=$(sudo systemctl is-active sasg-listener)
  LOGXML "<sasfw_sasg_loglistener>${LISTENER_STATE}</sasfw_sasg_loglistener>"

} #check_sasg_loglistener

check_iptables(){
  VER=${SASVER:0:1}
  echo "\nVER=$VER, Full SASVER=$SASVER"
  if [[ $VER -ge 4 ]];then
     sudo iptables -L |grep -q "src,src"
     if [[ "$?" -eq 0 ]];then
       LOGXML "<ipmac_filtering>true</ipmac_filtering>"
     else
       LOGXML "<ipmac_filtering>false</ipmac_filtering>"
     fi
  else
    LOGXML "<ipmac_filtering>Not_Applicable_V3Code</ipmac_filtering>"
  fi #if [[ "$(echo "$SASVER"|cut -f1 -d'.')" -lt 4 ]]

} # check_iptables


check_tunnels(){
  # if on sasfw, check tunnel type to cust environment and if IAMaaS is configured
 if [ -f "/sasg/configs/client/vars" ];then
   source /sasg/configs/client/vars

   # if sasg defined then check tunnel type
   if [ ! -z "${SASG_IP_1[0]}" ];then
     if [ "${TUNNEL_TYPE}" == "ipsec" ];then
      LOGXML "<tunnel_type>ipsec</tunnel_type>"
     else
      LOGXML "<tunnel_type>openvpn</tunnel_type>"
     fi
     # now check if IAM is configured
     if [ -z "$IAMAAS_PRIMARY_SUBNET" ];then
      LOGXML "<iam>NO</iam>"
     else
      LOGXML "<iam>YES</iam>"
     fi
   
   else
       LOGXML "<tunnel_type>N/A</tunnel_type>"
   fi
 else
    LOGXML "<tunnel_type>vars_not_found</tunnel_type>"
    LOGXML "<iam>vars_not_found</iam>"
 fi
     
} #check_tunnels()

# all servers - get sas automation version, check symantec anti-virus connectivity, qradar config check
GetIPS
CheckSAVConnection
CheckQradar


  echo "$SHNAME" | grep -q "\-chef"
  [[ "$?" -eq 0 ]] && THIS_SDS="CHEF"
  echo "$SHNAME" | grep -q "\-ee"
  [[ "$?" -eq 0 ]] && THIS_SDS="EE"
  echo "$SHNAME" | grep -q "\-cebw"
  [[ "$?" -eq 0 ]] && THIS_SDS="CEBW"
  echo "$SHNAME" | grep "\-bpm"|grep -v "rcp-"
  [[ "$?" -eq 0 ]] && THIS_SDS="BPM"
  echo "$SHNAME" | grep "rcp-proxy"
  [[ "$?" -eq 0 ]] && THIS_SDS="PROXY"
  echo "$SHNAME" | egrep -q "\-vyos|\-sasfw"
  [[ "$?" -eq 0 ]] && THIS_SDS="SASFW"
  case $THIS_SDS in
  SASFW)
    echo -e "On SASFW $SHNAME"
    SASFWVersion
    check_wazuh_agent
    check_iptables
    check_tunnels
    GetJHIPInfo
    check_sasg_loglistener
    LOGXML "</server>"
    ;;
  EE)
    echo -e "On EE server $SHNAME"
    CDSVersion
    GetJHIPInfo
    CheckCobaltID
    GetObList
    JHNonSASGVPNCheck
    CheckJHLogs
    check_iptables
    LOGXML "</server>"
    ;;
  CEBW)
    echo -e "On CEBW server $SHNAME"
    CDSVersion
    GetJHIPInfo
    CheckCobaltID
    GetObList
    JHNonSASGVPNCheck
    CheckJHLogs
    check_sas_chef_containers
    check_sasg_containers
    check_iptables
    check_wazuh_agent
    LOGXML "</server>"
    ;;
  CHEF)
    echo -e "On CHEF server $SHNAME"
    CDSVersion
    check_sas_chef_containers
    check_sasg_containers
    check_iptables
    LOGXML "</server>"
    ;;
  BPM)
    echo -e "On BPM server $SHNAME"
    CDSVersion
    check_wazuh_agent
    check_iptables
    LOGXML "</server>"
    ;;
  PROXY)
    echo -e "On Proxy server $SHNAME"
    CDSVersion
    check_wazuh_agent
    LOGXML "<ipmac_filtering>Not_Applicable_On_Proxy_Server</ipmac_filtering>"
    LOGXML "</server>"
    ;;
  *)
    echo -e "On server $SHNAME"
    CDSVersion
    check_iptables
    LOGXML "</server>"
    ;;
  esac


# all other cds servers, just run CDSVersion
exit 0
