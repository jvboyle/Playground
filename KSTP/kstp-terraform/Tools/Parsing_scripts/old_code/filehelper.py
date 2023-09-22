import json
import csv
import os
import re

class fileHelper():
    def __init__(self, log_writer=""):
        # log_writer, optional parameter that can be used to log the actions from this class
        # That log_writer MUST BE an object created by the implementation of the log function via
        # logger.py, class AppLogger()
        self.log_writer = log_writer
        self._err = False
        self._data = ''
        self._fixme = False 
        self._tab = '   '   # 3 spaces
        self._myLogger = ''
        self._myLoggerObj = ''
        self._projects_path = ''
        self._cs_name = ''
        self._json_section = '' 
        self._geography = ''
        self._dfw_section_name = ''

    # Class properties

    def _get_err(self):
        return self._err

    def _get_fixeme(self):
        return self._fixme
    
    def _get_data(self):
        return self._data

    def _set_myLogger(self, myLogger):
        self._myLogger = myLogger

    def _set_myLoggerObj(self, myLoggerObj):
        self._myLoggerObj = myLoggerObj
    
    def _set_projects_path(self, projects_path):
        self._projects_path = projects_path
    
    def _set_cs_name(self, cs_name):
        self._cs_name = cs_name
    
    def _set_json_section(self, json_section):
        self._json_section = json_section

    def _set_geography(self, geography):
        self._geography = geography

    def _set_dfw_section_name(self, dfw_section_name):
        self._dfw_section_name = dfw_section_name

    file_error = property(
        fget = _get_err
    )

    file_fix_me = property(
        fget = _get_fixeme
    )

    file_data = property(
        fget = _get_data
    )

    file_set_myLogger = property(
        fset = _set_myLogger
    )

    file_set_myLoggerObj = property(
        fset = _set_myLoggerObj
    )

    file_set_projects_path = property(
        fset = _set_projects_path
    )

    file_set_cs_name = property(
        fset = _set_cs_name
    )

    file_set_json_section = property(
        fset = _set_json_section
    )

    file_set_geography = property(
        fset = _set_geography
    )

    file_set_dfw_section_name = property(
        fset = _set_dfw_section_name
    )
    # Class members

    def write_json_file(self, file_name, jsondata):
        # Write an indented JSON file
        # If success, returns "", otherwise returns an error dictionary and log the error
        # if the logger was provided during the class initialization.
        # It returns a dictionary to keep it standard with the read function, and as well 
        # as, with the error handling process for both (read and write) functions
        try:
            with open(file_name, "w") as jsonfile:
                json.dump(jsondata, jsonfile, indent=4)
            result_dict = {
                "error": False,    # success
                "data": ""
            }
        except Exception as ex:
            result_dict = {
                "error": True,    
                "data": ex.__doc__
            }
        return result_dict

    def read_json_file(self, file_name):
        # Return the content of a JSON file
        # Check if the returned value contains "err_msg", if yes, then it is an error
        # if not, then it is the file content
        try:
            file_content = open(file_name)
            json_content = json.loads(file_content.read())
            file_content.close()
            result_dict = {
                "error": False,    # success
                "data": json_content
            }
        except Exception as ex:
            result_dict = {
                "error": True,    
                "data": ex.__doc__
            }
        return result_dict

    def write_csv_file(self, file_name, csv_header, csv_data):
        try:
            with open(file_name, "w", newline="") as csvfile:
                writer = csv.DictWriter(csvfile, fieldnames=csv_header)
                writer.writeheader()
                for row in csv_data:
                    writer.writerow(row)
            self._err = False
            self._data = ""
        except Exception as ex:
            self._err = True
            self._data = ex.__doc__

    def create_folder(self, dir_name):
        try:
            os.makedirs(dir_name, exist_ok=True)  
            self._err= False
            self._data= ""
        except OSError as err:
            self._err = True
            self._data = err

    def file_exists(self, filename):
        if os.path.isfile(filename):
            return True
        else:
            return False
        
    def write_regular_file(self, file_name, data):
        try:
            with open(file_name, 'w') as f:
                f.write(data)
            self._err= False
            self._data= ""
        except OSError as err:
            self._err = True
            self._data = err

    def dfw_tf_format(self, data, geography, cs_name, existing_services_list):
        try:
            self._data = ''
            self._fixme = False
            rules_issue = ''
            for index_section, section in enumerate(data['map_policies']):
                policy = data['map_policies'][section]
                # Header section
                self._data += 'resource \"nsxt_policy_security_policy\" \"policies_{}-{}\" {{\n'.format(section, cs_name)
                self._data += '{}display_name    = \"{}\"\n'.format(self._tab, section)
                self._data += '{}category        = \"{}\"\n'.format(self._tab, policy['category'])
                self._data += '{}locked          = false\n'.format(self._tab)
                self._data += '{}tcp_strict      = true\n'.format(self._tab)
                self._data += '{}stateful        = true\n'.format(self._tab)
                self._data += '{}nsx_id          = \"{}\"\n'.format(self._tab, section)
                self._data += '{}comments        = \"\"\n'.format(self._tab)
                self._data += '{}sequence_number = 0\n'.format(self._tab)
                # Rules section
                #for index_rule, rule in enumerate(policy['rules']):
                for rule in policy['rules']:
                    self._data += '{}rule {{\n'.format(self._tab)
                    self._data += '{}display_name = \"{}\"\n'.format(self._tab*3, policy['rules'][rule]['display_name'])
                    str_raw = policy['rules'][rule]['notes'].replace('"', '').replace('\'', '')
                    pattern = r'[^\w-]+'
                    str_raw = re.sub(pattern, ' ', policy['rules'][rule]['notes'])
                    self._data += '{}notes        = \"{}\"\n'.format(self._tab*3, str_raw)
                    grps = policy['rules'][rule]['source_groups']
                    grps_text = ''
                    if (grps): 
                        grps = list(map(lambda x: '/infra/domains/default/groups/{}'.format(x), grps))
                        if (policy['rules'][rule]['source_ips']):
                            grps.extend(policy['rules'][rule]['source_ips'])
                        for index, item in enumerate(grps):
                            if (index == len(grps)-1):
                                grps_text += '{}{}'.format(self._tab*5, json.dumps(item))
                            else: 
                                grps_text += '{}{},\n'.format(self._tab*5, json.dumps(item))
                        self._data += '{}source_groups = [\n{}\n{}]\n'.format(self._tab*3, grps_text, self._tab*4)
                    size_source_groups = len(grps)
                    grps = policy['rules'][rule]['destination_groups'] 
                    grps_text = ''
                    if (grps):
                        grps = list(map(lambda x: '/infra/domains/default/groups/{}'.format(x), grps))
                        if (policy['rules'][rule]['destination_ips']):
                            grps.extend(policy['rules'][rule]['destination_ips'])
                        for index, item in enumerate(grps):
                            if (index == len(grps)-1):
                                grps_text += '{}{}'.format(self._tab*5, json.dumps(item))
                            else: 
                                grps_text += '{}{},\n'.format(self._tab*5, json.dumps(item))  
                        self._data += '{}destination_groups = [\n{}\n{}]\n'.format(self._tab*3, grps_text, self._tab*4)
                    size_destination_groups = len(grps)          
                    self._data += '{}action = \"{}\"\n'.format(self._tab*3, policy['rules'][rule]['action'])
                    lst = policy['rules'][rule]['services']

                    # srv = [x.replace(' ', '_') for x in lst]
                    # srv_text = ',\n'.join(map(lambda x: '{}"/infra/services/{}"'.format(self._tab*5, x), srv))

                    # Checks if the service is within the existing_services_list, if yes just get the path and uses the same name
                    # If it is not within existing_services_list, then it create a path and remove any possible space from the service's name
                    srv_text = ',\n'.join(map(lambda service: '{}"{}"'.format(self._tab*5, existing_services_list[service]) if service in existing_services_list.keys() else '{}"/infra/services/{}"'.format(self._tab*5, service), lst))

                    self._data += '{}services = [\n{}\n{}]\n'.format(self._tab*3, srv_text, self._tab*4)
                    grps = policy['rules'][rule]['scope']
                    grps_text = ',\n'.join(map(lambda x: '{}"/infra/domains/default/groups/{}"'.format(self._tab*5, x), grps))
                    self._data += '{}scope = [\n{}\n{}]\n'.format(self._tab*3, grps_text, self._tab*4)
                    self._data += '{}disabled              = false\n'.format(self._tab*3)
                    self._data += '{}direction             = \"{}\"\n'.format(self._tab*3, policy['rules'][rule]['direction'])
                    self._data += '{}ip_version            = \"IPV4_IPV6\"\n'.format(self._tab*3)
                    if (policy['rules'][rule]['logged']):
                        self._data += '{}logged                = true\n'.format(self._tab*3)
                    else:
                        self._data += '{}logged                = false\n'.format(self._tab*3)
                    self._data += '{}sources_excluded      = false\n'.format(self._tab*3)
                    self._data += '{}destinations_excluded = false\n'.format(self._tab*3)
                    self._data += '{}tag {{\n'.format(self._tab*3)
                    self._data += '{}tag = \"{}-{}\"\n'.format(self._tab*5, section, geography)
                    self._data += '{}}}\n'.format(self._tab*4)
                    self._data += '{}}}\n'.format(self._tab*2)
                    # NSX-T limit: source or destination or scope can't have more than 128 entries
                    # As 'scope' is source + destination, we just check for its size, if scope >= 128 we have a problem
                    size_scope = size_source_groups + size_destination_groups
                    if (size_scope > 128):
                        rules_issue += 'rule: {}\n'.format(rule)
                        if (size_source_groups > 128):
                            fix_this = ' (must be fixed)'
                        else:
                            fix_this = ''
                        rules_issue += '{}|-- source_groups size.....: {}{}\n'.format(self._tab, size_source_groups, fix_this)
                        if (size_destination_groups > 128):
                            fix_this = ' (must be fixed)'
                        else:
                            fix_this = ''
                        rules_issue += '{}|-- destination_groups size: {}{}\n'.format(self._tab, size_destination_groups, fix_this)
                        if (size_scope > 128):
                            fix_this = ' (must be fixed)'
                        else:
                            fix_this = ''
                        rules_issue += '{}|-- scope size.............: {}{}\n\n'.format(self._tab, size_scope, fix_this)
                        self._fixme = True
                if (index_section < len(data['map_policies'])-1):
                    self._data += '},'
                else:
                    self._data += '}'
            # Check if the file is OK or if it must be fixed and updated the content 
            if (self._fixme):
                tmp_content  = '/*\n'
                tmp_content += 'The rules below must be fixed before you run the TF code injection.\n\n'
                tmp_content += 'To fix it you must ensure that the sections below does not have\n'
                tmp_content += 'more than 128 items in each.\n'
                tmp_content += '   - source_groups\n'
                tmp_content += '   - destination_groups\n'
                tmp_content += '   - scope\n\n'
                tmp_content += 'If they have, you must break them in multiple rules in a way that each\n'
                tmp_content += 'rule will fit within that 128 limit.\n\n'
                tmp_content += rules_issue
                tmp_content += '\n\n{}\n*/'.format(self._data)
                self._data = tmp_content
            self._err = False

        except Exception as ex:
            self._err = True
            self._data = ex.__doc__

    def save_tf_format(self, save_to, existing_services_list):
        '''
            We don't need to worry about the returned value from this function as if it has some error, it will
            stop the code execution.\n
            If the code continue to run, then everything was OK
        '''
        try: 
            # tmp_path....: Used to create the migration folder
            # fix_me files: Used to save within the 'migration' folder
            # tf_files....: Used to save within the 'shared' folder
            if (save_to == 'ires'):
                tmp_path = '{}/101-IRES-dfw/migrations/{}'.format(self._projects_path, self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/101-IRES-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/101-IRES-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'pdr'):
                tmp_path = '{}/102-PDR-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/102-PDR-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/102-PDR-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'sres'):
                tmp_path = '{}/103-SRES-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/103-SRES-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/103-SRES-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'hres'):
                tmp_path = '{}/104-HRES-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/104-HRES-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/104-HRES-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'gres'):
                tmp_path = '{}/105-GRES-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/105-GRES-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/105-GRES-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'nsx-v2t'):
                tmp_path = '{}/106-NSX-V2T-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/106-NSX-V2T-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/106-NSX-V2T-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'vpc'):
                tmp_path = '{}/107-VPC-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/107-VPC-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/107-VPC-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'hwsw'):
                tmp_path = '{}/108-HWSW-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/108-HWSW-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/108-HWS-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'sres-rpa'):
                tmp_path = '{}/109-SRES-RPA-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/109-SRES-RPA-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/109-SRES-RPA-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'monitoring'):
                tmp_path = '{}/110-MONITORING-dfw/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/110-MONITORING-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/110-MONITORING-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            if (save_to == 'tmp-section'):
                tmp_path = '{}/111-TMP-SECTION/migrations/{}'.format(self._projects_path,self._cs_name)
                fix_me_file_migration = '{}/{}_{}.tf.FIX-ME'.format(tmp_path, self._dfw_section_name, self._cs_name)
                fix_me_file = '{}/111-TF-TMP-Section-dfw/{}_{}.tf.FIX-ME'.format(self._projects_path, self._dfw_section_name, self._cs_name)
                tf_file_migration = '{}/{}_{}.tf'.format(tmp_path, self._dfw_section_name, self._cs_name)
                tf_file = '{}/111-TF-TMP-Section-dfw/{}_{}.tf'.format(self._projects_path, self._dfw_section_name, self._cs_name)
            self.create_folder('{}'.format(tmp_path))
            if (self.file_error):
                self._myLogger.critical('   |-- Error message: {}'.format(self.file_data))    
                self._myLogger.info('   |-- Please correct the error above and try again')
                self._myLogger.info('   |-- The execution will be interrupted')
                self._myLoggerObj.log_terminate()
            else:
                # Terraform format
                self.dfw_tf_format(self._json_section, self._geography, self._cs_name, existing_services_list)
                if (self.file_error):
                    self._myLogger.critical('      |-- Error creating {}'.format(tf_file))
                    self._myLogger.warning('      |-- Error message: {}'.format(self.file_data))
                    self._myLogger.info('Execution will be interrupted.')
                    self._myLoggerObj.log_terminate()
                else:
                    tf_data = self.file_data
                    # We had limit issue
                    if (self._fixme):
                        # Save within the migration's folder
                        self.write_regular_file(fix_me_file_migration, tf_data)
                        if (self.file_error):
                            self._myLogger.critical('      |-- Error saving {}'.format(fix_me_file_migration))
                            self._myLogger.warning('      |-- Error message: {}'.format(self.file_data))
                            self._myLogger.info('Execution will be interrupted.')
                            self._myLoggerObj.log_terminate()
                        # Save within the shared folder
                        self.write_regular_file(fix_me_file, tf_data)
                        if (self.file_error):
                            self._myLogger.critical('      |-- Error saving {}'.format(fix_me_file))
                            self._myLogger.warning('      |-- Error message: {}'.format(self.file_data))
                            self._myLogger.info('Execution will be interrupted.')
                            self._myLoggerObj.log_terminate()
                        self._myLogger.critical('      |-- File {} MUST BE FIXED before run the TF code'.format(fix_me_file))
                    else:
                        # Save within the migration's folder
                        self.write_regular_file(tf_file_migration, tf_data)
                        if (self.file_error):
                            self._myLogger.critical('      |-- Error saving {}'.format(tf_file_migration))
                            self._myLogger.warning('      |-- Error message: {}'.format(self.file_data))
                            self._myLogger.info('Execution will be interrupted.')
                            self._myLoggerObj.log_terminate()
                        # Save within the shared folder
                        self.write_regular_file(tf_file, tf_data)
                        if (self.file_error):
                            self._myLogger.critical('      |-- Error saving {}'.format(tf_file))
                            self._myLogger.warning('      |-- Error message: {}'.format(self.file_data))
                            self._myLogger.info('Execution will be interrupted.')
                            self._myLoggerObj.log_terminate()
        except Exception as ex:
            self._myLogger.critical('      |-- Error saving {}'.format(tf_file))
            self._myLogger.warning('      |-- Error message: {}'.format(self.file_data))
            self._myLogger.info('Execution will be interrupted.')
            self._myLoggerObj.log_terminate()

    def save_tf_format_vpn(self, file_name, json_data, edge_id):
        '''
            Export only SNAT and DNAT rules for the VPNs
        '''
        self.log_writer.info('      |-- Exporting NAT information')
        tf_output = ''
        # Check and convert to a list to make the code below simple, because
        # sometimes it is a list and sometimes just a dictionary
        if (json_data['edge']['features']['nat']['natRules']):
            if (isinstance(json_data['edge']['features']['nat']['natRules']['natRule'], dict)):
                json_data['edge']['features']['nat']['natRules']['natRule'] = [json_data['edge']['features']['nat']['natRules']['natRule']]
            # Only for certain NATs
            for nat in json_data['edge']['features']['nat']['natRules']['natRule']:
                nat_action = nat['action']
                nat_ruleId = nat['ruleId']
                if (nat_action == 'dnat') or (nat_action == 'snat'):
                    resource_name = '{}_{}'.format(nat_action, nat_ruleId)
                else:
                    resource_name = '' 
                if (resource_name):
                    self.log_writer.info('         |-- Exporting NAT rule {} for edge {}'.format(nat_ruleId, edge_id))
                    # Get the required fields,
                    display_name = 'TF-{}'.format(nat_ruleId)
                    action = nat_action.upper()
                    if (nat_action == 'dnat'):
                        source_networks = nat['dnatMatchSourceAddress']
                        if (source_networks.lower() == 'any') :
                            source_networks = ''         # Empty value means that the line must be skipped
                        destination_networks = nat['originalAddress']
                    if (nat_action == 'snat'):
                        source_networks = nat['originalAddress']
                        if (nat['snatMatchDestinationAddress'].lower() == 'any'):
                            destination_networks = ''
                        else:
                            destination_networks = nat['snatMatchDestinationAddress']
                    translated_networks = nat['translatedAddress']
                    # TF output
                    tf_output += 'resource "nsxt_policy_nat_rule" "{}" {{\n'.format(resource_name)
                    tf_output += '     display_name = "{}"\n'.format(display_name)
                    tf_output += '     action = "{}"\n'.format(action)
                    if (source_networks):
                        tf_output += '     source_networks = [{}]\n'.format(json.dumps(source_networks))
                    if (destination_networks):
                        tf_output += '     destination_networks = [{}]\n'.format(json.dumps(destination_networks))
                    tf_output += '     translated_networks = [{}]\n'.format(json.dumps(translated_networks))
                    tf_output += '     gateway_path = data.nsxt_policy_tier0_gateway.select.path\n'
                    tf_output += '     logging = true\n'
                    tf_output += '     firewall_match = "MATCH_INTERNAL_ADDRESS"\n'
                    tf_output += '     scope = ["CHANGE_PATH"]\n'
                    tf_output += '}\n'
                else:
                    self.log_writer.info('         |-- Skipping NAT rule {}'.format(nat_ruleId))
            self.write_regular_file(file_name, tf_output)
            if (self.file_error):
                self.log_writer.critical('         |-- Error saving {}'.format(file_name))
                self.log_writer.warning('         |-- {}'.format(self.file_data))
                self.log_writer.info('         |-- Execution will be interrupted')
                self._myLoggerObj.log_terminate()
            else:
                self.log_writer.info('         |-- File {} saved'.format(file_name))
