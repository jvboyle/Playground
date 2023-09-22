import json
import requests
import ipaddress

#Global vars
# PNPIPAM_HOST = "127.0.0.1:8443"
PNPIPAM_HOST = "10.214.35.42"
URL          = "https://" + PNPIPAM_HOST  + "/api/myapp/"
#TOKEN     = "6bk0gB2CmWML1Mq1qkkzdquMKLYbBjUl" # My laptop
TOKEN     = "cDgeM9w_Fi9joAHKX1JodrlfjsaqdP1d" # LAB
HEARDERS  = {
              'token': TOKEN,
              'Content-Type': 'application/json',
            }

# Get section info
def CheckiFolderInSectionInfo(section_name,folder_name,masterSubnetId):
    id = GetSectionId(section_name) 
    response = requests.get(URL + 'sections/' + id + '/subnets', headers=HEARDERS,verify=False)
    if 'data' in response.json():
        
        for item in response.json()['data']:

            if int(item["masterSubnetId"]) == masterSubnetId and item["description"] == folder_name:
                return int(item["id"])
        
def CheckifSubnetInSectionInfo(section_name,subnet,mask,masterSubnetId):
    id = GetSectionId(section_name) 
    response = requests.get(URL + 'sections/' + id + '/subnets', headers=HEARDERS,verify=False)
    if 'data' in response.json():
        
        for item in response.json()['data']:

            if item["masterSubnetId"] == masterSubnetId and item["subnet"] == subnet and int(item["mask"]) == mask:
                return int(item["id"])

# Get section id  
def GetSectionId(section_name):
    response = requests.get(URL + 'sections/' + section_name, headers=HEARDERS,verify=False)
     
    if 'data' in response.json(): 
       return response.json()['data']['id'] 

    if 'message' in response.json() and  response.json()['message'] == 'Not Found':
       return "N/A"

# Get Section Master subnets ids
def GetMasterSubnets(section_name):
    
    id = GetSectionId(section_name) 
    response = requests.get(URL + 'sections/' + id + '/subnets', headers=HEARDERS,verify=False)  
    #print(response.json()) 
    masterSubnets = []
    if 'data' in response.json():
     for item in response.json()['data']:
        if item['mask'] and int(item['mask']) < 24:
            masterSubnet = {}
            masterSubnet['id'] = item['id']
            masterSubnet['subnet'] = item['subnet'] + '/' + item['mask']
            masterSubnets.append(masterSubnet)
    return masterSubnets

# Check if masterSubnet for particular subnet exists and get masterSubnetId                                                                                                                                                                                    
def GetMasterSubnetId(section_name,subnet):
    
    masterSubnets = GetMasterSubnets(section_name)
    child  = ipaddress.ip_network(subnet)
    
    id = ''
    mask = 0
    for item in masterSubnets:
        parent = ipaddress.ip_network(item['subnet'])
        if child.subnet_of(parent):
            if int(item['subnet'].split('/')[1]) > mask:
               id = item['id']
               mask = int(item['subnet'].split('/')[1])                  
    return id

# Check if subnet exists
def FindSubnetId(section,subnet,mask):
    sectionId = GetSectionId(section)
    response = requests.get(URL + 'subnets/search/' + subnet + '/' + mask, headers=HEARDERS,verify=False)
    if response.json()['success']:
        for item in response.json()['data']: 
            if item["sectionId"] == sectionId:
               return response.json()['data'][0]['id']
    
    return ''   

# Check if address exists
def FindHostId(subnetId,ip):
    
    response = requests.get(URL + 'addresses/' + ip + '/' + str(subnetId), headers=HEARDERS,verify=False)
    if response.json()['success']:
       return response.json()['data']['id']
    
    return ''

# Construct data for creation SECTION
def Data_section(section_name, description):
    
    data = '''"name"               : "{}",
               "description"         : "{}"'''
    data = '{' + data.format(section_name,
                       description) + '}'
                                 
    return data

# Construct data for creation FOLDER/SUBNET
def Data_folder(Parameters):
    
    if "sectionId" in  Parameters: 
        data = '''"sectionId"              : {sectionId}'''
    else:
        print("Provide section name")       
   
    if "subnet" in  Parameters: 
        data = data +''',"subnet"          : "{subnet}"'''
    
    if "mask" in  Parameters: 
        data = data + ''',"mask"           : {mask}'''

    if "description" in  Parameters: 
        data = data + ''',"description"    : "{description}"'''

    if "vlanId" in  Parameters: 
        data = data + ''',"vlanId"         : {vlanId}'''

    if "vrfId" in  Parameters: 
        data = data + ''',"vrfId"          : {vrfId}'''

    if "masterSubnetId" in  Parameters: 
        data = data + ''',"masterSubnetId" : {masterSubnetId}'''

    if "nameserverId" in  Parameters: 
        data = data + ''',"nameserverId"   : {nameserverId}'''

    if "showName" in  Parameters: 
        data = data + ''',"showName"       : {showName}'''

    if "permissions" in  Parameters: 
        data = data + ''',"permissions"    : {permissions}'''

    if "DNSrecursive" in  Parameters: 
        data = data + ''',"DNSrecursive"   : {DNSrecursive}'''
    
    if "DNSrecords" in  Parameters: 
        data = data + ''',"DNSrecords"     : {DNSrecords}''' 

    if "allowRequests" in  Parameters: 
        data = data + ''',"allowRequests"  : {allowRequests}''' 

    if "pingSubnet" in  Parameters: 
        data = data + ''',"pingSubnet"     : {pingSubnet}''' 

    if "scanAgent" in  Parameters: 
        data = data + ''',"scanAgent"      : {scanAgent}''' 

    if "discoverSubnet" in  Parameters: 
        data = data + ''',"discoverSubnet" : {discoverSubnet}''' 

    if "isFolder" in  Parameters: 
        data = data + ''',"isFolder"       : {isFolder}''' 

    if "isFull" in  Parameters: 
        data = data + ''',"isFull"         : {isFull}''' 

    if "state" in  Parameters: 
        data = data + ''',"state"          : {state}''' 

    if "linked_subnet" in  Parameters:
        data = data + ''',"linked_subnet"  : {linked_subnet}'''
    
    if "threshold" in  Parameters:
        data = data +''',"threshold"       : {threshold}'''
    
    if "location" in  Parameters:  
        data = data +''',"location"        : {location}'''                             	                	   

    data = '{' + data.format(**Parameters) + '}'
    print(data)                             
    return data            

# Construct data for adding host to the subnet
def Data_host(Parameters):
 	        	
    if "subnetId" in  Parameters: 
        data = '''"subnetId"           : {subnetId}'''
    else:
        print("Provide subnetId")       
   
    if "ip" in  Parameters: 
        data = data +''',"ip"           : "{ip}"'''
    else:
        print("Provide host address")

    if "is_gateway" in  Parameters: 
        data = data + ''',"is_gateway"  : {is_gateway}'''

    if "description" in  Parameters: 
        data = data + ''',"description" : "{description}"'''

    if "hostname" in  Parameters: 
        data = data + ''',"hostname"    : "{hostname}"'''

    if "mac" in  Parameters: 
        data = data + ''',"mac"         : "{mac}"'''

    if "owner" in  Parameters: 
        data = data + ''',"owner"       : "{owner}"'''

    if "tag" in  Parameters: 
        data = data + ''',"tag"         : {tag}'''

    if "PTRignore" in  Parameters: 
        data = data + ''',"PTRignore"   : {PTRignore}'''
    else:
        data = data + ''',"PTRignore"   : 0'''

    if "PTR" in  Parameters: 
        data = data + ''',"PTR"         : {PTR}'''
    
    if "deviceId" in  Parameters: 
        data = data + ''',"deviceId"    : {deviceId}'''

    if "port" in  Parameters: 
        data = data + ''',"port"        : "{port}"'''
    
    if "note" in  Parameters: 
        data = data + ''',"note"        : "{note}"''' 

    if "excludePing" in  Parameters: 
        data = data + ''',"excludePing" : {excludePing}''' 
    else:
        data = data + ''',"excludePing" : 0'''                   	                	   
    data = '{' + data.format(**Parameters) + '}'
    print(data)                             
    return data            


def add_section(section_name, description):
    data = Data_section(section_name, description)
    response = requests.post(URL + 'sections/', headers=HEARDERS, data=data, verify=False)
    print(response.json())
    if response.json()['success']:
       return response.json()['id']

def add_subnet(Parameters):
    data = Data_folder(Parameters)
    response = requests.post(URL + 'subnets/', headers=HEARDERS, data=data, verify=False)    
    print(response.json())
    if response.json()['success']:      
       return int(response.json()['id'])

def add_folder(section_name,folder_name,mastersubnet):
    Parameters = dict()
    Parameters["sectionId"]   = GetSectionId(section_name)
    Parameters["description"] = folder_name
    Parameters["isFolder"] = 1
    Parameters["masterSubnetId"] = mastersubnet       
    return add_subnet(Parameters)

def add_host_to_subnet(Parameters):
     data = Data_host(Parameters)
     response = requests.post(URL + 'addresses/', headers=HEARDERS, data=data, verify=False)
     print(response.json()) 
     return response.json()   
        
        

