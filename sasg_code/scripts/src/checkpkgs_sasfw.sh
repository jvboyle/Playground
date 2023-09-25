#!/bin/bash
#
# History:  3/30/18 - Copied from sasg_client install and modifed for SASFW use.
#                   - so we can set up sasfw's from base redhat image & not customized SAS SL image.
#           4/03/18 - put check/install for wget first since we need this to pull down epel repo
#           4/03/18 - changed TUNNEL_TYPE check -added check for IAM variable -install libreswan if either is set
#           4/04/18 - fixed so epel-release gets installed no matter which tunnel type is used
#                     as we need epel for easy-rsa for tls tunnels, libreswan for ipsec.
#           4/05/18 - fixed grep check for installed epel-release
#           4/23/18 - v3.2.02 fixed check for epel-release - always download latest, then check if a version is
#                     already installed.  If so, del installed version & install newest otherwise may point to
#                     old repo & not get latest openvpn/easy-rsa, etc.
#           7/13/18 - v3.3 - added timeout options on wget of epel package to avoid long install delays
#
# get directory this script is located in no matter where it's called from
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)"
cd $DIR
source ./vars
source ./sasg_common.sh
#set -x
RHELVERSION=$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release) |cut -b1)
SCRIPTNAME=$0
PROCESSOR=`uname -p`

# vars to set text to red for errors
REDON="tput setaf 1"
REDOFF="tput sgr0"

echo -e "\nChecking installed software packages..."

#-------------------------------------------------------
wget_pack=`rpm -qa | grep -i "^wget-"`
WGET="wget"
if [ -z "$wget_pack" ];then
  echo -e "\nwget not found, installing...."
  RET=$(sudo su - root -c "yum -y install wget 2>&1")
  if [ "$?" -ne 0 ];then
     $REDON
     echo -e "\nYum Error Installing wget:\n$RET" |tee -a $YUMOUT
     echo -e "\nError stored in $YUMOUT, please fix manually - required for getting latest epel repo\n"
     $REDOFF
     exit 1
  fi
fi

# need epel-release whether openvpn or ipsec tunnel types
# if openvpn, need epel to get latest easy-rsa code
# if ipsec, need epel for libreswan/unbound-libs
# v3.2.02 - updated to always download latest epel-release rpm & then remove existing version if already
# installed (yum update doesn't work on epel-release package), then install new package downloaded.
# this ensures we always get the latest easy-rsa / openvpn, etc packages.
   echo -e "\nRunning wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm and installing epel repo ..."
   wget --timeout=2 --connect-timeout=2 --tries=1 https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
   if [ "$?" -eq 0 ];then
      rpm -qa | grep -q "epel-release"
      if [ "$?" -eq 0 ];then
         # if already installed, remove current package & update with latest one just downloaded.
         echo -e "\nversion of epel-release installed...removing and updating...."
         RET=$(sudo su - root -c "yum -y erase epel-release" 2>&1 | tee -a $YUMOUT)
         if [ "$?" -ne 0 ];then
            $REDON
            echo -e "\nYum Error removing existing epel-release package so it can be updated:\n$RET" |tee -a $YUMOUT
            echo -e "\nError stored in $YUMOUT, please fix manually\n"
            $REDOFF
            exit 1
         else
            echo -e "\nSuccessfully removed existing epel-release package ... "
            rpm -qa|grep epel
         fi
      fi
      # Now try to install the new package. 
      # if no epel-release package currently installed, run yum install to install latest pkg downloaded
      echo -e "\nInstalling new epel-release package ... "
      RET=$(sudo su - root -c "yum -y install \"${DIR}/epel-release-latest-7.noarch.rpm\" 2>&1 | tee -a $YUMOUT")
      if [ "$?" -ne 0 ];then
         $REDON
         echo -e "\nYum Error Installing epel-release-latest-7.noarch.rpm:\n$RET" |tee -a $YUMOUT
         echo -e "\nError stored in $YUMOUT, please fix manually - required for easy-rsa and openvpn\n"
         $REDOFF
         exit 1
      else
         echo -e "\nYum Error Installing epel-release-latest-7.noarch.rpm:\n$RET" |tee -a $YUMOUT
         echo "$RET" | tee -a $YUMOUT
         echo -e "\nyum returned successfully for epel-release-latest-7.noarch.rpm:\n$RET"
      fi
    else
      echo -e "\nwget https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm failed - epel repo required for openvpn & easy-rsa." |tee -a $YUMOUT
      #check if epel repsitory is already installed
      epel_package=$(rpm -qa|grep epel)
     if [ -z "${epel_package}" ]; then
        exit 1  
      else
         echo -e "\n Proceeding with current epel package: ${epel_package}. Please check versions of all packages and install manually the latest versions if required"
      fi
      
   fi

#-------------------------------------------------------
# disable firewalld
sudo su - root -c "systemctl stop firewalld"
sudo su - root -c "systemctl disable firewalld"

#-------------------------------------------------------
# if ipsec tunnel type, make sure most recent version gets installed - check yum version vs tar ver versus
# currently installed version - same for unbound-libs code.
if [[ "$TUNNEL_TYPE" == "ipsec" || "$IAMaaS" == "YES" || "${DVPN^^}" == "YES" ]]; then
  ./checklibreswan.sh
fi

#-------------------------------------------------------
tunnel_pack="installed"
if [[ "$TUNNEL_TYPE" == "ipsec" || "${DVPN^^}" == "YES" || "$IAMaaS" == "YES" ]];then
  if [ ! "$(rpm -qa | egrep -i ^libreswan)" ]; then 
     tunnel_pack=""
     TUNNELPKG="libreswan"
  fi   
fi
if [[ "$TUNNEL_TYPE" != "ipsec" ]];then 
  if [ ! "$(rpm -qa | egrep -i ^openvpn)" ]; then
     tunnel_pack=""
     TUNNELPKG="openvpn "${TUNNELPKG}
     echo $TUNNELPKG
  fi  
fi

#-------------------------------------------------------
unbound_pack=`rpm -qa | grep -i ^unbound-libs-1.6`  # added version as libreswan 3.23 requires this min ver
UNBOUND="unbound-libs"
#-------------------------------------------------------
iptables_pack=`rpm -qa | grep -i ^iptables-services`
IPTABLES="iptables-services"
ipset_pack=`rpm -qa | egrep -i ^ipset-[0-9]|grep "$PROCESSOR"`
IPSET="ipset"
ipset_service_pack=`rpm -qa | egrep -i ^ipset-service-[0-9]`
IPSETSERVICE="ipset-service"
#-------------------------------------------------------
easy_pack=`rpm -qa | grep -i ^easy-rsa`
EASYRSA="easy-rsa"
#-------------------------------------------------------
conntracktools_pack=`rpm -qa | grep -i ^conntrack-tools`
CONNTRACKTOOLS="conntrack-tools"
conntracklib_pack=`rpm -qa | grep -i ^libnetfilter_conntrack`
CONNTRACKLIB="libnetfilter_conntrack"
#-------------------------------------------------------
vimcommon_pack=`rpm -qa | grep -i ^vim-common`
VIMCOMMON="vim-common"
#-------------------------------------------------------
tcpdump_pack=`rpm -qa | grep -i ^tcpdump`
TCPDUMP="tcpdump"
#-------------------------------------------------------
rsync_pack=`rpm -qa | grep -i "^rsync-"`
RSYNC="rsync"
#-------------------------------------------------------
nc_pack=`rpm -qa | grep -i ^nmap-ncat-`
NC="nmap-ncat"
#-------------------------------------------------------
pv_pack=`rpm -qa | grep -i ^pv-`
PV="pv"
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

# if not ipsec tunnel, update/install easy-rsa package
if [[ "$TUNNEL_TYPE" != "ipsec" ]];then
yumit "$EASYRSA"
fi

if [ ! -z "$tunnel_pack" ] && [ ! -z $conntracktools_pack ] && [ ! -z $conntracklib_pack ] && [ ! -z $ipset_pack ] && [ ! -z $iptables_pack ] && [ ! -z $nc_pack ] && [ ! -z $tcpdump_pack ] && [ ! -z $ipset_service_pack ] && [ ! -z $rsync_pack ] && [ ! -z $vimcommon_pack ] && [ ! -z $pv_pack ]
then
  echo -e "\nAll required packages are installed, continuing with installation process.. \n"
  echo -e "\n---------------------------------------------------------------------------\n"
else

   #Checking if OpenVpn package is missing
   if [ -z "$tunnel_pack" ];then
      for pack in ${TUNNELPKG}
      do
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON;   echo -e "\nRequired $pack package is missing..."; $REDOFF
      yumit "$pack"
      done
   fi

   
   #Checking conntrack-tools package
   if [ -z "$conntracktools_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nconntrack-tools package is missing..."; $REDOFF
      yumit "$CONNTRACKTOOLS"
   fi

   #Checking conntrack-tools package
   if [ -z "$conntracklib_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nlibnetfilter_conntrack package is missing..."; $REDOFF
      yumit "$CONNTRACKLIB"
   fi

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

   #Checking if vim package is missing - required for xxd command used in ipsec PSK generation
   if [ -z "$vimcommon_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nvim-common package is missing..."; $REDOFF
      yumit "$VIMCOMMON"
   fi

   #Checking if pv package is missing
   if [ -z "$pv_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\npv package is missing..."; $REDOFF
      yumit "$PV"
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

