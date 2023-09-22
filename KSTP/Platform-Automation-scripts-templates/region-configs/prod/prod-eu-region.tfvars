#######################################
##### vSphere Access Credentials ######
#######################################
vsphere_server = "eu1vc1.eu1.sp.ibm.local"

##############################################
##### vSphere deployment specifications ######
##############################################
# Following resources must exist in vSphere
vsphere_datacenter = "EU1-AMS03"
vsphere_cluster = "EU1-C1"

datastore = "eu1-c1-vsan"
#template = "icp_30012019"
template = "icp_30012019_compute"


# Proxy Related information
httpproxy = "Acquire::http::proxy \"http://eu1pdr1prx.pdr1.eu1.ispw.ibm.local:8080/\";"
httpsproxy = "Acquire::https::proxy \"http://eu1pdr1prx.pdr1.eu1.ispw.ibm.local:8080/\";"
tillerproxy = "http://eu1pdr1prx.pdr1.eu1.ispw.ibm.local:8080"

#Object storage location information
object_url = "https://s3.eu-de.cloud-object-storage.appdomain.cloud"
object_access_key = "f34974efb5d2f1d7ec206fc207a85793650b513ba9760391"
object_key_id = "6eab94b0c8f64f6ba9c0be76d12e82b6"

objectstoragelocation_image = "platform-deployment-support-eu/ibm-cloud-private-x86_64-3.1.1.tar.gz"
