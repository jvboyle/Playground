#!/bin/bash

set -e
BASE_PATH=${PWD%/*}
#MOD_PATH=${PWD%/*/*}

PWD="$PWD"
export PROJECT
export ENV
export PARSE_STAGE

. $BASE_PATH/_scripts/project-flags.sh $@

echo '###################################'
echo "project $PROJECT"
echo "stage $PARSE_STAGE"
echo "Base Path = $BASE_PATH"
#echo "Mod Path = $MOD_PATH"
echo '###################################'

cd $ENV/$PROJECT

# based on stage , get the excel file name and set a variable
if [[ $PARSE_STAGE == 1 ]]
then 
  echo '###################################'
  echo "Getting V1 Excel File name..."
  EXCEL_FILE=$(ls  export_files | grep V1)
  echo "File set to $EXCEL_FILE"
  echo '###################################'
else [[ $PARSE_STAGE == 2 ]]
  echo '###################################'
  echo "Getting V2 Excel File name..."
  EXCEL_FILE=$(ls  export_files | grep V2)
  echo "File set to $EXCEL_FILE"
  echo '###################################'
fi

# Checking and create some dirs 
if [[ ! -d "json_config" ]]
then
    echo '###################################'
    echo 'Creating some Dirs...'
    mkdir json_config
    mkdir json_config/auxiliary_files
    mkdir json_config/initial_config
    mkdir json_config/terraform_config
    mkdir -p terraform
#    cp -r $MOD_PATH/kstp-terraform/Tools/terraform/templates/tf_child/* .
    cp -r $BASE_PATH/Tools/terraform/templates/tf_child/* ./terraform/
    echo '###################################'   
else
    echo '###################################'
    echo 'refresh Terraform Modules...'
    mkdir -p terraform
#    cp -r $MOD_PATH/kstp-terraform/Tools/terraform/templates/tf_child/* .
    cp -r $BASE_PATH/Tools/terraform/templates/tf_child/* ./terraform/
    echo '###################################'   
fi

echo "################################################################################"
echo "Copy over the Geo Mapping Files  applies_rules.json and Mapping_Services.json"
echo "We OverWrite the existing File from Last run, Update master file for persistance"
echo "Master file location  $BASE_PATH/Tools/mapping_files/$ENV"
echo "################################################################################"
#cp -r $MOD_PATH/kstp-terraform/Tools/mapping_files/$ENV/${ENV}_applied_rules.json  ./export_files/applied_rules.json
#cp -r $MOD_PATH/kstp-terraform/Tools/mapping_files/$ENV/${ENV}_Mapping_Services.json  ./export_files/Mapping_Services.json
cp -r $BASE_PATH/Tools/mapping_files/$ENV/${ENV}_applied_rules.json  ./export_files/applied_rules.json
cp -r $BASE_PATH/Tools/mapping_files/$ENV/${ENV}_Mapping_Services.json  ./export_files/Mapping_Services.json
echo '###################################'

# parsing the excel files and create json
echo '#######################################'
echo "Stage $PARSE_STAGE running....."
echo "parsing the excel files and create json"
python3 $BASE_PATH/Tools/Parsing_scripts/parse_Dfw_excel.py  \
-f export_files/$EXCEL_FILE \
-t $PARSE_STAGE \
-m export_files/Mapping_Services.json \
-p export_files/applied_rules.json \
-s $PROJECT \
-e $ENV

if [ $PARSE_STAGE == 2 ]
then 
  echo '###################################'
  echo "Generating TF..."
  python3 $BASE_PATH/Tools/Parsing_scripts/generate_terraform_config.py \
    -f "json_config/auxiliary_files/DFW_mapped.json" \
    -g "json_config/auxiliary_files/Security_groups_by_ip_full_mapped.json" \
    -s "json_config/auxiliary_files/Services_full.json" \
    -m "json_config/auxiliary_files/Services_and_groups_exists.json" \
    -e "export_files/$EXCEL_FILE" \
    -p "$ENV"
  echo '###################################'
  echo "moving json and rename for TF runs..."
  echo "moveing DFW.json to dfw"
    cp $PWD/json_config/terraform_config/DFW.json $PWD/terraform/202-dfw/DFW.auto.tfvars.json
  echo "moveing Groups.json to groups"
    cp $PWD/json_config/terraform_config/GROUPS.json $PWD/terraform/201-groups/GROUPS.auto.tfvars.json
    cp $PWD/json_config/terraform_config/GROUPS_phase_2.json $PWD/terraform/201-groups/GROUPS.auto.tfvars_phase_2.json
  echo "moveing Service.json to services"
    cp $PWD/json_config/terraform_config/SERVICES.json $PWD/terraform/200-services/SERVICES.auto.tfvars.json
  echo '###################################'
  echo 'creating and Moving Files to Projects consumable_service dir'
    mkdir -p $BASE_PATH/projects/$ENV/consumable_service/$PROJECT
    cp -r $PWD/terraform/* $BASE_PATH/projects/$ENV/consumable_service/$PROJECT/
else
  if [ $PARSE_STAGE == 3 ]
  then
    echo '###################################'
    echo 'consolidating shared json files'
    python3 $BASE_PATH/Tools/Parsing_scripts/consolidate_terraform_config.py \
      -p "$PROJECT" \
      -g "$ENV" \
      -c
#project = myArgs["p"]
#geography = myArgs["g"]
#consolidate = myArgs["c"]
  else
    echo '###################################'
    echo "Skipping TF Generate..."
    echo "Stage 1 "
    echo '###################################'
  fi
fi 

cd ../..

