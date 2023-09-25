#!/bin/bash
#
# Configure logrotate / rsyslog for iptables logging.
#
# History:  07Jul2017 - Initial script creation
#           08Aug2017 - Added logging for all NICs on sasg
#           15Sep2017 - added permissions/auth set option for sasg logs so automate id can access logs
#           20Sep2017 - added rotate for nginx logs
#           26Sep2017 - fixed issue with sasgfw logrotate being deleted after creation.
#           27Nov2017 - separated out vpn & firewall logs into two logrotate configs, added check for automate group id - 
#                     - if no automate group exists then use users by default for firewall/vpn log ownership so automate id
#                     - can read the zipped logs via rsync
#           11APR2017 - 3.2.1 - set up logrotate to run hourly vs daily, sasg logs rotated hourly.
#           12APR2017 - 3.2.1 - chgs to logging for GDPR - write timestamp, hostname, ip on each log entry
#
#===============================================================
source ./vars
# source in sasg_common.sh from /sasg/bin since we update it just prior to running with correct 
# VPNLOG and IPTABLELOG variables
source /sasg/bin/sasg_common.sh

USEGROUP="automate"
# check if automate group exists
getent group automate
if [ "$?" -ne 0 ];then
  echo -e "WARNING: - no automate group id found, using users for permissions on sasg firewall/vpn logs\n"
  USEGROUP="users"
fi
  
#------------------------------------------------------------------
# create rsyslog config file
#
echo -e "\n--------------------------------------------"
echo -e "configuring rsyslog ..."
if [ -f "$RSYSLOGCONFIG" ];then
  echo -e "\nbacking up existing $RSYSLOGCONFIG"
  mv -f $RSYSLOGCONFIG ${RSYSLOGCONFIG}.prev
fi

### v3.2.01 changes for GDPR compliance

sasfw_shortname_JH_IP=${SASFW_HOST}_${MACHINE_IP}
if [ "X$RHELVERSION" == "X6" ]; then

cat > $RSYSLOGCONFIG <<EOL
\$template SASGFormat,"%timegenerated% ${sasfw_shortname_JH_IP} %syslogtag%%msg:::drop-last-lf%\n"
:msg, startswith, "[SG_" -${IPTABLELOG};SASGFormat
&~
EOL

else

cat > $RSYSLOGCONFIG <<EOL
\$template SASGFormat,"%timegenerated% ${sasfw_shortname_JH_IP} %syslogtag%%msg:::drop-last-lf%\n"
if \$msg startswith "[SG_" then { action (type="omfile" file="${IPTABLELOG}" template="SASGFormat") stop }
EOL

fi

# old version
#cat > $RSYSLOGCONFIG <<EOL
#\$template SASGFormat,"%timegenerated% T3-rh7-jh01_10.186.22.60 %syslogtag%%msg:::drop-last-lf%\n"
#:msg, startswith, "[SG_" -/sasg/logs/Firewall/sasgfw02;SASGFormat
#&~
#EOL

if [ $? -ne 0 ];then
 echo -e "Error writing $RSYSLOGCONFIG"
 exit 1
else
 echo -e "$RSYSLOGCONFIG successfully written:"
 cat $RSYSLOGCONFIG
 echo -e "\nmoving backup of $RSYSLOGCONFIG to /sasg/backup/"
 mv ${RSYSLOGCONFIG}.prev /sasg/backup/
fi

#------------------------------------------------------------------
# disable rate-limiting in rsyslog.conf
#
echo -e "\n--------------------------------------------"
echo -e "disabling rate-limiting in /etc/rsyslog.conf if enabled..."
cp /etc/rsyslog.conf /sasg/backup/
grep -q "^\$SystemLogRateLimitInterval 0" /etc/rsyslog.conf
if [ $? -ne 0 ];then
  echo "\$SystemLogRateLimitInterval 0" >> /etc/rsyslog.conf
fi
grep -q "^\$SystemLogRateLimitBurst 0" /etc/rsyslog.conf
if [ $? -ne 0 ];then
  echo "\$SystemLogRateLimitBurst 0" >> /etc/rsyslog.conf
fi


#------------------------------------------------------------------
# configure logrotate to run hourly
#
echo -e "copying /etc/cron.daily/logrotate to /etc/cron.hourly/logrotate to enable logrotate to run hourly..."

ln -s /etc/cron.daily/logrotate /etc/cron.hourly/logrotate
if [ "$?" -ne 0 ];then
   echo -e "\nERROR - ln -s /etc/cron.daily/logrotate /etc/cron.hourly/logrotate failed."
fi

#------------------------------------------------------------------
# configure logrotate for sasg vpn and firewall logs
#
echo -e "\n--------------------------------------------"
echo -e "Configuring logrotate ...\n"
if [ -f "$LOGROTATE_SASGFW" ];then
  echo -e "\nbacking up existing $LOGROTATE_SASGFW"
  mv -f $LOGROTATE_SASGFW ${LOGROTATE_SASGFW}.prev
fi
cat > $LOGROTATE_SASGFW <<EOL
$IPTABLELOG
{
    size 0
    dateext
    dateformat -%Y%m%d-%s
    rotate 10
    compress
    sharedscripts
    create 650 root $USEGROUP
    postrotate
        /bin/kill -HUP \`cat /var/run/syslogd.pid 2> /dev/null\` 2> /dev/null || true
    endscript
}
EOL
if [ $? -ne 0 ];then
 echo -e "\nError writing $LOGROTATE_SASGFW"
 exit 1
else
 echo -e "\n$LOGROTATE_SASGFW successfully written:"
 cat $LOGROTATE_SASGFW
 echo -e "\nmoving backup of $LOGROTATE_SASGFW to /sasg/backup/"
 mv ${LOGROTATE_SASGFW}.prev /sasg/backup/
fi

if [ -f "$LOGROTATE_SASGVPN" ];then
  echo -e "\nbacking up existing $LOGROTATE_SASGVPN"
  mv -f $LOGROTATE_SASGVPN ${LOGROTATE_SASGVPN}.prev
fi
cat > $LOGROTATE_SASGVPN <<EOL
$VPNLOG
{
    size 0
    dateext
    dateformat -%Y%m%d-%s
    rotate 10
    compress
    sharedscripts
    create 650 root $USEGROUP
    postrotate
        /bin/kill -HUP \`cat /var/run/syslogd.pid 2> /dev/null\` 2> /dev/null || true
    endscript
}
EOL
if [ $? -ne 0 ];then
 echo -e "\nError writing $LOGROTATE_SASGVPN"
 exit 1
else
 echo -e "\n$LOGROTATE_SASGVPN successfully written:"
 cat $LOGROTATE_SASGVPN
 echo -e "\nmoving backup of $LOGROTATE_SASGVPN to /sasg/backup/"
 mv ${LOGROTATE_SASGVPN}.prev /sasg/backup/
fi

#------------------------------------------------------------------
# configure logrotate for auth logs, mail logs, etc
#
if [ -f "$LOGROTATECONFIG" ];then
  echo -e "\nbacking up existing $LOGROTATECONFIG"
  mv -f $LOGROTATECONFIG ${LOGROTATECONFIG}.prev
fi
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
 echo -e "\nError writing $LOGROTATECONFIG"
 exit 1
else
 echo -e "\n$LOGROTATECONFIG successfully written:"
 cat $LOGROTATECONFIG
 echo -e "\nmoving backup of $LOGROTATECONFIG to /sasg/backup/"
 mv ${LOGROTATECONFIG}.prev /sasg/backup/
fi

#------------------------------------------------------------------
# configure logrotate for NGINX
#
if [ -f "$LOGROTATE_NGINX" ];then
  echo -e "\nbacking up existing $LOGROTATE_NGINX"
  mv -f $LOGROTATE_NGINX ${LOGROTATE_NGINX}.prev
fi

cat > $LOGROTATE_NGINX <<EOL
/sasg/logs/Nginx/*.log
{
    daily
    missingok
    rotate 10
    compress
    delaycompress
    notifempty
    create 640 nginx adm
    sharedscripts
    postrotate
       if [ -f /var/run/nginx.pid ]; then
          kill -USR1 \`cat /var/run/nginx.pid\` 2> /dev/null || true
       fi
    endscript
}
EOL
if [ $? -ne 0 ];then
 echo -e "\nError writing $LOGROTATE_NGINX"
 exit 1
else
 echo -e "\n$LOGROTATE_NGINX successfully written:"
 cat $LOGROTATE_NGINX
 echo -e "\nmoving backup of $LOGROTATE_NGINX to /sasg/backup/"
 mv ${LOGROTATE_NGINX}.prev /sasg/backup/
fi

#------------------------------------------------------------------
# Restart rsyslog
#
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

#------------------------------------------------------------------
