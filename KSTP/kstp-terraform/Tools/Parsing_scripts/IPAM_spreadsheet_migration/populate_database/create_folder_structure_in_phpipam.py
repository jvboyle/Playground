import yaml
import urllib3
import api_new
import getopt
import sys

urllib3.disable_warnings()

def get_params(argumentList):
    
    global file_name
    
    print(argumentList)
    # Options
    options = "hf:"
 
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
                 
             
    except getopt.error as err:
        # output error, and return with an error code
        print (str(err))

def process_subfolders(section,data,mastersubnet):
    

    print("folder_name to create {}, mastersubnet {}".format(data['name'],mastersubnet))
    id = api_new.CheckiFolderInSectionInfo(section,data['name'],mastersubnet)
    if id:
        print("Folder {} has already existed".format(data['name']))
        mastersubnet = id
    else:  
        print("Creating folder {}".format(data['name']))  
        mastersubnet = api_new.add_folder(section,data['name'],mastersubnet)

    if 'Subfolders' in data and data['Subfolders']:
        for item in data['Subfolders']:
            process_subfolders(section,item,mastersubnet)  
    
    if 'Subnets'in data and data['Subnets']:
        for item in data['Subnets']:
            print('item',item)
            process_subnets(section,item,mastersubnet) 

def process_subnets(section,data,mastersubnet):    
    
    data['sectionId']      = api_new.GetSectionId(section)  
    data['masterSubnetId'] = mastersubnet
    data['mask'] = int(data['subnet'].split('/')[1])
    data['subnet'] = data['subnet'].split('/')[0]
    print('data ',data)

    id = api_new.CheckifSubnetInSectionInfo(section,data['subnet'],data['mask'],mastersubnet)
    if id:
        print("Subnet {}/{} has already existed".format(data['subnet'],data['mask']))
        mastersubnet = id
    else:
        print("Creating subnet {}/{}".format(data['subnet'],data['mask']))    
        mastersubnet = api_new.add_subnet(data)

    print("subnet, before")
    print(data)
    if 'Subnets' in data and data['Subnets']:
        print("subnet, after")
        for item in data['Subnets']:
            #api_new.GetMasterSubnets(section)
            process_subnets(section,item,mastersubnet)


get_params(sys.argv[1:])
file = open(file_name)

sections = yaml.load(file, Loader=yaml.FullLoader)

for section in sections:
    print(section)
    # check if section exists
    section_id = api_new.GetSectionId(section)
    if section_id == 'N/A':
       api_new.add_section(section, sections[section]['description'])
    else:
        print(section)
        print('Section with name {} exists. section id is {}'.format(section,section_id))
    if 'Subfolders' in sections[section] and sections[section]['Subfolders']:    
        for item in sections[section]['Subfolders']:
            #process_subfolders(section,sections[section]['Subfolders'])  
            #print(item)
            print("Inside main Subfolder")
            process_subfolders(section,item,0)  
    if 'Subnets' in sections[section] and sections[section]['Subnets']:           
        for item in sections[section]['Subnets']:
            print("I am here")
            #process_subfolders(section,sections[section]['Subfolders'])  
            print('Subnets',item)
            process_subnets(section,item,0)