#!/bin/bash
#
# Simple script to be run on SASFW servers to check nginx access.log
# for 404 errors on GETs & if greater than specified threshold, generate alert
# Since run on nginx log on sasfw, gives indicator that someone may be poking
# around since jumphost container has correct file/urls - shouldn't normally 
# generate 404 errors.
#
# History - orig - 19SEP2019 - SBraun
# ===============================================================================================
RUNINTERVAL=300  # Run every 5 min
source /sasg/bin/sasmon/sasmon.common

NGINX_LOG="/var/log/nginx/access.log"  # normal production nginx log directory
ERROR_THRESHOLD=5  # generate alert when 404 error on GETS count is greater or equal to threshold

ALERT_TYPE_LOGNOTFOUND="WARNING"  # type of alert to create if nginx log is not found
ALERT_SUFFIX_LOGNOTFOUND="nginx_access"  # suffix for mist alert file for access log not found

ALERT_TYPE_404="ERROR"  # type of alert to create if 404 errors exceeds threshold
ALERT_SUFFIX_404="nginx_404"  # suffix for mist alert file for 404 errors
#-------------------------------------------------------------------------------

# just exit if no nginx service running (ie shared rcp environments)
NGINX_SERVICE=$(sudo systemctl is-active nginx)
if [ "$NGINX_SERVICE" != "active" ];then
  # no nginx active on the server, just exit
  exit 0
fi

# if nginx log not found create alert and exit
# otherwise clear any existing log not found alerts
ACCESSLOG=$(sudo ls $NGINX_LOG)
if [ -z "$ACCESSLOG" ];then
  LOG "nginx log ${NGINX_LOG} not found, creating alert."
  LOGALERT "$ALERT_TYPE_LOGNOTFOUND" "$ALERT_SUFFIX_LOGNOTFOUND" "nginx log ${NGINX_LOG} not found"
  exit
else
  CLEARALERT "$ALERT_TYPE_LOGNOTFOUND" "$ALERT_SUFFIX_LOGNOTFOUND"
fi

# grep log for any GET & 404 errors
  GETERRCOUNT=$(sudo grep "GET" $NGINX_LOG| grep "404"|grep -v "config.sha256"|wc -l |awk '{printf("%d",$1)}')
  if [ $GETERRCOUNT -eq 0 ];then
    LOG "No GET/404 errors found in $NGINX_LOG."
    CLEARALERT "${ALERT_TYPE_404}" "nginx_404"
  elif [ $GETERRCOUNT -ge $ERROR_THRESHOLD ];then
    LOG "$0: Found $GETERRCOUNT 404s, threshold: $ERROR_THRESHOLD, generating alert.\n"
    LOGALERT "${ALERT_TYPE_404}" "$ALERT_SUFFIX_404" "Found $GETERRCOUNT GET/404 errors in $NGINX_LOG, threshold: $ERROR_THRESHOLD."
  else
    LOG "$0: Found $GETERRCOUNT 404s, threshold: $ERROR_THRESHOLD, no alert generated."
    CLEARALERT "${ALERT_TYPE_404}" "nginx_404"
  fi

