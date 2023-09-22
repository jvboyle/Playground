#!/bin/bash
set -e

ENV_CASE=$(echo $ENV | tr '[:upper:]' '[:lower:]')
export ENV_CASE

export STATE_TABLE=${REMOTE_WORKSPACE}-terraform-state-lock
export STATE_BUCKET=${REMOTE_WORKSPACE}-terraform-state-storage

export RESOURCE_GROUP=$(az group list --query '[].name' -o tsv | grep 009)
export ARM_ACCESS_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP --account-name kstp0storage0act --query '[0].value' -o tsv)
export SUBSCRIPTION_ID=`az account show --query id --output tsv`


echo '###################################'
echo 'backend settings used '
echo "running some debug output"
echo "init project = $PROJECT"
echo "init env = $ENV" 
echo "init env_case = $ENV_CASE"
echo "init tf_config = $TF_CONFIG"
echo "init tf_action = $TF_ACTION"
echo "init prefix = $NAME_PREFIX"
echo "Account_Arm_key = $ARM_ACCESS_KEY"
echo "SubscriptionID = $SUBSCRIPTION_ID"
echo "Container_Name = $ENV_CASE-kstp-tf-state-blob"
echo "Lock_key = ${LOCK_KEY}"
echo "RG = $RESOURCE_GROUP RG"
echo "REMOTE_WORKSPACE = $REMOTE_WORKSPACE"
echo '###################################'

echo "running terraform init"
terraform init -upgrade -lock=false -reconfigure \
    -backend-config="storage_account_name=kstp0storage0act" \
    -backend-config="container_name=$ENV_CASE-kstp-tf-state-blob" \
    -backend-config="use_azuread_auth=true" \
    -backend-config="subscription_id=$SUBSCRIPTION_ID" \
    -backend-config="key=${LOCK_KEY}"

