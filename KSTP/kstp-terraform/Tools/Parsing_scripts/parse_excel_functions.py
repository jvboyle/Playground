#
# Standard function result format
#
# ALL functions within this module, will return their results in the format of a dictionary
#
# result = {
#   'error': True | False
#   'data': data | error message
# }
#
# If 'error' == True  --> 'data' = error message
# If 'error' == False --> 'data' = function returned data
# 
# The only exception is the flatten_list that will return a list or an string for error

# import json
import copy
# import re
import ast
import pandas as pd
from os.path import basename 
from py_modules import filehelper
from py_modules import ipaddr
from py_modules import names_fix as nf

#######################################################
def stage(parse_this, migration_date, cs_name, geography, init_config_path):
    '''
        This function is just a wrapper, it will get the element that you are parsing
        and the list of required worksheets to do the parse. It then will check which
        function should be called, extract the required worksheets from the list, and
        call the correct function.\n\n
        - 'elem' -> What are you parsing, groups, IPs, IPSETs, etc
        - 'worksheets' -> A list of worksheets required by each 'elem' parse function
        - 'param1' and 'param2' optional arguments that can be used if required 
    '''

    # Get the objects that we need
    myLogger    = parse_this['aux']['logger']
    myLoggerObj = parse_this['aux']['logObject']
    myFiles     = parse_this['aux']['fileHandler']
    
    data = {}
    parse_items = parse_this['data']

    # Loop through everything that must be parsed
    for elem in parse_items:
        myLogger.info('   |-- {}'.format(parse_this['data'][elem]['msg']))
         # VM INFO data
        if (elem == 'VMS'):
            result = get_vms(parse_this['data'][elem]['worksheets'][0],     # 0 --> 'VM_Info'
                             init_config_path,                              # Path to save vms groups json
                             geography)                                     # 'geography
        # IPSET data
        if (elem == 'IPSETS'):
            result = get_ipset(parse_this['data'][elem]['worksheets'][0],   # 0 --> 'IPSETS'
                               init_config_path,                            # Path to save ipsets groups json
                               geography)                                   # 'geography'
        # SECURITY GROUP data
        if (elem == 'SG'):
            result = get_sg(parse_this['data'][elem]['worksheets'][0],      # 0 --> 'Security Group Configuration' 
                            parse_this['data'][elem]['worksheets'][1],      # 1 --> 'Security Group Effective Member' 
                            init_config_path,                               # Path where the services json file will be created
                            data['VMS'],                                    # VMs list
                            data['IPSETS'],                                 # IPSETS
                            migration_date,                                 # 'migration date'
                            cs_name,                                        # 'consumable service name'
                            geography,                                      # 'geography'
                            myLogger)                                       # Logger 
        # ALL SERVICES data
        if (elem == 'SRV'):
            result = get_srv(parse_this['data'][elem]['worksheets'][0],     # 0 --> 'Services'    
                             parse_this['data'][elem]['worksheets'][1],     # 1 --> 'Service Group' 
                             myLogger)                                      # 1 --> 'Service Group'      

        # MIGRATION LIST data
        if (elem == 'ML'):
            result = get_mlist(parse_this['data'][elem]['worksheets'][0],   # 0 --> 'VM_List'
                               parse_this['data'][elem]['worksheets'][1],   # 1 --> 'excel_layer3'
                               data['SG'],                                  # No received, manually included. For this works, 'SG' parse must be performed prior to 'ML'
                               data['IPSETS'],                              # No received, manually included. For this works, 'IPSET' parse must be performed prior to 'ML'
                               migration_date,                              # 'migration date'
                               cs_name,                                     # 'consumable service name'
                               geography,                                   # 'geography'
                               myLogger)                                    # Logger
        # LAYER_3_FIREWALL_RULES.JSON data
        if (elem == 'DFW'):
            result = get_dfw(parse_this['data'][elem]['worksheets'][0],     # 0 --> 'Layer 3 Firewall Rules'
                             data['ML'],                                    # Not received, manually included. For this works, 'VMS' must be parsed before 'DFW'
                             data['SRV'],                                   # Not received, manually included. For this works, 'VMS' must be parsed before 'DFW'
                             myLogger,                                      # Logger
                             init_config_path,                              # Init config path to save the auxiliary file for the admin team
                             data['SG'],
                             data['VMS'])
                             
        
        # Save the file
        if (result['error']):
            myLogger.critical('      |-- Error getting the data for {}'.format(parse_this['data'][elem]['file']))
            myLogger.warning('      |-- Error message: {}'.format(result['data']))
            myLogger.info('Execution will be interrupted.')
            myLoggerObj.log_terminate()
        else:
            # Saves the file
            myFiles.write_json_file(parse_this['data'][elem]['file'], result['data'])
            if (myFiles.file_error):
                myLogger.critical('      |-- Error saving \'{}\''.format(parse_this['data'][elem]['file']))
                myLogger.warning('      |-- Error message: {}'.format(result['data']))
                myLogger.info('Execution will be interrupted.')
                myLoggerObj.log_terminate()
            # Return the json data for future use in another stage, 
            # this way we avoid read all the json files that were just saved
            data.update({
                elem: result['data']
            })
    result = {
        'error': False,
        'data': data
    }
    return result

###############################################################################################
def get_dfw(excel_layer3, migration_list, all_services, myLogger, init_config_path, all_sg, vm_list):
    '''
        This function will return a dictionary with the required structure\n
        for the layer_3_firewall_rules.json file/n/n
        - wks_dfw it is the Layer 3 Firewall Rules tab already cleanned in the pre stage phase
        where the code does a housekeeping on it.
    '''
    excel_layer3 = excel_layer3[[0,2,3,4,6,7,10,11,13,14,15,17,18,19]]
    excel_layer3.columns = [
        'name',                 # col 0
        'rule_status',          # col 2
        'rule_name',            # col 3
        'rule_id',              # col 4
        'source_type',          # col 6
        'source_name',          # col 7
        'destination_type',     # col 10
        'destination_name',     # col 11
        'service_name',         # col 13
        'action',               # col 14
        'direction',            # col 15
        'applied_to',           # col 17
        'log',                  # col 18
        'notes'                 # col 19
    ]

    geography = migration_list['geography']
    myFile = filehelper.fileHelper()
    try:
        # Get the rules that should be migrated
        rules_list = migration_list['rules']['rules']
        # We must convert rules_list back to INT to the filter works
        rules_list = list(map(lambda x: int(x), rules_list))
        # filter only the selected rules identified within the 'ML' parse
        wks_dfw = excel_layer3[excel_layer3['rule_id'].isin(rules_list)]

        # Group by section's name and loop through
        dfw_all = {}
        
        # Get all SGs names
        all_sg_list = []
        all_sg_list.extend(all_sg['dynamic_groups'].keys())
        all_sg_list.extend(all_sg['static_groups']['empty_groups'])
        all_sg_list.extend(all_sg['static_groups']['valid_groups'].keys())

        # All original VM names
        vms = vm_list['vms'].keys()

        # map_policies section
        for group_name, section in wks_dfw.groupby('name'):
            s_ip = 0
            d_ip = 0
            dfw_groups = []
            dfw_services = []
            dfw_rules = {}
            file_name = group_name
            myLogger.info('   |-- Analyzing {}, please wait ...'.format(group_name))
            group_name = group_name.replace(' ', '-').replace('.', '-').strip()
            group_name = 'TF-{}'.format(group_name)
            for rule_id, rule in section.groupby('rule_id'):
                applied_to = rule['applied_to'].to_list()
                # Applied to can have a mix of types, need to separate them to properly format their names
                applied_sg = []
                applied_vm = []
                # applied_to have only SG or VM
                for item in applied_to:
                    if (item in vms):
                        result = nf.tf_prefix(geography, item, 'VM')
                        if (result['error']):
                            return result_dict(True, 'DFW applied to VM -> {}'.format(result['data']))
                        else:
                            applied_vm.append(result['data'])
                    if (item in all_sg_list):  
                        result = nf.tf_prefix(geography, item, 'SG')
                        if (result['error']):
                            return result_dict(True, 'DFW applied to SG -> {}'.format(result['data']))
                        else:
                            applied_sg.append(result['data'])
                applied_to = applied_sg + applied_vm
                source_ipv4 = []
                destination_ipv4 = []
                myLogger.info('      |-- Formating rule {}'.format(rule_id))
                # Fix rule's name
                rule_name = str(rule['rule_name'].iloc[0])  # Convert to string just to be safe and to avoid errors
                rule_name = rule_name.replace(' ', '-').replace('.', '-').strip()
                display_name = 'TF-{}-{}'.format(rule_id, rule_name)
                # Source
                source_vm = rule[rule['source_type']=='VirtualMachine']['source_name'].to_list()
                # Add prefix, VMs have the same format as an IPSET, that's why we use 'IPSET' for VMs
                if (source_vm):
                    source_vm = list(set(source_vm))
                    original_source_vm_list = ','.join(map(lambda item: item, source_vm))
                    result = nf.tf_prefix(geography, source_vm, 'VM')
                    if (result['error']):
                        return result_dict(True, 'DFW source vm -> {}'.format(result['data']))
                    else:
                        source_vm = result['data']
                source_sg = rule[rule['source_type']=='SecurityGroup']['source_name'].to_list()
                # Add prefix
                if (source_sg):
                    source_sg = list(set(source_sg))
                    result = nf.tf_prefix(geography, source_sg, 'SG')
                    if (result['error']):
                        return result_dict(True, 'DFW source vm -> {}'.format(result['data']))
                    else:
                        source_sg = result['data']
                source_ipset = rule[rule['source_type']=='IPSet']['source_name'].to_list()
                # Add prefix
                if (source_ipset):
                    source_ipset = list(set(source_ipset))
                    result = nf.tf_prefix(geography, source_ipset, 'IPSET')
                    if (result['error']):
                        return result_dict(True, 'DFW source vm -> {}'.format(result['data']))
                    else:
                        source_ipset = result['data']
                # Get source IPv4
                source_ipv4 += rule[rule['source_type']=='Ipv4Address']['source_name'].to_list()
                if (source_ipv4):
                    s_ip = s_ip+1
                destination_vm = rule[rule['destination_type']=='VirtualMachine']['destination_name'].to_list()
                # Add prefix, VMs have the same format as an IPSET, that's why we use 'IPSET' for VMs
                if (destination_vm):
                    destination_vm = list(set(destination_vm))
                    original_destination_vm_list = ','.join(map(lambda item: item, destination_vm))
                    result = nf.tf_prefix(geography, destination_vm, 'VM')
                    if (result['error']):
                        return result_dict(True, 'DFW source vm -> {}'.format(result['data']))
                    else:
                        destination_vm = result['data']
                destination_sg = rule[rule['destination_type']=='SecurityGroup']['destination_name'].to_list()
                # Add prefix
                if (destination_sg):
                    destination_sg = list(set(destination_sg))
                    result = nf.tf_prefix(geography, destination_sg, 'SG')
                    if (result['error']):
                        return result_dict(True, 'DFW source vm -> {}'.format(result['data']))
                    else:
                        destination_sg = result['data']
                destination_ipset = rule[rule['destination_type']=='IPSet']['destination_name'].to_list()
                # Add prefix
                if (destination_ipset):
                    destination_ipset = list(set(destination_ipset))
                    result = nf.tf_prefix(geography, destination_ipset, 'IPSET')
                    if (result['error']):
                        return result_dict(True, 'DFW source vm -> {}'.format(result['data']))
                    else:
                        destination_ipset = result['data']
                # Get source IPv4
                destination_ipv4 += rule[rule['destination_type']=='Ipv4Address']['destination_name'].to_list()
                if (destination_ipv4):
                    d_ip = d_ip+1
                # Services 
                services_groups = all_services['service_groups'].keys()  
                services = rule[rule['service_name'] != '']['service_name'].to_list()
                services = flatten_list(services, True)
                if ('ANY' in services):
                    services.remove('ANY')
                if ('any' in services):
                    services.remove('any')
                if (isinstance(services, str)):
                    return result_dict(True, 'firewall layer 3 services -> {}'.format(services))
                else:
                    # chg_get_dfw_01
                    tmp_list = services[:]
                    for elem in tmp_list:
                        pos = elem.find('/')
                        if (pos > 0):
                            proto = elem[:pos].upper()
                            if (((proto == 'TCP') or (proto == 'UDP')) and (',' in elem)):
                                # Remove the old one from services
                                services.remove(elem)
                                elem = elem[pos+1:]
                                elem = list(map(lambda x: '{}-{}'.format(proto,x), elem.split(',')))
                                # Add the new ones
                                services = services + elem
                    services = list(set(services))
                    for index, service in enumerate(services):
                        if (service in services_groups):
                            # remove the service group reference from the list
                            services.pop(index)  
                            # add all services from that service group to the list   
                            services = services + all_services['service_groups'][service]
                    # Adjust service name
                    services = list(map(lambda x: x.replace('/','-').replace('tcp-','TCP-').replace('udp-', 'UDP-').strip(), services))
                # Action
                action = rule['action'].iloc[0].upper()
                # Direction
                direction = rule['direction'].iloc[0]
                if (direction.lower() == 'inout'):
                    direction = 'IN_OUT'
                else:
                    direction = direction.upper()
                # Log
                logged = rule['log'].iloc[0]
                # Notes
                notes = rule['notes'].iloc[0]
                source_groups = list(set(source_sg + source_vm + source_ipset))
                destination_groups = list(set(destination_sg + destination_vm + destination_ipset))
                # Create the consolidated scope list, and append it to the DFW groups
                scope = list(set(source_groups + destination_groups + applied_to))
                dfw_groups.extend(scope)
                dfw_services.extend(services)
                source_ipv4 = list(set(source_ipv4))
                if (source_ipv4):
                    result = flatten_list(source_ipv4, True, True)
                    if (isinstance(result, str)):
                        return result_dict(True, 'DFW error converting source IPs -> <>'.format(result)) 
                    else:
                        source_ipv4 = result
                destination_ipv4 = list(set(destination_ipv4))
                if (destination_ipv4):
                    result = flatten_list(destination_ipv4, True, True)
                    if (isinstance(result, str)):
                        return result_dict(True, 'DFW error converting destination IPs -> <>'.format(result)) 
                    else:
                        destination_ipv4 = result
                if (source_groups or source_ipv4 or destination_groups or destination_ipv4):
                    # display_name = display_name.encode('unicode_escape').decode('utf-8').replace('\\u2013', '').replace('--', '-')
                    display_name = nf.fix_name(display_name)
                    if (rule['rule_status'].iloc[0].lower() == 'enabled'):
                        disabled = False
                    else:
                        disabled = True
                    # Format the rule section
                    rule_to_append = {
                        rule_id: {
                            'display_name': display_name,
                            'disabled': disabled,
                            'source_groups': source_groups,
                            'source_ips': source_ipv4,
                            'destination_groups': destination_groups,
                            'destination_ips': destination_ipv4,
                            'services': services,
                            'action': action,
                            'direction': direction,
                            'logged': logged,
                            'notes': notes,
                            'scope': scope
                        }
                    }
                    # Append the rules IDs that must go within their section
                    dfw_rules.update(rule_to_append)
            if (dfw_rules):    
                # Append the sections
                policy_to_append = {
                    group_name: {
                        'category': 'Application',
                        'rules': dfw_rules
                    }
                }
                # remove all duplicated entries
                dfw_services = flatten_list(dfw_services, True, False)
                if (isinstance(dfw_services, str)):
                    return result_dict(True, 'DFW services json -> {}'.format(dfw_services))
                dfw_groups = flatten_list(dfw_groups, True)
                if (isinstance(dfw_groups, str)):
                    return result_dict(True, 'DFW groups json -> {}'.format(dfw_groups))
                # DFW final output
                dfw_data = {
                    'map_services': {
                        'SERVICES': dfw_services
                    },
                    'map_groups': {
                        'GROUPS': dfw_groups
                    },
                    'map_policies': policy_to_append
                }
                dfw_all.update({
                    group_name: dfw_data
                })
                myFile.write_json_file('{}/parsed_files/{}.json'.format(init_config_path, file_name), dfw_data)
        return result_dict(False, dfw_all)

    except Exception as ex:
        return result_dict(True, 'get dfw exception --> {} - {}'.format(ex, ex.__doc__))

###############################################################################################
def get_mlist(wks_migration, excel_layer3, sg_list, ipsets_list, migration_date, cs_name, geography, myLogger):
    '''
        This function will get the migration VM list, updated every VM on it with the \n
        information about their IP, SG which they belong, and IPSETs
    '''
    try:
        # Get all possible information for each VM that should be migrated
        mig_dict = {}
        sg_names = []
        myLogger.info('      |-- Processing VMs and IPs, please wait ...')
        for row in wks_migration.itertuples():
            vm = row[1].strip()
            ip = row[2].strip()
            # Check if the VM is actually part of a group or ipset
            if (vm in sg_list['vms_and_groups']['original_groups'].keys()):
                # 'original_name' is used below to identify the rules as the Excel only have the original names
                groups = sg_list['vms_and_groups']['original_groups'][vm]   
                sg_names.append(groups)
            else:
                groups = []
                sg_list['vms_and_groups']['new_groups'][vm] = []
                sg_list['vms_and_groups']['original_groups'][vm] = []
            # The VM itself will have its own group, let's add that
            result = nf.tf_prefix(geography, vm, 'VM')
            if (result['error']):
                return result_dict(True, 'error preparing VM\'s name -> {}'.format(result['data']))
            else: 
                vm_group_name = result['data']
                sg_list['vms_and_groups']['new_groups'][vm].append(vm_group_name)
            mig_dict.update({
                vm.strip(): {
                    'new_vm_group': vm_group_name,
                    'ip': ip,
                    'groups': sg_list['vms_and_groups']['new_groups'][vm],   # 'new_groups' are appended as they'll be used in the future
                    'original_groups': sg_list['vms_and_groups']['original_groups'][vm]
                },
            })

        ############################################
        # Identifing the RULES that must be migrated
        myLogger.info('      |-- Selecting the rules to be applied ...')
        rule_list = []

        # Step 1: get the VMs IPs from the migration list to check which IPSET applies
        ipset_list = list(map(lambda list_item: list_item.split('\n') if '\n' in list_item else list_item, wks_migration[1].to_list()))
        ipset_list = flatten_list(ipset_list, True)
        if(isinstance(ipset_list, str)):
            return result_dict(True, 'Error getting IPSet list for the migration list -> {}'.format(ipset_list))
        result = get_migration_ipsets(wks_migration[1].to_list(), ipsets_list)
        if (result['error']):
            return result
        else:
            valid_ipsets = result['data']

        sg_names = flatten_list(sg_names,True, True)
        if (isinstance(sg_names, str)):
            result = {
                'error': True,
                'data': sg_names
            }
            return result
        
        # Step 2: check layer 3 
        myLogger.info('      |-- Selecting rules from firewall layer 3 ...')
        myLogger.info('         |-- There are {} lines to be checked, this may take some time. Please wait ...'.format(len(excel_layer3)))
        by_vm=0
        by_sg=0
        by_ipset=0
        tmp_list = wks_migration[0].to_list()
        vm_list = [item.strip() for item in tmp_list]
        for index, grp in excel_layer3.groupby(4):
            applied_to = grp[17].to_list()
            ###########################
            # Applicable rules by VMs
            all_vms = grp[grp[6]=='VirtualMachine'][7].to_list()
            all_vms.extend(grp[grp[10]=='VirtualMachine'][11].to_list())
            all_vms.extend(applied_to)
            result = set(all_vms) - set(vm_list)
            if (result != set(all_vms)): 
                by_vm+=1
                rule_list.extend([grp[4].iloc[0]])

            ###########################
            # Applicable rules by SG
            all_sgs = grp[grp[6]=='SecurityGroup'][7].to_list()
            all_sgs.extend(grp[grp[10]=='SecurityGroup'][11].to_list())
            all_sgs.extend(applied_to)
            all_sgs = list(set(all_sgs)) 
            all_sgs = [item.strip() for item in all_sgs] 
            sg_names = [item.strip() for item in sg_names] 
            result = set(all_sgs) - set(sg_names)
            if (result != set(all_sgs)): 
                by_sg+=1
                rule_list.extend([grp[4].iloc[0]])

            ###########################
            # Applicable rules by IPSets
            layer3_ipset = grp[grp[6]=='IPSet'][7].to_list()
            layer3_ipset.extend(grp[grp[10]=='IPSet'][11].to_list())   # There is no IPSET in the applied_to
            layer3_ipset = list(set(layer3_ipset))
            if (layer3_ipset):
                # Get the IPSETs value from the IPSET info
                layer3_ipset = [item.strip() for item in layer3_ipset]
                valid_ipsets = [item.strip() for item in valid_ipsets]
                result = set(layer3_ipset) - set(valid_ipsets)
                # Check if there is some IPSET within the group_ipset that must be validated
                if (result != set(layer3_ipset)):
                    by_ipset+=1
                    rule_list.extend([grp[4].iloc[0]])
        # Get unique values
        rule_list = list(set(rule_list))
        myLogger.info('         |-- {} rules selected'.format(len(rule_list)))
        # Convert to string otherwise json.dump() will fail later when it will try to save the file
        rule_list = [str(rule) for rule in rule_list]
        # Return the rules list along with other information
        result = {
            'error': False,
            'data': {
                'migration_date': migration_date,
                'geography': geography,
                'wave': cs_name,
                'rules': {
                    'total': len(rule_list),
                    'rules': rule_list
                },
                'vms': mig_dict
            }
        }
    except Exception as ex:
        result = {
            'error': True,
            'data': 'get migration list -> {}'.format(ex)
        }
    return result

###############################################################################################
def get_migration_ipsets(vmips_to_check, ipsets_dict):
    '''
        Check if the VM IP is within the IPSETs
    '''
    try:
        valid_ipset = []
        myIP = ipaddr.IPChecker()
        # Loop through the IPSET list
        for ipset_name in ipsets_dict['ipsets'].keys():
            ipset_ip = ipsets_dict['ipsets'][ipset_name].split(':')
            ipset_ip = ast.literal_eval(ipset_ip[1])
            myIP.check_ip_range(vmips_to_check, ipset_ip)
            if (myIP.error):
                result = {
                    'error': True,
                    'data': 'validating VM IP address -> {}'.format(myIP.error_msg)
                }
            else:
                if (myIP.is_in_range):
                    valid_ipset.append(ipset_name)
        result = {
            'error': False,
            'data': valid_ipset
        }
    except Exception as ex:
        result = {
            'error': True,
            'data': 'getting IPSETs IPs -> {}'.format(ex)
        }
    return result

###############################################################################################
def get_srv(wks_srv, wks_srv_groups, myLogger):
    '''
        This function will return a dictionary with the required structure\n
        for the services file
        - wks_srv        -> 'Services' tab
        - wks_srv_groups -> 'Service_Groups'tab
    '''
    try:
        # This lambda function will split the item if necessary
        #lambda_split = lambda x: [item.strip() for item in str(x.iloc[0]).split(',')]

        # SERVICES
        wks_srv = wks_srv[wks_srv[1].ne('') & wks_srv[2].ne('')]
        srv_by_port = {}
        # Grouped by port
        for port_num, ports in wks_srv.groupby(2):
            srv_name = ports[0].iloc[0]
            result = {
                port_num: {
                    ports[1].iloc[0]: srv_name
                }
            }
            srv_by_port.update(result)
        
        # Grouped by service name
        srv_by_name = {}
        for service_name, services in wks_srv.groupby(0):
            srv_name = service_name
            ports = services[2].iloc[0]
            if (',' in ports):
                ports = ports.split(',')
            else:
                ports = [ports]
            result = {
                srv_name: {
                    services[1].iloc[0]: ports
                }
            }
            srv_by_name.update(result)

        # SERVICES GROUPS
        srv_groups = wks_srv_groups.groupby(0)[1].apply(list).to_dict()
        for group in srv_groups:
            myLogger.info('      |--> Checking group {}'.format(group))
            result = flatten_list(srv_groups[group], True, True)
            if (isinstance(result, str)):
                return result_dict(True, 'service groups -> {}'.format(result))
            else:
                srv_groups[group] = result
        all_services = {
            'services': {
                'by_port': srv_by_port,
                'by_service_name': srv_by_name
            },
            'service_groups': srv_groups
        }

        result = {
            'error': False,
            'data': all_services
        }
    except Exception as ex:
        result = {
            'error': True,
            'data': 'get srv --> {} - {}'.format(ex, ex.__doc__)
        }
    return result 

###############################################################################################
def get_sg(wks_sgc, wks_sgem, init_config_path, vms_list, all_ipsets, migration_date, cs_name, geography, myLogger):
    '''
        This function will return a dictionary with the required structure\n
        for the all_sg_members.json file
    '''
    try:
        
        #####################################################
        # DYNAMIC GROUPS
        dynamic = copy.deepcopy(wks_sgc)
        myLogger.info('      |-- Getting dynamic groups ...')
        all_dynamic_sg_members = {}
        dynamic[4].ffill(inplace=True)
        dynamic.fillna('', inplace=True)
        dynamic = dynamic[dynamic[4].str.contains('dynamic', case=False) & ((dynamic[5] == 'VM.NAME') | (dynamic[5] == 'VM.GUEST_OS_FULL_NAME'))]
        if (not dynamic.empty):
            for group_name, group in dynamic.groupby(0):
                members_dict = group.groupby(7)[8].apply(list).to_dict()
                # Update the SG name
                result = nf.tf_prefix(geography, group_name, 'SG')
                if (result['error']):
                    result['data'] = 'Error updating dynamic group name ({}) -> {}'.format(group_name, result['data'])
                    return result
                else:
                    new_name = result['data']
                groups_dict = {
                    new_name: {
                        'original_name': group_name,
                        'type': 'dynamic',
                        'query_value': group[5].iloc[0],
                        'criteria': members_dict
                    }
                }
                all_dynamic_sg_members.update(groups_dict)

        wks_sgc.fillna('', inplace=True)
        
        #####################################################
        # SGEI section
        sgei_list = []
        cut = wks_sgc[wks_sgc[0] == 'Security Group Exclude & Include Membership']
        if (not cut.empty):
            cut = int(cut.index[0])
            # Security Group Exclude & Include Membership section
            wks_sgei = copy.deepcopy(wks_sgc)
    
            # Include & Exclude only
            wks_sgei = wks_sgei.truncate(before=cut+2).iloc[:,[0,3,4,5]]
            wks_sgei = wks_sgei[wks_sgei[3] != ''].reset_index(drop=True)
            sgei_list = list(set(wks_sgei[0].to_list()))

        # Get the list of static groups that must be checked along with the static groups from SG effective membership
        static_to_check = wks_sgc[wks_sgc[4].str.contains('static', case=False)][0].to_list()
        sgem_list = list(set(wks_sgem[0].to_list()))

        #####################################################
        # EMPTY GROUPS
        myLogger.info('      |-- Getting empty groups ...')
        empty_groups_list = list(set(static_to_check) - set(sgei_list))         # What is not in the SGEI section
        if (empty_groups_list):
            empty_groups_list = list(set(empty_groups_list) - set(sgem_list))   # What is not in the SGEM section, and therefore, it is in nowhere

        all_static_groups = {}

        #####################################################
        # SGEM GROUP
        myLogger.info('      |-- Getting SGEM group ...')
        for sgem_name, sgem_group in wks_sgem.groupby(0):
            result = nf.tf_prefix(geography, sgem_name, 'SG')
            if (result['error']):
                return result_dict(True, 'Error getting merged SGEM list -> {}'.format(result['data']))
            else:
                new_name = result['data']
            if (not new_name in all_dynamic_sg_members):
                all_static_groups.update({
                    new_name: {
                        'original_name': sgem_name,
                        'type': 'static',
                        'members': {
                            'VirtualMachine': sgem_group[2].to_list()
                        }
                    }
                })

        #####################################################
        # Consolidate SGEI & SGEM
        myLogger.info('      |-- Getting security groups exclude & include unique groups ...')
        sgei_only_dict = {}
        if (sgei_list):     
            for sgei_name, sgei_group in wks_sgei.groupby(0):
                result = nf.tf_prefix(geography, sgei_name, 'SG')
                if (result['error']):
                    return result_dict(True, 'Error getting merged SGEM list -> {}'.format(result['data']))
                else:
                    new_name = result['data']
                # Check if it exists
                if (sgei_name in sgem_list):
                        if (not new_name in all_dynamic_sg_members):
                            unique_members = all_static_groups[new_name]['members']
                            # Consolidate only the members from SGEI
                            for member_name, member_group in wks_sgei[wks_sgei[0]==sgei_name].groupby(4):
                                if (member_name in unique_members.keys()):
                                    # Consolidate
                                    unique_members[member_name] += member_group[5].to_list()
                                    unique_members[member_name] = list(set(unique_members[member_name]))
                                    all_static_groups[new_name]['members'][member_name] = unique_members[member_name]
                                else:
                                    all_static_groups[new_name]['members'][member_name] = member_group[5].to_list()
                else:
                    all_static_groups.update({
                    new_name: {
                        'original_name': sgei_name,
                        'type': 'static',
                        'members': sgei_group.groupby(4)[5].apply(list).to_dict()
                    }
                })
                    
        # Dynamic groups and SGEI must merge with SGEM and create a single groups list, except for empty groups

        #####################################################
        # SGEM & DYNAMICS GROUPS
        myLogger.info('      |-- Getting security groups effective membership ...')
        members_dict = {}
        # sgem_only_dict = {}
        #     wks_sgem_only = wks_sgem    # Just to avoid duplicate code below
        for sgem_group in all_static_groups.keys():
            if (sgem_group in all_dynamic_sg_members.keys()):
                all_static_groups[sgem_group]['criteria'] = all_dynamic_sg_members[sgem_group]['criteria']
                all_dynamic_sg_members.pop(sgem_group)
            else:
                all_static_groups[sgem_group]['criteria'] = {}

        #####################################################
        # VMS_AND_GROUPS section
        myLogger.info('      |-- Getting VMs and groups info ...')
        sg_groups = {}
        all_static_sg_members = {}
        vms_groups = {}
        vms_new_groups = {}
        # counter_sta = 0
        vm_list_keys = vms_list['vms'].keys()
        myLogger.info('      |-- Getting static groups, please wait ...')
        for sgem_name, sgem_group in wks_sgem.groupby(0):
            result = nf.tf_prefix(geography, sgem_name, 'SG')
            if (result['error']):
                result['data'] = 'Error updating new SG name ({}) -> {}'.format(sgem_name, result['data'])
                return result
            else:
                sgem_new_name = result['data']
            vms_ips = []
            # counter_sta += 1
            sgem_vms = sgem_group[2].to_list()
            # vms_and_groups section
            for vm in sgem_vms:
                if vm in vms_groups.keys(): 
                    vms_groups[vm].append(sgem_name)   # sgem_name is the ORIGINAL group's name (no prefix)
                    vms_new_groups[vm].append(sgem_new_name)
                else:
                    vms_groups[vm] = [sgem_name]
                    vms_new_groups[vm] = [sgem_new_name]
                # Get the VM IP
                if (vm in vm_list_keys):
                    vm_ip = vms_list['vms'][vm]     # It should returns <group_name>:<ip_address>
                    if (vm_ip):
                        vm_ip = vm_ip.split(':')
                        vms_ips.append(vm_ip[1])    # We want the IP
                    else:
                        myLogger.warning('         |-- {} has no IP assigned to it'.format(vm))
                        vms_ips.append('9.9.9.9')
                else:
                    myLogger.warning('         |-- {} virtual machine not found'.format(vm))
            # Add the prefix
            result = nf.tf_prefix(geography, sgem_name, 'SG')
            if (result['error']):
                result['data'] = 'Error updating SG name ({}) -> {}'.format(sgem_name, result['data'])
                return result
            else:
                new_name = result['data']
            all_static_sg_members.update({
                new_name: {
                    'original_name': sgem_name,
                    'type': 'static',
                    'members': {
                        'VirtualMachine': sgem_vms
                    }
                }
            })   
            # remove '9.9.9.9' duplicates if they exists
            if ('9.9.9.9' in vms_ips):
                vms_ips = list(set(vms_ips))
            # Save services json
            sg_groups.update({
                new_name: {
                    'IP': vms_ips
                }
            })
        all_sg_members = {
            'geography': geography,
            'wave': cs_name,
            'migration_date': migration_date,
            'dynamic_groups': all_dynamic_sg_members,
            'static_groups': {
                'empty_groups': empty_groups_list,
                #'only_sgei': sgei_only_dict,
                'valid_groups': all_static_groups,
                #'sgei_sgem': sgei_sgem_dict
            },
            'vms_and_groups': {
                'new_groups': vms_new_groups,
                'original_groups': vms_groups
            }
        }

        result = {
            'error': False,
            'data': all_sg_members
        }
    except Exception as ex:
        result = {
            'error': True,
            'data': 'get sgc --> {} - {}'.format(ex, ex.__doc__)
        }
    return result

###############################################################################################
def get_vms(wks_vms, init_config_path, geography):
    '''
        This function will return a list of VMs from the 'VM_Info' tab
    '''
    try:
        # VM list
        vms={}
        ips={}
        vms_groups = {}
        vms_mapping = {}
        items = wks_vms[wks_vms[0].notna()][[0,1]]
        for row in items.itertuples():
            # vms[<name>] = <IP>
            vm = row[1]
            ip = str(row[2])
            result = nf.tf_prefix(geography, vm, 'VM')
            if (result['error']):
                return result_dict(True, 'updating VM group name -> {}'.format(result['data']))
            else:
                vm_group_name = result['data']
            # {<vm> : 'vm_group_name:ip}
            vms.update({vm: '{}:{}'.format(vm_group_name, ip)})
            # {<ip> : 'vm_group_name:<vm>}
            ips.update({ip:'{}:{}'.format(vm_group_name, vm)})
            # VM groups json
            vms_groups.update({
                vm_group_name:{
                    'name': vm,
                    'IP':[ip]
                }
            })
            vms_mapping.update({vm: vm_group_name})
        dict_vm = {
            'vms': vms,
            'ips': ips
        }
        result = {
            'error': False,
            'data': dict_vm
        }
        myFiles = filehelper.fileHelper()
        vms_groups = {
            'map_grp': vms_groups,
            'vm_mapping': vms_mapping
        }
        myFiles.write_json_file('{}/vm_groups.json'.format(init_config_path),vms_groups)
        if (myFiles.file_error):
            return result_dict(True, 'creating VM groups json file -> <>'.format(myFiles.file_data))
    except Exception as ex:
        result = {
            'error': True,
            'data': 'get vms --> {} - {}'.format(ex, ex.__doc__)
        }
    return result 

###############################################################################################
def get_ipset(wks_ipset, init_config_path, geography):
    '''
        This function will return a list of IPSETs from the 'IPSETS' tab
    '''
    try:
        # IPSET list
        ipset_groups={}
        ipset_mapping = {}
        ipset = {}
        items = wks_ipset[wks_ipset[1].notna()][[0,1]]
        network_address_error = []
        for row in items.itertuples():
            name = row[1]
            original_name = name
            result = nf.tf_prefix(geography, name, 'IPSET')
            if (result['error']):
                return result_dict(True, 'error getting IPSET group name -> {}'.format(result['data']))
            else:
                name = result['data']
            item = str(row[2])
            # Addresses
            result = flatten_list([item], True, True)
            if (isinstance(result, str)):
                result = {
                    'error': True,
                    'data': 'get ipset ips --> {}'.format(result)
                }
                return result   # IPs list
            else:
                # ipset[<name>] = <List of IPs>
                for ip in result:
                    if '/' in ip:
                        network_address_error.append('{}'.format(name))
                ipset_groups.update({
                    name: {
                        'name': original_name,
                        'IP': result
                    }
                })
                ipset_mapping.update({original_name: name})
                ipset.update({
                    row[1]: '{}:{}'.format(name, result)
                })
        # if (network_address_error):
        #     network_address_error = list(set(network_address_error))
        #     return result_dict(True, 'Invalid network addresses found for these IPSets -> \n\n{}\n\n'.format(network_address_error))
        result = {
            'error': False,
            'data': {
                'ipsets': ipset
                # 'vms_and_ipsets': vm_ipset
            }
        }
        # Save json file
        myFiles = filehelper.fileHelper()
        ipset_groups = {
            'map_grp': ipset_groups,
            'ipset_mapping': ipset_mapping
        }
        myFiles.write_json_file('{}/ipset_groups.json'.format(init_config_path), ipset_groups)
        if (myFiles.file_error):
            return result_dict(True, 'saving ipsets json -> {}'.format(myFiles.file_data))
    except Exception as ex:
        result = {
            'error': True,
            'data': 'get ipset --> {} - {}'.format(ex, ex.__doc__)
        }
    return result 

###############################################################################################
def flatten_list(lst, remove_duplicates=False, split=False):
    '''
        Get a list of lists, and return one single list with all elements.
        - 'remove_duplicates' is False (default value), you may have  
        duplicated elements in the final list. If True, duplicates elements will be removed from the final list.
        - 'split' if True it will split a comma separated values from the sub list elements. If False, it won't split.
    '''
    try: 
        flat_list = []
        for item in lst:
            if isinstance(item, list):
                flat_list.extend(flatten_list(item, remove_duplicates, split))
            else:
                if (split and ',' in item):
                    flat_list.extend(flatten_list(item.split(','), remove_duplicates))
                else:
                    flat_list.append(item.strip())
        if (remove_duplicates):
            flat_list = list(set(flat_list))
        return flat_list
    except Exception as ex:
        return 'Error flatten list -> {}'.format(ex)

# ###############################################################################################
# def fix_name(name):
#     # name = name.replace('–', '-').replace(' ', '-').replace('.', '-').replace('/','-').replace('(','-').replace(')','-').replace('--','-').strip()

#     # r: The r before the opening quote signifies that this is a raw string, we can use backslashes and other special characters without needing to escape them.
#     # []: The square brackets are used to define a character set, which matches any one character that appears inside the brackets.
#     # ^: The caret character at the beginning of the character set means that we want to match any character that is NOT in the set.
#     # \w: The \w matches any word character, which includes letters, digits, and underscores.
#     # +: The plus sign at the end of the character set means that we want to match one or more occurrences of the preceding pattern.
#     pattern = r'[^\w-]+'
#     name = re.sub(pattern, '-', name)
#     # After the first run, we can end up with multiple hyphens in a row, we run it again to remove that
#     # -+: 2 or more hyphen characters in a row.
#     pattern = r'-+'
#     name = re.sub(pattern, '-', name)
#     return name

# ###############################################################################################
# def nf.tf_prefix(geography, elem, type):
#     '''
#         This function will create and append the prefix TF_<GEO>-HOST- for those
#         elements that does not have it
#         - item: single element
#         - type: 'IPSET' or 'SG'
#     '''

#     geo = '{}-'.format(geography)
#     try:
#         if (not isinstance(elem, list)):
#             elem = fix_name(elem)
#             if (type == 'SG'):
#                 elem = elem.replace(geo.lower(),'').replace(geo.upper(),'')
#                 elem = 'TF-{}-{}'.format(geography, elem)
#             if (type == 'VM'):
#                 new_elem = elem.replace(geo.lower(),'').replace(geo.upper(),'')
#                 new_elem = new_elem.replace('host-','').replace('HOST-','')
#                 elem = 'TF-{}-HOST-{}'.format(geography, new_elem)
#             if (type == 'IPSET'):
#                 new_elem = elem.replace(geo.lower(),'').replace(geo.upper(),'')
#                 new_elem = new_elem.replace('host-','').replace('HOST-','')
#                 elem = 'TF-{}-IPSET-{}'.format(geography, new_elem)
#             updated_item = elem
#         else:
#             updated_item = []
#             for item in elem:
#                 item = fix_name(item)
#                 if (type == 'SG'):
#                     item = item.replace(geo.lower(),'').replace(geo.upper(),'')
#                     item = 'TF-{}-{}'.format(geography, item)
#                 if (type == 'VM'):
#                     new_elem = item.replace(geo.lower(),'').replace(geo.upper(),'')
#                     new_elem = new_elem.replace('host-','').replace('HOST-','')
#                     item = 'TF-{}-HOST-{}'.format(geography, new_elem)
#                 if (type == 'IPSET'):
#                     new_elem = item.replace(geo.lower(),'').replace(geo.upper(),'')
#                     new_elem = new_elem.replace('host-','').replace('HOST-','')
#                     item = 'TF-{}-IPSET-{}'.format(geography, new_elem)
#                 updated_item.append(item)
#         return result_dict(False, updated_item)
#     except Exception as ex:
#         return result_dict(True, 'TF prefix -> {}'.format(ex))

###############################################################################################
def result_dict(error, data):
    '''
        This function will format the result in the standard dictionary
    '''
    return {
        'error': error,
        'data': data
    }

#############################################################
def get_criteria(criteria):

    if (criteria == 'starts_with'):
        criteria = 'STARTSWITH'
    if (criteria == 'contains'):
        criteria = 'CONTAINS'
    if (criteria == '=' or criteria == 'equals'):
        criteria = 'EQUALS'
    return criteria

#######################################################
def read_worksheet(xls_file, sheet_name, header=None):
    '''
        Reads the Excel file and returns a DICT.
        If you need a Pandas Dataframe then you have to convert
        the returned value with pandas.DataFrame()
        \n
        \n
        Parameters:
        - xls_file: The Excel path/filename that you want to read
        - sheet_name: 
        None or a string with the worksheet's nama that you want to read. If equals to None, then it will read all workshetts
        - header:
        None (default) or worksheet's row number to be used as a header.
        \n
        \n
        Returned value:\n
        A dictionary with 2 keys, 'error' (boolean) and 'data'.
        - 'error' == True --> 'data' will have the error message
        - 'error' == Falt --> 'data' will have the actual data
    '''
    try:
        excel_df = pd.read_excel(xls_file, sheet_name=sheet_name, header=header)  
        result = {
            'error': False,
            'data': excel_df
        }
    except ValueError as ve:
        result = {
            'error': True,
            'data': ve
        }
    except FileNotFoundError as fnf:
        result = {
            'error': True,
            'data': fnf
        }
    except Exception as ex:
        result = {
            'error': True,
            'data': '{} - {}'.format(ex, ex.__doc__)
        }
    return result
    