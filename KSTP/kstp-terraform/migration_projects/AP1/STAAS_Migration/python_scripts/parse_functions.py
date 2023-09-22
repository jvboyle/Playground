import json
import re
import copy
import os

def write_to_file_indent(file_name,dictionary):

    with open(file_name, "w") as outfile:
        json.dump(dictionary, outfile, indent=4)

def write_to_file(file_name,dictionary):

    with open(file_name, "w") as outfile:
         json.dump(dictionary, outfile)

def load_file(file_name):
    file_content = open(file_name,)
    return json.loads(file_content.read())

def check_and_create_dir(dir_name):
    try:
        # Create target Directory
        os.mkdir(dir_name)
        print("Directory " ,dir_name ,  " Created ") 
    except FileExistsError:
        print("Directory " ,dir_name ,  " already exists")

def write_to_log(log_file,message):

    f = open(log_file, "a")
    f.write(message+"\n")
    f.close()

def sum_lists(list_of_lists):
    List= []
    for el in list_of_lists:
        List.extend(el)
    return list(set(List))
####################################################
# Parse "IPSETS" worksheet
####################################################
def ipset(worksheet):

    OBJS = {}
    for row in range(3,worksheet.max_row + 1):   
        if worksheet.cell(row,1).value:
            ipset = worksheet.cell(row,1).value

            if worksheet.cell(row,2).value:
               OBJS[ipset] = [ el.strip() for el in worksheet.cell(row,2).value.split(',')]
            else:
               OBJS[ipset] = []
    
    return OBJS

####################################################
# Parse "Security Group Effective Member" worksheet
####################################################
def security_groups_1(worksheet):
    OBJS = {}
    for row in range(3,worksheet.max_row + 1):
    
        if worksheet.cell(row,1).value:
            group = worksheet.cell(row,1).value
            OBJS[group] = {}
            OBJS[group]["vms"] = []
    
        if worksheet.cell(row,3).value:
               OBJS[group]["vms"].append(worksheet.cell(row,3).value.strip())    

    return OBJS 

####################################################
# Parse "Security Group Configuration" worksheet
####################################################

def security_groups_2(worksheet):
    OBJS = {}   
    for row in range(3,worksheet.max_row + 1):
        if worksheet.cell(row,1).value and re.match(r"Security Group Exclude", worksheet.cell(row,1).value):
            ROW = row
            break
        
    for row in range(ROW+2,worksheet.max_row + 1):  
        if worksheet.cell(row,1).value :
           group = worksheet.cell(row,1).value
           OBJS[group] = {}
           OBJS[group]["vms"] = []
           OBJS[group]["ipset"] = []
           OBJS[group]["ips"]    = []
           OBJS[group]["sg"]    = []  
    
        if worksheet.cell(row,6).value:
           
           if re.match(r"VirtualMachine", worksheet.cell(row,5).value):
              OBJS[group]["vms"].append(worksheet.cell(row,6).value)             
              
           if re.match(r"IPSet", worksheet.cell(row,5).value):
              OBJS[group]["ipset"].append(worksheet.cell(row,6).value)
    
           if re.match(r"SecurityGroup", worksheet.cell(row,5).value):
              OBJS[group]["sg"].append(worksheet.cell(row,6).value)
 
              
    return OBJS

####################################################
# Parse "Service_Groups" worksheet
#
# worksheet.cell(row,1).value - Service group name
# worksheet.cell(row,4).value - Hyperlink to application Protocol
#
####################################################
def service_groups( srvgrp_worksheet, srv_worksheet, log_file ):
    OBJS = {}
    for row in range(3,srvgrp_worksheet.max_row + 1):

        if srvgrp_worksheet.cell(row,1).value:
            srvgrp_name = srvgrp_worksheet.cell(row,1).value
            OBJS[srvgrp_name] = {}
            PORTS = {}

        if srvgrp_worksheet.cell(row,4).value:
            #service_member = srvgrp_worksheet.cell(row,4).value

            if( srvgrp_name == "MSSQL Integration Services"):
                print()

            protocol_link = srvgrp_worksheet.cell(row, column=4).hyperlink

            if( protocol_link ):
                location   = protocol_link.location
                tab        = location.partition('!')[0]
                cell       = location.partition('!')[2]
                cellValue  = protocol_link.display

                #srv_name = srv_worksheet.cell( rowNumber, 1 ).value

                # Prevent using linked cells from the same Service_Groups tab.
                if( tab == "Services"):
                    rowNumber  = int(re.findall(r'\d+', cell )[0])

                    if srv_worksheet.cell( rowNumber,3 ).value:
                        protocol = srv_worksheet.cell( rowNumber,3 ).value
    
                        if srv_worksheet.cell( rowNumber,4 ).value:
                            ports = srv_worksheet.cell( rowNumber,4 ).value.split(',')
                        else:
                            ports = ""
                            write_to_log(log_file,"Port for service {} is not defined".format(srvgrp_name))
                else:
                    ports = [f"{cellValue}"]
    
                for port in ports :
                    PORTS.setdefault( protocol, [] ).append(port)
                    OBJS[srvgrp_name] = PORTS

    return OBJS

####################################################
# Parse "Services" worksheet
#
# worksheet.cell(row,1).value - Name
# worksheet.cell(row,3).value - Application Protocol
# worksheet.cell(row,4).value - Value
#
####################################################
def services(worksheet,log_file):
    OBJS = {}   
    for row in range(3,worksheet.max_row + 1):
        if worksheet.cell(row,1).value:
            name = worksheet.cell(row,1).value
            if worksheet.cell(row,3).value:
               protocol = worksheet.cell(row,3).value
               if worksheet.cell(row,4).value:
                  ports = worksheet.cell(row,4).value.split(',')
               else:
                   ports = ""
                   write_to_log(log_file,"Port for service {} is not defined".format(name))
               OBJS[name] = {"protocol": protocol, "port" : ports, "init": True}

    return OBJS

####################################################
# Parse VM_Info worksheet
#
# worksheet.cell(row,1).value - VM Name
# worksheet.cell(row,2).value - Guest IP Address
####################################################
def vms(worksheet,log_file):
    OBJS = {} 
    for row in range(3,worksheet.max_row + 1):
        if worksheet.cell(row,1).value:
            name = worksheet.cell(row,1).value
            if worksheet.cell(row,2).value:                
                OBJS[name] = worksheet.cell(row,2).value
            else:
                write_to_log(log_file,"ip for VM {} is not provided".format(name))
    return OBJS  

#######################################################
# Parse "Object Mapping" worksheet 
# 
# worksheet.cell(row,1).value - Original name
# worksheet.cell(row,2).value - Modified name
# worksheet.cell(row,3).value - Note
#  
#######################################################
def groups_mapping(worksheet,ipsets,prefix):
    OBJS = {}
    
    for row in range(2,worksheet.max_row + 1):
        if worksheet.cell(row,1).value:
            name = worksheet.cell(row,1).value.strip() 
            OBJS[name] = {}
            if worksheet.cell(row,2).value:
               OBJS[name]["new_name"] = worksheet.cell(row,2).value.strip()
            else:
               if name in ipsets:
                   OBJS[name]["new_name"] = prefix + '-SG-' + worksheet.cell(row,1).value.strip()
               else:
                   OBJS[name]["new_name"] = prefix + '-' + worksheet.cell(row,1).value.strip()    
            if worksheet.cell(row,3).value:   
               OBJS[name]["note"] = worksheet.cell(row,3).value.strip()
            else:    
               OBJS[name]["note"] = ""
    return OBJS    
  

####################################################
# Parse Layer 3 Firewall Rules
####################################################
def dfw(worksheet):
    
    OBJS= {} # Dictionary for Distributed firewall rules
    
    for row in range(4,worksheet.max_row + 1):
        # define section
        if worksheet.cell(row,1).value:        
            section_name = worksheet.cell(row,1).value
            OBJS[section_name] = {}
            OBJS[section_name]["category"] = "Application"
            OBJS[section_name]["section_id"] = worksheet.cell(row,2).value
            OBJS[section_name]["rules"] = {}
            
                
        #define rules under section
        if worksheet.cell(row,4).value:        
            rule_name = worksheet.cell(row,4).value 
            rule_dict = {}
            rule_dict["display_name"] = rule_name
            
            if worksheet.cell(row,5).fill.fgColor.rgb == "FFC6EFCE": 
               rule_dict["apply"] = True
            else:
               rule_dict["apply"] = False   
            rule_dict["rule_id"] = worksheet.cell(row,5).value
            rule_dict["source_groups"] = []
            rule_dict["source_ipsets"] = []
            rule_dict["source_ips"] = []
            rule_dict["source_vms"] = []
            rule_dict["destination_groups"] = []
            rule_dict["destination_ipsets"] = []
            rule_dict["destination_ips"] = []
            rule_dict["destination_vms"] = []
            rule_dict["services"] = []
            rule_dict["applied_to"] = []
            rule_dict["action"] = worksheet.cell(row,15).value
            if re.match(r"inout", worksheet.cell(row,16).value):
               rule_dict["direction"] = "IN_OUT"
            else:    
                rule_dict["direction"] = worksheet.cell(row,16).value.upper()
            if re.match(r"Enabled", worksheet.cell(row,3).value):
               rule_dict["disabled"] = False
            else:
               rule_dict["disabled"] = True  
            if worksheet.cell(row,19).value == 1:
               rule_dict["logged"] = True 
            else:
               rule_dict["logged"] = False    
            
            OBJS[section_name]["rules"]["rule_" + str(rule_dict["rule_id"])] = rule_dict
    
        #define source for rule    
        if worksheet.cell(row,8).value:
           
           if worksheet.cell(row,7).value:
               if re.match(r"SecurityGroup", worksheet.cell(row,7).value):
                   source = worksheet.cell(row,8).value
                   rule_dict["source_groups"].append(source)
               else:
                   if re.match(r"IPSet", worksheet.cell(row,7).value):
                      source = worksheet.cell(row,8).value
                      rule_dict["source_ipsets"].append(source)                      
                   else:
                      if re.match(r"VirtualMachine", worksheet.cell(row,7).value):  
                         rule_dict["source_vms"].append(worksheet.cell(row,8).value)                    
                      else:
                         rule_dict["source_ips"].append(worksheet.cell(row,8).value)
        #define destination for rule   
        if worksheet.cell(row,12).value:
           if worksheet.cell(row,11).value: 
                
               if re.match(r"SecurityGroup", worksheet.cell(row,11).value):
                   destination =  worksheet.cell(row,12).value
                   rule_dict["destination_groups"].append(destination)
               else:           
                   if re.match(r"IPSet", worksheet.cell(row,11).value):
                       destination = worksheet.cell(row,12).value
                       rule_dict["destination_ipsets"].append(destination)                  
                   else:
                      if re.match(r"VirtualMachine", worksheet.cell(row,11).value):
                         rule_dict["destination_vms"].append(worksheet.cell(row,12).value) 
                      else:
                         rule_dict["destination_ips"].append(worksheet.cell(row,12).value)
                           
        
        #define services for rule       
        if worksheet.cell(row,14).value:
           #print(worksheet.cell(row,14).value)
           name = worksheet.cell(row,14).value         
           rule_dict["services"].append(name)
    
        #define scope for rule       
        if worksheet.cell(row,18).value:
           rule_dict["applied_to"].append(worksheet.cell(row,18).value)    
    return OBJS        

def groups_definition_by_ip(obj,groups,key):   
    for item in groups.items():
        if key == "sg":
           item[1][key] = list(map(lambda a: obj.get(a,{}).get("vms",[]) + obj.get(a,{}).get("ipset",[]) , item[1][key]))
           item[1][key] = sum_lists(item[1][key])
        else:    
            item[1][key] = list(map(lambda a: obj.get(a,a), item[1][key])) 
            if key == "ipset": 
               item[1][key] = sum_lists(item[1][key])
    return groups

def merge_all_ip(groups):
    OBJS = {}
    for item in groups.items():      
       OBJS[item[0]] = sum_lists([ el for el in item[1].values()])
    return OBJS

def merge_dictionaries(dict1,dict2):
    for key in dict1:
        if key in dict2:
            dict2[key] = list(set(dict2[key] + dict1[key]))
        else:
            dict2[key] =  dict1[key]
    return dict2          



def add_services_from_dfw(dfw,services,services_mapping):
    List = []
    for item in dfw.values():        
        for rule in item["rules"].values():
            List.extend(list(filter(lambda a: re.match(r"^(TCP|UDP)\/[0-9]", a), 
                                    rule["services"]))
                       )
    for item in List:
        name = item.replace('/','-').replace(',','-')
        protocol = item.split('/')[0]
        port     = item.split('/')[1]
        if not name in services:
           services[name] = {"protocol": protocol, "port" : [port], "init": False}
        if not item in services_mapping:
           services_mapping[item] = name             

def filter_dfw(dfw):
    DFW = copy.deepcopy(dfw)
    for item in dfw:        
        for rule in dfw[item]["rules"]:
            if not dfw[item]["rules"][rule]["apply"]:
                del DFW[item]["rules"][rule]
        if not DFW[item]["rules"]:
           del DFW[item]
                        
    return DFW        

def dfw_map_services(dfw,obj,keys):
    for item in dfw.values():        
        for rule in item["rules"].values():
            for key in keys:                  
                rule[key] = list(map(lambda a: obj.get(a,a), rule[key]))

def dfw_map_groups(dfw,obj):
    for item in dfw.values():        
        for rule in item["rules"].values(): 
            for key in ("source_groups","destination_ipsets","destination_groups","source_ipsets","applied_to"):               
                rule[key] = list(map(lambda a: obj.get(a,{"new_name":a}).get("new_name",a), rule[key]))


def adjust_dfw_config(dfw,service):
    DFW = copy.deepcopy(dfw)
    for item in dfw: 
        del DFW[item]["section_id"]     
        for rule in dfw[item]["rules"]:
            DFW[item]["rules"][rule]["logged"] = True
            del DFW[item]["rules"][rule]["applied_to"]
            del DFW[item]["rules"][rule]["rule_id"]
            for (key1,key2) in [("source_groups","source_ipsets"),
            ("destination_groups","destination_ipsets"),
            ("source_ips","source_vms"),("destination_ips","destination_vms")]:
                DFW[item]["rules"][rule][key1] = \
                    DFW[item]["rules"][rule][key1] +\
                         DFW[item]["rules"][rule][key2]
                del DFW[item]["rules"][rule][key2]                                 
            DFW[item]["rules"][rule]["scope"] = DFW[item]["rules"][rule]["source_groups"] +\
                         DFW[item]["rules"][rule]["destination_groups"]
            DFW[item]["rules"][rule]["action"] = DFW[item]["rules"][rule]["action"].upper()                                
        if item == "SRES":
           DFW[service] = DFW[item]
           del DFW[item]                 
    return DFW    

def get_objects_from_dfw(dfw,obj_list): 
    src_dest = set()    
    for item in dfw.values():        
        for rule in item["rules"].values():
            for key in obj_list:
               src_dest.update(rule[key])   
    
    return list(src_dest)           

def replace_group_by_ip(ipset,group,obj_list):
      print(obj_list) 
      obj_list = list(map(lambda a: group.get(a,ipset.get(a)),obj_list) )
      
      return list(set(sum_lists(obj_list)))               
