#!/bin/bash

# vars to set text to red for errors
REDON="tput setaf 1"
REDOFF="tput sgr0"

PKGDIR="/tmp/RH7PKGS"
RHCODE="./sasg_client/RH7PKGS.tar.gz"
tar -xzf $RHCODE -C /tmp

# get current installed version of libreswan (if any) as well as version in tar file and yum.
LIBRE_INSTALLED=$(rpm -qa|grep "libreswan-[0-9]")
LIBRE_TAR_V=$(rpm -qip ${PKGDIR}/libreswan/libreswan-*|grep -i "^Version"|awk '{print $NF}')
if [ -z "$LIBRE_INSTALLED" ];then
  LIBRE_INST_V=0
else
  LIBRE_INST_V=$(rpm -qi $LIBRE_INSTALLED |grep -i "^Version"|awk '{print $NF}')
fi
LIBRE_YUM_V=$(sudo yum info libreswan|grep -i "^Version" |awk '{print $NF}')

# get current installed version of unbound-libs (if any) as well as version in tar file and yum.
UNBOUND_INSTALLED=$(rpm -qa|grep "unbound-libs-[0-9]")
UNBOUND_TAR_V=$(rpm -qip ${PKGDIR}/unbound-libs/unbound-libs-*|grep -i "^Version"|awk '{print $NF}')
if [ -z "$UNBOUND_INSTALLED" ];then
  UNBOUND_INST_V=0
else
  UNBOUND_INST_V=$(rpm -qi $UNBOUND_INSTALLED |grep -i "^Version"|awk '{print $NF}')
fi
UNBOUND_YUM_V=$(sudo yum info unbound-libs|grep -i "^Version" |awk '{print $NF}')

echo -e "libreswan_versions:"
echo -e "\ttar:\t$LIBRE_TAR_V"
echo -e "\tinstalled:\t$LIBRE_INST_V"
echo -e "\tyum:\t $LIBRE_YUM_V"

echo -e "\nunbound-libs versions:"
echo -e "\ttar:\t$UNBOUND_TAR_V"
echo -e "\tinstalled:\t$UNBOUND_INST_V"
echo -e "\tyum:\t $UNBOUND_YUM_V"

CHECK2VERSIONS(){
# compare 2 versions, print which is greater first or second
  first="$1"
  second="$2"
awk '{if($1 < $2)
     print "second"
   if($1 == $2)
     print "same"
   if($1 > $2)
     print "first"
}' <<<  "$first $second"
} # CHECK2VERSIONS()

CHECKANDINSTALL(){
    PKG=$1
    YUM_V=$2
    TAR_V=$3
    INST_V=$4
  # check which version of the package is newer - yum version available or one provided in tar file
  # use yum if yum version is newer or same as what's in the tar file
  RET=$(CHECK2VERSIONS "$YUM_V" "$TAR_V")
  if [ "$RET" == "first" -o "$RET" == "same" ];then
    echo -e "$PKG yum version is newer or same as tar file version"
    USEYUM=true
  else
    echo -e "$PKG tar version is newer than yum version"
    USEYUM=false
  fi
  echo -e "\n"

  if [ "$USEYUM" == "true" ];then
    if [ ! -z "$INST_V" ];then
      #package is installed - check installed version against yum version
      RET=$(CHECK2VERSIONS "$YUM_V" "$INST_V")
      if [ "$RET" == "same" -o "$RET" == "second" ];then
         echo -e "$PKG already at current or newer level than what's in yum..."
      elif [ "$RET" == "first" ];then
         echo -e "$PKG version in yum is newer than installed version, calling: yum -y install $PKG  ..."
         RET=$(sudo su - root -c "/usr/bin/yum -y install $PKG 2>&1")
         if [ "$?" -ne 0 ];then
           echo -e "\nERROR: failed to install $PKG - $RET\n"
           exit 1
         else
           echo -e "\nSuccessfully installed $PKG: "
           rpm -qa|grep $PKG
         fi
      fi
    else
      #package is NOT installed - install from yum
       echo -e "$PKG not installed - calling: yum -y install $PKG  ..."
      RET=$(sudo su - root -c "yum -y install $PKG 2>&1")
         if [ "$?" -ne 0 ];then
           echo -e "\nERROR: failed to install $PKG - $RET\n"
           exit 1
         else
           echo -e "\nSuccessfully installed $PKG: "
           rpm -qa|grep $PKG
         fi
    fi
  else
    if [ ! -z "$INST_V" ];then
      #package is installed - check installed version against tar file version
      RET=$(CHECK2VERSIONS "$TAR_V" "$INST_V")
      if [ "$RET" == "same" -o "$RET" == "second" ];then
         echo -e "$PKG already at current or newer level than what's in tar file..."
      elif [ "$RET" == "first" ];then
         echo -e "$PKG version in tar is newer than installed version, installing from tar: yum -y install ${PKGDIR}/${PKG}/*  ..."
         RET=$(sudo su - root -c "yum -y install ${PKGDIR}/$PKG/* 2>&1")
         if [ "$?" -ne 0 ];then
           echo -e "\nERROR: failed to install $PKG - $RET\n"
           exit 1
         else
           echo -e "\nSuccessfully installed $PKG: " 
           rpm -qa|grep $PKG
         fi
      fi
    else
      #package is NOT installed - install from tar
       echo -e "$PKG not installed - installing from tar:  yum -y install ${PKGDIR}/${PKG}/* ..."
       RET=$(sudo su - root -c "yum -y install ${PKGDIR}/$PKG/* 2>&1")
         if [ "$?" -ne 0 ];then
           echo -e "\nERROR: failed to install $PKG - $RET\n"
           exit 1
         else
           echo -e "\nSuccessfully installed $PKG: " 
           rpm -qa|grep $PKG
         fi
    fi
  fi # if [ "$USEYUM" == "true" ....

  echo -e "\n"

} # CHECKANDINSTALL()

CHECKANDINSTALL "libreswan" "$LIBRE_YUM_V" "$LIBRE_TAR_V" "$LIBRE_INST_V"
CHECKANDINSTALL "unbound-libs" "$UNBOUND_YUM_V" "$UNBOUND_TAR_V" "$UNBOUND_INST_V"
