# -*- coding: utf-8 -*-
import sys, os, re, ipaddress
import time
import datetime
import tarfile
import json
from ssh import SSH 

# Excel
from mmap import mmap,ACCESS_READ
from datetime import date,datetime,time
from xlrd import open_workbook, cellname, cellnameabs, colname, xldate_as_tuple, XL_CELL_TEXT, error_text_from_code

class VARS:
    filters = {}

    # Need manually retrieved.
    #SASG_IP_1 - Need to get this from the spreadsheet SASG111, since we do not have this configured in any CDS devices.
    #SASG_IP_2 - Need to get this from the spreadsheet SASG111, since we do not have this configured in any CDS devices.
    #SASG_VIP1 - Need to get this from the spreadsheet SASG111, since we do not have this configured in any CDS devices.
    #SASG_VIP2 - Need to get this from the spreadsheet SASG111, since we do not have this configured in any CDS devices.
    #DNS_IP - Need to get this from the spreadsheet SASG111, since we do not have this configured in any CDS devices.
    #LDAP_IP - Need to get this from the spreadsheet SASG111, since we do not have this configured in any CDS devices.

    # Static information (or not-used information)
    #SASGAAS_MS_IP - This will always be the same, since there is only one instance of SASGaaS today in the global management segment
    #SASGAAS_CDS_IP - This is not used, we decided to place SASGaaS in the global management segment
    # SASGAAS_MS_IP='10.148.11.148'
    # MS_VYATTA_IP='10.149.99.238'
    # APM_IP=159.8.20.241

    #excluded ones.
    #{ "name": "Customer Endpoint Subnets", "col": 1, "type": "ip", "var_type": "string", "var": "CUSTOMER_SUBNETS[0]", "color": 13 }, 
    #{ "name": "VyOS", "col": 2, "type": "ip", "var_type": "string", "var": "PUBLIC_VYOS_IP", "color": 13 },
    #{ "name": "BPM", "col": 3, "type": "ip", "var_type": "string", "var": "BPM_IP", "color": 13 },
    #{ "name": "Chef", "col": 3, "type": "ip", "var_type": "string", "var": "CHEF_IP", "color": 13 },
    #{ "name": "EE", "col": 3, "type": "ip", "var_type": "string", "var": "EE_IP", "color": 13 },
    #{ "name": "ASB", "col": 3, "type": "ip", "var_type": "string", "var": "ASB_IP", "color": 13 },
    #{ "name": "RCP BPM", "col": 3, "type": "ip", "var_type": "string", "var": "RCP_BPM_IP", "color": 13 },
    #{ "name": "RCP ROR", "col": 3, "type": "ip", "var_type": "string", "var": "RCP_ROR_IP", "color": 13 }

    filters["Account Details"] = [ 
        { "name": "Customer Name", "col": 1, "type": "string", "var_type": "string", "var": "CUSTOMER_NAME", "color": 13 }, 
        { "name": "Customer Geography", "col": 1, "type": "string", "var_type": "string", "var": "CUSTOMER_GEO", "color": 13 }, 
        { "name": "Customer DNS Servers", "col": 1, "type": "ip", "var_type": "array", "var": "DNS_IP", "color": 13 }, 
        { "name": "Customer DNS Server IP", "col": 1, "type": "ip", "var_type": "array", "var": "DNS_IP", "color": 13 }, 
        { "name": "DNS_IP", "col": 1, "type": "ip", "var_type": "array", "var": "DNS_IP", "color": 13 }, 
        { "name": "LDAP_IP", "col": 1, "type": "ip", "var_type": "array", "var": "DNS_IP", "color": 13 }, 
        { "name": "Customer LDAP Servers", "col": 1, "type": "ip", "var_type": "array", "var": "LDAP_IP", "color": 13 },
        { "name": "Customer LDAP Server IP", "col": 1, "type": "ip", "var_type": "array", "var": "LDAP_IP", "color": 13 },
        { "name": "VyOS", "col": 3, "type": "ip", "var_type": "string", "var": "PRIVATE_VYOS_IP", "color": 13 }
    ]

    filters["OpenVPN"] = [
        { "name": "SASG VM1 Private IP", "col": 2, "type": "ip", "var_type": "string", "var": "SASG_IP_1" }, 
        { "name": "SASG VM2 Private IP", "col": 2, "type": "ip", "var_type": "string", "var": "SASG_IP_2" }, 
        { "name": "SASG Virtual IP 1", "col": 2, "type": "ip", "var_type": "string", "var": "SASG_VIP1[0]" }, 
        { "name": "SASG Virtual IP 2", "col": 2, "type": "ip", "var_type": "string", "var": "SASG_VIP2[0]" }, 
        { "name": "SASG Virtual IP 3", "col": 2, "type": "ip", "var_type": "string", "var": "SASG_VIP3[0]" }, 
        { "name": "SASG Virtual IP 4", "col": 2, "type": "ip", "var_type": "string", "var": "SASG_VIP4[0]" }, 
        { "name": "SASG Virtual IP 5", "col": 2, "type": "ip", "var_type": "string", "var": "SASG_VIP5[0]" }, 
        { "name": "SASG Virtual IP 6", "col": 2, "type": "ip", "var_type": "string", "var": "SASG_VIP6[0]" }
    ]

    collect = ["PRIVATE_VYOS_IP", "BPM_IP", "CHEF_IP", "EE_IP", "ASB_IP", "RCP_BPM_IP", "RCP_ROR_IP" ]

    def find_index(self, arr, key):
        idx = 0
        for item in arr:
            if item and item[0] != '#' and key in item:
                return idx
            idx = idx + 1
        return None

    def get_gateway_ip(self, addr):
	addrs = addr.split('.')
	addrs[3] = str(int(addrs[3]) + 1)
	return '.'.join(addrs)

    def excel_parsing(self, filepath, temp_filepath, output_dir='./'):
	print(filepath)

        try: 
            wb = open_workbook(filepath, formatting_info=True)
        except NotImplementedError:
            print('This tool only supports xls file. Please conver your xlsx to xls file')
	    return -1

        temp_list = open(temp_filepath, 'r').read().split('\n')
	temp_json = {}
        customername = ''
        for s in wb.sheets():
            #print('Sheet:', s.name)
            #print('Number of Rows/Columbs:', s.nrows, s.ncols)

            for row in range(s.nrows):
                for fil in self.filters.get(s.name,[]):
		    try: # 'ascii' codec can't encode character u'\xa0' in position 4: ordinal not in range(128)
			str(s.cell(row,0).value)
		    except:
		  	continue

                    if fil.get("name") in str(s.cell(row,0).value):
                        col = int(fil.get("col"))
			try: # 'ascii' codec can't encode character u'\xa0' in position 4: ordinal not in range(128)
			    val = str(s.cell(row,col).value)
			except:
			    continue

                        if s.cell(row,0).value == "Customer Name":
                            customername = val.replace(' ', '')

                        xfx = s.cell_xf_index(row, col)
                        xf = wb.xf_list[xfx]
                        bgx = xf.background.pattern_colour_index
                        if fil.get("color") and bgx != fil.get("color"): continue # only yellow

                        valid = True
                        val = val.split('\n')
                        for v in val:
                            if fil.get("type") == "ip" and not self.is_valid_ip(v):
                                valid = False
                                break

                            if fil.get("type") == "string" and not v:
                                valid = False
                                break

                        if not valid: continue

                        idx = self.find_index(temp_list, fil.get("var"))

                        if fil.get("var") in self.collect:
                            temp_json[fil.get("var")] = ' '.join(val)

                        fval = ''
                        if fil.get("var_type") == "string":
			    ival = ' '.join(val).strip()
                            if len(ival.split()) > 1:
                                fval = fil.get("var") + '="' + ival  + '"'
                            else:
                                fval = fil.get("var") + '=' + ival
                        elif fil.get("var_type") == "ip":
			    fval = fil.get("var") + '=' + self.subnet_to_ip(ival)
                        elif fil.get("var_type") == "array":
                            for item in range(len(val)):
                                if len(val[item].split(' ')) > 1:
                                    fval = fval + (fil.get("var") + '[' + str(item) + ']="' + val[item]) + '"\n'
                                else:
                                    fval = fval + (fil.get("var") + '[' + str(item) + ']=' + val[item]) + '\n'

                        #print('line: ', fil.get("var"), self.find_index(temp_list, fil.get("var")))
                        if not idx:
                            temp_list.append(fval)
                        else:
                            temp_list[idx] = fval

        if not customername:
            print('Customer name is not known. Please add the customername')
            return -1

	#{'ASB_IP': u'10.155.93.248', 'BPM_IP': u'10.155.93.244', 'EE_IP': u'10.155.93.155', 'RCP_ROR_IP': u'10.155.93.245', 'RCP_BPM_IP': u'10.155.93.244', 'CHEF_IP': u'10.155.93.162', 'PRIVATE_VYOS_IP': u'10.155.93.168'}

        # VYOS

	adds = {}

	ssh = SSH()
    	#rc, output = ssh.run_remote_cmd('automate', '/home/automate/.ssh/id_rsa', temp_json.get("PRIVATE_VYOS_IP"), 'show firewall group MANAGEMENT_SEGMENT', port=2222) # can't recognize 'show'

        print(temp_json.get("PRIVATE_VYOS_IP"))

	rc, output = ssh.session_open(temp_json.get("PRIVATE_VYOS_IP"), 'automate', './keys/automate', port=2222)	
	if rc:
            print("ERROR: failed to open session to vyos: ", output, temp_json)
	    return -1

	ssh.session_send('configure')

        #CUSTOMER_SUBNETS[0]="10.0.0.0/8"
	rc, output = ssh.session_send('show firewall group network-group CUST_ENDPOINTS')
        subnets = ''
	for line in output.split('\n'):
            if '1.0.0.0/8' in line: continue
	    items = line.strip().split(' ')
	    if items[0] == 'network':
                subnets += items[1] + ' '
        adds['CUSTOMER_SUBNETS'] = subnets.strip()

        print('--- CUSTOMER_SUBNETS, CUST_ENDPOINTS', adds)

	rc, output = ssh.session_send('show vpn ipsec site-to-site')
        subnets = ''
        if 'remote' in output and 'prefix' in output:
            adds['TUNNEL_TYPE'] = 'ipsec'
        #else: # default (no need to enable)
        #    adds['TUNNEL_TYPE'] = 'openvpn'

        print('--- TUNNEL_TYPE', adds)

        #show firewall group address-group SASG_MASQ_IP
	#rc, output = ssh.session_send('show firewall group address-group SASG_MASQ_IP')
	#for line in output.split('\n'):
	#    items = line.strip().split(' ')
	#    if items[0] == 'address':
        #        adds['SASG_MASQ_IP'] = items[1]
        #print('--- SASG_MASQ_IP', adds['SASG_MASQ_IP'])

        #PUBLIC_VYOS_IP
        #show interfaces ethernet eth1 
        #address 173.192.171.120/28
	rc, output = ssh.session_send('show interfaces ethernet eth1')
	for line in output.split('\n'):
	    items = line.strip().split(' ')
	    if items[0] == 'address':
                adds['PUBLIC_VYOS_IP'] = self.subnet_to_ip(items[1])

        print('--- PUBLIC_VYOS_IP', adds)

 	#DEDICATED_SEGMENT=
	# It can be assumed that any entry besides 10.149.99.238 is a mini-mgmt segment IP
	rc, output = ssh.session_send('show firewall group address-group DEDICATED_SEGMENT')
        tools = []
	for line in output.split('\n'):
	    items = line.strip().split(' ')
	    if items[0] == 'address': # TODO: check whether the sequence makes sense....???
                if items[1] != '10.149.99.238' and items[1] != '127.0.0.1' and items[1] != temp_json.get("PRIVATE_VYOS_IP"):
                    tools.append(items[1].strip())

        tool_list = ["BPM_IP", "CHEF_IP", "EE_IP", "ASB_IP", "RCP_BPM_IP", "RCP_ROR_IP"]
        if len(tools) > len(tool_list):
            print("ERROR: more tools than tool_list", tools)
            return -1

        index = 0
        for fip in tools:
            adds[tool_list[index]] = fip
            index += 1

        print('--- dedicated segment', adds)

 	#MINI_MS_VYATTA_IP=
	# It can be assumed that any entry besides 10.149.99.238 is a mini-mgmt segment IP
	rc, output = ssh.session_send('show firewall group address-group MANAGEMENT_SEGMENT')
	for line in output.split('\n'):
	    items = line.strip().split(' ')
	    if items[0] == 'address' and items[1] != '10.149.99.238':
		adds['MINI_MS_VYATTA_IP'] = items[1].strip()

        print('--- MINI_MS_VYATTA_IP', adds)

	#SASG_MASQ_IP[0]= This can be found in the vyos config:
	adds['SASG_MASQ_IP'] = []
	rc, output = ssh.session_send('show firewall group address-group SASG_MASQ_IP')
	if rc:
            print("ERROR: failed to open session to session_send: ", output)
	    return -1
	for line in output.split('\n'):
	    items = line.strip().split(' ')
	    if items[0] == 'address' and items[1] != '9.9.9.9':
		adds['SASG_MASQ_IP'].append(items[1].strip())

	ssh.session_close()

	if len(adds['SASG_MASQ_IP']) == 0:
	    adds['SASG_MASQ_IP'].append('9.9.9.9')

        adds['MS_VYATTA_IP']='10.149.99.238'
	adds['SASGAAS_MS_IP'] = '10.148.11.148'

	rc, output = ssh.session_open(adds.get("EE_IP"), 'automate', './keys/automate', port=2222)	
	if rc:
            print("ERROR: failed to open session to ee: ", output, temp_json)
	    return -1

	ssh.session_send('\n')
	#TOOLS_SUBNET=
	#BCR_IP=
	#ip addr show eth0 -> find the same way as scripts... and first address..
	rc, output = ssh.session_send('ip -f inet -o address')
	if rc:
            print("ERROR: failed to open session to session_send for ip inet: ", output)
	    return -1
	for line in output.split('\n'):
            items = re.sub( '\s+', ' ', line).strip().split()
	    if items[1] == 'eth0':
		net = ipaddress.ip_interface(unicode(items[3], 'utf-8'))
		adds['TOOLS_SUBNET'] = items[3].strip()
		adds['BCR_IP'] = self.get_gateway_ip(str(net.network.network_address))

	for add in adds.keys():
	    if type(adds.get(add)) == str:
		idx = self.find_index(temp_list, add)
                if not idx: 
                    print('ERROR: ', idx, add, val)
                    continue
                val = adds.get(add)
                if len(val.strip().split()) > 1:
                    temp_list[idx] = add + '="' + val + '"'
                else:
                    temp_list[idx] = add + '=' + val
	    elif type(adds.get(add)) == list:
	  	fval = ''
		for num in range(len(adds.get(add))):
		    key = add + '[' + str(num) + ']'
		    val = adds.get(add)[num]
                    if len(val.strip().split()) > 1:
                        fval += key + '="' + val + '"\n'
                    else:
                        fval += key + '=' + val + '\n'
	        idx = self.find_index(temp_list, add)
                print('ERROR: ', idx, add, fval)
	        temp_list[idx] = fval

        try:
            cusfilename = customername.replace(' ', '') + '.vars'
            open('/'.join([output_dir, cusfilename]), 'w+').write('\n'.join(temp_list))
            print('Vars file is successfully generated. Please find the %s file' % cusfilename)
        except Exception, e:
            print('ERROR: ', str(e))

	print('----------------------')

    def isnumber(self, value):
        try:
            float(value)
            return True
        except ValueError:
            return False

    def subnet_to_ip(self, subnet):
        """Just return IP part.
        """
        return subnet.split('/')[0].strip()

    def is_valid_ip(self, ip):
        """Validates IP addresses.
        """
        if not ip: return False
        if '/' in ip: # incl. subnet x.x.x.x/x
            ips = ip.split('/')
            if not ips[1].isdigit() or int(ips[1]) > 32:
                return False 
            ip = ips[0]
        return self.is_valid_ipv4(ip) or self.is_valid_ipv6(ip)

    def is_valid_ipv4(self, ip):
        """Validates IPv4 addresses.
        """
        pattern = re.compile(r"""
            ^
            (?:
            # Dotted variants:
            (?:
                # Decimal 1-255 (no leading 0's)
                [3-9]\d?|2(?:5[0-5]|[0-4]?\d)?|1\d{0,2}
            |
                0x0*[0-9a-f]{1,2}  # Hexadecimal 0x0 - 0xFF (possible leading 0's)
            |
                0+[1-3]?[0-7]{0,2} # Octal 0 - 0377 (possible leading 0's)
            )
            (?:                  # Repeat 0-3 times, separated by a dot
                \.
                (?:
                [3-9]\d?|2(?:5[0-5]|[0-4]?\d)?|1\d{0,2}
                |
                0x0*[0-9a-f]{1,2}
                |
                0+[1-3]?[0-7]{0,2}
                )
            ){0,3}
            |
            0x0*[0-9a-f]{1,8}    # Hexadecimal notation, 0x0 - 0xffffffff
            |
            0+[0-3]?[0-7]{0,10}  # Octal notation, 0 - 037777777777
            |
            # Decimal notation, 1-4294967295:
            429496729[0-5]|42949672[0-8]\d|4294967[01]\d\d|429496[0-6]\d{3}|
            42949[0-5]\d{4}|4294[0-8]\d{5}|429[0-3]\d{6}|42[0-8]\d{7}|
            4[01]\d{8}|[1-3]\d{0,9}|[4-9]\d{0,8}
            )
            $
        """, re.VERBOSE | re.IGNORECASE)
        return pattern.match(ip) is not None

    def is_valid_ipv6(self, ip):
        """Validates IPv6 addresses.
        """
        pattern = re.compile(r"""
            ^
            \s*                         # Leading whitespace
            (?!.*::.*::)                # Only a single whildcard allowed
            (?:(?!:)|:(?=:))            # Colon iff it would be part of a wildcard
            (?:                         # Repeat 6 times:
                [0-9a-f]{0,4}           #   A group of at most four hexadecimal digits
                (?:(?<=::)|(?<!::):)    #   Colon unless preceeded by wildcard
            ){6}                        #
            (?:                         # Either
                [0-9a-f]{0,4}           #   Another group
                (?:(?<=::)|(?<!::):)    #   Colon unless preceeded by wildcard
                [0-9a-f]{0,4}           #   Last group
                (?: (?<=::)             #   Colon iff preceeded by exacly one colon
                |  (?<!:)               #
                |  (?<=:) (?<!::) :     #
                )                       # OR
            |                           #   A v4 address with NO leading zeros
                (?:25[0-4]|2[0-4]\d|1\d\d|[1-9]?\d)
                (?: \.
                    (?:25[0-4]|2[0-4]\d|1\d\d|[1-9]?\d)
                ){3}
            )
            \s*                         # Trailing whitespace
            $
        """, re.VERBOSE | re.IGNORECASE | re.DOTALL)
        return pattern.match(ip) is not None

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: %s <customer excel> <vars.template> <output folder>" % sys.argv[0])
        sys.exit(-1)

    var = VARS()
    rc = 0
    try:
        out_dir = sys.argv[3]
	rc = var.excel_parsing(sys.argv[1], sys.argv[2], out_dir)
    except:
	out_dir = None
	rc = var.excel_parsing(sys.argv[1], sys.argv[2])

    if rc:
	print('++++ FAILED: %s' % sys.argv[1])
	# move the file into the failed folder if needed
