#!/bin/bash

set -e

BASE_PATH=${PWD%/*}
PWD="$PWD"

export PROJECT
export ENV
export CUSTOMER
export TF_CONFIG
export CON_SERVICE
export TF_ACTION=plan
#export SKIP_TFSEC=true
export SKIP_TFLINT=true

. $BASE_PATH/_scripts/tf_project-flags.sh $@

export REMOTE_WORKSPACE="${PROJECT}-${ENV}"

if [ -n "$CUSTOMER" ]
  then
    echo "running Customer"
    cd $ENV/$PROJECT/customers/$CUSTOMER/$TF_CONFIG
    mkdir -p ../_vars
    export LOCK_KEY="$PROJECT/customers/$CUSTOMER/${TF_CONFIG}/terraform.tfstate"
    export REMOTE_WORKSPACE="${CUSTOMER}-${ENV}"
    echo "LOCK_KEY=$LOCK_KEY"
    echo "REMOTE_WORKSPACE=$REMOTE_WORKSPACE"
    cp $BASE_PATH/providers/terraform_provider.tf .
    echo "Project = $PROJECT"
    echo "Customer = $CUSTOMER"
    echo "Project_Path=$ENV/$PROJECT/customers/$CUSTOMER/$TF_CONFIG"
    echo "environment = \"$ENV\"" > ../_vars/${REMOTE_WORKSPACE}.tfvars
#   echo "project = \"$CUSTOMER\"" >  ../_vars/globals.tfvars
elif [ -n "$CON_SERVICE" ]
  then
    echo "running consumable_service"
    cd $ENV/consumable_service/$CON_SERVICE/$TF_CONFIG
    mkdir -p ../_vars
    export CUSTOMER=$CON_SERVICE
    export LOCK_KEY="consumable_service/$CON_SERVICE/${TF_CONFIG}/terraform.tfstate"
    export REMOTE_WORKSPACE="${CUSTOMER}-${ENV}"
    export CUSTOMER=$CON_SERVICE
    echo "LOCK_KEY=$LOCK_KEY"
    cp $BASE_PATH/providers/terraform_provider.tf .
    echo "Project_Path=$ENV/consumable_service/$CON_SERVICE/$TF_CONFIG"
    echo "environment = \"$ENV\"" > ../_vars/${REMOTE_WORKSPACE}.tfvars
#   echo "project = \"$CUSTOMER\"" >  ../_vars/globals.tfvars

else
    echo " running default "
    cd $ENV/$PROJECT/$TF_CONFIG
    mkdir -p ../_vars
    export LOCK_KEY="$PROJECT/${TF_CONFIG}/terraform.tfstate"
    export REMOTE_WORKSPACE="${PROJECT}-${ENV}"
    export CUSTOMER=$PROJECT
    echo "LOCK_KEY=$LOCK_KEY"
    cp $BASE_PATH/providers/terraform_provider.tf .
    echo "Project_Path=$PROJECT/$TF_CONFIG"
    echo "environment = \"$ENV\"" > ../_vars/${REMOTE_WORKSPACE}.tfvars
#    echo "project = \"$PROJECT\"" >  ../_vars/globals.tfvars
  fi

echo '###################################'
echo 'running pre.sh if found'
if [[ -d "scripts" && -f "scripts/pre.sh" ]]; 
  then
    echo "Found pre.sh, executing it."
    ./scripts/pre.sh $@
    echo "Done with pre.sh"
fi
echo 'end of pre.sh'

#echo 'Running tflint...'
#if [[ $SKIP_TFLINT == true ]]
#  then
#    echo '###################################'
#    echo 'Skipping tflint'
#  else
#    echo 'Running tflint...'
#    tflint
#fi
#echo 'No errors found from tflint'
echo '###################################'

echo '###################################'
echo 'enable the azure backend'
. $BASE_PATH/_scripts/tf-init-azure.sh
echo 'complete backend setup'
echo '###################################'

echo '###################################'
echo 'validate terraform'
terraform validate
echo 'end terraform validate'
echo '###################################'

#if [[ $SKIP_TFSEC == true ]]
#  then
#    echo '###################################'
#    echo 'Skipping tfsec'
#    echo '###################################'
#  else
#    echo '###################################'
#    echo 'Running tfsec...'
#    tfsec
#    echo '###################################'
#fi

export PROJECT_ENV_VAR_FILE
if [ -f "vars/${REMOTE_WORKSPACE}.tfvars" ]
  then
    echo "Found project environment var file"
    PROJECT_ENV_VAR_FILE=-var-file=vars/${REMOTE_WORKSPACE}.tfvars
fi

# not used right now but leaving for future 
#PROJECT_GLOBAL_ENV_FILE=""
#if [ -f "../_vars/globals.tfvars" ]
#  then
#    echo "Found globals environment var file"
#    PROJECT_GLOBAL_ENV_FILE=-var-file="../_vars/globals.tfvars"
#fi

echo "Project = $PROJECT"
echo "Customer = $CUSTOMER"

if [[ $TF_ACTION == *"-auto-approve"* ]]; 
  then
    echo '###################################'
    echo 'running Auto Plan'
    echo "Project = $PROJECT"
    echo "Customer = $CUSTOMER"  
    echo "terraform plan -var project=$PROJECT -var environment=$ENV -var customer=$CUSTOMER -var-file="../_vars/${REMOTE_WORKSPACE}.tfvars" $PROJECT_ENV_VAR_FILE"
    #terraform plan -var project=$PROJECT -var environment=$ENV -var customer=$CUSTOMER -var-file="../_vars/${REMOTE_WORKSPACE}.tfvars" $PROJECT_ENV_VAR_FILE $PROJECT_GLOBAL_ENV_FILE
    terraform plan -var project=$PROJECT -var environment=$ENV -var customer=$CUSTOMER -var-file="../_vars/${REMOTE_WORKSPACE}.tfvars" $PROJECT_ENV_VAR_FILE
    echo '###################################'
  else
    echo '###################################'
    echo "running $TF_ACTION"
    echo "Project = $PROJECT"
    echo "Customer = $CUSTOMER"  
    echo "terraform $TF_ACTION -var project=$PROJECT -var environment=$ENV -var customer=$CUSTOMER -var-file="../_vars/${REMOTE_WORKSPACE}.tfvars" $PROJECT_ENV_VAR_FILE"
    #terraform $TF_ACTION -var project=$PROJECT -var environment=$ENV -var customer=$CUSTOMER -var-file="../_vars/${REMOTE_WORKSPACE}.tfvars" $PROJECT_ENV_VAR_FILE $PROJECT_GLOBAL_ENV_FILE
    terraform $TF_ACTION -var project=$PROJECT -var environment=$ENV -var customer=$CUSTOMER -var-file="../_vars/${REMOTE_WORKSPACE}.tfvars" $PROJECT_ENV_VAR_FILE
    echo '###################################'
fi

echo '###################################'
if [[ -d "scripts" && -f "scripts/post.sh" ]]; 
  then
    echo "Found post.sh, executing it."
    ./scripts/post.sh $@
    echo 'Done with post'
    echo '###################################'
  else
    echo 'post.sh not found'
    echo '###################################'
fi

cd ../..