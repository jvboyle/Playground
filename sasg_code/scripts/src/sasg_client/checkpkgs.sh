#!/bin/bash
#
# History:  7/27/17 - updated - allowed to bundle required rpms now.  
#                   - Untar to /tmp & install from there so if issues, admin can have access
#                   - to the rpms on sasg.
#           7/31/17 - Added policycoreutils-python
#           8/08/17 - Updated RH7 ipset libs (new version & new ipset-service package)
#           8/16/17 - fixed missing check for ipset-service package
#           9/08/17 - added rsync - may be required for pulling sasg logs
#           9/19/17 - added wget - may be required for sasg-check-keepalived.sh if proxy in use
#           9/25/17 - had script unnecessarily sourcing in sasg_common.sh - gives false error msg on new installs
#                   - though not a concern as sasg_common.sh wasn't required.
#           2/15/18 - 3.1.07 update - updated RH7 rpms, new libreswan, openvpn, easy-rsa, unbound-libs
#
source ./vars
#set -x
RHELVERSION=$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release) |cut -b1)
SCRIPTNAME=$0
PROCESSOR=`uname -p`

if [ "X$RHELVERSION" == "X6" ]; then
  PKGDIR="/tmp/RH6PKGS"
  RHCODE="./RH6PKGS.tar.gz"
else
  PKGDIR="/tmp/RH7PKGS"
  RHCODE="./RH7PKGS.tar.gz"
fi

# vars to set text to red for errors
REDON="tput setaf 1"
REDOFF="tput sgr0"

# name of reqd sw tarball - expect rpms tar'd -relative path, same dir (./)
if [ ! -f "$RHCODE" ];then
  $REDON
  echo -e "\nWarning - $RHCODE not found, notify your IBM contact.\n"
  $REDOFF
else
  tar -xzf $RHCODE -C /tmp
fi

echo -e "\nChecking installed software packages..."

#-------------------------------------------------------
if [ "$TUNNEL_TYPE" == "ipsec" ];then
  tunnel_pack=`rpm -qa | egrep -i ^libreswan`
  TUNNELPKG="libreswan"
else
  tunnel_pack=`rpm -qa | egrep -i ^openvpn`
  TUNNELPKG="openvpn"
fi
#-------------------------------------------------------
unbound_pack=`rpm -qa | grep -i ^unbound-libs-1.6`  # added version as libreswan 3.23 requires this min ver
UNBOUND="unbound-libs"
#-------------------------------------------------------
#RH6 rpm found at: ftp://fr2.rpmfind.net/linux/centos/6.9/os/i386/Packages/keepalived-1.2.13-5.el6_6.i686.rpm
keepalived_pack=`rpm -qa | egrep -i ^keepalived`
KEEPALIVED="keepalived"
#-------------------------------------------------------
if [ "X$RHELVERSION" == "X6" ]; then
  iptables_pack=`rpm -qa | grep -i ^iptables-[0-9]`
  IPTABLES="iptables"
else
  iptables_pack=`rpm -qa | grep -i ^iptables-services`
  IPTABLES="iptables-services"
fi
ipset_pack=`rpm -qa | egrep -i ^ipset-[0-9]|grep "$PROCESSOR"`
IPSET="ipset"
ipset_service_pack=`rpm -qa | egrep -i ^ipset-service-[0-9]`
IPSETSERVICE="ipset-service"
#-------------------------------------------------------
easy_pack=`rpm -qa | grep -i ^easy-rsa`
EASYRSA="easy-rsa"
#-------------------------------------------------------
tcpdump_pack=`rpm -qa | grep -i ^tcpdump`
TCPDUMP="tcpdump"
#-------------------------------------------------------
policycore_pack=`rpm -qa | grep -i policycoreutils-python`
POLICYCORE="policycoreutils-python"
#-------------------------------------------------------
rsync_pack=`rpm -qa | grep -i "^rsync-"`
RSYNC="rsync"
#-------------------------------------------------------
wget_pack=`rpm -qa | grep -i "^wget-"`
WGET="wget"
#-------------------------------------------------------
nginx_pack=`rpm -qa | grep -i "^nginx-"`
NGINX="nginx"
#-------------------------------------------------------
if [ "X$RHELVERSION" == "X6" ]; then
  nc_pack=`rpm -qa | grep -i ^nc-`
  NC="nc"
else
  nc_pack=`rpm -qa | grep -i ^nmap-ncat-`
  NC="nmap-ncat"
fi

#-------------------------------------------------------

YUMOUT="/tmp/yum.out"
if [ -f "$YUMOUT" ];then
  mv $YUMOUT $YUMOUT.prev
fi
PKGFAIL=""

yumit(){
  PKG=$1

  if [ ! -d "$PKGDIR/$PKG" ];then
    $REDON
    echo -e "\nPackage $PKGDIR/$PKG Directory Not Found." | tee -a $YUMOUT
    $REDOFF
    PKGFAIL="$PKGFAIL $PKG"
    return 1
  else
    echo -e "\nrunning yum -y install ${PKGDIR}/${PKG}/*  ..." | tee -a $YUMOUT
    RET=$(yum -y install ${PKGDIR}/${PKG}/* 2>&1)

  fi

  if [ "$?" -ne 0 ]; then
    echo "$RET" | tee -a $YUMOUT
    echo "$RET"| grep -qi "No package"
    if [ $? -eq 0 ];then
      $REDON
      echo -e "\nYum Error Installing $PKG:\n$RET" |tee -a $YUMOUT
      echo -e "\nError stored in $YUMOUT, please fix manually and re-run $SCRIPTNAME\n"
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
         echo -e "\nError stored in $YUMOUT, please fix manually and re-run $SCRIPTNAME\n"
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


if [ ! -z $tunnel_pack ] && [ ! -z $keepalived_pack ] && [ ! -z $ipset_pack ] && [ ! -z $iptables_pack ] && [ ! -z $easy_pack ] && [ ! -z $nc_pack ] && [ ! -z $tcpdump_pack ] && [ ! -z $ipset_service_pack ] && [ ! -z $rsync_pack ] && [ ! -z $wget_pack ] && [ ! -z $nginx_pack ]
then
  echo -e "\nAll required packages are installed, continuing with installation process.. \n"
  echo -e "\n---------------------------------------------------------------------------\n"
else

   #Checking if OpenVpn package is missing
   if [ -z "$tunnel_pack" ];then
      if [ "$TUNNEL_TYPE" == "ipsec" ];then
        # if ipsec tunnel type, make sure required unbound_libs is installed -not listed as prereq in libreswan
        # but is required or will get a symbol lookup error when starting ipsec service
        if [ -z "$unbound_pack" ];then
           echo -e "\n---------------------------------------------------------------------------\n"
           $REDON;   echo -e "\nRequired $UNBOUND package is missing..."; $REDOFF
           yumit "$UNBOUND"
        fi
      fi
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON;   echo -e "\nRequired $TUNNELPKG package is missing..."; $REDOFF
      yumit "$TUNNELPKG"
   fi

   #Checking if Keepalived package is missing
   if [ -z "$keepalived_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nKeepalived package is missing..."; $REDOFF
      yumit "$KEEPALIVED"
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

   #Checking if Iptables-service package is missing
   if [ -z "$iptables_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nIptables package is missing..."; $REDOFF
      yumit "$IPTABLES"
   fi

   #Checking if Easy-Rsa package is missing
   if [ -z "$easy_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nEasy-Rsa package is missing..."; $REDOFF
        yumit "$EASYRSA"
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

   #Checking if policycoreutils-python package is missing
   if [ -z "$policycore_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\npolicycoreutils-python package is missing..."; $REDOFF
      yumit "$POLICYCORE"
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
   #Checking if nginx package is missing
   if [ -z "$nginx_pack" ];then
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nnginx package is missing..."; $REDOFF
      yumit "$NGINX"
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

