#!/bin/bash
###########################################################################
# Description: Generate SASG VyOS Configuration Package 
# Author: Jinho Hwang
# Date: 2016.08.21
# History:
#    2016.08.21 - Original script.
#    07SEP2017  - Added generation of automate key - for private key to add to CDS svr & pub key on SASG
#    20SEP2017  - Added check to see if on  dev or master sasgaas - copy appropriate subnet list for routes to add on cds
#    06OCT2017  - Added removal of MRTG_KEY_TMP & AUTOMATE_KEY_TMP dirs/keys for security compliance
#    09SEP2018  - fixed err when in test env, subnet_dev_list not getting copied to subnet_list
#    19NOV2018  - added cleanup to vars when read in - removal of excess spaces
#                 before/after vars & equals signs. Also ssh to each SDS
#                 including sasfw & update appropriate SDS *_IP= var with
#                 server's MAC private network ip & mac address
#                 added in check for tools server build - if dev env detected, set LOCATION=TEST in vars so proper ipset
#                 lists/filter rules get added on test tools servers.
#    03JUN2019  - RCP Shared HA Support: genereting MAC for RCP_PROXY array
# Notes:
#    Make sure 'vars' exists in build
###########################################################################

# VYOS-------

SOURCE_DIR=./src
BUILD_DIR=./build
APP_NAME=sasg_vyos_configure.sh
CUSTOM_GEN=custom_sasg_client_gen.sh
MRTG_KEY_TMP=./src/mrtgkeys
AUTOMATE_KEY_TMP=./src/automatekeys
TESTSASGAAS=/app/TESTSASGAAS

# Generating certs/keys initially and then copy proper files to 
# build directories
chmod +x "./${SOURCE_DIR}/generate-logpush-certs-keys.sh"
"./${SOURCE_DIR}/generate-logpush-certs-keys.sh"

#if [ -z $1 ]; then echo "Usage: $0 <target folder with vars>"; exit -1; fi
TARGET_DIR=$1
[ -z "$TARGET_DIR" ] && TARGET_DIR=./
if [ ! -f "$TARGET_DIR/vars" ]; then echo "FAIL: vars does not exist in $TARGET_DIR. Provide a full path."; exit -1; fi


# get mac addresses for each SDS, update the vars file with each mac before it gets copied to the build dir to be used for sasfw/tools server builds.
GetMacs(){
  VARFILE="$1"
  MACSCRIPT="${TARGET_DIR}/getmac.sh"
  SDSVARS=("BPM_IP" "CHEF_IP" "EE_IP" "RCP_IP" "RCP_BPM_IP" "RCP_ROR_IP" "ASB_IP" "CEBW_IP" "PRIVATE_VYOS_IP" "RCP_PROXY_IP" "CSC_IP")
  PRIV_NIC="eth0" #name of private network interface

  # build simple script to be run via ssh on each SDS - will allow us to exit with an error should there be a connectivity 
  # issue to one of the sds's
cat >$MACSCRIPT << EOF
#!/bin/bash
MAC=\$(sudo /usr/sbin/ip addr show dev $PRIV_NIC |grep -w "link/ether" |awk '{print \$2}'|grep -E -o "([a-zA-Z0-9]{1,2}[:]){5}[a-zA-Z0-9]{1,2}")
echo "\$MAC"
EOF
chmod 750 $MACSCRIPT

   # clean up vars file - remove space(s) before var name, before/after = sign, at end of a line
   cat $VARFILE | while read LINE
   do
     echo "$LINE"|egrep -q "^#|^$"
     if [ "$?" -eq 0 ];then
        echo "$LINE" >>$VARFILE.new
     else
        echo "$LINE"|sed "s/^ \+//g" | sed "s/ \+=/=/g" | sed "s/= \+/=/g" | sed "s/ \+$//g" >>$VARFILE.new
     fi
   done
   mv $VARFILE.new $VARFILE

  # check if file indicating we're in the test environment is there, if so append LOCATION=TEST so we get the right vars
  if [ -f "$TESTSASGAAS" ];then
     cat ${VARFILE}|grep -v "^#" | grep "LOCATION="
     if [ "$?" -ne 0 ];then
       echo -e "LOCATION=TEST" >>${VARFILE}
     fi
  fi

  USEK="/sasg_data/userdata/sasgaas-admin/keys/sasauto"
  SDSVARS+=($(grep "^RCP_PROXY_IP" $VARFILE | awk -F'=' '{print $1}' | sed 's/\[/\\\[/' | sed 's/\]/\\\]/'))
  for SDS in "${SDSVARS[@]}"
  do
    RET= # Reset var between "for" cycles
    VARNAME=$(echo "$SDS"|cut -f1 -d'=')
    # check if this variable name even exists in the vars file, if not go to next in list
    if [ "$(grep "^$VARNAME" $VARFILE)" != "" ];then

      if [[ "${VARNAME}" =~ "RCP_PROXY" ]]; then
         CURIP=$(grep "^$SDS=" $VARFILE |awk -F'=' '{print $2}')
         MAC_REGEXP=$(echo $SDS | sed 's/IP/MAC/')
         RCP_MAC_VAR=$(grep "^$MAC_REGEXP=" $VARFILE |awk -F'=' '{print $1}')
         CURMAC=$(grep "^$MAC_REGEXP=" $VARFILE |awk -F'=' '{print $2}')
         #[ ! -z ${CURIP} ] && CURIPFULLSTRING=${SDS}"="${CURIP}
         #[ ! -z ${CURMAC} ] &&  CURMACFULLSTRING=${MAC_REGEXP}"="${CURMAC}
         CURIPFULLSTRING=$(grep "^$SDS=" $VARFILE | sed 's/\[/\\\[/' | sed 's/\]/\\\]/')
         CURMACFULLSTRING=$(grep "^$MAC_REGEXP=" $VARFILE | sed 's/\[/\\\[/' | sed 's/\]/\\\]/')
      else
        CURIP=$(grep -w "^$SDS" $VARFILE |awk -F'=' '{print $2}')
        VAR_NOIP=$(echo "$SDS"|awk -F'_IP' '{print $1}')
        CURMAC=$(grep -w "^${VAR_NOIP}_MAC" $VARFILE | awk -F'=' '{print $2}')
        CURIPFULLSTRING=$(grep -w "^$SDS" $VARFILE)
        CURMACFULLSTRING=$(grep -w "^${VAR_NOIP}_MAC" $VARFILE)
      fi

      #if current ip for this variable is null then comment out the variable in vars, dont go try to ssh to a null to get the mac
      [[ -z "$CURIP" ]] && sed -i.bak "s/^${SDS}=/#${SDS}/g" $VARFILE && sed -i.bak "s/^${SDS}$/#${SDS}/g" $VARFILE && continue

      # put in query to get mac for this ip
      USEPORT=2222
      RET=$(ssh -i $USEK -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o BatchMode=yes -p $USEPORT sasauto@${CURIP} "bash -s" <${MACSCRIPT})
      SSHERR=$?
      if [ "$SSHERR" -eq 255 ];then
        # ssh failed on 2222, try 22
        USEPORT=22
        RET=$(ssh -i $USEK -o StrictHostKeyChecking=no -o ConnectTimeout=5 -o BatchMode=yes -p $USEPORT sasauto@${CURIP} "bash -s" <${MACSCRIPT})
        SSHERR=$?
        if [ "$SSHERR" -ne 0 ];then
          echo -e "SSH failed for $VARNAME $CURIP with err $SSHERR"
          exit 1
        fi
      fi # if [ "$?" -eq 255 ]

      if [ ! -z "$RET" ];then
         # if we got back a mac address from the host, update the vars file
         if [[ "${VARNAME}" =~ "RCP_PROXY" ]]; then
            NEWVAR="${MAC_REGEXP}=${RET}"
         else
            NEWVAR="${VAR_NOIP}_MAC=${RET}"
         fi
         if [ ! -z "$CURMACFULLSTRING" ];then
            # current mac variable exists in vars, just replace the address
            sed -i.bak "s/${CURMACFULLSTRING}/${NEWVAR}/g" $VARFILE
         else
            # current mac variable doesnt exist in vars, add it just after the current ip variable
            sed -i.bak "s/^${CURIPFULLSTRING}/${CURIPFULLSTRING}\n${NEWVAR}/g" $VARFILE
         fi

      else
         if [ ! -z "$CURMAC" ];then
            echo -e "\nUnable to get current MAC address for ${VARNAME}=${CURIP} but ssh to server succeeded so using current MAC($CURMAC) from vars file.\n"
         else
            echo -e "\nUnable to get MAC address for ${VARNAME}=${CURIP} but ssh to server succeeded.  No mac specified in vars & is required..exiting."
            exit 1
         fi
      fi
    fi # if [ "$?" -eq 0 ];then
  done


} # GetMacs()


# Call GetMacs to pull mac addresses for each sds & update the vars file.  If we fail on one we'll exit out & not even do the build.
# This will prevent problems where one SDS gets missed but it looks like the whole install went fine.
GetMacs ${TARGET_DIR}/vars

if [ -d "$BUILD_DIR" ]; then 
    rm -rf "$BUILD_DIR"
fi
mkdir "$BUILD_DIR"
mkdir "$BUILD_DIR/mrtg_keys"
mkdir "$MRTG_KEY_TMP"
mkdir "$BUILD_DIR/automate_keys"
mkdir "$AUTOMATE_KEY_TMP"


/usr/bin/ssh-keygen -f $BUILD_DIR/mrtg_keys/id_rsa -t rsa -N ""
cp $BUILD_DIR/mrtg_keys/id_* $MRTG_KEY_TMP
/usr/bin/ssh-keygen -f $BUILD_DIR/automate_keys/id_rsa -t rsa -N ""
cp $BUILD_DIR/automate_keys/id_rsa* $AUTOMATE_KEY_TMP


cp ./src/VERSION "$BUILD_DIR"
cp "$TARGET_DIR"/vars "$BUILD_DIR"

cp -a ./bin "$BUILD_DIR"
cp -a "$SOURCE_DIR"/* "$BUILD_DIR"

cp ./ca.key ./ca.crt ./server.key ./server.crt ./client.key ./client.crt "$BUILD_DIR"

./bin/makeself.sh "$BUILD_DIR" "$APP_NAME" "SASG VyOS Installation Script Generation" ./sasg_main.sh
mv "$APP_NAME" "$TARGET_DIR"

# Removed customer_client_gen.sh , not sued anymore 
# CUSTOM PACKAGING-------
#./bin/makeself.sh "$BUILD_DIR" "$CUSTOM_GEN" "SASG VyOS Installation Script Generation" ./custom_client_gen.sh
#mv "$CUSTOM_GEN" "$TARGET_DIR"

rm -rf "$BUILD_DIR"

echo "SUCCESS: $APP_NAME are generated"

# TOOLS-------

TOOLS_DIR=./src/tools
TOOLS_NAME=sasg_tools_configure.sh

mkdir "$BUILD_DIR"

cp ./src/VERSION "$BUILD_DIR"
cp "$TARGET_DIR"/vars "$BUILD_DIR"
cp -a "$TOOLS_DIR"/* "$BUILD_DIR"
mkdir "$BUILD_DIR/mrtg_keys"
mkdir "$BUILD_DIR/automate_keys"
cp $MRTG_KEY_TMP/* $BUILD_DIR/mrtg_keys
cp $AUTOMATE_KEY_TMP/* $BUILD_DIR/automate_keys

# check if we're using master or development git build - if dev, then copy dev subnet list - otherwise use prod list
if [ -f "$TESTSASGAAS" ];then
    # using non-master build so assume on dev environment - copy dev subnet list 
    echo "using dev subnet list for routes to add"
    cp $BUILD_DIR/subnet_dev_list $BUILD_DIR/subnet_list
    cat ${BUILD_DIR}/vars|grep -v "^#" | grep "LOCATION="
    if [ "$?" -ne 0 ];then
      echo -e "LOCATION=TEST" >>${BUILD_DIR}/vars
    fi
fi

cp ./ca.crt ./server.key ./server.crt "$BUILD_DIR"

./bin/makeself.sh "$BUILD_DIR" "$TOOLS_NAME" "SASG Tools Server Installation Script Generation" ./sasg_tools_main.sh

mv "$TOOLS_NAME" "$TARGET_DIR"
rm -rf "$BUILD_DIR"

# clean up for security compliance 
rm -rf "$MRTG_KEY_TMP"
rm -rf "$AUTOMATE_KEY_TMP"
rm $MACSCRIPT

echo "SUCCESS: $TOOLS_NAME is generated"

