#################################################################
#### REGION SPECIFIC #####

#######################################
##### vSphere Access Credentials ######
#######################################
vsphere_server = "ag1vc1.ag1.sp.ibm.local"

##### vSphere deployment specifications ######
# Following resources must exist in vSphere
vsphere_datacenter = "AG1-WDC04"
vsphere_cluster = "AG1-C1"
datastore = "ag1-c1-vsan"
# template = "icp_30012019"
template = "icp_30012019_compute"

# Proxy Related information
httpproxy = "Acquire::http::proxy \"http://ag1pdr1prx.pdr1.ag1.sp.ibm.local:8080\";"
httpsproxy = "Acquire::https::proxy \"http://ag1pdr1prx.pdr1.ag1.sp.ibm.local:8080/\";"
tillerproxy = "http://ag1pdr1prx.pdr1.ag1.sp.ibm.local:8080"

#Object storage location information
object_url = "https://s3.us-east.cloud-object-storage.appdomain.cloud"
object_access_key = "13e328623cf00e258798773cbeee6b51f2eed4f7b7aca9dc"
object_key_id = "b196ca4b0de84b33b5dc339ec14473c8"

objectstoragelocation_image = "platform-deployment-support/ibm-cloud-private-x86_64-3.1.1.tar.gz"
