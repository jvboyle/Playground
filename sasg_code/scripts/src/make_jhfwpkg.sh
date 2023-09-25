#!/bin/bash
#
# Create a fwupdate.sh script in /tmp which you can sftp to the EE box which when
# run via the sasauto id on the EE server, will connect to the automate id on the
# SASG and update the iptables / ipset config on the SASG based on the vars file 
# /sasg/configs/client/vars
#
# History:
#   20dec2017 - SBraun - initial script
#-----------------------------------------------------------------------------------

source /sasg/bin/sasg_common.sh
SASG_ID="sla_automation"

if [ ! -f "$SAS_CLIENT_DIR/vars" ];then
  echo -e "Error - no $SAS_CLIENT_DIR/vars file found..exiting."
  exit 1
fi
if [ ! -f "$SAS_CLIENT_DIR/sasg_common.sh" ];then
  echo -e "Error - no $SAS_CLIENT_DIR/sasg_common.sh file found..exiting."
  exit 1
fi
if [ ! -f "$SAS_CLIENT_DIR/sasg_iptables.sh" ];then
  echo -e "Error - no $SAS_CLIENT_DIR/sasg_iptables.sh file found..exiting."
  exit 1
fi
if [ ! -f "$SAS_CLIENT_DIR/sasg_iptables.sh" ];then
  echo -e "Error - no $SAS_CLIENT_DIR/sasg_iptables.sh file found..exiting."
  exit 1
fi

echo "Have you already updated $SAS_CLIENT_TOP/vars with the required changes or"
echo "reconfigured this sasfw with the changes you require using an updated vars file"
echo "in SasGaaS ?"
read RESP
if [[ "$RESP" != "y" ]];then
  echo -e "\nUpdate sasfw via SasGaas or manually update $SAS_CLIENT_DIR/vars with the desired changes then re-run this script.\n"
  exit 1
fi

# cd to the /sasg directory where we keep scripts for configuring sasfw & sasg
# create a new directory to hold just the jumphost updates.   If the directory is
# already there move it to a backup name.
cd $SAS_CLIENT_TOP
if [ -d "jhfwupdate" ];then
   cp -r jhfwupdate jh_fwupdate.prev
   rm -rf ./jhfwupdate
fi
mkdir jhfwupdate
mkdir jhfwupdate/jhfwupdate
# put vars in both the directory where we'll create the install script to run on the EE server
# as well as the subdirectory under that where we put the files that will go into the 
# self-extracting file that gets sftpd to the jumphost: 
# EE self-extracting archive
#   contains jhupdate.sh  & fwupdate.sh self-extracting archive to be sftpd to the JH's

# copy required files to first directory down which is where we build the self- extracting archive that runs on the EE server as sasauto
cp -p $SAS_CLIENT_TOP/vars jhfwupdate
cp -p $SAS_CLIENT_TOP/VERSION jhfwupdate

# copy required files to 2nd directory down which is where we build the self- extracting archive that the script which runs on the EE
# server with sftp to the jumphost and execute remotely in order to update the jh firewall.
cp -p $SAS_CLIENT_TOP/jhfw_main.sh jhfwupdate/jhfwupdate
cp -p $SAS_CLIENT_TOP/vars jhfwupdate/jhfwupdate
cp -p $SAS_CLIENT_DIR/VERSION jhfwupdate/jhfwupdate
cp -p $SAS_CLIENT_DIR/sasg_common.sh jhfwupdate/jhfwupdate
cp -p $SAS_CLIENT_DIR/sasg_iptables.sh jhfwupdate/jhfwupdate

#
# Create script to be run on the EE server when user
cat > jhfwupdate/eejhfw_main.sh <<EOL
#!/bin/bash

source ./vars
FWUPDATE_DIR=\$(pwd)
FWUPDATE_FN=jhfw_update.sh
KEY=/home/sasauto/.ssh/id_rsa
JH_PORT=22
JH_DEFID=automate
echo -e "\nJust press enter to connect as \$JH_DEFID on Jumphosts, otherwise please type id to use (ie: sla_automation) and then press enter:\n"
read RESP
if [ -z "\$RESP" ];then
  JH_ID="\$JH_DEFID"
else
  JH_ID="\$RESP"
fi

for ((INDEX=0; INDEX<\${#SASG_IP_1[@]}; INDEX++))
do
 # loop through each SASG at each site
 # if 2nd sasg is blank, skip
 for ((SASLOOP=1; SASLOOP<3; SASLOOP++))
 do
   declare -A SASGIP
   declare -A SASGVIP
   if [ \$SASLOOP == 1 ];then
       SASGIP=\${SASG_IP_1[\$INDEX]}
   else
       SASGIP=\${SASG_IP_2[\$INDEX]}
   fi

  if [ -z "\${SASGIP}" ];then
    break;
  fi

  chmod 750 \$FWUPDATE_DIR/\$FWUPDATE_FN
  echo -e "\nsftp'ing \$FWUPDATE_DIR/\$FWUPDATE_FN to \$SASGIP ..."
  sftp -i \$KEY -o StrictHostKeyChecking=no -P \$JH_PORT \${JH_ID}@\${SASGIP} <<EOF
   put \$FWUPDATE_DIR/\$FWUPDATE_FN /tmp/\$FWUPDATE_FN
   quit
EOF
  if [ "\$?" -ne 0 ];then
    echo -e "sftp Failed ..."
  else
    echo -e "sftp successfull ..."

    echo -e "\nRunning \$FWUPDATE_FN on host \$SASGIP"

    ssh -i \$KEY -o StrictHostKeyChecking=no -p \$JH_PORT \${JH_ID}@\${SASGIP} "sudo su - root -c /tmp/\$FWUPDATE_FN 2>&1"

    if [ "\$?" -eq 0 ];then
      echo -e "ssh successfull ..."
    else
      echo -e "ssh Failed ..."
    fi
  fi

 done # for ((SASLOOP=1; SASLOOP<3; SASLOOP++))
done # for ((INDEX=0; INDEX<\${#SASG_IP_1[@]}; INDEX++))
EOL


chmod 750 jhfwupdate/eejhfw_main.sh


# now create the self-extracting archives..first sasg bundle:

cd $SAS_CLIENT_TOP/jhfwupdate
$SAS_CLIENT_TOP/bin/makeself.sh "./jhfwupdate" ./jhfw_update.sh "JH FW Update" ./jhfw_main.sh

cd $SAS_CLIENT_TOP
$SAS_CLIENT_TOP/bin/makeself.sh "./jhfwupdate" ./eejhfw_update.sh "JH FW Update - EE Bundle" ./eejhfw_main.sh
