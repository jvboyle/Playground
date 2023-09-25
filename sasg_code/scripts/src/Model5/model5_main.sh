#!/bin/bash
################################################################################
# Description: Install SASG
# Author: Svyatlana Dubrouskaya
# Date: 2018.09.18
# Config: vars file 
# Main: ./sasg_install.sh
# Standalone Usage: Run each script alone
# History:
#    2018.09.18 - Original script
# Notes:
#Main script to install and configure nginx package for Model 5 
################################################################################

DATE=`date +"%F_%T"`
SASG_LOG=/tmp/sasg_install.log.$DATE

if [ ! -f "vars" ]; then
    echo 'ERROR: Please provide a user configuration file "vars"' | tee -a $SASG_LOG
    exit -1
fi

set -o pipefail

source ./vars
echo "SASG VERSION $VERSION" | tee -a $SASG_LOG

################################################################################
#Install packages (nginx,rsync)
################################################################################

# make sasg dir for logs & executables
if [ ! -d "/sasg/bin" ];then
   mkdir -p /sasg/bin
fi
if [ ! -d "/sasg/logs" ];then
   mkdir -p /sasg/logs
fi

# Copy debug tools to /sasg/bin for easier future debugging with admins
#cp modnginx.sh /sasg/bin/modnginx.sh
#chmod 750 /sasg/bin/modnginx
cp VERSION /sasg/bin/VERSION

# Set permissions on sasg log dirs so automate id can access logs
# Setting permissions on each log dir individually - not granting r_x to every log file - ownership of log files will
# be set by logrotate
chmod 755 /sasg
chmod 755 /sasg/logs

################################################################################
## Configure NGINX
################################################################################
./nginx_configure.sh
if [ "$?" -ne 0 ];then
  echo -e "nginx configuration error\n" | tee -a $SASG_LOG
  exit 1
else
   echo -e "\nnginx is configured successfully!\n" | tee -a $SASG_LOG
fi

############################################################################### 

echo "SUCCESS" | tee -a $SASG_LOG
