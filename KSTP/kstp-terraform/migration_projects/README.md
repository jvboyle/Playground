# **Migration script run command examples**

  The purpose this run_prs.sh script is to parse the exported nsx-v excel file. Archs will Identify Rules , and highlight them Green. The python code will find and build json objects related to the selected rules 

## **Script** 
kstp-terraform/migration_projects/run_prs.sh

required Variables
|Variable|Description |Values  |notes|
|--|--| --|--|
|env |Environment  |AP1,AG1,EU1|Builds Geo Dir path |
|project|consumable Service name | Directory name | when naming , no spaces in names 
|parse_stage|stage parse script to run | 1,2 | 


### Stage 1 
Description -  v1 of the excel file, Parse generates info.json used by the archs for V2 


## ./run_prs.sh --env AG1 --project jvboyle_gse --parse_stage 1

  ### Stage 2

## ./run_prs.sh --env AG1 --project jvboyle_gse --parse_stage 2
