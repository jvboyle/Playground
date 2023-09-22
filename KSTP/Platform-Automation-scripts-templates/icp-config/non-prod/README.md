# Terraform ICP Variable Files

Non-Production ICP Configurations Files.

## Usage
The purpose of this directory is to hold the reusable variable files for each instance we need.

1. terraform plan -var-file=<instance name>-terraform.tfvars
  e.g. terraform plan -var-file=../icp-config/non-prod/non-prod-pdr2-instance.tfvars
1. terrform apply -var-file=<instance name>-terraform.tfvars
    e.g. terraform apply -var-file=../icp-config/non-prod/non-prod-pdr2-instance.tfvars

### IMPORTANT
The PLAN is to REMOVE all passwords from these variable files. This still needs to be done for the VM template.

It is envisioned that userids and passwords will be set in ENV variables on the Control Node before the automation proceeds.
