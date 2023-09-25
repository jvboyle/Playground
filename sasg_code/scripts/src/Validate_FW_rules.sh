#!/bin/bash

#########################################################################################
# Description: Script compares the iptables filter rules before and after update 
#              and creates FW_rules_validation_result_<DATE>.csv file ( separator is ";")
#              with 3 columns: new, common, old rules. The "new" column contains rules 
#              that present only in the new iptables file, the "common" - rules that present 
#              in the old and new iptables files, the "old" - rules that present only in the
#              old iptables file.
#              Result file is created in the /sasg/backup directory 
#             
# Author: Svyatlana Dubrouskaya
# Date: 18APR2018
# Usage: ./Validate_FW_rules.sh  
#
# History:
#    2018.18.04 - Original script 
#
#######################################################################

#######################################################################
#Set  up variables
FW_validate_dir=/sasg/backup
DATE=$(date +%Y_%m_%d_%H:%M:%S)
VERSION=$(cat /sasg/bin/VERSION)
HOSTNAME=$(hostname -a)
RESULT_FILE=$FW_validate_dir/FW_rules_validation_result_${DATE}_for_${VERSION}.csv
iptables_new=/tmp/iptables_new
iptables_old=/tmp/iptables_old
filter_rules_new=/tmp/filter_rules_new
filter_rules_old=/tmp/filter_rules_old
#######################################################################

#######################################################################
#Copy new and old iptables config to the temporary files that belong to the sasauto
touch $iptables_new $iptables_old
if [ $# -eq 0 ]; then
   iptables_new_name=/etc/sysconfig/iptables
   iptables_old_name=/sasg/backup/iptables_Validate_${HOSTNAME}_Pre-${VERSION} #getting name the latest iptables backup
   sudo chmod u+r $iptables_old_name
elif [ $# -eq 1 ]; then
   iptables_new_name=/etc/sysconfig/iptables
   iptables_old_name=$1
elif [$# -eq 2 ]; then
   iptables_new_name=$1
   iptables_old_name=$2
fi

sudo cat $iptables_new_name > $iptables_new
sudo cat $iptables_old_name > $iptables_old

if [ $# -eq 0 ]; then
   sudo chmod u-r $iptables_old_name
fi

#######################################################################

#######################################################################
#Take only filter rules from iptables config 
awk '/filter/ {filter="yes"; commit="no"; print start} /COMMIT/ {commit=yes}{ if (filter == "yes" && commit == "no") {print}} ' $iptables_new | sed '/^\s*#/d' | sed 's/-m\s*comment\s*--comment\s*[A-Z]*[0-9]*_[A-Z]*-[0-9]*//' | sed 's/-j\s*LOG.*//' | grep -v "*filter" | grep -v  ":" | sed '/^\s*$/d' > $filter_rules_new
awk '/filter/ {filter="yes"; commit="no"; print start} /COMMIT/ {commit=yes}{ if (filter == "yes" && commit == "no") {print}} ' $iptables_old | sed '/^\s*#/d' | sed 's/-m\s*comment\s*--comment\s*[A-Z]*[0-9]*_[A-Z]*-[0-9]*//' | sed 's/-j\s*LOG.*//' | grep -v "*filter" | grep -v  ":" | sed '/^\s*$/d'> $filter_rules_old
#######################################################################

#######################################################################
#Compare new and old filter rules and create csv result file 
echo "New FW rules are taken from the file $iptables_new_name" > $RESULT_FILE
echo "Old FW rules are taken from the file $iptables_old_name" > $RESULT_FILE
echo "new;common;old" >> $RESULT_FILE
line_length=$(cat $filter_rules_new $filter_rules_old | awk ' { if ( length > x ) { x = length } }END{ print x*2+10 }')
diff -w -y -W $line_length --left-column $filter_rules_new $filter_rules_old | awk ' { if ( /\(/ ) {print ";"$0} else {print $0}}' | sed 's/(/;/' | sed 's/[|><]/;;/' >> $RESULT_FILE
#######################################################################

#######################################################################
#Remove temporary files
rm $iptables_new $iptables_old $filter_rules_new $filter_rules_old
#######################################################################


