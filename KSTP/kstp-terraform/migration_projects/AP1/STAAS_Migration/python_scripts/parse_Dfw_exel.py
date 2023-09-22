# 
# file - location of the DfwToExcel-YYYY-MM-DD_HH-MM_<version>_Thycotic.xlsx"
# version V1 - original DfwToExel document. 
# version V2 - document witn "Object_Mapping" tab. This tab contains mapping 
# between names of the existing NSX-V Security groups and IPSET groups and 
# names of the Security groups in the NSX-T.
# There are 3 columns in the "Object_Mapping": Original Name,Modified Name,Note.
# if Modified Name is empty, new name will be created automatically using pattern:
# for security group: <Prefix>-<Original Name>
# for ipset group   : <Prefix> -SG-<Original Name>
#
# reload="no" (default parameter value is "yes". If parameter is set up to "yes" 
# script will read xlsx file and recreate json files related to the tabs in
# the xlsx document. 
# This parametrer is used to reduce script executing time during development, test
# and debug as reading xlsx document is time-consuming operation
# 
# service - name of the consumption service 
# 
# stage="1" - initial run ( run against of first version of the xlsx document ). default value
# stage="2" - run against modified version of the document
#
# srvc_mapping="/home/sdubrouskaya/NSX_T_Migration/Parse_DFW_xlsx/input_xlsx_files/Mapping_Services.json"
#
# file="/home/sdubrouskaya/NSX_T_Migration/Parse_DFW_xlsx/input_xlsx_files/DfwToExcel-2022-03-07_21-11_V2_Thycotic.xlsx"
# reload="no"
# service="Thycotic"
## US fully Qualified file paths in the below commands 
# python3.8 parse_Dfw_exel.py -f "$file" -r "$reload" -t "$stage" -s "$service" -m "$srvc_mapping"
# python3.8 parse_Dfw_exel.py -f "$file" -m "$srvc_mapping" -s "$service"


import getopt 
import openpyxl
import os
import sys
import parse_functions
from parse_functions import load_file
from parse_functions import write_to_file
from parse_functions import write_to_file_indent

def check_parameters(file,srv_map,stage):
    if not os.path.exists(file):
       print("Can not find file {}.\
           Please provide correct path to the DfwToExel file.".format(file)) 
       sys.exit('some error log') 
    if stage == "2":   
       if not os.path.exists(srv_map):
           print("Can not find file {}. \
               Please provide correct path to the DfwToExel file.".
                  format(srv_map))

def get_params(argumentList):
    
    global file, stage, reload, service, srv_map
    
    reload = "yes"
    stage  = "1"
    # Options
    options = "hf:s:r:t:m:"
    #print(argumentList)
    try:
        # Parsing argument
        arguments, values = getopt.getopt(argumentList, options)

        # checking each argument
        for currentArgument, currentValue in arguments:
 
            if currentArgument in ("-h", "--Help"):
                print ("python3.8 parse_tab.py -g <> -s <> -o <>")
                sys.exit(2)
            elif currentArgument in ("-f"):
                 file = currentValue
            elif currentArgument in ("-t"):
                 stage = currentValue
            elif currentArgument in ("-r"):    
                 reload = currentValue
            elif currentArgument in ("-s"):    
                 service = currentValue 
            elif currentArgument in ("-m"):    
                 srv_map = currentValue          
    except getopt.error as err:
        # output error, and return with an error code
        print (str(err))

       

get_params(sys.argv[1:])

# check parameters
check_parameters(file,srv_map,stage)

init_config = "../json_config/initial_config/"
parse_functions.check_and_create_dir(init_config)

if reload == "yes":
    workbook = openpyxl.load_workbook(file)
    # Parse "IPSET" tab and store content in the file 
    # ../json_config/initial_config 
    IPS = parse_functions.ipset(workbook["IPSETS"])
    write_to_file_indent(init_config + "IPSET.json", IPS)
    
    # Parse "Security Group Effective Member" tab and store content in 
    # the file ../json_config/initial_config 
    write_to_file_indent(init_config + "Security_Group_Effective_Member.json",
                  parse_functions.security_groups_1(
                      workbook["Security Group Effective Member"]))
    
    # Parse "Security Group Configuration" tab and store content in 
    # the file ../json_config/initial_config 
    write_to_file_indent(init_config + "Security_Group_Configuration.json",
                  parse_functions.security_groups_2(
                      workbook["Security Group Configuration"]))
    
    # Parse "Layer 3 Firewall Rules" tab and store content in 
    # the file ../json_config/initial_config 
    write_to_file_indent(init_config + "Layer_3_Firewall_Rules.json",
                  parse_functions.dfw(workbook["Layer 3 Firewall Rules"]))
    
    # Parse "Service_Groups" tab and store content in a json file 
    # ../json_config/initial_config 
    write_to_file_indent(init_config + "Service_Groups.json",
                         parse_functions.service_groups(workbook["Service_Groups"], workbook["Services"],"parse.log"))

    # Parse "Services" tab and store content in the file 
    # ../json_config/initial_config 
    write_to_file_indent(init_config + "Services.json",
                  parse_functions.services(workbook["Services"],"parse.log"))              
              
    # Parse "VM_Info" tab and store content in the file 
    # ../json_config/initial_config 
    write_to_file_indent(init_config + "VM_Info.json",
                  parse_functions.vms(workbook["VM_Info"],"parse.log")) 
    
    if stage == "2":
       # Parse "Object Mapping" tab and store content in 
       # the file ../json_config/initial_config 
       write_to_file_indent(init_config + "Object_Mapping.json",
                  parse_functions.groups_mapping(
                      workbook["Object Mapping"],IPS,"AP1"))
                  
                                       

# Load json files for initial config
IPS = load_file(init_config + "IPSET.json")   
SG1 = load_file(init_config + "Security_Group_Effective_Member.json")
SG2 = load_file(init_config + "Security_Group_Configuration.json")
DFW = load_file(init_config + "Layer_3_Firewall_Rules.json")
SRV = load_file(init_config + "Services.json")
VMS = load_file(init_config + "VM_Info.json")
if os.path.exists(init_config + "Object_Mapping.json"):
    GMP = load_file(init_config + "Object_Mapping.json")
    # get list of the Security groups that exist on the NSX_T 
    SGE = [item["new_name"] for item in GMP.values() if item["note"] == "EXISTS" ] 

if os.path.exists(srv_map):
    # load list of the predifined services in the nsxt
    #and its mapping with raw port services
    SMP = load_file(srv_map)
    # get list of the predifined services
    SRE = list(SMP.values()) 

#################################################################################
# Creating auxiliary files                                                      #
#
# modified_config = "../json_config/auxiliary_files/ - directory where all 
# auxiliary files are stored
modified_config = "../json_config/auxiliary_files/"
parse_functions.check_and_create_dir(modified_config)

# Security_groups_by_ip_full.json - file that is contain definitions for
#  all Security groups and ipsets using only ip not vm names 

# replace vms names by their ips in the SG definitions
# (Security_Group_Effective_Member)
parse_functions.groups_definition_by_ip(VMS,SG1,"vms")

# replace vms names,ipset names,sg names by their ips in the SG definitions
# (Security_Group_Configuration)
parse_functions.groups_definition_by_ip(VMS,SG2,"vms")
parse_functions.groups_definition_by_ip(IPS,SG2,"ipset")
parse_functions.groups_definition_by_ip(SG2,SG2,"sg")

# merge Security_Group_Effective_Member and Security_Group_Configuration and 
# ipset to one dictionary                                       
SGR = parse_functions.merge_dictionaries(parse_functions.merge_all_ip(SG1),
                                   parse_functions.merge_all_ip(SG2))
SGR = parse_functions.merge_dictionaries(SGR,IPS)                                   
write_to_file_indent(modified_config + "Security_groups_by_ip_full.json",SGR)

# Define raw port services that are used in the DFW 
# and merge them with SEVICES defined in the SERVICE tab
CSM = {}
parse_functions.add_services_from_dfw(DFW,SRV,CSM) 
write_to_file_indent(modified_config + "Services_full.json",SRV)

# Filter DFW: remove all rules with applied_to = false
DFW_filtered = parse_functions.filter_dfw(DFW)
write_to_file_indent(modified_config + "DFW_filtered.json",DFW_filtered)

# Get all sources and destinations before mapping
INFO = {}
obj_list = ["source_groups","source_ipsets",
            "destination_groups","destination_ipsets",
            "source_ips","source_vms",
            "destination_ips","destination_vms"]

INFO["source and destination"] = parse_functions.get_objects_from_dfw(
                                    DFW_filtered,obj_list)
obj_list = ["source_groups","source_ipsets",
            "destination_groups","destination_ipsets"]
                        
INFO["groups and ipsets"] = parse_functions.get_objects_from_dfw(
                               DFW_filtered,obj_list)                      

INFO["source and destination ips"] = parse_functions.replace_group_by_ip(
                                       IPS,SGR,INFO["groups and ipsets"])

write_to_file_indent(modified_config + "INFO.json",INFO)

if stage == "2":
    # replace SG names by mapped values
    SGR ={GMP[item]["new_name"]:SGR[item] for item in INFO["groups and ipsets"]}
    write_to_file_indent(modified_config + "Security_groups_by_ip_full_mapped.json",SGR)
    
    # replace services by their mapping values DFW 
    parse_functions.dfw_map_services(DFW_filtered,CSM,["services"])
    parse_functions.dfw_map_services(DFW_filtered,SMP,["services"])
    
    # replace VMs by their ips DFW
    parse_functions.dfw_map_services(DFW_filtered,VMS,["source_vms","destination_vms"])
    
    # replace SG names by their mapping values in DFW
    parse_functions.dfw_map_groups(DFW_filtered,GMP)
      
    # Merge groups and ipsets to one list
    # merge vms and vms ips to one 
    # delete applied_to item
    # compose scope item: source + destination
    # set logged to true
    dFW = parse_functions.adjust_dfw_config(DFW_filtered,service)
    write_to_file_indent(modified_config + "DFW_mapped.json",dFW)
    
    Existing = {"groups": SGE, "services": SRE }
    write_to_file_indent(modified_config + "Services_and_groups_exists.json",Existing)

    
