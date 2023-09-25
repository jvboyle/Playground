#!/bin/bash
IPTABLES="/etc/sysconfig/iptables.new"
IPTABLESCOMMAND=$(which iptables)
IPSET="/etc/sysconfig/ipset.new"
IPSETCOMMAND=$(which ipset)


#Flushing chains INPUT and DOCKER_USER
chains_list="INPUT DOCKER-USER"
for chain in ${chains_list}
do
  echo "Executing command iptables --flush ${chain}.."
  # Only filter chains are processed this way
  if ! iptables -L | grep "^Chain " | grep -q "${chain}"; then
    echo "No \"${chain}\" chain found"
    continue
  fi
  ${IPTABLESCOMMAND} --flush ${chain}
  if [ $? -eq 0 ]; then
     echo "Chain ${chain} has been flushed."
  else
     echo "Could not flush chain ${chain}. Manual intervention is required."
     exit 1
  fi
done

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
              echo "Destroying ipset group ${group_name}"
              ${IPSETCOMMAND} destroy ${group_name}
              ${IPSETCOMMAND} ${line}
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

#check iptables syntax
if ! iptables-restore --test ${IPTABLES} ; then
   echo "There are syntax errors in the new iptables configuration file ${IPTABLES}.new . Exiting"
   exit 1
fi

#Declaring the refreshing file with iptables rules
iptables_rules_add=iptables_rules_add.sh
rm -f ${iptables_rules_add}

#creating script to add iptables rules
cat ${IPTABLES} | egrep -v -i -e "^#" -e "*filter" -e "^:" -e "COMMIT"  -e "FORWARD" | sed '/^$/d' | awk '{print "echo \"Adding", $0,"\""; print "iptables",$0}' > ${iptables_rules_add}
chmod u+x ${iptables_rules_add}
./${iptables_rules_add}
if [ $? -eq 0 ]; then
   echo "iptables were updated successfully."
   exit 0
else
   exit 1
   echo "Something went wrong during iptables update. Please check and fix manually."
fi
