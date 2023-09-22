import os
import sys
import copy
import json
import shutil
import warnings
import pandas as pd
from datetime import datetime 
import parse_excel_functions as parse

from py_modules import logger
from py_modules import filehelper
from py_modules import foldermenu
from py_modules import names_fix as nf

# 1.01
#   - Changed GW FW rules TF file's name
#   - Updated GW policy resource's name
#   - Updated 'display_name'
# 1.5
#   - Fixed destination_ips without destination_groups
# 1.6
#   - Added shared folders accross the geographies
#   - Created shared folder 112-
# 1.7
#   - Updated existing_rules from new exported file
#   - Fixed enabled/disabled entry for the rules
#   - Moved fix_name and tf_prefix to py_modules\names_fix.py
# 1.75
#   - Created 2 new shared sections for EU1 SRES wave3
# 1.8
#   - Updated empty DRES dataframe check
# 1.9
#   - created shared index 115 for EU 

version = '1.9'

# Just to avoid internal Pandas warning messages
pd.options.mode.chained_assignment = None
warnings.simplefilter(action='ignore', category=FutureWarning)

# Migration date/time
now = datetime.now()
migration_date = now.strftime('%m/%d/%Y %H:%M')

# Set the correct working directory (cwd)
cwd = os.getcwd()

# DEVELOPMENT ONLY ############################################
# cwd = 'C:/KSTP/GIT/kstp-terraform/Tools/Parsing_scripts'
###############################################################

pos = cwd.find('Tools')
if (pos < 0):
    print('This script should be executed within the \'Tools/Parsing_scripts\'.')
    sys.exit(0)
else:
    base_path = cwd[:pos-1]

##############################################################
# MENU OPTIONS                                               #
##############################################################
my_questions = [
    ['Please, select the geography:', True, []],
    ['Please, select the project:', True, []],
    ['Please, select the export folder:', True, []],
    ['Please, select the NSX-V exported file:', False, []]
]
myMenu = foldermenu.FolderBasedMenu(my_questions, 'KSTP NSX-V Migration Parser Script Version {}'.format(version))
myMenu.Question('{}/migration_projects'.format(base_path))
# User exited or an error happened
if (myMenu.exited or myMenu.error):
    print(myMenu.error)
    sys.exit(0)     

start = datetime.now()
##############################################################
# CREATE REQUIRED VARIABLES AND FOLDERS                      #
##############################################################
# Get the inputs
geography   = myMenu.answers[0]
cs_name     = myMenu.answers[1]
export_path = myMenu.answers[2]
export_file = myMenu.answers[3]

# Update CWD 
cwd = '{}/migration_projects/{}/{}'.format(base_path, geography, cs_name)

# Required paths
export_files_path   = '{}/{}'.format(cwd, export_path)
init_config_path    = '{}/draft'.format(cwd)
tf_config_path      = '{}/terraform'.format(cwd)
# tf_groups_path      = '{}/tf_groups'.format(tf_config_path)
tf_gw_path          = '{}/tf_gw'.format(tf_config_path)
tf_shared_path      = '{}/tf_shared'.format(tf_config_path)
terraform_path      = '{}/tf_dfw'.format(tf_config_path)
projects_path       = '{}/projects/{}/Shared'.format(base_path, geography)

# Required files
log_file               = '{}/log/parse_excel.log'.format(cwd)
excel_file             = '{}/{}/{}'.format(cwd, export_path, export_file)
existing_rules_file    = '{}/{}/{}_existing_rules.json'.format(cwd, export_path, geography)
lists_file             = '{}/log/{}-{}-lists.txt'.format(cwd, geography, cs_name)
existing_groups_file   = '{}/{}/{}_existing_groups.json'.format(cwd, export_path, geography)
existing_services_file = '{}/{}/{}_existing_services.json'.format(cwd, export_path, geography)

# Create log and file handler objects
myLoggerObj = logger.AppLogger(log_file, 'console', 'file')
myLogger    = myLoggerObj.log_writer('KSTP_V2T')
myFiles     = filehelper.fileHelper(myLogger)




##############################################################
# PRE STAGE                                                  #
##############################################################

# Log header
print(' ')
print(' ')
myLogger.info('<<<<<<<<<<              STARTING EXCEL PARSE             >>>>>>>>>>')
print(' ')
myLogger.info('Parse version ..: {}'.format(version))
myLogger.info('Migration date..: {}'.format(migration_date))
myLogger.info('Wave information: {}/{}'.format(geography, cs_name))
myLogger.info('Excel parse file: {}'.format(excel_file))
myLogger.info('Current working directory: {}'.format(cwd))
myLogger.info('Log file........: {}'.format(log_file))

################################################################
# Create folders and copy required files
myLogger.info('Copying required files and creating folder structure ...')
myFiles.create_folder('{}'.format(init_config_path))
if (myFiles.file_error):
    myLogger.critical('   |-- Error message: {}'.format(myFiles.file_data))    
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()
myFiles.create_folder('{}'.format(tf_config_path))
if (myFiles.file_error):
    myLogger.critical('   |-- Error message: {}'.format(myFiles.file_data))    
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()
myFiles.create_folder('{}'.format(tf_gw_path))
if (myFiles.file_error):
    myLogger.critical('   |-- Error message: {}'.format(myFiles.file_data))    
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()
myFiles.create_folder('{}'.format(tf_shared_path))
if (myFiles.file_error):
    myLogger.critical('   |-- Error message: {}'.format(myFiles.file_data))    
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()
myFiles.create_folder('{}/201-groups/TF-step-02'.format(terraform_path))
if (myFiles.file_error):
    myLogger.critical('   |-- Error message: {}'.format(myFiles.file_data))    
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()
myFiles.create_folder('{}/parsed_files'.format(init_config_path))
if (myFiles.file_error):
    myLogger.critical('   |-- Error message: {}'.format(myFiles.file_data))    
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()
try:
    # Copy the required terraform files
    for folder in os.scandir('{}/Tools/terraform/templates/tf_child'.format(base_path)):
        shutil.copytree(
            '{}/Tools/terraform/templates/tf_child/{}'.format(base_path, folder.name), 
            '{}/{}'.format(terraform_path, folder.name),
            dirs_exist_ok=True
        )
    # Copy existing files
    for file_name in os.listdir('{}/Tools/mapping_files/{}'.format(base_path, geography)):
        if (os.path.isfile('{}/Tools/mapping_files/{}/{}'.format(base_path, geography, file_name))):
            shutil.copy(
                '{}/Tools/mapping_files/{}/{}'.format(base_path, geography, file_name),
                '{}/{}'.format(export_files_path, file_name)
            )
except Exception as ex:
    myLogger.critical('   |-- Error message: {}'.format(ex))    
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()

try:
    # Read the Excel parse file
    myLogger.info('Reading Excel parse file ...')
    result = parse.read_worksheet(excel_file, None)
    if (result['error']):
        myLogger.critical('   |-- Error message: {}'.format(result['data']))    
        myLogger.info('   |-- Please correct the error above and try again')
        myLogger.info('   |-- The execution will be interrupted')
        myLoggerObj.log_terminate()
    else:
        # Keep the entire Excel file that was read (workbook variable) for future use in the other phases avoiding the need to read the file again
        workbook = result['data']

        myLogger.info('Housekeeping parse file ...')
        myLogger.info('   |-- Layer 3 Firewall Rules')
        excel_layer3 = pd.DataFrame(workbook['Layer 3 Firewall Rules'])
        excel_layer3 = excel_layer3.truncate(before=3).reset_index(drop=True)
        excel_layer3[0].ffill(inplace=True)         # SG name
        for grp_name, grp in excel_layer3.groupby(0):
            excel_layer3.loc[excel_layer3[0]==grp_name, 3] = grp[3].ffill()         # Rule name
            excel_layer3.loc[excel_layer3[0]==grp_name, 4] = grp[4].ffill()
        excel_layer3[19].fillna('', inplace=True)   # Notes 
        excel_layer3.dropna(how='all', inplace=True)
        excel_layer3.fillna('', inplace=True)
        
        myLogger.info('   |-- VM Info & List')
        excel_vminfo = pd.DataFrame(workbook['VM_Info'])
        excel_vminfo = excel_vminfo.truncate(before=2).reset_index(drop=True)
        excel_vminfo[1].fillna('9.9.9.9', inplace=True)  # IPs

        excel_migration_wave = pd.DataFrame(workbook['VM_List'])
        excel_migration_wave = excel_migration_wave.truncate(before=1).reset_index(drop=True)
        tmp_lst = excel_migration_wave[0].tolist()  # name
        vm_list = [item.strip() for item in tmp_lst]
        tmp_lst = excel_migration_wave[1].tolist()  # IP
        ip_list = [item.strip() for item in tmp_lst]

        myLogger.info('   |-- Security Group Effective Member')
        excel_sgem = pd.DataFrame(workbook['Security Group Effective Member'])
        excel_sgem = excel_sgem.truncate(before=2).reset_index(drop=True)
        excel_sgem[0].ffill(inplace=True)

        myLogger.info('   |-- Security Group Configuration')
        excel_sgc = pd.DataFrame(workbook['Security Group Configuration'])
        excel_sgc = excel_sgc.truncate(before=2).reset_index(drop=True)
        excel_sgc[0].ffill(inplace=True)
        #excel_sgc.fillna('', inplace=True)

        myLogger.info('   |-- IPSets')
        excel_ipset = pd.DataFrame(workbook['IPSETS'])
        excel_ipset[1].fillna('9.9.9.9', inplace=True)
        excel_ipset.fillna('', inplace=True)
        #excel_ipset.dropna(how='all', inplace=True)
        excel_ipset = excel_ipset.truncate(before=2).reset_index(drop=True)
        

        myLogger.info('   |-- Services')
        excel_services = pd.DataFrame(workbook['Services'])
        excel_services = excel_services.truncate(before=2)[[0,2,3]].reset_index(drop=True)
        excel_services.fillna('', inplace=True)
        excel_services.drop_duplicates(inplace=True)
        excel_services.columns = [0, 1, 2]

        myLogger.info('   |-- Services Groups')
        excel_service_groups = pd.DataFrame(workbook['Service_Groups'])
        excel_service_groups = excel_service_groups.truncate(before=2)[[0,3]].reset_index(drop=True)
        excel_service_groups[0].ffill(inplace=True)
        excel_service_groups.columns = [0, 1]
        excel_service_groups.fillna('', inplace=True)

        myLogger.info('   |-- Migration list')
        excel_migration_list = pd.DataFrame(workbook['VM_List'])
        excel_migration_list = excel_migration_list.truncate(before=1).reset_index(drop=True)

except Exception as ex:
    myLogger.critical('   |-- Error message: {}'.format(ex))        
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()


##############################################################
# PARSING STAGE                                              #
##############################################################
myLogger.info('Parsing NSX-V info ...')
# Let's parse 
parse_this = {
    'aux': {
        'logger': myLogger,
        'logObject': myLoggerObj,
        'fileHandler': myFiles,
    },
    'data':{
        # IMPORTANT: the order of those sections below matters
        'VMS': {
            'msg': 'Parsing VMs Info ...',
            'worksheets': [excel_vminfo],
            'params': [],
            'file': '{}/all_vms.json'.format(init_config_path)
        },
        # 'VMS' must be parsed BEFORE 'IPSET'
        'IPSETS': {      
            'msg': 'Parsing IPSETS ...',
            'worksheets': [excel_ipset],
            'params': [],
            'file': '{}/all_ipsets.json'.format(init_config_path)
        },
        # 'VMS' and 'IPSETS' must be parsed before 'SG'
        'SG': {
            'msg': 'Parsing Security Group ...',
            'worksheets': [excel_sgc, excel_sgem],
            'params': [],
            'file': '{}/all_sg_members.json'.format(init_config_path)
        },
        'SRV': {
            'msg': 'Parsing Services ...',
            'worksheets': [excel_services, excel_service_groups],
            'params': [],
            'file': '{}/all_services.json'.format(init_config_path)
        },
        # 'SG' and 'IPSET' must be parsed before 'ML'
        # This one will output the RULE list that must be migrated
        'ML': {
            'msg': 'Parsing Migration List ...',
            'worksheets': [excel_migration_list, excel_layer3],
            'params': [],
            'file': '{}/migration_list.json'.format(init_config_path)
        },
        # 'ML' must be parsed before 'DFW'
        'DFW': {
            'msg': 'Parsing Firewall Layer 3 ...',
            'worksheets': [excel_layer3],
            'params': [],
            'file': '{}/parsed_files/all_dfw_rules.json'.format(init_config_path)
        }
    }
}
# It is unecessary to check if the 'result' was a success or not because the execution will be interruped 
# within parse.jblw() if something goes wrong. We just grab the returned value
result = parse.stage(parse_this, migration_date, cs_name, geography, init_config_path)
json_files_content = result['data']

######################################################################################################
# EXISTING GROUPS JSON
try: 
    myLogger.info('   |-- Existing groups file check')
    existing_groups = []
    listed_groups = []
    should_migrate_groups = []
    not_migrated_groups = []       # IMPORTANT: this list will be used during the groups json file creation
    # Get all the groups 
    for key in json_files_content['DFW']:
        listed_groups.extend(json_files_content['DFW'][key]['map_groups']['GROUPS'])
    # Remove duplicated just in case
    listed_groups = list(set(listed_groups))
    if (myFiles.file_exists(existing_groups_file)):
        result = myFiles.read_json_file(existing_groups_file)
        if (result['error']):
            myLogger.critical('      |-- Error reading existing groups file')
            myLogger.warning('      |-- Error message: {}'.format(result['data']))
            myLogger.info('Execution will be interrupted.')
            myLoggerObj.log_terminate()
        else:
            myLogger.info('      |-- Getting existing groups list')
            existing_groups = result['data']['existing_groups'].keys()
            if (existing_groups):
                should_migrate_groups = list(set(listed_groups) - set(existing_groups))           # new
                not_migrated_groups = list(set(listed_groups) - set(should_migrate_groups))       # existing
                if (not_migrated_groups):
                    myLogger.warning('      |-- Identified {} existing groups that were removed from this wave'.format(len(not_migrated_groups)))
            else:
                should_migrate_groups = listed_groups
            # Will be used at the end of the script to update the groups json files
            existing_groups_dict = {
                'Geo': {
                    'ID': geography,
                    'migration_date': migration_date,
                    'wave': cs_name
                },
                'should_migrate': should_migrate_groups,
                'not_migrated': not_migrated_groups,
                'existing_groups': result['data']['existing_groups']
            }
    else:
        myLogger.warning('      |-- Existing groups file not found --> \'{}\''.format(existing_groups_file))
        myLogger.warning('      |-- All groups related to the rules defined will be listed to be migrated')
        # Will be used at the end of the script to update the groups json files
        existing_groups_dict = {
            'Geo': {
                'ID': geography,
                'migration_date': migration_date,
                'wave': cs_name
            },
            'should_migrate': listed_groups,
            'not_migrated': not_migrated_groups,
            'existing_groups': existing_groups
        }
except Exception as ex:
    myLogger.critical('   |-- Existing groups error message: {}'.format(ex))        
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()

######################################################################################################
# EXISTING SERVICES JSON
try: 
    myLogger.info('   |-- Existing services check')
    existing_services = []
    should_migrate_services = []
    listed_services = []
    not_migrated_services = []       # IMPORTANT: this list will be used during the services json file creation
    for key in json_files_content['DFW']:
        for srv_name in json_files_content['DFW'][key]['map_services']['SERVICES']:
            if (srv_name.lower().startswith('tcp') or srv_name.lower().startswith('udp')):
                if (',' in srv_name):
                    srv_name = srv_name.replace(',', '-')
            # listed_services.extend(json_files_content['DFW'][key]['map_services']['SERVICES'])
            listed_services.append(srv_name)
    # Remove duplicated just in case
    listed_services = list(set(listed_services))
    if (myFiles.file_exists(existing_services_file)):
        result = myFiles.read_json_file(existing_services_file)
        if (result['error']):
            myLogger.critical('      |-- Error reading existing services file')
            myLogger.warning('      |-- Error message: {}'.format(result['data']))
            myLogger.info('Execution will be interrupted.')
            myLoggerObj.log_terminate()
        else:
            myLogger.info('      |-- Getting existing services list')
            #existing_services = result['data']['existing_services']
            existing_services_list = result['data']['existing_services']
            existing_services = list(result['data']['existing_services'].keys())
            if (existing_services):
                should_migrate_services = list(set(listed_services) - set(existing_services))           # new
                not_migrated_services = list(set(listed_services) - set(should_migrate_services))       # existing
                if (not_migrated_services):
                    myLogger.warning('      |-- Identified {} existing services that were removed from this wave'.format(len(not_migrated_services)))
            #  Will be used at the end of the script to update the services json files
            existing_services_dict = {
                'Geo': {
                    'ID': geography,
                    'migration_date': migration_date,
                    'wave': cs_name
                },
                'should_migrate': should_migrate_services,
                'not_migrated': not_migrated_services,
                'existing_services': existing_services_list
            }
    else:
        myLogger.warning('      |-- Existing services file not found --> \'{}\''.format(existing_services_file))
        myLogger.warning('      |-- All services related to the rules defined will listed to be migrated')
        #  Will be used at the end of the script to update the services json files
        existing_services_dict = {
            'Geo': {
                'ID': geography,
                'migration_date': migration_date,
                'wave': cs_name
            },
            'should_migrate': listed_services,
            'not_migrated': not_migrated_services,
            'existing_services': existing_services,
        }
except Exception as ex:
    myLogger.critical('   |-- Existing services error message: {}'.format(ex))        
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()

######################################################################################################
# EXISTING RULES JSON
try: 
    rule_list = json_files_content['ML']['rules']['rules']
    myLogger.info('   |-- Existing rules check')
    existing_rules = []
    not_migrated_rules = []       # IMPORTANT: this list will be used during the DFW json file creation
    listed_rules = rule_list
    if (myFiles.file_exists(existing_rules_file)):
        result = myFiles.read_json_file(existing_rules_file)
        if (result['error']):
            myLogger.critical('      |-- Error reading existing rules file')
            myLogger.warning('      |-- Error message: {}'.format(result['data']))
            myLogger.info('Execution will be interrupted.')
            myLoggerObj.log_terminate()
        else:
            myLogger.info('      |-- Getting existing rules list')
            rules_names = list(result['data']['existing_rules'].keys())
            existing_rules = []
            for tmp_rule in rules_names:
                if (tmp_rule.startswith('TF-')):
                    pos = tmp_rule.find('-', 4)
                    tmp_rule = tmp_rule[3:pos]
                    existing_rules.append(tmp_rule)
            if (existing_rules):
                # ATTENTION
                # Updating the initial rule list
                rule_list = list(set(listed_rules) - set(existing_rules))                       # new
                not_migrated_rules = list(set(listed_rules) - set(rule_list))                   # existing
                if (not_migrated_rules):
                    myLogger.warning('      |-- Identified {} existing rules that were removed from this wave'.format(len(not_migrated_rules)))
            #  Will be used at the end of the script to update the rules json files
            existing_rules_dict = {
                'Geo': {
                    'ID': geography,
                    'migration_date': migration_date,
                    'wave': cs_name
                },
                'should_migrate': [str(number) for number in rule_list],
                'not_migrated': not_migrated_rules,
                'existing_rules': existing_rules
            }
    else:
        myLogger.warning('      |-- Existing rules file not found --> \'{}\''.format(existing_rules_file))
        myLogger.warning('      |-- All rules defined will listed to be migrated')
        #  Will be used at the end of the script to update the rules json files
        existing_rules_dict = {
            'Geo': {
                'ID': geography,
                'migration_date': migration_date,
                'wave': cs_name
            },
            'should_migrate': [str(number) for number in rule_list],
            'not_migrated': not_migrated_rules,
            'existing_rules': existing_rules,
        }
except Exception as ex:
    myLogger.critical('   |-- Existing rules error message: {}'.format(ex))        
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()

######################################################################################################
# Creating SERVICES.JSON
try:
    myLogger.info('   |-- Creating Terraform services file ...')
    map_svc = {}
    all_services = json_files_content['SRV']['services']['by_service_name']
    new_services = existing_services_dict['should_migrate']
    if (new_services):
        # We need to split the new_services in 2 list:
        # not_listed_services: services that are not in the all_services list (services tab)
        # listed_services: services that are in the all_services list
        not_listed_services = list(set(new_services) - set(all_services.keys()))
        listed_services = list(set(new_services) - set(not_listed_services))
        if (listed_services):
            # get the info for the listed_services from the all_services as they are there
            map_svc = dict(map(lambda x: (nf.fix_name(x), all_services[x]), listed_services))
        # Let's fix the not_listed group
        for service in not_listed_services:
            if (len(service) > 3):
                proto = service[:4].lower()     # Includes the '-'
                if (proto == 'tcp-') or (proto == 'udp-'):
                    if (',' in service[4:]):
                        ports = service[4:].split(',')
                    else:
                        ports = [service[4:]]
                    # Update the new services names removing spaces, etc., from it
                    service = nf.fix_name(service)
                    map_svc.update({
                        service: {
                            service[:3]: ports
                        }
                    })
                else:
                    myLogger.warning('      |-- Service {} removed from the migration, must be manually created in NSX-T ...'.format(service))
            else:
                myLogger.warning('      |-- Service {} removed from the migration, must be manually created in NSX-T ...'.format(service))
        services_terraform = {
            'map_svc': map_svc
        }
        # save to Terraform folder
        result = myFiles.write_json_file('{}/200-services/SERVICES.auto.tfvars.json'.format(terraform_path), services_terraform)
        if (result["error"]):
                myLogger.critical('      |-- Error creating the Terraform services file')
                myLogger.warning('      |-- Error message: {}'.format(result['data']))
                myLogger.info('Execution will be interrupted.')
                myLoggerObj.log_terminate()

        # There is no need to test the return of this function as it has only 2 conditions: success or the code
        # will be interrupted.
        myFiles.save_services_tf_format('{}/200-services/services.txt'.format(terraform_path), services_terraform)
    else:
        result = myFiles.write_json_file('{}/200-services/SERVICES.txt'.format(terraform_path), 'Services migration not required')
        myLogger.info('   |-- No new services required, all were previously migrated')
except Exception as ex:
    myLogger.critical('   |-- Services file creation error message: {}'.format(ex))        
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()

######################################################################################################
# DFW TF
try:
    if (rule_list):
        myLogger.info('   |-- Finalizing DFW file ...')

        # Set common properties to all sections
        myFiles.file_set_myLogger = myLogger
        myFiles.file_set_myLoggerObj = myLoggerObj
        myFiles.file_set_projects_path = tf_shared_path
        myFiles.file_set_cs_name = cs_name
        myFiles.file_set_geography = geography
        myFiles.file_set_tf_gw_path = tf_gw_path

        dfw_dres_rules = {}
        dfw_dres_groups = []
        dfw_dres_services = []
        for dfw_section_name in json_files_content['DFW']:
            if (dfw_section_name.startswith('TF-DRES') or dfw_section_name.startswith('TF-DRIAMAAS')):
                json_section = json_files_content['DFW'][dfw_section_name]
                tmp_df = copy.deepcopy(json_section['map_policies'])
                if (not_migrated_rules):
                    for key in json_section['map_policies'].keys():
                        for rule in json_section['map_policies'][key]["rules"]:
                            if (str(rule) in not_migrated_rules):    # Came from the existing rules section above
                                tmp_df[key]['rules'].pop(rule)
                            else:
                                # Check for the new services whose name must be updated
                                updated_srv_list = list(map(lambda x: nf.fix_name(x) if (x in existing_services_dict['should_migrate']) else x, json_section['map_policies'][key]['rules'][rule]['services']))
                                json_section['map_policies'][key]['rules'][rule]['services'] = updated_srv_list
                                tmp_df[key]['rules'][rule]['services'] = updated_srv_list
                        # Check if some rule was left, if not remove the section
                        if (not tmp_df[key]['rules']):
                            tmp_df.pop(key)
                if (tmp_df):
                    dfw_dres_rules.update(tmp_df[dfw_section_name]['rules'])
                    # Update the name if required
                    tmp_json = copy.deepcopy(json_files_content['DFW'][dfw_section_name]['map_services']['SERVICES'])
                    for srv_name in tmp_json:
                        if (srv_name in existing_services_dict['should_migrate']):
                            json_files_content['DFW'][dfw_section_name]['map_services']['SERVICES'].remove(srv_name)
                            json_files_content['DFW'][dfw_section_name]['map_services']['SERVICES'].append(nf.fix_name(srv_name))
                    dfw_dres_services.extend(json_files_content['DFW'][dfw_section_name]['map_services']['SERVICES'])
                    dfw_dres_groups.extend(json_files_content['DFW'][dfw_section_name]['map_groups']['GROUPS'])
            else:
                json_section = json_files_content['DFW'][dfw_section_name]
                updated_srv_list = []
                for srv_name in json_section['map_services']['SERVICES']:
                    if (srv_name in existing_services_dict['should_migrate']):
                        updated_srv_list.append(nf.fix_name(srv_name))
                    else:
                        updated_srv_list.append(srv_name)
                json_section['map_services']['SERVICES'] = updated_srv_list
                # Remove the rules that should not be migrated from the DFW json file
                tmp_df = copy.deepcopy(json_section['map_policies'])
                # Remove the rules that should not be migrated
                if (not_migrated_rules):
                    for key in json_section['map_policies'].keys():
                        for rule in json_section['map_policies'][key]["rules"]:
                            if (str(rule) in not_migrated_rules):    # Came from the existing rules section above
                                tmp_df[key]['rules'].pop(rule)
                            else:
                                # Check for the new services whose name must be updated
                                updated_srv_list = list(map(lambda x: nf.fix_name(x) if (x in existing_services_dict['should_migrate']) else x, json_section['map_policies'][key]['rules'][rule]['services']))
                                # json_section['map_policies'][key]['rules'][rule]['services'] = updated_srv_list
                                tmp_df[key]['rules'][rule]['services'] = updated_srv_list
                        # Check if some rule was left, if not remove the section
                        if (not tmp_df[key]['rules']):
                            tmp_df.pop(key)
                if (tmp_df):
                    json_section['map_policies'] = tmp_df
                    # Set specific properties to the current section
                    myFiles.file_set_json_section = json_section
                    myFiles.file_set_dfw_section_name = dfw_section_name
                    # Save them to the projects folder
                    save_to = dfw_section_name.lower().replace('tf-','')
                    myFiles.save_tf_format(save_to, existing_services_list) 
        # Copy all the files from migration_projects, to projects/shared
        for folder in os.scandir('{}'.format(tf_shared_path)):
            myLogger.info('          |-- Copying {} to shared location ...'.format(folder.name))
            shutil.copytree(
                '{}/{}'.format(tf_shared_path, folder.name), 
                '{}/{}'.format(projects_path, folder.name),
                dirs_exist_ok=True
            )
        if (dfw_dres_services):         
            # all individual files were created except the consolidated DFW, let's do it
            dfw_dres_services = list(set(dfw_dres_services))  
            dfw_dres_groups = list(set(dfw_dres_groups))  
            dfw_data = {
                'map_services': {
                    'SERVICES': dfw_dres_services
                },
                'map_groups': {
                    'GROUPS': dfw_dres_groups
                },
                'map_policies': {
                    'TF-{}'.format(cs_name): {
                        'category': 'Application',
                        'rules': dfw_dres_rules
                    } 
                }
            }   
            # Check rules for DRES consolidated version
            # Remove the rules that should not be migrated from the DFW json file
            tmp_df = copy.deepcopy(dfw_data['map_policies'])
            # Remove the rules that should not be migrated
            if (not_migrated_rules):
                for key in dfw_data['map_policies'].keys():
                    for rule in dfw_data['map_policies'][key]["rules"]:
                        if (rule in not_migrated_rules):    # Came from the existing rules section above
                            tmp_df[key]['rules'].pop(rule)
                    # Check if some rule was left, if not remove the section
                    if (not tmp_df[key]['rules']):
                        tmp_df.pop(key)
            if (tmp_df):
                dfw_data['map_policies'] = tmp_df
                # Terraform format
                myFiles.dfw_tf_format(dfw_data, geography, cs_name, existing_services_list)
                if (myFiles.file_error):
                    myLogger.critical('      |-- Error creating DRES DFW TF format file within {}'.format(terraform_path))
                    myLogger.warning('      |-- Error message: {}'.format(myFiles.file_data))
                    myLogger.info('Execution will be interrupted.')
                    myLoggerObj.log_terminate()
                else:
                    tf_data = myFiles.file_data
                    if (myFiles.file_fix_me):
                        myFiles.write_regular_file('{}/202-dfw/TF-DRES_{}.tf.FIX-ME'.format(terraform_path, cs_name), tf_data)
                        if (myFiles.file_error):
                            myLogger.critical('      |-- Error saving DRES DFW TF format file within {}'.format(terraform_path))
                            myLogger.warning('      |-- Error message: {}'.format(myFiles.file_data))
                            myLogger.info('Execution will be interrupted.')
                            myLoggerObj.log_terminate()
                        # Save within the json_config/terraform_config/tf_gw folder    
                        myFiles.write_regular_file('{}/TF-DRES_{}.tf.FIX-ME'.format(tf_gw_path, cs_name), tf_data)
                        if (myFiles.file_error):
                            myLogger.critical('      |-- Error saving DRES DFW TF format file within {}'.format(terraform_path))
                            myLogger.warning('      |-- Error message: {}'.format(myFiles.file_data))
                            myLogger.info('Execution will be interrupted.')
                            myLoggerObj.log_terminate()
                    else:
                        myFiles.write_regular_file('{}/202-dfw/TF-DRES_{}.tf'.format(terraform_path, cs_name), tf_data)
                        if (myFiles.file_error):
                            myLogger.critical('      |-- Error saving DRES DFW TF format file within {}'.format(terraform_path))
                            myLogger.warning('      |-- Error message: {}'.format(myFiles.file_data))
                            myLogger.info('Execution will be interrupted.')
                            myLoggerObj.log_terminate()
                        gw_name = 'TF-GW-{}'.format(cs_name)
                        gw_tf_data = myFiles.update_gw_files('resource "', 10, '"', 'nsxt_policy_gateway_policy', tf_data)
                        gw_tf_data = myFiles.update_gw_files('display_name    = "', 19, '"', gw_name, gw_tf_data)
                        gw_tf_data = myFiles.update_gw_files('category        = "', 19, '"', 'LocalGatewayRules', gw_tf_data)
                        gw_tf_data = myFiles.update_gw_files('nsx_id          = "', 19, '"', gw_name, gw_tf_data)
                        gw_tf_data = myFiles.update_gw_files('scope = [', 9, ']', 'local.gw_scope', gw_tf_data)
                        myFiles.write_regular_file('{}/TF-GW-{}.tf'.format(tf_gw_path, cs_name), gw_tf_data)
                        if (myFiles.file_error):
                            myLogger.critical('      |-- Error saving DRES DFW TF format file within {}'.format(tf_gw_path))
                            myLogger.warning('      |-- Error message: {}'.format(myFiles.file_data))
                            myLogger.info('Execution will be interrupted.')
                            myLoggerObj.log_terminate()
    else:
        myLogger.warning('   |-- No FW rules identified for this migration')
        myLogger.info('      |-- DFW file was not created')
except Exception as ex:
    myLogger.critical('   |-- DFW file creation error message: {}'.format(ex))        
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()

######################################################################################################
# DYNAMIC & STATIC GROUPS
try:
    myLogger.info('   |-- Creating Terraform groups file ...')
    myFiles = filehelper.fileHelper()
    existing_groups = existing_groups_dict['existing_groups']
    not_migrated = []
    all_tf_code = """"""

    ##############################################################
    # TF output templates
    dyn_header       = """resource "nsxt_policy_group" "grp_{}" {{\n   display_name = "{}"\n   nsx_id = "{}"\n   tag {{\n      tag = "TF-${{var.project}}-${{var.environment}}"\n   }}\n"""
    dyn_conjunction  = """   conjunction {\n      operator = "OR"\n   }\n"""
    dyn_criteria     = """   criteria {{\n      condition {{\n         key         = "{}" \n         member_type = "{}"\n         operator    = "{}"\n         value       = "{}"\n      }}\n   }}\n"""
    dyn_ipexpression = """   criteria {{\n      ipaddress_expression {{\n         ip_addresses = {}\n      }}\n   }}\n"""
    dyn_nestedSG     = """   criteria {{\n      path_expression {{\n         member_paths = {}\n      }}\n   }}\n"""
    nestedSG         = "/infra/domains/default/groups/{}"
    dyn_footer      = """}\n"""

    myLogger.info('      |-- TF code for groups ...')
    grp_index = 0
    # This will be used to update the existing groups file at the end
    all_groups_created = []
    
    #######################
    # TF VMs groups section
    myLogger.info('      |-- VMs groups output ...')
    result = myFiles.read_json_file('{}/vm_groups.json'.format(init_config_path))
    if (result['error']):
        myLogger.critical('         |-- Error reading VM groups file: {}'.format(result['data']))        
        myLogger.info('         |-- The execution will be interrupted')
        myLoggerObj.log_terminate()
    else:
        tf_code = """#####################################\n# VM GROUPS\n#\n# Migration date: {}\n# Geography.....: {} \n# Wave..........: {}\n#####################################\n""".format(migration_date, geography, cs_name)
        vm_groups = result['data']   # vm_gorups will be used in other parts of the code below
        to_be_migrated = list(set(vm_groups['map_grp'].keys()) - set(existing_groups))
        for key in to_be_migrated:
            if (not key in existing_groups):
                all_groups_created.append(key)
                ip_list = json.dumps(vm_groups['map_grp'][key]['IP'])
                grp_index += 1
                tf_code += dyn_header.format(grp_index, key, key)
                tf_code += dyn_criteria.format('Name', 'VirtualMachine', 'EQUALS', vm_groups['map_grp'][key]['name'])
                tf_code += dyn_conjunction
                tf_code += dyn_ipexpression.format(ip_list)
                tf_code += dyn_footer
    if (not to_be_migrated):
        tf_code += '\n\n# Nothing to migrate'
    myFiles.write_regular_file('{}/201-groups/101-vm_groups.tf'.format(terraform_path), tf_code)
    if (myFiles.file_error):
        myLogger.critical('         |-- Error saving VMs groups file: {}'.format(myFiles.file_data))        
        myLogger.info('      |-- The execution will be interrupted')
        myLoggerObj.log_terminate()
    all_tf_code += tf_code

    ##########################
    # TF IPSETs groups section
    myLogger.info('      |-- IPSETs groups output ...')
    result = myFiles.read_json_file('{}/ipset_groups.json'.format(init_config_path))
    if (result['error']):
        myLogger.critical('         |-- Error reading IPSET groups file: {}'.format(myFiles.file_data))        
        myLogger.info('        |-- The execution will be interrupted')
        myLoggerObj.log_terminate()
    else:
        tf_code = """#####################################\n# IPSETs GROUPS\n#\n# Migration date: {}\n# Geography.....: {} \n# Wave..........: {}\n#####################################\n""".format(migration_date, geography, cs_name)
        ipset_groups = result['data']
        to_be_migrated = list(set(ipset_groups['map_grp'].keys()) - set(existing_groups))
        for key in to_be_migrated:
            ip_list = ipset_groups['map_grp'][key]['IP']
            if (len(ip_list) > 500):    # NSX-T limit: The total of IPAdressExpressions, MACAddressExpressions, paths in a PathExpression and external IDs in ExternalIDExpression should not exceed 500
                ip_list = json.dumps(ip_list, indent=25)
                # Split the original list in subsets
                subset_list = []
                for i in range(0, total_size, 450):
                    subset_list.append(ip_list[i: i+450])
                # Loop through the new list and create the subgroups for each subset
                new_groups = []
                for subset in subset_list:
                    grp_index += 1
                    new_group_name = '{}-{}'.format(key, grp_index)
                    new_groups.append(new_group_name)
                    all_groups_created.append(new_group_name)
                    tf_code += dyn_header.format(grp_index, new_group_name, new_group_name)
                    tf_code += dyn_ipexpression.format(subset)
                    tf_code += dyn_footer
                # Original group now will be just a mapping to the subgroups created
                all_groups_created.append(key)
                grp_index += 1
                tf_code += dyn_header.format(grp_index, key, key)
                # Get the new VMs groups names, skip VMs that exists in the old group but does not exist in the VM_Info
                all_new_vm_groups = []
                for group in new_groups:
                    new_groups.append(nestedSG.format(group))
                tf_code += dyn_nestedSG.format(json.dumps(new_groups,indent=25))
                tf_code += dyn_footer
            else:
                ip_list = json.dumps(ip_list, indent=25)
                grp_index += 1
                all_groups_created.append(key)
                tf_code += dyn_header.format(grp_index, key, key)
                tf_code += dyn_ipexpression.format(ip_list)
                tf_code += dyn_footer
        if (not to_be_migrated):
            tf_code += '\n\n# Nothing to migrate'
        myFiles.write_regular_file('{}/201-groups/102-ipset_groups.tf'.format(terraform_path), tf_code)
        if (myFiles.file_error):
            myLogger.critical('         |-- Error saving IPSETs groups file: {}'.format(myFiles.file_data))        
            myLogger.info('         |-- The execution will be interrupted')
            myLoggerObj.log_terminate()   

    all_tf_code += tf_code

    #########################
    # TF Empty groups section
    myLogger.info('      |-- Empty groups output ...')
    tf_code = """#####################################\n# EMPTY GROUPS\n#\n# Migration date: {}\n# Geography.....: {} \n# Wave..........: {}\n#####################################\n""".format(migration_date, geography, cs_name)
    tmp_groups = json_files_content['SG']['static_groups']['empty_groups']
    empty_groups = []
    # Must compare using the new name
    for group in tmp_groups:
        result = nf.tf_prefix(geography, group, 'SG')
        if (result['error']):
            myLogger.critical('         |-- Error setting empty group name: {}'.format(result['data']))        
            myLogger.info('         |-- The execution will be interrupted')
            myLoggerObj.log_terminate() 
        else:
            empty_groups.append(result['data'])
    to_be_migrated = list(set(empty_groups) - set(existing_groups))
    for key in to_be_migrated:
        all_groups_created.append(key)
        grp_index += 1
        tf_code += dyn_header.format(grp_index, key, key)
        tf_code += dyn_footer
    if (not to_be_migrated):
        tf_code += '\n\n# Nothing to migrate'
    myFiles.write_regular_file('{}/201-groups/103-empty_groups.tf'.format(terraform_path), tf_code)
    if (myFiles.file_error):
        myLogger.critical('         |-- Error saving empty groups file: {}'.format(result['data']))        
        myLogger.info('         |-- The execution will be interrupted')
        myLoggerObj.log_terminate() 

    all_tf_code += tf_code
    output_warning = {}

    ########################
    # TF SGEM (static) groups section
    myLogger.info('      |-- Static groups output ...')
    tf_code = """#####################################\n# SGEM GROUPS\n#\n# Migration date: {}\n# Geography.....: {} \n# Wave..........: {}\n#####################################\n""".format(migration_date, geography, cs_name)
    all_sgem_groups = json_files_content['SG']['static_groups']['valid_groups']
    to_be_migrated = list(set(all_sgem_groups.keys()) - set(existing_groups))
    for key in to_be_migrated:
        all_new_member_path = []
        all_new_vm_groups = []
        # Original group now will be just a mapping to the subgroups created
        all_groups_created.append(key)
        grp_index += 1
        tf_code += dyn_header.format(grp_index, key, key)
        # Loop through the members type
        for member_type in all_sgem_groups[key]['members'].keys():
            # VM member type
            tf_code_subgroup = """"""
            if (member_type == 'VirtualMachine'):
                vms_list = all_sgem_groups[key]['members'][member_type]
                total_size = len(vms_list)
                if (total_size > 500):    # NSX-T limit: The total of IPAdressExpressions, MACAddressExpressions, paths in a PathExpression and external IDs in ExternalIDExpression should not exceed 500
                    # Split the original list in subsets
                    subset_list = []
                    for i in range(0, total_size, 450):
                        subset_list.append(vms_list[i: i+450])
                    # Loop through the new list and create the subgroups for each subset
                    new_groups = []
                    for subset in subset_list:
                        grp_index += 1
                        new_group_name = '{}-{}'.format(key, grp_index)
                        new_groups.append(new_group_name)
                        all_groups_created.append(new_group_name)
                        tf_code_subgroup += dyn_header.format(grp_index, new_group_name, new_group_name)
                        # Get the new VMs groups names, skip VMs that exists in the old group but does not exist in the VM_Info
                        all_new_vm_groups = []
                        for vm in subset:
                            #for vm in vms_list:
                            if (vm in vm_groups['vm_mapping'].keys()):
                                all_new_vm_groups.append(nestedSG.format(vm_groups['vm_mapping'][vm]))
                            else:
                                myLogger.warning('            |-- The following VM not found in VM_Info: {}'.format(vm))
                        tf_code_subgroup += dyn_nestedSG.format(json.dumps(all_new_vm_groups,indent=25))
                        tf_code_subgroup += dyn_footer
                    # Get the new VMs groups names, skip VMs that exists in the old group but does not exist in the VM_Info
                    all_new_vm_groups = []
                    for group in new_groups:
                        all_new_vm_groups.append(nestedSG.format(group))
                    # tf_code += dyn_nestedSG.format(json.dumps(all_new_vm_groups,indent=25))
                    # tf_code += dyn_footer
                else:
                    # all_groups_created.append(key)
                    # Get the new VMs groups names, skip VMs that exists in the old group but does not exist in the VM_Info
                    all_new_vm_groups = []
                    for vm in vms_list:
                        if (vm in vm_groups['vm_mapping'].keys()):
                            all_new_vm_groups.append(nestedSG.format(vm_groups['vm_mapping'][vm]))
                        else:
                            myLogger.warning('         |-- The following VM not found in VM_Info: {}'.format(vm))
            # SG or IPSET
            if (member_type == 'IPSet') or (member_type == 'SecurityGroup'):
                if (member_type == 'IPSet'):
                    m_type = 'IPSET'
                else:
                    m_type = 'SG'
                all_new_member_path = []
                for member in all_sgem_groups[key]['members'][member_type]:
                    result = nf.tf_prefix(geography, member, m_type)
                    if (result['error']):
                        myLogger.critical('         |-- Error getting member type: {}'.format(result['data']))        
                        myLogger.info('         |-- The execution will be interrupted')
                        myLoggerObj.log_terminate()
                    else:
                        member = result['data']
                    all_new_member_path.append(nestedSG.format(member))

        # Consolidate VM and member_path as they are all SG
        all_new_member_path += all_new_vm_groups

        # Check if the group was created within static groups
        # check how many 'resource' TF groups will be required based on the number of VMs within the criterias
        criterias = all_sgem_groups[key]['criteria']
        if (criterias):
            # remove duplicated entries
            for criteria in criterias.keys():
                items = criterias[criteria]
                items = list(set(items))
                criterias[criteria] = items
            total_conjunctions = 0
            for index_criteria, criteria in enumerate(criterias):
                if (index_criteria > 0):    # If yes, we are still within the loop, we se need a new conjunction
                    if (total_conjunctions < 3):   # One last condition will be the paths
                        tf_code += dyn_conjunction
                        total_conjunctions +=1
                    else:
                        myLogger.warning('         |-- This dynamic group MUST be manually checked/migrated {} -> max VMs limit'.format(key))                
                        output_warning.update({
                            key: {
                                'Issue': {
                                    'Error': 'Automation NSX-T limit exceeded the number of VMs, manual check/migration required',
                                    'Dynamic_query': criterias
                                }
                            }
                        })
                        break
                criteria_name = parse.get_criteria(criteria)
                # all vms within a single criteria
                all_vms = all_sgem_groups[key]['criteria'][criteria]
                for index, vm in enumerate(all_vms):
                    # Add the sub set of VMs to the criteria and check if we should continue
                    tf_code += dyn_criteria.format('Name', 'VirtualMachine', criteria_name, vm)
                    if (index+1 < len(all_vms)):
                        if (total_conjunctions < 4):
                            tf_code += dyn_conjunction
                            total_conjunctions +=1
                        else:
                            myLogger.warning('         |-- This dynamic group MUST be manually checked/migrated {} -> max VMs limit'.format(key))                
                            output_warning.update({
                                key: {
                                    'Issue': {
                                        'Error': 'Automation NSX-T limit exceeded the number of VMs, manual check/migration required',
                                        'Dynamic_query': criterias
                                    }
                                }
                            })
                            break
                if (total_conjunctions > 2):    # no more room
                    break
            if (all_new_member_path):
                tf_code += dyn_conjunction
                tf_code += dyn_nestedSG.format(json.dumps(all_new_member_path,indent=25))
        else:
            if (all_new_member_path):
                tf_code += dyn_nestedSG.format(json.dumps(all_new_member_path,indent=25))
        tf_code += dyn_footer
        if (tf_code_subgroup):
            tf_code += tf_code_subgroup
    if (not to_be_migrated):
        tf_code += '\n\n# Nothing to migrate'
    myFiles.write_regular_file('{}/201-groups/TF-step-02/104-static_groups.tf'.format(terraform_path), tf_code)
    if (myFiles.file_error):
        myLogger.critical('         |-- Error saving empty groups file: {}'.format(result['data']))        
        myLogger.info('         |-- The execution will be interrupted')
        myLoggerObj.log_terminate()

    all_tf_code += tf_code

    ###########################
    # TF dynamic groups section
    myLogger.info('      |-- Dynamic groups output ...')
    tf_code = """#####################################\n# DYNAMIC GROUPS\n#\n# Migration date: {}\n# Geography.....: {} \n# Wave..........: {}\n#####################################\n""".format(migration_date, geography, cs_name)
    dyn_groups = json_files_content['SG']['dynamic_groups']
    #output_warning = {}
    limit_found = False
    to_be_migrated = list(set(dyn_groups) - set(existing_groups))
    for group in to_be_migrated:
        all_groups_created.append(group)
        # Check if the group was created within static groups
        # check how many 'resource' TF groups will be required based on the number of VMs within the criterias
        criterias = dyn_groups[group]['criteria']
        # remove duplicated entries
        for key in criterias.keys():
            items = criterias[key]
            items = list(set(items))
            criterias[key] = items
        # header
        grp_index +=1
        tf_code += dyn_header.format(grp_index, group, group)
        total_conjunctions = 0
        for index_criteria, criteria in enumerate(criterias):
            if (index_criteria > 0):    # If yes, we are still within the loop, we se need a new conjunction
                if (total_conjunctions < 4):   # But we add it only if we have less the 5 conjunctions already included
                    tf_code += dyn_conjunction
                    total_conjunctions +=1
                else:
                    myLogger.warning('         |-- This dynamic group MUST be manually checked/migrated {} -> max VMs limit'.format(group))                
                    output_warning.update({
                        group: {
                            'Issue': {
                                'Error': 'Automation NSX-T limit exceeded the number of VMs, manual check/migration required',
                                'Dynamic_query': criterias
                            }
                        }
                    })
                    break
            criteria_name = parse.get_criteria(criteria)
            # all vms within a single criteria
            all_vms = dyn_groups[group]['criteria'][criteria]
            for index, vm in enumerate(all_vms):
                # Add the sub set of VMs to the criteria and check if we should continue
                if (dyn_groups[group]['query_value'] == 'VM.NAME'):
                    query_value = 'Name'
                if (dyn_groups[group]['query_value'] == 'VM.GUEST_OS_FULL_NAME'):
                    query_value = 'OSName'
                tf_code += dyn_criteria.format(query_value, 'VirtualMachine', criteria_name, vm)
                if (index+1 < len(all_vms)):
                    if (total_conjunctions < 4):
                        tf_code += dyn_conjunction
                        total_conjunctions +=1
                    else:
                        myLogger.warning('         |-- This dynamic group MUST be manually checked/migrated {} -> max VMs limit'.format(group))                
                        output_warning.update({
                            group: {
                                'Issue': {
                                    'Error': 'Automation NSX-T limit exceeded the number of VMs, manual check/migration required',
                                    'Dynamic_query': criterias
                                }
                            }
                        })
                        break
            if (total_conjunctions > 3):    # no more room
                break
        # footer
        tf_code += dyn_footer   
    if (not to_be_migrated):
        tf_code += '\n\n# Nothing to migrate'
    myFiles.write_regular_file('{}/201-groups/TF-step-02/105-dynamic_groups.tf'.format(terraform_path), tf_code)
    if (myFiles.file_error):
        myLogger.critical('         |-- Error saving empty groups file: {}'.format(result['data']))        
        myLogger.info('         |-- The execution will be interrupted')
        myLoggerObj.log_terminate()

    all_tf_code += tf_code
    myFiles.write_regular_file('{}/000-dynamic_groups.tf'.format(init_config_path), all_tf_code)

    # Update the groups that should be created
    existing_groups_dict['should_migrate'] = all_groups_created

except Exception as ex:
    myLogger.critical('   |-- Groups file creation error message: {}'.format(ex))        
    myLogger.info('   |-- Please correct the error above and try again')
    myLogger.info('   |-- The execution will be interrupted')
    myLoggerObj.log_terminate()


############################################################################################
# EXISTING FILES UPDATE
# Must be performed as the last step because this way we have sure that the script wasn't
# interrupted during the process, and it finished successfully.
myLogger.info('   |-- Updating groups, services and rules existing files')
# EXISTING GROUPS JSON
result = myFiles.write_json_file(existing_groups_file, existing_groups_dict)
if (result['error']):
    myLogger.critical('      |-- Error saving {} file'.format(existing_groups_file))
    myLogger.warning('      |-- Error message: {}'.format(result['data']))
    myLogger.info('Execution will be interrupted.')
    myLoggerObj.log_terminate()
else:
    # If there are groups already migrated, display the message
    myLogger.warning('         |-- Please check the file \'{}\''.format(existing_groups_file))
    myLogger.info('         |-- Validate the groups that should be migrated and those that will not be migrated')    

# EXISTING SERVICES JSON
result = myFiles.write_json_file(existing_services_file, existing_services_dict)
if (result['error']):
    myLogger.critical('      |-- Error saving {} file'.format(existing_services_file))
    myLogger.warning('      |-- Error message: {}'.format(result['data']))
    myLogger.info('Execution will be interrupted.')
    myLoggerObj.log_terminate()
else:
    # If there are groups already migrated, display the message
    myLogger.warning('         |-- Please check the file \'{}\''.format(existing_services_file))
    myLogger.info('         |-- Validate the services that should be migrated and those that will not be migrated')

# EXISTING RULES JSON
result = myFiles.write_json_file(existing_rules_file, existing_rules_dict)
if (result['error']):
    myLogger.critical('      |-- Error saving {} file'.format(existing_rules_file))
    myLogger.warning('      |-- Error message: {}'.format(result['data']))
    myLogger.info('Execution will be interrupted.')
    myLoggerObj.log_terminate()
else:
    # If there are groups already migrated, display the message
    myLogger.warning('         |-- Please check the file \'{}\''.format(existing_rules_file))
    myLogger.info('         |-- Validate the rules that should be migrated and those that will not be migrated')

############################################################################################
# Copying final files version to their destination
try:
    myLogger.info('Creating and copying files to projects consumable_service folder')
    project_folder = '{}/projects/{}/consumable_service/{}'.format(base_path, geography, cs_name)
    myFiles.create_folder(project_folder)
    if (myFiles.file_error):
        myLogger.critical('      |-- Error creating {} folder'.format(project_folder))
        myLogger.warning('      |-- Error message: {}'.format(myFiles.file_data))
        myLogger.info('Execution will be interrupted.')
        myLoggerObj.log_terminate()
    else:
        for folder in os.scandir('{}'.format(terraform_path)):
            if (folder.name.lower() == '202-dfw'):
                myLogger.warning('          |-- Skipping {} ...'.format(folder.name))
                myLogger.info('             |-- This folder must be manually checked and, if necessary, manually copied')
            else:
                myLogger.info('          |-- Copying {} ...'.format(folder.name))
                shutil.copytree(
                    '{}/{}'.format(terraform_path, folder.name), 
                    '{}/{}'.format(project_folder, folder.name),
                    dirs_exist_ok=True
                )
except Exception as ex:
    myLogger.critical('      |-- Error preparing Terraform files')
    myLogger.warning('      |-- Error message: {}'.format(ex))
    myLogger.info('Execution will be interrupted.')
    myLoggerObj.log_terminate()

############################################################################################
# Creating admin_info file
try:
    myLogger.info('Creating admin info file')
    admin_output = ''
    new_groups = {}
    all_groups = []
    all_groups = excel_sgc[0].to_list() + excel_sgem[0].to_list()
    all_groups = list(set(all_groups))
    for grp in all_groups:
        new_grp = nf.tf_prefix(geography, grp, 'SG')
        new_groups.update({new_grp['data']: grp})
    for vm in json_files_content['ML']['vms'].keys():
        new_vm_group = json_files_content['ML']['vms'][vm]['new_vm_group']
        vm_groups = json_files_content['ML']['vms'][vm]['groups']
        myLogger.info('   |-- Checking {} ...'.format(vm))
        for section in json_files_content['DFW'].keys():
            if (section in json_files_content['DFW'][section]['map_policies'].keys()):
                rules = json_files_content['DFW'][section]['map_policies'][section]['rules']
                for rule in rules.keys():
                    src_groups = rules[rule]['source_groups']
                    if (new_vm_group in src_groups):
                        # Check for the VM itself
                        admin_output += '{},SOURCE,{}\n'.format(int(rule), vm)
                    #else:
                    # Check for the groups that the VM belongs to
                    result = list(set(vm_groups) - set(src_groups))
                    if (len(result) != len(vm_groups)):
                        # Get only the groups for that particular VM
                        add_grps = list(set(vm_groups) - set(result))  
                        add_grps = list(filter(lambda x: x != '', map(lambda x: new_groups[x] if x in new_groups.keys() else '', add_grps)))
                        # Means that some of the VM's groups were also listed in the rule' source group
                        if (add_grps):
                            admin_output += '{},SOURCE_GRP,{},{}\n'.format(rule, vm,','.join(add_grps))
                    dst_groups = rules[rule]['destination_groups']
                    if (new_vm_group in dst_groups):
                        admin_output += '{},DESTINATION,{}\n'.format(rule, vm)
                    #else:
                    # Check for the groups that the VM belongs to
                    result = list(set(vm_groups) - set(dst_groups))
                    if (len(result) != len(vm_groups)):
                        add_grps = list(set(vm_groups) - set(result)) 
                        add_grps = list(filter(lambda x: x != '', map(lambda x: new_groups[x] if x in new_groups.keys() else '', add_grps)))
                        # Means that some of the VM's groups were also listed in the rule' source group
                        if (add_grps):
                            admin_output += '{},DESTINATION_GRP,{},{}\n'.format(rule, vm,','.join(add_grps))
    # Sort output
    lines = admin_output.split('\n')
    lines.sort(key=lambda x: x[:4])
    
    admin_output = '\n'.join(lines)
    f = open('{}/admin_info.txt'.format(init_config_path), 'w')
    f.write(admin_output)
    f.close()
        

except Exception as ex:
    myLogger.critical('      |-- Error preparing admin info file')
    myLogger.warning('      |-- Error message: {}'.format(ex))
d={'min': 0, 'sec':0}    
done = datetime.now()
delta = done-start
d['min'], d['sec'] = divmod(delta.seconds, 60)
myLogger.info('Parser executed in {} mins and {} secs'.format(d['min'], d['sec']))
# We are done !
myLogger.info('<<<<<<<<<<              FINISHED EXCEL PARSE             >>>>>>>>>>')
print(' ')
print(' ')