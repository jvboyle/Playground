#################################################################
#### REGION SPECIFIC #####

#######################################
##### vSphere Access Credentials ######
#######################################
vsphere_server = "ag1vc01.poc.ispw.ibm.local"


##############################################
##### vSphere deployment specifications ######
##############################################
# Following resources must exist in vSphere
vsphere_datacenter = "WDC04"
vsphere_cluster = "WDC04-PoC-CL1"


datastore = "vsanDatastore"

template = "icp31_30012019"

domain = "sres01.poc.ispw.ibm.local"

# Proxy Related information
httpproxy = "Acquire::http::proxy \"http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080/\";"
httpsproxy = "Acquire::https::proxy \"http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080/\";"
dockerproxy = "Environment=\"HTTP_PROXY=http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080/\" \"HTTPS_PROXY=http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080/\" \"NO_PROXY=localhost,127.0.0.1,158.87.63.93,poctestterraicp01.sres01.poc.ispw.ibm.local:8500\""
tillerproxy = "http://ag1pdr1prx.pdr1.poc.ispw.ibm.local:8080"

#Object storage location information
object_url = "https://s3.us-east.cloud-object-storage.appdomain.cloud"
object_access_key = "AUw6u4f4pfeBQui4T6pkn4OYBhyTIeaIkGzfIdsu"
object_key_id = "tfYQAZAD6dvegxddFYiL"

objectstoragelocation_image = "automation-support/ibm-cloud-private-x86_64-3.1.1.tar.gz"
