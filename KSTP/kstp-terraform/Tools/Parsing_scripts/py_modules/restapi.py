import requests
import urllib3
import json
# import os
import xmltodict                        # 3rd party library: pip install xmltodict
from requests.auth import HTTPBasicAuth
from datetime import datetime

class RestAPICall():
    def __init__(self, log_writer="", myLogger="", myJSON=""):
        # Just to remove a warning about unsecured https request in the output
        urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)
        self._log_writer = log_writer
        self._myLogger = myLogger
        self._myJSON = myJSON
        # Get local date and time
        now = datetime.now()
        self._date = now.strftime("%b-%d-%Y")
        self._time = now.strftime("%H:%M:%S")

    def GetData(self, user_id, pwd, get_url, arg_headers="", args=""):
            if (user_id):
                try:
                    response = requests.get(
                        get_url,
                        auth=HTTPBasicAuth(user_id, pwd),
                        verify=False
                    )
                    if ('error_message' in response.text):
                        result_dict = {
                            "error": True,
                            "data": response.text
                        }
                        return result_dict
                    result_dict = {
                        "error": False,
                        "data": response.text
                    }
                except Exception as ex:
                    result_dict = {
                        "error": True,
                        "data": ex.__doc__
                    }
                return result_dict
            else:
                response = requests.get(get_url, headers=arg_headers, params=args)
                result_dict = {
                    "error": False,
                    "data": response.json()
                }
                return result_dict

    def PostData(self, post_url, content_type="", post_headers="", post_data=""):
        if(content_type == "JSON"):
            response = requests.post(post_url, json=post_data, headers=post_headers)
            data = response.json()
        if ("errors" in data):
            has_error = True
        else:
            has_error = False
        
        result_dict = {
            "error": has_error,
            "data": data
        }
        return result_dict
    
    def NSXEdges(self, nsx_env, nsx_manager, user_id, pwd, paths):
        '''
            Works for NSX-V due to differences in the RestAPI call
        '''
        dres = 0
        no_vpn_name = 0
        no_vpn = 0
        self._log_writer.info("<<<<<<<<<<              STARTING NSX EXPORT             >>>>>>>>>>")
        self._log_writer.info("{} Manager: {}".format(nsx_env.upper(), nsx_manager))
        self._log_writer.info("Export running for: {}".format(user_id))

        # Get the list of edges
        get_req = "https://{}/api/4.0/edges?pageSize=1024".format(nsx_manager)
        self._log_writer.info("Exporting {}".format(get_req))
        self._log_writer.warning("   |-- This may take couple of minutes to complete, please wait ...")
        # RestAPI cal
        result = self.GetData(user_id, pwd, get_req)
        if (result["error"]):
            self._log_writer.critical("   |-- Error calling GET {}".format(get_req))
            self._log_writer.error("   |-- Error message: {}".format(result["data"]))
            self._log_writer.info("   |-- Execution will be interrupted")
            self._myLogger.log_terminate()
        else:
            #####################################################################
            # FOR DEVELOPMENT ONLY - no files should be saved ###################
            #####################################################################
            jsonfile = "{}/edges_output.json".format(paths['export_path_edges'])
            json_data = xmltodict.parse(result["data"])
            saved_json = self._myJSON.write_json_file(jsonfile, json_data)
            if (saved_json["error"]):
                self._log_writer.warning("   |-- Error saving {}".format(jsonfile))
            else:
                self._log_writer.info("   |-- File {} saved".format(jsonfile))
            #####################################################################

            # Loop through every edge to get the required values
            dr_edges = {
                "export":{
                    "date": self._date,
                    "time": self._time
                },
                "edges":{}
            }
            edges_info = xmltodict.parse(result["data"])
            edges = edges_info["pagedEdgeList"]["edgePage"]["edgeSummary"]
            self._log_writer.info("Lopping through individual edge configuration")
            for edge in edges:
                # if ("-dr" in edge["name"]) and ("-vpn" in edge["name"]):
                dres += 1
                edge_name = edge["name"]
                edge_id = edge["id"]
                edge_dc = edge["datacenterName"]
                self._log_writer.info("   |-- {}".format(edge_name))
                self._log_writer.info("      |-- GET {}".format(edge_name))
                # Get unique edge information
                get_req = "https://{}/api/4.0/edges/{}".format(nsx_manager, edge_id)
                # RestAPI call
                result = self.GetData(user_id, pwd, get_req)
                if(result['error']):
                    self._log_writer.critical("      |-- Error calling GET {}".format(get_req))
                    self._log_writer.error("      |-- Error message: {}".format(result["data"]))
                    self._log_writer.info("      |-- Execution will be interrupted")
                    self._myLogger.log_terminate()
                else:
                    jsonfile = "{}/{}-{}_output.json".format(paths['export_path_edges'], edge_name, edge_id)
                    json_data = xmltodict.parse(result["data"])
                    saved_json = self._myJSON.write_json_file(jsonfile, json_data)
                    if (saved_json["error"]):
                        self._log_writer.warning("      |-- Error saving {}".format(jsonfile))
                    else:
                        features = json_data["edge"]["features"]
                        self._log_writer.info("      |-- File {} saved".format(jsonfile))
                        # Check if we need the TF format based in the edge's name
                        if ('-vpn' in edge_name):
                            tf_name = "{}/{}-{}_output.tf".format(paths['export_tf'], edge_name, edge_id)
                            self._myJSON.save_tf_format_vpn(tf_name, json_data, edge_id)
                get_req = "https://{}/api/4.0/edges/{}/ipsec/config?showSensitiveData=true".format(nsx_manager, edge_id)
                # RestAPI call
                result = self.GetData(user_id, pwd, get_req)
                if (result["error"]):
                    self._log_writer.critical("      |-- Error calling GET {}".format(get_req))
                    self._log_writer.error("      |-- Error message: {}".format(result["data"]))
                    self._log_writer.info("      |-- Execution will be interrupted")
                    self._myLogger.log_terminate()
                else:
                    #####################################################################
                    # FOR DEVELOPMENT ONLY - no files should be saved ###################
                    #####################################################################
                    jsonfile = "{}/{}_output.json".format(paths['export_path_vpns'], edge_name)
                    result["data"] = xmltodict.parse(result["data"])
                    saved_json = self._myJSON.write_json_file(jsonfile, result["data"])
                    if (saved_json["error"]):
                        self._log_writer.warning("      |-- Error saving {}".format(jsonfile))
                    else:
                        self._log_writer.info("      |-- File {} saved".format(jsonfile))
                    #####################################################################

                    # Save the updated file
                    json_data.update({"features": features})
                    jsonfile = "{}/{}_exported.json".format(paths['export_edges'], edge_name)
                    saved_json = self._myJSON.write_json_file(jsonfile, result["data"])
                    if (saved_json["error"]):
                        self._log_writer.warning("      |-- Error saving {}".format(jsonfile))
                    else:
                        self._log_writer.info("      |-- File {} saved".format(jsonfile))

                    # Due to the way that the XML file is exported, result["data"]["ipsec"]["sites"]["site"] can be one of two types:
                    # result["data"]["ipsec"]["sites"]["site"] is a DICTIONARY
                    # meaning that ["site"] has only 1 entry in the following format ["site"]:{}", and therefore it is a single dictionary
                    #
                    # result["data"]["ipsec"]["sites"]["site"] is a LIST
                    # meaning that ["site"] has multiple entries in the following format ["site"]=[{}, {}, ...], and terefore it is a list of dictionaries
                    vpns = []
                    if (not result["data"]["ipsec"]["sites"] is None):
                        if (isinstance(result["data"]["ipsec"]["sites"]["site"], dict)):        # only 1 entry.
                            vpn_psk = result["data"]["ipsec"]["sites"]["site"]["psk"]
                            if (not "name" in result["data"]["ipsec"]["sites"]["site"]):        # sometimes the "name" is null (not a mandatory field/value)
                                vpn_name = "{}_vpn".format(edge_id)
                                no_vpn_name += 1
                                self._log_writer.warning("      |-- VPN name not found to edge ID {}".format(edge_id))
                                self._log_writer.warning("      |-- Name created: {}_vpn".format(edge_id))
                                vpns.append({
                                    "vpn_name": vpn_name,
                                    "vpn_psk": vpn_psk
                                })
                            else:
                                vpn_name = result["data"]["ipsec"]["sites"]["site"]["name"]
                                vpns.append({
                                    "vpn_name": vpn_name,
                                    "vpn_psk": vpn_psk
                                })
                        else:                                                                   # Means "site" is a list, so we can loop through it
                            vpn_list = result["data"]["ipsec"]["sites"]["site"]
                            for vpn in vpn_list:
                                vpn_psk = vpn["psk"]
                                if (not "name" in vpn):
                                    vpn_name = "{}_vpn".format(edge_id)
                                    no_vpn_name += 1
                                    self._log_writer.warning("      |-- VPN name not found to edge ID {}".format(edge_id))
                                    self._log_writer.warning("      |-- Name created: {}_vpn".format(edge_id))
                                    vpns.update({
                                        "vpn_name": vpn_name,
                                        "vpn_psk": vpn_psk
                                    })
                                else:
                                    vpn_name = vpn["name"]
                                    vpn_psk = vpn["psk"]
                                    vpns.append({
                                        "vpn_name": vpn_name,
                                        "vpn_psk": vpn_psk
                                    })
                    else:
                        self._log_writer.warning("      |-- VPN not configured for  {}".format(edge_id))
                        no_vpn += 1
                        vpns.append({
                            "vpn_name": "__NOT CONFIGURED__",
                            "vpn_psk": "__NOT CONFIGURED__"
                        })
                    dr_edges["edges"].update({
                        edge["name"]:{
                            "id": edge_id,
                            "datacenter": edge_dc,
                            "vpns": vpns
                        }
                    })
            ####################################################################################
            # Save the summary file
            # ATTENTION:
            # PSK plain text
            # Move this file to a safe location and delete it as soon as possible
            ####################################################################################
            jsonfile = "{}/edges_summary-{}.json".format(paths['export_path_edges'], self._date)
            saved_json = self._myJSON.write_json_file(jsonfile, dr_edges)
            if (saved_json["error"]):
                self._log_writer.critical("   |-- Error saving {}".format(jsonfile))
                self._log_writer.error("   |-- Error message: {}".format(saved_json["data"]))
                self._log_writer.info("   |-- Execution will be stopped")
                self._myLogger.log_terminate()
            else:
                self._log_writer.warning("   |-- ATTENTION")
                self._log_writer.info("   |-- File {} saved".format(jsonfile))
                self._log_writer.info("   |-- This file contains plain text PSK")
                self._log_writer.info("   |-- Move it immediately to a safe location and delete it")
            ####################################################################################
            self._log_writer.info("   |-- Total DRES: {}".format(dres))
            self._log_writer.info("   |-- DRES without VPN configured: {}".format(no_vpn))
            self._log_writer.info("   |-- DRES without VPN name: {}".format(no_vpn_name))

        self._log_writer.info("<<<<<<<<<<          EXPORT COMPLETED SUCCESSFULLY         >>>>>>>>>>")

    def NSXServices(self, nsx_env, nsx_manager, user_id, pwd, paths):
        '''
            Works for NSX-T due to differences in the RestAPI call
        '''
        self._log_writer.info("<<<<<<<<<<              STARTING NSX SERVICES EXPORT             >>>>>>>>>>")
        self._log_writer.info("{} Manager: {}".format(nsx_env.upper(), nsx_manager))
        self._log_writer.info("Export running for: {}".format(user_id))

        # Get the list of edges
        get_req = "https://{}/api/v1/infra/services".format(nsx_manager)
        self._log_writer.info("Exporting {}".format(get_req))
        self._log_writer.warning("   |-- This may take couple of minutes to complete, please wait ...")
        # RestAPI cal
        result = self.GetData(user_id, pwd, get_req)
        if (result["error"]):
            self._log_writer.critical("   |-- Error calling GET {}".format(get_req))
            self._log_writer.error("   |-- Error message: {}".format(result["data"]))
            self._log_writer.info("   |-- Execution will be interrupted")
            self._myLogger.log_terminate()
        else:
            existing_services = {}
            file_name = "{}/services_output.json".format(paths['export_services'])
            file_full = "{}/services_exported.json".format(paths['export_services'])
            json_data = json.loads(result['data'])
            for items in json_data['results']:
                existing_services.update({
                    items['display_name']: items['path']
                })
            self._myJSON.write_json_file(file_name, existing_services)
            self._myJSON.write_json_file(file_full, json_data)
            if (self._myJSON.file_error):
                self._log_writer.warning("      |-- Error saving {}".format(file_name))
            else:
                self._log_writer.info("      |-- File {} saved".format(file_name))

    def NSXGroups(self, nsx_env, nsx_manager, user_id, pwd, paths):
        '''
            Works for NSX-T due to differences in the RestAPI call
        '''
        self._log_writer.info("<<<<<<<<<<              STARTING NSX GROUPS EXPORT             >>>>>>>>>>")
        self._log_writer.info("{} Manager: {}".format(nsx_env.upper(), nsx_manager))
        self._log_writer.info("Export running for: {}".format(user_id))

        # Get the list of edges
        get_req = "https://{}/policy/api/v1/infra/domains/default/groups".format(nsx_manager)
        self._log_writer.info("Exporting {}".format(get_req))
        self._log_writer.warning("   |-- This may take couple of minutes to complete, please wait ...")
        # RestAPI cal
        result = self.GetData(user_id, pwd, get_req)
        if (result["error"]):
            self._log_writer.critical("   |-- Error calling GET {}".format(get_req))
            self._log_writer.error("   |-- Error message: {}".format(result["data"]))
            self._log_writer.info("   |-- Execution will be interrupted")
            self._myLogger.log_terminate()
        else:
            existing_groups = {}
            file_name = "{}/groups_output.json".format(paths['export_groups'])
            file_full = "{}/groups_exported.json".format(paths['export_groups'])
            json_data = json.loads(result['data'])
            # Check for more data
            data = []
            while ('cursor' in json_data.keys()):
                data.extend(json_data['results'])
                new_req = '{}?cursor={}'.format(get_req, json_data['cursor'])
                result = self.GetData(user_id, pwd, new_req)
                if (result["error"]):
                    self._log_writer.critical("   |-- Error calling GET {}".format(new_req))
                    self._log_writer.error("   |-- Error message: {}".format(result["data"]))
                    self._log_writer.info("   |-- Execution will be interrupted")
                    self._myLogger.log_terminate()
                else:
                    json_data = json.loads(result['data'])
            else:
                # Append the only one, or the last one, page
                data.extend(json_data['results'])
            for items in data:
                if (isinstance(items['_create_time'], int)):
                    created = self._convert_time(items['_create_time'])
                else:
                    created = items['_create_time']
                if (isinstance(items['_last_modified_time'], int)):
                    modified = self._convert_time(items['_last_modified_time'])
                else:
                    modified = items['_last_modified_time']
                existing_groups.update({
                    items['display_name']: {
                        'path': items['path'],
                        'created': created,
                        'created_by': items['_create_user'],
                        'last_modified': modified
                    }
                })
            self._myJSON.write_json_file(file_name, existing_groups)
            self._myJSON.write_json_file(file_full, data)
            if (self._myJSON.file_error):
                self._log_writer.warning("      |-- Error saving {}".format(file_name))
            else:
                self._log_writer.info("      |-- File {} saved".format(file_name))

    def NSXDFWRules(self, nsx_env, nsx_manager, user_id, pwd, paths):
        '''
            Works for NSX-T due to differences in the RestAPI call
        '''
        self._log_writer.info("<<<<<<<<<<              STARTING NSX FIREWALL RULES EXPORT             >>>>>>>>>>")
        self._log_writer.info("{} Manager: {}".format(nsx_env.upper(), nsx_manager))
        self._log_writer.info("Export running for: {}".format(user_id))

        # List all subfolders to determine which FW section should be exported
        sections_to_check = []
        self._log_writer.info("   |-- Getting firewall sections to export, this may take some time. Please wait ...")
        get_req = "https://{}/api/v1/infra/domains/default/security-policies".format(nsx_manager)
        # RestAPI cal
        result = self.GetData(user_id, pwd, get_req)
        if (result["error"]) and (not '"httpStatus" : "NOT_FOUND"' in result["data"]):
            self._log_writer.critical("   |-- Error calling GET {}".format(get_req))
            self._log_writer.error("   |-- Error message: {}".format(result["data"]))
            self._log_writer.info("   |-- Execution will be interrupted")
            self._myLogger.log_terminate()
        else:
            sections_list = []
            if (result["error"]) and (not '"httpStatus" : "NOT_FOUND"' in result["data"]):
                self._log_writer.critical("   |-- Error calling GET {}".format(get_req))
                self._log_writer.error("   |-- Error message: {}".format(result["data"]))
                self._log_writer.info("   |-- Execution will be interrupted")
                self._myLogger.log_terminate()
            else:
                # Skip if the sections created by the system
                json_data = json.loads(result['data'])
                sections = json_data['results']
                total_sections = 0
                for index, section in enumerate(sections):
                    section_id = section['id']
                    created_by = section['_create_user']
                    if (not created_by == 'system'):
                        total_sections += 1
                        sections_list.append(section_id)
                    else:
                        self._log_writer.warning("      |-- Skipping system section {}".format(section_id))
        # Get the list of edges
        self._log_writer.info("   |-- Exporting firewall sections rules")
        rules_dict = {}
        count_section = 1
        for section in sections_list:
            get_req = "https://{}/api/v1/infra/domains/default/security-policies/{}".format(nsx_manager, section)
            self._log_writer.info("      |-- ({}/{}) Exporting {} ...".format(count_section, total_sections, section))
            count_section += 1
            # RestAPI cal
            result = self.GetData(user_id, pwd, get_req)
            if (result["error"]) and (not '"httpStatus" : "NOT_FOUND"' in result["data"]):
                self._log_writer.critical("   |-- Error calling GET {}".format(get_req))
                self._log_writer.error("   |-- Error message: {}".format(result["data"]))
                self._log_writer.info("   |-- Execution will be interrupted")
                self._myLogger.log_terminate()
            else:
                # Skip if the section does not exist
                if (not '"httpStatus" : "NOT_FOUND"' in result["data"]):
                    json_data = json.loads(result['data'])
                    rules = json_data['rules']
                    for index, rule in enumerate(rules):
                        name = rule['display_name']
                        id = rule['rule_id']
                        created_time = self._convert_time(rule['_create_time'])
                        disabled = rule['disabled']
                        rules_dict.update({
                            name: {
                                'id': id,
                                'created_time': created_time,
                                'disabled': disabled,
                                'section': section
                            }
                        })
        # Save the file
        file_full = "{}/dfw_rules_exported.json".format(paths['export_dfw'])
        self._myJSON.write_json_file(file_full, rules_dict)
        if (self._myJSON.file_error):
            self._log_writer.warning("Error saving {}".format(file_full))
        else:
            self._log_writer.info("File {} saved".format(file_full))

    def _convert_time(self, time_to_convert):
        '''
            Returns a string with the converted time, or 
            false in case of error
        '''
        try:
            # Convert milleseconds to seconds
            timestamp = time_to_convert / 1000 
            dt = datetime.fromtimestamp(timestamp)
            # Format the date
            converted_time = dt.strftime('%Y-%m-%d %H:%M:%S')
            return converted_time
        
        except Exception as ex:
            return False