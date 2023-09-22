import urllib3
import api_new
import getopt 
import sys
import json

urllib3.disable_warnings()

def get_params(argumentList):
    
    global file_name
    global section
    
    print(argumentList)
    # Options
    options = "hf:s:"
 
    # Long options
    long_options = ["Help", "--file"]
 
    try:
        # Parsing argument
        arguments, values = getopt.getopt(argumentList, options, long_options)
        print("arguments",arguments)
        # checking each argument
        for currentArgument, currentValue in arguments:
 
            if currentArgument in ("-h", "--Help"):
                print ("Displaying Help")
                sys.exit(2)
            elif currentArgument in ("-f", "--file"):
                 file_name = currentValue
            elif currentArgument in ("-s", "--section"):
                 section = currentValue     
             
    except getopt.error as err:
        # output error, and return with an error code
        print (str(err))

def create_subnet(data):

    # check if subnets exists in section   
    id = api_new.FindSubnetId(section,data['subnet'],str(data['mask']))
    if id:
        print("Subnet {}/{} already exists".format(data['subnet'],data['mask']))
    else:
        # find master subnet
        data['masterSubnetId'] = api_new.GetMasterSubnetId(section,data['subnet']+'/' + str(data['mask']))
        print("Creating subnet {}/{}".format(data['subnet'],data['mask']))    
        id = api_new.add_subnet(data)
    
    return id

def create_host_in_subnet(host,subnetId,subnet):
    
    id = api_new.FindHostId(subnetId,host['ip'])
    if id:
       print("host {} already exists".format(host['ip']))
    else:    
        host['subnetId']   = subnetId
        if host['tag'] == "Used": host['tag'] = "2"
        if host['tag'] == "Reserved": host['tag'] = "3"
        if host['hostname'].lower() == 'gateway':
           host['is_gateway'] = 1
        else:   
           host['is_gateway'] = 0
           
           if not host["ip"].split('.')[3] == '255' and not host["ip"] == subnet:
              api_new.add_host_to_subnet(host) 

get_params(sys.argv[1:])
#file_name = "/home/sdubrouskaya/ISPW/IPAM_SPREDSHEET_MIGRATION/Sprint_1/AP/DRES.json"
file_content = open(file_name,)
dreses = json.loads(file_content.read())

for dres in dreses:
    data = dict()
   
    data['sectionId']   = api_new.GetSectionId(section)
    print("data['sectionId']",data['sectionId'])
    data['subnet']      = dres['subnet'].split('/')[0]  
    data['mask']        = dres['subnet'].split('/')[1]
    data['description'] = dres['name']
    SubnetId = create_subnet(data)
    for nested_subnet in dres["nested_subnets"]:
        
        data['subnet']      = nested_subnet['subnet'].split('/')[0]  
        data['mask']        = nested_subnet['subnet'].split('/')[1]
        data['description'] = nested_subnet['name']
        SubnetId = create_subnet(data)
        for host in nested_subnet['hosts']:
            create_host_in_subnet(host,SubnetId,data['subnet'])   
       
        
