#!/bin/bash
# ####################################################################################################
# SASFW log rotate config script - slightly different from one run on sasg's
# - no nginx, no reading vars file.  Run via sudo from sasg_main.sh
# ####################################################################################################
# Configure logrotate / rsyslog for iptables logging.
#
# History:  07Jul2017 - Initial script creation
#           08Aug2017 - Added logging for all NICs on sasg
#           19Oct2017 - Updated start/stop rsyslog cmds to RH7 systemctl, removed
#                       sourcing in of vars & sasg_common.sh to avoid any conflicts with sasg
#                       as specific file names get added based on which sasg server its running on.
#           08Nov2017 - Updated so firewall/vpn logs get updated with sasauto ownership vs root
#           27Nov2017 - Updated so firewall/vpn logrotate configs are in separate files so if no vpn defined
#                       (ie gsni only or ipcenter tactical config, we still get firewall logs rotated).
#           30Nov2017 - removed ownership chg from syslog logrotate config (/var/log/messages, secure, etc).
#           12Jan2018 - SBraun -3.1.07 - updated sasgfw.conf rsyslog config file - new format in prep for
#                     - turning on forwarding of Firewall log data to MSS as well as writing to local file.
#           17APR2018 - Decision made to not copy firewall logs to separate log dir - let it go to default
#                       messages file.  Commented out SAS custom rsyslog configs.
#
#=========================================================================================================
RSYSLOGDIR="/etc/rsyslog.d"
RSYSLOGCONFIG="$RSYSLOGDIR/sasgfw.conf"
IPTABLELOG="/sasg/logs/Firewall/sasfw"
VPNLOG="/sasg/logs/VPN/sas_*.log"
START_RSYSLOG='systemctl start rsyslog'
STOP_RSYSLOG='systemctl stop rsyslog'
LOGROTATEDIR="/etc/logrotate.d"
LOGROTATECONFIG="$LOGROTATEDIR/syslog"
LOGROTATE_SASGFW="$LOGROTATEDIR/sasgfw"
LOGROTATE_SASGVPN="$LOGROTATEDIR/sasgvpn"
LOGROTATE_CONNTRACK="$LOGROTATEDIR/conntrack"
SASOWNER="sasauto"
MSSIP="10.148.11.176"   # ip of MSS server rsyslog is to forward log data to.

# 3.2.1 change - 17apr2018 - remove any existing rsyslog.d & logrotate.d configs that might
# be there from previous installs
[[ -f "$RSYSLOGCONFIG" ]] && rm -f $RSYSLOGCONFIG
[[ -f "$LOGROTATE_SASGFW" ]] && rm -f $LOGROTATE_SASGFW
[[ -f "$LOGROTATE_SASGVPN" ]] && rm -f $LOGROTATE_SASGVPN


echo -e "\n--------------------------------------------"
echo -e "configuring rsyslog ..."
# write out rsyslog config file

# original rsyslog config:
#cat > $RSYSLOGCONFIG <<EOL
# Log IPTables.
#:msg, startswith, "[SG" -${IPTABLELOG}
#& ~
#EOL

# new rsyslog config:
### cat > $RSYSLOGCONFIG <<EOL
### # Log IPTables.
### if (\$msg startswith '[SG_') then {
###    action(type="omfile" file="/sasg/logs/Firewall/sasfw")
###    action(type="omfwd" Target="$MSSIP" Port="6514")
###    stop
### } 
### 
### EOL

### if [ $? -ne 0 ];then
###  echo -e "Error writing $RSYSLOGCONFIG"
###  exit 1
### else
###  echo -e "$RSYSLOGCONFIG successfully written:"
###  cat $RSYSLOGCONFIG
### fi

echo -e "\n--------------------------------------------"
echo -e "disabling rate-limiting in /etc/rsyslog.conf if enabled..."
grep -q "^\$SystemLogRateLimitInterval 0" /etc/rsyslog.conf
if [ $? -ne 0 ];then
  echo "\$SystemLogRateLimitInterval 0" >> /etc/rsyslog.conf
fi
grep -q "^\$SystemLogRateLimitBurst 0" /etc/rsyslog.conf
if [ $? -ne 0 ];then
  echo "\$SystemLogRateLimitBurst 0" >> /etc/rsyslog.conf
fi

echo -e "\n--------------------------------------------"
echo -e "configuring logrotate ..."
# configure logrotate log for firewall log
cat > $LOGROTATE_SASGFW <<EOL
$IPTABLELOG
{
    daily
    dateext
    rotate 10
    delaycompress
    compress
    sharedscripts
    create 640 $SASOWNER $SASOWNER
    postrotate
        /bin/kill -HUP \`cat /var/run/syslogd.pid 2> /dev/null\` 2> /dev/null || true
    endscript
}
EOL

#create logrotate config for vpn log
cat > $LOGROTATE_SASGVPN <<EOL
$VPNLOG
{
     hourly
     missingok
     dateext
     dateformat %Y_%m_%d_%H
     rotate 10
     size 520M
     maxsize 520M
     copytruncate
     delaycompress
     compress
     sharedscripts
     postrotate
         /bin/kill -HUP \`cat /var/run/syslogd.pid 2> /dev/null\` 2> /dev/null || true
     endscript
}
EOL

#create logrotate config for vpn log
cat > $LOGROTATE_CONNTRACK<<EOL
/var/log/conntrackd-stats.log
{
     monthly
     missingok
     dateext
     dateformat %Y_%m_%d_%H
     rotate 10
     size 520M
     maxsize 520M
     copytruncate
     delaycompress
     compress
     sharedscripts
     postrotate
         /bin/kill -HUP \`cat /var/run/syslogd.pid 2> /dev/null\` 2> /dev/null || true
     endscript
}
EOL
cat > $LOGROTATECONFIG <<EOL
/var/log/cron
/var/log/maillog
/var/log/messages
/var/log/secure
/var/log/spooler
{
    daily
    dateext
    rotate 10
    compress
    sharedscripts
    postrotate
        /bin/kill -HUP \`cat /var/run/syslogd.pid 2> /dev/null\` 2> /dev/null || true
    endscript
}
EOL

if [ $? -ne 0 ];then
 echo -e "Error writing $LOGROTATECONFIG"
 exit 1
else
 echo -e "$LOGROTATECONFIG successfully written:"
 cat $LOGROTATECONFIG
fi

###############################################################################################################
# configure logrotate to run hourly

if [ ! -f /etc/cron.hourly/logrotate ]; then
   echo -e "copying /etc/cron.daily/logrotate to /etc/cron.hourly/logrotate to enable logrotate to run hourly..."
   sudo su - root -c "ln -s /etc/cron.daily/logrotate /etc/cron.hourly/logrotate"
   if [ "$?" -ne 0 ];then
      echo -e "\nERROR - ln -s /etc/cron.daily/logrotate /etc/cron.hourly/logrotate failed."
   fi
fi

#
###############################################################################################################

echo -e "\n--------------------------------------------"
echo -e "restarting rsyslog ..."
$STOP_RSYSLOG

echo "Running $START_RSYSLOG"
RET=$($START_RSYSLOG)
if [ "$?" -ne 0 ];then
  echo -e "Error restarting rsyslog: $RET"
  exit 1
else
  # sleep a sec & then check status of syslog again - make sure it started
  sleep 2
  RET=$($STATUS_RSYSLOG)
  echo "$RET"| egrep -i "stopped | (dead)"
  if [ $? -eq 0 ];then
    echo -e "\nStarting rsyslog again..\n"
    RET=$($START_RSYSLOG)
    if [ $? -ne 0 ];then
      echo -e "Error restarting rsyslog: $RET"
      exit 1
    fi
  fi

  # system says it started rsyslog - check for pid
  RSYSLOGPID=$(ps -ef|grep -v grep|grep "sbin/rsyslogd")
  if [ -z "$RSYSLOGPID" ];then
     echo -e "\nError restarting rsyslog - /sbin/rsyslogd process not found.\n"
     exit 1
  else
     echo -e "rsyslogd restarted, pid: $RSYSLOGPID"
     echo -e "\nlogrotate and rsyslog configured, rsyslog restarted."
     echo -e "\n--------------------------------------------"
     exit 0
  fi
fi

