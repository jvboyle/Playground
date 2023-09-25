#!/bin/bash

echo "running some Outputs"
echo '##################################'
terraform --version
echo "tfsec version"
tfsec --version
tflint --version
echo '##################################'
echo 'Need To setup Azure CLI, Please follow directions in yellow'
az login

# OpenVPN Connection use # host.docker.internal #

cat << "EOF"
  ____ _   _    _         _         _                        _   _                 
 / ___| \ | |  / \       / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __  ___ 
| |   |  \| | / _ \     / _ \| | | | __/ _ \| '_ ` _ \ / _` | __| |/ _ \| '_ \/ __|
| |___| |\  |/ ___ \   / ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | \__ \
 \____|_| \_/_/   \_\ /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|___/ 
EOF

echo "All Setup , Have a Great Day"
bash


                                                                    
                                                                    

