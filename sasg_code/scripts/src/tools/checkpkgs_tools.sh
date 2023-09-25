#!/bin/bash
#
# History:  3/30/18 - Copied from sasg_client install and modifed for CDS Tools servers
#                   - so we can set up sasfw's from base redhat image & not customized SAS SL image.
#
# get directory this script is located in no matter where it's called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd $DIR
source ./vars
#set -x
RHELVERSION=$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release) |cut -b1)
SCRIPTNAME=$0
PROCESSOR=`uname -p`

# vars to set text to red for errors
REDON="tput setaf 1"
REDOFF="tput sgr0"

echo -e "\nChecking installed software packages..."

# disable firewalld
systemctl stop firewalld
systemctl disable firewalld

#-------------------------------------------------------
iptables_pack=`rpm -qa | grep -i ^iptables-services`
IPTABLES="iptables-services"
ipset_pack=`rpm -qa | egrep -i ^ipset-[0-9]|grep "$PROCESSOR"`
IPSET="ipset"
ipset_service_pack=`rpm -qa | egrep -i ^ipset-service-[0-9]`
IPSETSERVICE="ipset-service"
#-------------------------------------------------------
#conntracktools_pack=`rpm -qa | grep -i ^conntrack-tools`
#CONNTRACKTOOLS="conntrack-tools"
#conntracklib_pack=`rpm -qa | grep -i ^libnetfilter_conntrack`
#CONNTRACKLIB="libnetfilter_conntrack"
#-------------------------------------------------------
tcpdump_pack=`rpm -qa | grep -i ^tcpdump`
TCPDUMP="tcpdump"
#-------------------------------------------------------
rsync_pack=`rpm -qa | grep -i "^rsync-"`
RSYNC="rsync"
#-------------------------------------------------------
wget_pack=`rpm -qa | grep -i "^wget-"`
WGET="wget"
#-------------------------------------------------------
nc_pack=`rpm -qa | grep -i ^nmap-ncat-`
NC="nmap-ncat"
#-------------------------------------------------------

YUMOUT="/tmp/yum.out"
if [ -f "$YUMOUT" ];then
  mv $YUMOUT $YUMOUT.prev
fi
PKGFAIL=""

yumit(){
  PKG=$1

  INSTALLorUPDATE="install"   # whether to run yum update or yum install - def: install

  # check if easy-rsa package is v2, if so do an update, not just install
  if [ "$PKG" == "easy-rsa" ];then
    rpm -qa|grep -q "easy-rsa-2"
    if [ "$?" -eq 0 ];then
      INSTALLorUPDATE="update"
    fi
  fi

  echo -e "\nrunning sudo su - root -c \"yum -y ${INSTALLorUPDATE} ${PKG}\"  ..." | tee -a $YUMOUT
  RET=$(sudo su - root -c "yum -y ${INSTALLorUPDATE} ${PKG} 2>&1")
  if [ "$?" -ne 0 ]; then
    echo "$RET" | tee -a $YUMOUT
    echo "$RET"| grep -qi "No package"
    if [ $? -eq 0 ];then
      $REDON
      echo -e "\nYum Error Installing $PKG:\n$RET" |tee -a $YUMOUT
      echo -e "\nError stored in $YUMOUT, please fix manually\n"
      $REDOFF
      PKGFAIL="$PKGFAIL $PKG"
      return 1
    else
      echo "$RET"| grep -i "^Error"|grep -qi "Nothing to do"
      if [ $? -eq 0 ];then
         echo -e "\nNothing to do - package installed."
         return 0
      else
         $REDON
         echo -e "\nYum Error Installing $PKG:\n$RET" |tee -a $YUMOUT
         echo -e "\nError stored in $YUMOUT, please fix manually\n"
         $REDOFF
         PKGFAIL="$PKGFAIL $PKG"
         return 1
      fi
    fi
  else
    echo "$RET" | tee -a $YUMOUT
    echo -e "\nyum returned successfully for: $PKG ...\n"
    return 0
  fi
}

# if ipsec tunnel type, make sure most recent version gets installed - check yum version vs tar ver versus
# currently installed version - same for unbound-libs code.
if [ "$TUNNEL_TYPE" == "ipsec" ];then
  ./checklibreswan.sh
fi

#  if [ ! -z $tunnel_pack ] && [ ! -z $conntracktools_pack ] && [ ! -z $conntracklib_pack ] && [ ! -z $ipset_pack ] && [ ! -z $iptables_pack ] && [ ! -z $easy_pack ] && [ ! -z $nc_pack ] && [ ! -z $tcpdump_pack ] && [ ! -z $ipset_service_pack ] && [ ! -z $rsync_pack ] && [ ! -z $wget_pack ]
if [ ! -z $ipset_pack ] && [ ! -z $iptables_pack ] && [ ! -z $nc_pack ] && [ ! -z $tcpdump_pack ] && [ ! -z $ipset_service_pack ] && [ ! -z $rsync_pack ] && [ ! -z $wget_pack ]
then
  echo -e "\nAll required packages are installed, continuing with installation process.. \n"
  echo -e "\n---------------------------------------------------------------------------\n"
else

   #Checking if Iptables-service package is missing
   if [ -z "$iptables_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nIptables package is missing..."; $REDOFF
      yumit "$IPTABLES"
   fi

   #Checking if ipset package is missing
   if [ -z "$ipset_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nIpset package is missing..."; $REDOFF
      yumit "$IPSET"
   fi

  if [ "X$RHELVERSION" != "X6" ]; then
   #Checking if ipset-service package is missing (if on RH7)
   if [ -z "$ipset_service_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nIpset-service package is missing..."; $REDOFF
      yumit "$IPSETSERVICE"
   fi
  fi

   #Checking if nc package is missing
   if [ -z "$nc_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nNetcat package is missing..."; $REDOFF
      yumit "$NC"
   fi

   #Checking if tcpdump package is missing
   if [ -z "$tcpdump_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nTcpdump package is missing..."; $REDOFF
      yumit "$TCPDUMP"
   fi

   #Checking if rsync package is missing
   if [ -z "$rsync_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nrsync package is missing..."; $REDOFF
      yumit "$RSYNC"
   fi
   #Checking if wget package is missing
   if [ -z "$wget_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nwget package is missing..."; $REDOFF
      yumit "$WGET"
   fi
fi

echo -e "\n---------------------------------------------------------------------------\n"

if [ ! -z "$PKGFAIL" ];then
  $REDON
  PKGFAILCOUNT=`echo $PKGFAIL|awk '{print NF}'`
  if [ $PKGFAILCOUNT -gt 1 ];then
    echo -e "\n$PKGFAILCOUNT Required Packages were not installed:"
  else
    echo -e "\n$PKGFAILCOUNT Required Package was not installed:"
  fi
  $REDOFF
  echo -e "\nYum output from all package installs is stored in: $YUMOUT\n"
  for RPM in $PKGFAIL
  do
    echo -e "  $RPM\n"
  done
  exit 1
else
  echo -e "\nYum output from all package installs is stored in: $YUMOUT"
  echo -e "continuing..."
  echo -e "\n---------------------------------------------------------------------------\n"
  exit 0
fi

