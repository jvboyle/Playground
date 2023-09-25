#!/bin/bash
# ####################################################################################################
# SASFW log rotate config script - slightly different from one run on sasg's
# - no nginx, no reading vars file.  Run via sudo from sasg_main.sh
# ####################################################################################################
# Configure logrotate / rsyslog for iptables logging.
#
# History:  29Mar2018 - Initial script creation - modified version of sasfw syslog script
#           17APR2018 - Decision made to not copy firewall logs to separate log dir - let it go to default
#                       messages file.  Commented out SAS custom rsyslog configs.
#
#=========================================================================================================
RSYSLOGDIR="/etc/rsyslog.d"
RSYSLOGCONFIG="$RSYSLOGDIR/sascds.conf"
IPTABLELOG="/sasg/logs/Firewall/sascds"
START_RSYSLOG='systemctl start rsyslog'
STOP_RSYSLOG='systemctl stop rsyslog'
LOGROTATEDIR="/etc/logrotate.d"
LOGROTATECONFIG="$LOGROTATEDIR/syslog"
LOGROTATE_SASCDS="$LOGROTATEDIR/sascds"
#SASOWNER="sasauto"
MSSIP="10.148.11.176"   # ip of MSS server rsyslog is to forward log data to.


# 3.2.1 change - 17apr2018 - remove any existing rsyslog.d & logrotate.d configs that might
# be there from previous installs
[[ -f "$RSYSLOGCONFIG" ]] && rm -f $RSYSLOGCONFIG
[[ -f "$LOGROTATE_SASCDS" ]] && rm -f $LOGROTATE_SASCDS

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
###    action(type="omfile" file="$IPTABLELOG")
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
### cat > $LOGROTATE_SASCDS <<EOL
### $IPTABLELOG
### {
###     daily
###     dateext
###     rotate 10
###     compress
###     sharedscripts
###     postrotate
###         /bin/kill -HUP \`cat /var/run/syslogd.pid 2> /dev/null\` 2> /dev/null || true
###     endscript
### }
### EOL
### 
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

