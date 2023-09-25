#!/bin/bash
#
# Simple script to be run via cron on EE server to pull sasg firewall and vpn logs
# Reads server list from a single file with list of cds server ips and ports
#
# Original script - S Braun - 29Aug2017
#    - S Braun - 15Sep2017 - based on puller.sh on elk server - tweaked for use with sasg logs
#    - S Braun - 25Sep2017 - added RETENTION - # days of sync'd logs to keep & option to specify 3rd arg with 
#                            log/dir name to sync if log names in 2nd arg arent' found.
#    - S Braun - 26Sep2017 - added -o StrictHostKeyChecking=no option on ssh so no human intervention required
#                          - when this runs - will be able to connect & pull logs.  Added check & update of 
#                          - serverlist - when only ip addr of sasg is there, it first ssh's to the sasg & gets
#                          - short hostname then updates the serverlist..from then on it can use the hostname
#                          - for the target directory to copy log files to vs just an ip address.
#    - S Braun - 23May2018 - added pull of iptables/ipset files & validation files.  Also check if rsync/ssh
#                            fails with file not found, set permissions on the directory then retry.
#    - S Braun - 16Aug2018 - Modified to support both regular jumphost and shared jumphost.  If shared JH, will
#                            pull logs for each client directory in /sasg/clients
# -----------------------------------------------------------------------------------------------------------------

#######################################################
SERVERLIST="/home/sasauto/Puller/sasg_serverlist"  # list of sasg servers to pull from - built on install
PULLERID="/home/sasauto/Puller/sasg_id"     # id file - if exists use id listed in the file for ssh/rsync, else use default
IPTAB_LOG_REPO="/home/sasauto/logrepo/Iptables"   # where to store rsync'd sasg firewall logs
FW_LOG_REPO="/home/sasauto/logrepo/Firewall"   # where to store rsync'd sasg firewall logs
VPN_LOG_REPO="/home/sasauto/logrepo/VPN"   # where to store rsync'd sasg vpn logs
MRTG_LOG_REPO="/home/sasauto/logrepo/MRTG"   # where to store rsync'd sasg vpn logs
DEFAULT_ID="automate"  # id to ssh as - expects ssh keys to be configured already
RETENTION=10      # number of logs to retain - find -mtime +$RETENTION -exec rm -f done after log rsync completes.
DATE=`date +"%F_%H%M%S"`
#######################################################
if [ -f "${SERVERLIST}.new" ];then
   # shouldn't be a new serverlist when we just start up - could be a manual run of sasgpuller then ctrl-c in the middle
   # remove the .new file
   echo -e "possible failed previous run of $0 - removing ${SERVERLIST}.new...."
   rm -f ${SERVERLIST}.new
fi

if [ -f "$PULLERID" ];then
  # read in id from pullerid file - since can be manually edited
  # remove blank lines and comments & grab last line
  ID_READ=$(cat $PULLERID|egrep -v "^#|^$"|tail -1)
  if [ -z "$ID_READ" ];then
    USEID=$DEFAULT_ID
  else
    USEID=$ID_READ
  fi
else
  # no separate file with ssh id to use, use default
  USEID=$DEFAULT_ID
fi


if [ ! -d "$FW_LOG_REPO" ];then
   echo -e "\n$FW_LOG_REPO doesn't exist..creating..\n"
   mkdir -p $FW_LOG_REPO
fi
if [ ! -d "$VPN_LOG_REPO" ];then
   echo -e "\n$VPN_LOG_REPO doesn't exist..creating..\n"
   mkdir -p $VPN_LOG_REPO
fi
if [ ! -d "$MRTG_LOG_REPO" ];then
   echo -e "\n$MRTG_LOG_REPO doesn't exist..creating..\n"
   mkdir -p $MRTG_LOG_REPO
fi
if [ ! -d "$IPTAB_LOG_REPO" ];then
   echo -e "\n$IPTAB_LOG_REPO doesn't exist..creating..\n"
   mkdir -p $IPTAB_LOG_REPO
fi

if [ ! -f "$SERVERLIST" ];then
  echo -e "\nError - server list $SERVERLIST  file not found!..exiting.\n"
  exit 1
fi

DO_RSYNC="YES"

##############################################################################################
# run rsync to sync up sasg logs to current logrepo filesystem.  expects file in SERVERLIST
# variable to exist, and requires at 2 args - 
#    DoRsync "log repo directory on local server to copy sasg logs to" " logs on sasg to sync" 
##############################################################################################
DoRsync(){
VYTLOGROOT="$1"
LOGDIR="$2"
CL="$3"
if [ ! -z "$3" ];then
  # this is shared jumphost, have to set up target dir using client directory name - update SVR variable
  # so we write to the correct path on ee
  SVR="$CL"
  echo -e "setting SVR=\"$CL\""
fi

  echo -e "\n--------------------\nrunning: rsync -avz -e \"ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no\" ${USEID}@${IP}:${LOGDIR} ${VYTLOGROOT}/${SVR}/ --rsync-path=\"sudo /usr/bin/rsync\""
  RET=$(rsync -avz -e "ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no" ${USEID}@${IP}:${LOGDIR} ${VYTLOGROOT}/${SVR}/ --rsync-path="sudo /usr/bin/rsync" 2>&1)
  if [ $? -ne 0 ];then
    echo "$RET"|grep -qi "No such file or directory"
    if [ $? -eq 0 ];then
       # try setting permissions on the log dir and backup dirs - if no r-x for all then 
       # can fail because ssh can't list the files in the dir
       # if issue with clients log dir, set permissions on /sasg/clients dir or subdirs didn't get permissions set properly.
       TRYAGAIN="false"
       echo "$LOGDIR" | grep "sasg/clients"
       if [ "$?" -eq 0 ];then
          # LOGDIR is for shared JH so set permissions in 3 steps 
          #   1 - on /sasg/clients, 2 -on the specific client dir, then recursively on the client dir/logs
          #  dont just set recursively on /sasg/clients or it affects permissions on all Nginx directories.
          CLIENTSDIR="/sasg/clients"
          CLIENTDIR=$(echo "$LOGDIR" | awk -F'/' '{printf("/%s/%s/%s",$2,$3,$4)}')
          CLIENTLOGSDIR="${CLIENTDIR}/logs"
          echo -e "got no such file or directory err on $LOGDIR, trying to set directory permissions on \n  $CLIENTSDIR\n  $CLIENTDIR\n  $CLIENTLOGSDIR\n & will then retry the rsync..."
          ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo chmod 755 ${CLIENTSDIR}"
          if [ "$?" -ne 0 ];then
             echo -e "FAILED to set permissions to 755 on $CLIENTSDIR"
          else
             echo -e "successfully set permissions to 755 on $CLIENTSDIR"
             ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo chmod 755 ${CLIENTDIR}"
             if [ "$?" -ne 0 ];then
                echo -e "FAILED to set permissions to 755 on $CLIENTDIR"
             else
                echo -e "successfully set permissions to 755 on $CLIENTDIR"
                ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo chmod 755 ${CLIENTLOGSDIR}"
                if [ "$?" -ne 0 ];then
                    echo -e "FAILED to set permissions to 755 on $CLIENTLOGDIR"
                else
                    echo -e "successfully set permissions to 755 on $CLIENTDIR"
                    TRYAGAIN="true"
                fi
             fi
          fi

       else
          # not dealing with shared jumphost clients directory - just set permissions on the particular log
          BASEDIR=$(echo "$LOGDIR"|awk -F'/' '{for(i=1;i<NF;i++){printf("%s/",$i)}}')
          echo "got no such file or directory err on $LOGDIR, trying to set directory permissions on $BASEDIR & retrying"
          ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo chmod 755 ${BASEDIR}"
          if [ "$?" -eq 0 ];then
            TRYAGAIN="true"
          else
            echo -e "\nERROR setting directory permissions on $BASEDIR, not retrying rsync..."
            TRYAGAIN="false"
          fi
       fi

       # Now check if TRYAGAIN flag got set to true it means the chmod was successful & we should retry the rsync
       if [ "$TRYAGAIN" == "true" ];then
          echo -e "\nssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} \"sudo chmod -R 755 ${BASEDIR}\" successful ..."
          echo -e "\n--------------------\nrunning: rsync -avz -e \"ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no\" ${USEID}@${IP}:${LOGDIR} ${VYTLOGROOT}/${SVR}/ --rsync-path=\"sudo /usr/bin/rsync\""

        RET=$(rsync -avz -e "ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no" ${USEID}@${IP}:${LOGDIR} ${VYTLOGROOT}/${SVR}/ --rsync-path="sudo /usr/bin/rsync" 2>&1)
        if [ $? -ne 0 ];then
          echo -e "\nERROR running: rsync -avz -e \"ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no\" ${USEID}@${IP}:${LOGDIR} ${VYTLOGROOT}/${SVR}/ --rsync-path="sudo /usr/bin/rsync""
          echo -e "\nRSYNC OUTPUT=$RET\n"
        else
          echo -e "\nSUCCESS running: rsync -avz -e \"ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no\" ${USEID}@${IP}:${LOGDIR} ${VYTLOGROOT}/${SVR}/ --rsync-path="sudo /usr/bin/rsync""
        fi

       fi
    else
      # failed on some other err other than no such file or directory - just log err
      echo -e "\nERROR running: rsync -avz -e \"ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no\" ${USEID}@${IP}:${LOGDIR} ${VYTLOGROOT}/${SVR}/ --rsync-path="sudo /usr/bin/rsync""
      echo -e "\nRSYNC OUTPUT=$RET\n"
    fi
  else
    echo -e "\nSUCCESS running: rsync -avz -e \"ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no\" ${USEID}@${IP}:${LOGDIR} ${VYTLOGROOT}/${SVR}/ --rsync-path="sudo /usr/bin/rsync""
  fi
  # remove logs older than log retention time specified for this server
  echo -e "\n Removing all logs with mtime > $RETENTION days:\n"
  find ${VYTLOGROOT}/${SVR}/ -type f -name "*.gz" -mtime +${RETENTION} -exec rm -f {} \;

return

} # DoRsync(){

CheckNewJHList(){
  if [ -f "${SERVERLIST}.new" ];then
    echo -e "${SERVERLIST}.new already exists."
  else
    if [ ! -f "${SERVERLIST}.${DATE}" ];then
      echo -e "backing up $SERVERLIST as ${SERVERLIST}.${DATE}"
      cp -p $SERVERLIST ${SERVERLIST}.${DATE}
    fi
    cat >${SERVERLIST}.new <<EOL
# Simple list of all SASG servers to pull firewall/vpn logs from 
#
# Port_Num IP ServerName Jumphost_Type
#
#  Port_Num = ssh port 
#  ServerName = jumphost short hostname - used for directory name under logrepo where files are synced
#  Jumphost_Type = determined automatically by logpuller.  If /sasg/clients exists its a sharedJH
#
#  Blank lines & lines starting with #  are ignored.
############################################################
EOL
    egrep -v "^$|^#" $SERVERLIST >> ${SERVERLIST}.new
    echo -e "created ${SERVERLIST}.new for writing updated JH information"
  fi
}


# parse list of jumphost servers and determine hostname of jumphost, type of jumphost and what rsync should be run

#cat $SERVERLIST|egrep -v "^$|^#" |awk '{printf("%s %s %s %s\n",$1,$2,$3,$4)}'|while read PORT IP SVR JHTYPE
IPLIST=$(egrep -v "^$|^#" $SERVERLIST | awk '{printf("%s ",$2)}')
for IP in $IPLIST
do
  PORT=$(grep -w "$IP" $SERVERLIST |awk '{print $1}')
#  IP=$(grep -w "$IP" $SERVERLIST |awk '{print $2}')
  SVR=$(grep -w "$IP" $SERVERLIST |awk '{print $3}')
  JHTYPE=$(grep -w "$IP" $SERVERLIST |awk '{print $4}')
  # check if we have the short hostname for the jumphost
  echo "$SVR" | grep -q -E -o "([0-9]{1,3}[.]){3}[0-9]{1,3}"
  if [ "$?" -eq 0 ];then
     echo "No existing short hostname for $IP...trying to get from server..."
     # have ip for server name not actual hostname - try to run ssh & get the short hostname
     SHOSTNAME=$(ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "hostname -s")
     if [ "$?" -ne 0 ];then
        # failed to get hostname, dont try to get jhtype, dont update svrlist, dont rsync
        echo -e "\n  Failed to get short hostname for server $IP..."
        DO_RSYNC="NO"
     else
        # successfully got hostname, try to get jumphost type
        echo -e "\n  Got short hostname $SHOSTNAME for server $IP\n    getting directory list under /sasg to determine jumphost type..."
        #SASGDIRS=$(ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo ls -d /sasg/*")
        SASGDIRS=$(ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo ls -l /sasg/clients/|grep ^d |awk '{print \$NF}'")
        if [ "$?" -ne 0 ];then
           # failed to get directories under /sasg, dont do rsync or update serverlist
           echo -e "\n       Failed to get list of directories under /sasg."
           DO_RSYNC="NO"
        else
           # got list of directories, now check for /sasg/clients directory - if found, set to shared jumphost
           echo "$SASGDIRS" | grep -w "sasg/clients"
           if [ "$?" -eq 0 ];then
             echo -e "     jumphost type - sharedJH"
             JHTYPE="sharedJH"
           else
             echo -e "     jumphost type - normalJH"
             JHTYPE="normalJH"
           fi
           # Got the hostname and jumphost types & they were not set previously so now update the sasg_serverlist
           echo -e "\nupdating jumphost configuration list with hostname <$SHOSTNAME>, ip <$IP>, jh type <$JHTYPE> ..."
#           DATE=`date +"%F_%T"`
#           cp -p $SERVERLIST ${SERVERLIST}.${DATE}
           CheckNewJHList
           sed -i.bak "s/${IP}$/${SHOSTNAME} ${JHTYPE}/g" ${SERVERLIST}.new
           if [ "$?" -ne 0 ];then
              echo "Failed to update ${SERVERLIST}.new."
              exit 1
           fi
           SVR=$SHOSTNAME
           DO_RSYNC="YES"
        fi # if [ "$?" -ne 0 ];then
     fi # if [ "$?" -ne 0 ];then
  else
     # Already have jumphost short hostname, double check we have server type
     if [ -z "$JHTYPE" ];then
        # if we get here, we have the server short hostname already, ie existing config but dont have the JH type
        echo -e "\n$SERVERLIST contained hostname $SHOSTNAME for server $IP but not JH type... now checking jumphost type ..."
        # SASGDIRS=$(ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo ls -d /sasg/*")
        SASGDIRS=$(ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo ls -l /sasg/|grep ^d |awk '{print \$NF}'")
        if [ "$?" -ne 0 ];then
           # failed to get directories under /sasg, dont do rsync or update serverlist
           echo -e "\n  Failed to get list of directories under /sasg to determine jumphost type."
           DO_RSYNC="NO"
        else
           # got list of directories, now check for /sasg/clients directory - if found, set to shared jumphost
           echo "$SASGDIRS" | grep -w "sasg/clients"
           if [ "$?" -eq 0 ];then
             echo -e "   jumphost type - sharedJH"
             JHTYPE="sharedJH"
           else
             echo -e "   jumphost type - normalJH"
             JHTYPE="normalJH"
           fi
           # Got the hostname and jumphost types & they were not set previously so now update the sasg_serverlist
           echo -e "\n$SERVERLIST contained short hostname of $SVR for server ip $IP and successfully retrieved JH type <$JHTYPE>, now updating serverlist.\n"
           CheckNewJHList
           sed -i.bak "s/${SVR}$/${SVR} ${JHTYPE}/g" ${SERVERLIST}.new
           if [ "$?" -ne 0 ];then
              echo "Failed to update ${SERVERLIST}.new."
              exit 1
           fi
           DO_RSYNC="YES"
        fi # if [ "$?" -ne 0 ];then
     else
        # if we get here, means the JH type and short hostname were already set from a previous run so just set DO_RSYNC flag to yes
        echo -e "\n$SERVERLIST already contained hostname $SHOSTNAME for server $IP and JH type $JHTYPE  ..."
        DO_RSYNC="YES"
     fi # if [ -z "$JHTYPE" ];then
        
  fi # if [ "$?" -eq 0 ];then


  # once we get here, DO_RSYNC will either be set to yes or no depending on if we have all the info we need
  # One final check - can we ping the server - if not then set DO_RSYNC="no"
  if [ "$DO_RSYNC" == "YES" ];then
    #echo -e "pinging $IP to validate connectivity before running rsyncs..."
    echo -e "Checking ssh connectivity to $IP to before running rsyncs..."
#    ping -c 1 $IP
    SHOSTNAME=$(ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "hostname -s")
     if [ "$?" -ne 0 ];then
      echo -e "\nping -c 1 $IP failed. Not attemping rsync for this host."
      DO_RSYNC="NO"
    else
       # Have the hostname, jumphost type and can ping the jumphost ip so run appropriate rsync commands depending on 
       # the jumphost type
       if [ "$JHTYPE" == "normalJH" ];then
          echo -e "\nRunning rsyncs for $IP $SVR $JHTYPE:"
           echo -e "\n=========================================================================="
          DoRsync "$IPTAB_LOG_REPO" "/sasg/backup/*Validate*" 2>&1
          
          DoRsync "$IPTAB_LOG_REPO" "/etc/sysconfig/iptables" 2>&1

          DoRsync "$IPTAB_LOG_REPO" "/etc/sysconfig/ipset" 2>&1

          DoRsync "$FW_LOG_REPO" "/sasg/logs/Firewall/sas*.gz" 2>&1

          DoRsync "$VPN_LOG_REPO" "/sasg/logs/VPN/sas*.gz" 2>&1

          DoRsync "$MRTG_LOG_REPO" "/sasg/MRTG/stats/" 2>&1
       else
          # for shared JH, need to pull fw & vpn logs for each client so first need to get list of client directories
        # SASGCLIENTS=$(ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo ls -d /sasg/clients/*")
        SASGCLIENTS=$(ssh -p ${PORT} -o ConnectTimeout=5 -o BatchMode=yes -o StrictHostKeyChecking=no ${USEID}@${IP} "sudo ls -l /sasg/clients/|grep ^d |awk '{print \$NF}'")
        if [ "$?" -ne 0  -o -z "$SASGCLIENTS" ];then
           echo -e "\nFailed to get list of directories in /sasg/clients on server $SVR  $IP -unable to run rsync.\n"
        else
           echo -e "\n=========================================================================="
           echo -e "\nRunning rsyncs for $IP $SVR $JHTYPE:"
           for CLNAME in $SASGCLIENTS
           do
              CL=$(basename $CLNAME)
              echo -e "\n  Client dir: ${CL}:"
              echo -e "\n  --------------------------"
              DoRsync "$FW_LOG_REPO" "/sasg/clients/${CL}/logs/Firewall/sas*.gz" "$CL" 2>&1
              DoRsync "$VPN_LOG_REPO" "/sasg/clients/${CL}/logs/VPN/sas*.gz" "$CL" 2>&1
           done
        fi

       fi # if [ "$JHTYPE" == "normalJH" ];then

    fi
  fi
done # big while loop going thru each jumphost in sasg_serverlist

if [ -f "${SERVERLIST}.new" ];then
  echo -e "Updating ${SERVERLIST} ..."
  mv ${SERVERLIST}.new ${SERVERLIST}
  if [ "$?" -ne 0 ];then
    echo -e "Failed Updating ${SERVERLIST} ..."
  else
    echo -e "Successfully Updated ${SERVERLIST} ..."
  fi
fi
# clean up .bak file created by sed
[[ -f "${SERVERLIST}.new.bak" ]]  && rm -f ${SERVERLIST}.new.bak
