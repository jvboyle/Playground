#!/bin/bash
IPSET="/etc/sysconfig/ipset.new"
IPSETCOMMAND=$(which ipset)

#goes through ipset file, check ipset groups and add if not exist
cat ${IPSET} | grep -v "#" | while read line
do
   action=$(echo ${line} | awk '{print $1}')
   group_name=$(echo ${line} | awk '{print $2}')
   case ${action} in
   "create")
           if ! ${IPSETCOMMAND} --list --terse ${group_name} > /dev/null ; then
              ${IPSETCOMMAND} ${line}
            else
              echo "Flushing ipset group ${group_name}"
              ${IPSETCOMMAND} flush ${group_name}
           fi
   ;;
   "add")
        entry=$(echo ${line} | awk '{print $3}')
        if ! ${IPSETCOMMAND} --test ${group_name} ${entry}> /dev/null 2>/dev/null ; then
           echo "Adding entry ${entry} to the ${group_name}"
           ${IPSETCOMMAND} ${line}
        fi
   ;;
   esac
done
