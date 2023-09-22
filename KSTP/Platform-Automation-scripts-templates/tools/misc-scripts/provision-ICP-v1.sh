#! /bin/bash

# Internal Variable setup

segment_id="sres2"    # DRES identifier  e.g. dr100
region_id="ag1"  # Region Short Name 'eu1', 'non-prod'
prod_or_non_prod="prod"  # `non-prod`
customer_name=""  # used in creation of teh DRES
internal_ssh_password=$1
internal_icp_password=$2
cluster_size="medium"
cluster_size_configfile="empty" ##???????
icp_instance_name="icp2"
icp_config_dir="../icp-config/"
region_config_dir="../region-configs/"

icp_instance_name=$region_id$segment_id$icp_instance_name


terraform plan -var 'ssh_password=$internal_ssh_password' -var 'icppassword=$internal_icp_password' -var-file=../region-configs/prod/prod-ag-region.tfvars -var-file=../icp-config/prod/prodag-sres2-terraform.tfvars -var-file=../icp-config/icp-cluster-medium-node-config.tfvars > /tmp/review
