#! /bin/bash

### PRE-required Steps
# 1. Setup vCenter Userid and Password Environment Variables
# 2. clone Git repo to automation control node
# 3. initialize Terraform `terraform init` in this instance


# Internal Variable setup

segment_id="dr500"    # DRES identifier  e.g. dr100
region_id="ag1"  # Region Short Name 'eu1', 'non-prod'
prod_or_non_prod="non-prod"  # `non-prod`
customer_name=""  # used in creation of teh DRES
ssh_password=""
icp_password=""
cluster_size="medium"
cluster_size_configfile="empty" ##???????
icp_instance_name="icp1"
icp_config_dir="../icp-config/"
region_config_dir="../region-configs/"

## Constant setup
# Networking Constants
jumpServerRuleItem1="SG-SRES-Linux-Jump-Servers"
jumpServerRuleItem2="SG-SRES-WIN-Jump-Servers"
jumpServerRuleItem3="HOST-IBM-Blue-Sendmail"
jumpServerRuleItem4="HOST-IBM-Bluepages"
jumpServerRuleItem5="HOST-IBM-Blue-API-Connect"
jumpServerRuleItem6="NET-ICp-ClusterIP-Service-Network"
jumpServerRuleItem7="NET-ICp-Pod-Network"

nsx_network_label_suffix_part="app-internal1"

## Gather Information required

#if [ -z "$CL_IP_ENV" ] ; then
#  echo "Enter CL_IP : "; read CL_IP
#  export CL_IP
#else
#  CL_IP="${CL_IP_ENV}"
#fi

## Setup Key information on Input Parameters

if [ "$cluster_size" = "small" ] ; then
  cluster_size_configfile=$icp_config_dir"icp-cluster-small-node-config.tfvars"
elif [ "$cluster_size" = "medium" ] ; then
  cluster_size_configfile=$icp_config_dir"icp-cluster-medium-node-config.tfvars"
elif [ "$cluster_size" = "large" ] ; then
  cluster_size_configfile=$icp_config_dir"icp-cluster-large-node-config.tfvars"
else
  echo "future"
fi

## See if the segment_ID is Not set...
if [[ -z "$segment_id" ]] ; then
  echo "No Segment ID is set"
else
  network_specifications=../network-config/$prod_or_non_prod/$segment_id"-network-specifics.yml"
fi

## Lookup key network information from the "re"
nsx_network_label_suffix=$region_id"-"$segment_id"-"$nsx_network_label_suffix_part
icp_instance_name=$region_id$segment_id$icp_instance_name
terraform_region_config=$region_config_dir$prod_or_non_prod"/"$region_id"-region.tfvars"
ansible_region_config=$region_config_dir$prod_or_non_prod"/"$region_id"-answerfile.yml"
icp_instance_config=$region_config_dir$prod_or_non_prod"/"$region_id"-"$segment_id"-terraform.tfvars"
segment_subnet=`grep app_internal_subnet: $network_specifications | awk '{print $2}'`
segment_subnet_mask=`grep app_internal_subnet_prefix: $network_specifications | awk '{print $2}'`

# Dump out Variables
printf "These are the variables that have been set\n"
echo "nsx_network_label_suffix"
echo $nsx_network_label_suffix
echo "--------------------"
echo "icp_instance_name"
echo $icp_instance_name
echo "--------------------"
echo "icp_instance_config"
echo $icp_instance_config
echo "--------------------"
echo "network_specifications"
echo $network_specifications
echo "--------------------"
echo "terraform_region_config"
echo $terraform_region_config
echo "--------------------"
echo "ansible_region_config"
echo $ansible_region_config
echo "--------------------"
echo "cluster_size_configfile"
echo $cluster_size_configfile
echo "--------------------"
echo "segment_subnet"
echo $segment_subnet
echo "--------------------"
echo "segment_subnet_mask"
echo $segment_subnet_mask
echo "--------------------"


## execute DRES Playbook
cd /home/gzeien/Platform-Automation-scripts-templates/network-automation/provision-dres-playbook
ansible-playbook provision-DRES.yml --extra-vars "region_name=$prod_or_non_prod dres_name=$segment_id customer_name=$customer_name region=$region_id requested_state='present'"

## Get VM_Network_Label
cd /home/gzeien/Platform-Automation-scripts-templates/network-automation/get_network_label_playbook
ansible-playbook  get_network_label.yml --extra-vars "region_type=non-prod region=ag1 segmentID=sr1 target_cluster=WDC04-PoC-CL1" | grep network_label.0 | awk '{print $2}' > /tmp/gz
cat /tmp/gz


## Create FW Rules for ICP CLuster


## Deploy ICP Cluster into DRES
mkdir /data/$icp_instance_name"-state"

cd ..\icp-automation-v5

terraform plan -var 'ssh_password=$ssh_password' -var 'icppassword=$icp_password' \
-var-file=../region-configs/$prod_or_non_prod/$region_id-region.tfvars \
-var-file=../icp-config/$prod_or_non_prod/$segment_id"-terraform.tfvars" \
-var-file=../icp-config/$cluster_size_configfile 1> /data/$icp_instance_name"-state"/stdout-logfile 2>/data/$icp_instance_name"-state"/stderr-logfile
