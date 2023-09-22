# DFW="/home/sdubrouskaya/NSX_T_Migration/Parse_DFW_xlsx/json_config/auxiliary_files/DFW_mapped.json"
# SRV="/home/sdubrouskaya/NSX_T_Migration/Parse_DFW_xlsx/json_config/auxiliary_files/Services_full.json"
# SGR="/home/sdubrouskaya/NSX_T_Migration/Parse_DFW_xlsx/json_config/auxiliary_files/Security_groups_by_ip_full_mapped.json"
# SGE="/home/sdubrouskaya/NSX_T_Migration/Parse_DFW_xlsx/json_config/auxiliary_files/Services_and_groups_exists.json"
# python3.8 generate_terraform_config.py -f "$DFW" -g "$SGR" -s "$SRV" -m "$SGE"

from parse_functions import load_file, write_to_file
import sys
import getopt 
import parse_functions
from parse_functions import write_to_file_indent

def get_params(argumentList):
    
    global dfw, grp, srv, sge
    
    # Options
    options = "hf:s:g:m:"
    print(argumentList)
    try:
        # Parsing argument
        arguments, values = getopt.getopt(argumentList, options)

        # checking each argument
        for currentArgument, currentValue in arguments:
 
            if currentArgument in ("-h", "--Help"):
                print ("python3.8 parse_tab.py -g <> -s <> -o <>")
                sys.exit(2)
            elif currentArgument in ("-f"):
                 dfw = currentValue
            elif currentArgument in ("-g"):
                 grp = currentValue
            elif currentArgument in ("-s"):    
                 srv = currentValue
            elif currentArgument in ("-m"):    
                 sge = currentValue     
   
    except getopt.error as err:
        # output error, and return with an error code
        print (str(err))

get_params(sys.argv[1:])

#load auxillary files
DFW = load_file(dfw) 
SGR = load_file(grp)
SRV = load_file(srv)
SGE = load_file(sge)

# Define SG by their ip and store in the file  
terraform_config = "../json_config/terraform_config/"
parse_functions.check_and_create_dir(terraform_config)

# create terrafofm config dir
GROUPS = parse_functions.get_objects_from_dfw(DFW,["source_groups","destination_groups"])
SRVS    = parse_functions.get_objects_from_dfw(DFW,["services"])

FWR_terraform_json = { "map_services": { "SERVICES": SRVS},
                       "map_groups"  : { "GROUPS"  : GROUPS}, 
                       "map_policies": DFW }
write_to_file_indent(terraform_config + "DFW.json",FWR_terraform_json)

SGR_terraform = { item : {"IP":SGR[item]} for item in GROUPS if not item in SGE["groups"] }   
SGR_terraform_json = {"map_grp": SGR_terraform}
write_to_file_indent(terraform_config + "GROUPS.json",SGR_terraform_json)  


SRV_terraform = { item : {SRV[item]["protocol"]:SRV[item]["port"]} for item in SRVS if not item in SGE["services"] and not item == "ANY" }
SERVICES_terraform_json = {"map_svc": SRV_terraform}
write_to_file_indent(terraform_config + "SERVICES.json",SERVICES_terraform_json)