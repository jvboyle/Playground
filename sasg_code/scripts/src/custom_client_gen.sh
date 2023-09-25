#!/bin/bash
################################################################################
# Description: Generate Custom Customer Package
# Author: Jinho Hwang
# Date: 2017.01.23
# Main: ./custom_sasg_client_gen.sh
# History:
#    2017.01.23 - Original script.
# Notes:
#    This is the main script to create a client package from custom folder.
################################################################################

SOURCE_DIR_DEFAULT=/config/auth/client
echo -n "Enter your client folder [$SOURCE_DIR_DEFAULT]: "
read SOURCE_DIR
if [ -z "$SOURCE_DIR" ]; then
    SOURCE_DIR=$SOURCE_DIR_DEFAULT
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "$SOURCE_DIR does not exist!"
    exit -1
fi

SASG_INSTALL_FILE=sasg_install.sh

cp ./VERSION $SOURCE_DIR
cp -a ./sasg_client/* $SOURCE_DIR
./bin/makeself.sh "$SOURCE_DIR" "$SASG_INSTALL_FILE" "SASG Installation Script Generation" ./sasg_main.sh

cp $SASG_INSTALL_FILE /tmp
chmod 777 /tmp/$SASG_INSTALL_FILE
echo "SASG installation package has been generated in /tmp/$SASG_INSTALL_FILE"
echo "Configure customer's SASG servers in on-premise data centers."
