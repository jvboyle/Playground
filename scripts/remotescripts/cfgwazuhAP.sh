#!/bin/bash
# Install Wazuh agent for North America servers
# ===============================================================================================
SHNAME=`hostname -s`
THIS=$(/usr/sbin/ip addr |grep -n2 "inet 10." |grep "inet 10."|awk '{print $3}'|cut -f1 -d'/')

AP="10.118.186.137"
EU="10.175.10.79"
NA="10.148.11.166"
GEO_MGMT="$AP"


WAZUH_PKG=$(rpm -qa|grep "wazuh-agent")
if [ ! -z "$WAZUH_PKG" ];then
  WAZUH_MGR_ADDRESS=$(cat /var/ossec/etc/ossec.conf|grep "<address>")
  echo -e "\nSUCCESS,$SHNAME,$THIS,rpm_already_installed: $WAZUH_PKG, $WAZUH_MGR_ADDRESS"
  exit 0
fi
  
# Install Repo
cat > /etc/yum.repos.d/wazuh.repo <<\EOF
[wazuh_repo]
gpgcheck=1
gpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH
enabled=1
name=Wazuh repository
baseurl=https://packages.wazuh.com/3.x/yum/
protect=1
EOF

rpm --import https://packages.wazuh.com/key/GPG-KEY-WAZUH

#yum install -y wazuh-agent-3.7.0-1 net-tools
yum install -y wazuh-agent net-tools

# change ossec id gecos
sudo usermod -c "744/S/*SLAPS1/IBM/SLA Project GTS Labs Service ID" ossec

#update config
# Sed to MANAGER_IP
sed -i.bak "s/MANAGER_IP/$GEO_MGMT/g" /var/ossec/etc/ossec.conf

######## Register #########
# Server Agent running
# /var/ossec/bin/ossec-authd -p 1515

#Node
/var/ossec/bin/agent-auth -m "$GEO_MGMT" -p 1515

/var/ossec/bin/ossec-control start  

WAZUH_PKG=$(rpm -qa|grep "wazuh-agent")
if [ ! -z "$WAZUH_PKG" ];then
  WAZUH_MGR_ADDRESS=$(cat /var/ossec/etc/ossec.conf|grep "<address>")
  WAZUH_PROCESSES=$(ps -ef|grep -v grep|grep "ossec" |awk -F'/' '{printf("%s,",$NF)}')
  echo -e "\nSUCCESS,$SHNAME,$THIS,RPM: $WAZUH_PKG, MgrIP:$WAZUH_MGR_ADDRESS,Processes: $WAZUH_PROCESSES"
else 
  echo -e "\nERROR,$SHNAME,$THIS,wazuh_agent_rpm_not_installed"
fi
