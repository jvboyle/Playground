# Takes a file CSV file called "data.csv" and outputs each row as a numbered YAML file.
# Data in the first row of the CSV is assumed to be the column heading.

# Import the python library for parsing CSV files.
import os
import sys
import glob
import yaml
import subprocess

if len(sys.argv) <= 1:
	print "USAGE: firewall-controller-AA.py  <PlatformEnv> <Region> <DRES Number> <Customer Prefix>"
	sys.exit()

platformEnv = sys.argv[1]  #  "non-prod"  OR "prod"
region = sys.argv[2]   # eu1"  AMS;  "ag1"  WDC ; "ag1"  PoC
drNumber = sys.argv[3]
customerPrefixName = sys.argv[4]

print (drNumber)

## Setup Custom services ( no parameters. Pass in vCenter ID to enable PS script to log into NSX)
print ("Execute: Setup-Custom-Services.ps1 ( ", ")")
# subprocess.Popen(["./Setup-Custom-Services.ps1"], stdout=sys.stdout)

## Create AA SRES Security Groups ( no parameters. Pass in vCenter ID to enable PS script to log into NSX)
## Unique to AA Processing
print ("Execute: Setup-AA-SRES-Security-Groups.ps1 ( ", ")")
# subprocess.Popen(["./Setup-AA-SRES-Security-Groups.ps1"], stdout=sys.stdout)

## Create AA DRES Security groups
print ("Execute: Create-AA-DRES-SecurityGroup.ps1 ( ", str(drNumber) , ")")
# subprocess.Popen(["./Create-AA-DRES-SecurityGroup.ps1"], stdout=sys.stdout)

## Create DRES FW Rules dresSectionName
print ("Execute: Create-DRES-FW-Rules-Section.ps1 ( ", str(drNumber) , ")")
# subprocess.Popen(["./Create-DRES-FW-Rules-Section.ps1"], stdout=sys.stdout)


# Interate through each "FW line item" to process
path="../../network-config/VM-FW-Rules/DRES"+str(drNumber)+"/*.yml"
files=glob.glob(path)
for file in files:
    print file
    with open(file, 'r') as stream:
        data_loaded = yaml.load(stream)

    ## Call the Powershell program to create the FW rules
    #USAGE: Execute FW Rule  <dresSectionName> <ruleName> <Source> < Destination> <action> <service> < applied to>"
    print ("Execute FW Rule.ps1 ", "DR"+str(drNumber)," ",data_loaded['rule_name'] )
    print (data_loaded['source'], " ", data_loaded['destination'])
    print (data_loaded['action'], " ", data_loaded['service'])
    print (data_loaded['applied_to'], " ", data_loaded['logging'])
    print ("--")
	# subprocess.Popen(["./Execute FW Rule.ps1"], stdout=sys.stdout)

### Adding members to Security Groups
print ("Execute: addMember-to-SecurityGroup.ps1 ( ", str(drNumber) , ")")
