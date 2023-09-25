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
#           9/18/18 - remove all packages install except nginx (model 5 support)
source ./vars
#set -x
RHELVERSION=$(rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release) |cut -b1)
SCRIPTNAME=$0
PROCESSOR=`uname -p`

if [ "X$RHELVERSION" == "X6" ]; then
  PKGDIR="/tmp/RH6NGINX"
  RHCODE="./RH6NGINX.tar.gz"
else
  PKGDIR="/tmp/RH7NGINX"
  RHCODE="./RH7NGINX.tar.gz"
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

echo -e "\nChecking if Nginx package is installed ..."
#-------------------------------------------------------
nginx_pack=`rpm -qa | grep -i "^nginx-"`
NGINX="nginx"
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


if [ ! -z $nginx_pack ]; then
   echo -e "\nNginx package is installed, continuing with installation process.. \n"
   echo -e "\n---------------------------------------------------------------------------\n"
   exit 0
else
      echo -e "\n---------------------------------------------------------------------------\n"
      $REDON; echo -e "\nnginx package is missing..."; $REDOFF
      yumit "$NGINX"
      RC=$?
      echo -e "\nYum output from package install is stored in: $YUMOUT\n"
      exit $RC
fi


