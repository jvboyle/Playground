# ** Run Script for NSX-T deploys**

  The purpose this run.sh script is to Set a Rigid framework for storing terraform objects per customer and setup the state per geo for remote storage 

**Script** 
kstp-terraform/projects/run.sh

required Variables
|Variable|Description |Values  |notes|
|--|--| --|--|
|env |Environment  |AP1,AG1,EU1|Builds Geo Dir path |
|project|consumable Service name | Directory name | when naming , no spaces in names 
|tf_config|terraform index dir | Directory name| used for all TF runs
|tf_action|used to set action|plan(default), apply|code defaults to pla n
|customer|project name under customer directory | Directory Name | Used for dres to T0 mapping
|con_service|project name under consumable_service | Directory Name | used for migration projects 
```
Repository Layout 
 Projects 
  - Geo ( AP1,AG1,EU1,DT1,azure-infra)
    -consumable_service 
     - jvboyle_gse
    -T0-0 ( this will be named based on Real T0 name )
      -100-T0 ( dir to store terraform to create t0 )
      - Customers
       - DresName
        - xxx-index ( used to store terraform objects )
         - dfw.tf
        - xxx-index
         - service.tf
```

### consumable_service - Used for migration project 
```
./run.sh  --env AG1 --project consumable_service --tf_config 200-services --con_service jvboyle_gse --tf_action plan
```
path built = /AG1/consumable_service/jvboyle_gse/200-services

### level - T0 - build 
 - this example will enter the dir at the root of T0-0 and run the resource
```
./run.sh --env AG1 --project T0-0 --tf_config 100-T0 --tf_action plan
```
path built  =T0-0/100-T0

###  Level under T0, Used for Dres ( customers ) 
- this example will enter the dir T0-0 / customer / dres-jvboyle and run the resource 101-dres
```
./run.sh --env DT1 --project T0-0  --customer dres-jvboyle --tf_config 101-dres
```
path built =DT1/T0-0/customers/dres-jvboyle/101-dres
