import json
import re

def write_to_file(file_name,dictionary):

    with open(file_name, "w") as outfile:
         json.dump(dictionary, outfile, indent=4)

def add_hosts_dres_tab(ROW,col,worksheet):
    
    hosts = []
    for row in range(ROW + 3,worksheet.max_row + 1):
        
        host = dict()
        ip_cell             = worksheet.cell(row,col)
        hostname_cell       = worksheet.cell(row,col + 1)
        comments_cell       = worksheet.cell(row,col + 2)
        
        if ip_cell.value and re.match(r"VxLAN", ip_cell.value):
           break                                              
        else:
           host['ip']          = ip_cell.value
           host['hostname']    = ''
           host['description'] = ''
           if hostname_cell.value and hostname_cell.value.strip():
              host["hostname"] = hostname_cell.value
              if re.match(r"rese", host["hostname"].lower()):
                 host['tag']         = 'Reserved'
                 host['description'] = host['hostname']
                 host['hostname']    = ''
              else:
                 host['tag'] = 'Used'
           if comments_cell.value:
              host['description'] = comments_cell.value + host['description']
           
           if hostname_cell.fill.fgColor.rgb == "FFFFF2CC":
              host['tag'] = 'Reserved'       
           if "tag" in host and not hostname_cell.font.strike and not host["hostname"] == "free":
               hosts.append(host)

    return [row,hosts]        

def add_hosts_gsni_cgn_translation_tab(ROW,col,worksheet):
    
    hosts = []
    for row in range(ROW,worksheet.max_row + 1):
        
        host = dict()
        ispw_ip_cell   = worksheet.cell(row,col)
        gsni_ip_cell   = worksheet.cell(row,col + 1)
        gsni_site_cell = worksheet.cell(row,col + 2)
        comments_cell  = worksheet.cell(row,col + 3)
        program_cell   = worksheet.cell(row,col + 4)
        
        if ispw_ip_cell.value :
           host['ISPW CGN IP'] = ispw_ip_cell.value
           if re.match(r"rese", ispw_ip_cell.value.lower()):
              host['tag'] = 'Reserved'
           elif gsni_ip_cell.value:
              host['GSNI CGN IP'] = gsni_ip_cell.value
              host['tag']         = 'Used'   
        
        if gsni_site_cell.value :
           host['GSNI Site'] = gsni_site_cell.value
        else:
           host['GSNI Site'] = '' 
        
        if comments_cell.value :
           host['Comments'] = comments_cell.value
        else:
           host['Comments'] = ''

        if program_cell.value :
           host['Program'] = program_cell.value
        else:
           host['Program'] = ''

        if "tag" in host:
            hosts.append(host) 
             
    return hosts

def add_hosts_hres(ROW,col,worksheet):
    hosts = []
    for row in range(ROW,worksheet.max_row + 1):
        
        host = dict()

        ip_cell               = worksheet.cell(row,col)
        hres_cell             = worksheet.cell(row,col + 1)
        hres_gsni_ip_cell     = worksheet.cell(row,col + 2)
        agg_gsni_ip_cel_cell  = worksheet.cell(row,col + 3)
        comments_cell         = worksheet.cell(row,col + 4)
        
        if ip_cell.value :

           host['IP'] = ip_cell.value
           if hres_cell.value:
              host['HRES'] = hres_cell.value

           if hres_gsni_ip_cell.value:
              host['HRES GSNI NAT IP'] = hres_gsni_ip_cell.value
              host['tag'] = 'Used'
           elif comments_cell.value and re.match(r"rese", comments_cell.value.lower()):
                host['HRES GSNI NAT IP'] = ''
                host['tag'] = 'Reserved'   
          
        if agg_gsni_ip_cel_cell.value:
           host['AGG GSNI NAT IP'] = agg_gsni_ip_cel_cell.value
        else:
           host['AGG GSNI NAT IP'] = '' 
        
        if comments_cell.value :
           host['Comments'] = comments_cell.value
        else:
           host['Comments'] = ''

        if "tag" in host:
            hosts.append(host) 
             
    return hosts

def add_hosts_sl_public_tab(ROW,col,worksheet):
    hosts = []
    for row in range(ROW,worksheet.max_row + 1):
        
        host = dict()
        ip_cell       = worksheet.cell(row,col)
        hostname_cell = worksheet.cell(row,col + 1)
        
        if ip_cell.value :

           host['ip'] = ip_cell.value
           if hostname_cell.value:
              host['hostname'] = hostname_cell.value
              if re.match(r"rese", host['hostname'].lower()):
                 host['tag'] = 'Reserved'
                 host["description"] = host["hostname"]
                 host['hostname'] = ''
              else:   
                 host['tag'] = 'Used'
                 host['hostname'] = hostname_cell.value          

        if "tag" in host:
            hosts.append(host) 
             
    return hosts

def parse_dres_tab(worksheet,col):
    
    max_row = worksheet.max_row
    row = 2
    dres = dict()
    dres['name']           =  worksheet.cell(row,col).value.strip()
    dres['subnet']         =  worksheet.cell(row + 2,col).value.split('/')[0] + '/23' 
    dres['nested_subnets'] = []  
                               
    ROW = 3
    while ROW < max_row:
       name   = worksheet.cell(ROW,col).value.replace("VxLAN:","").strip()
       subnet = worksheet.cell(ROW+1,col).value 
       ROW,hosts = add_hosts_dres_tab(ROW,col,worksheet) 
       dres['nested_subnets'].append({ "name"   : name,
                                       "subnet" : subnet,
                                       "hosts"  : hosts
                                     }) 
    return dres                              



def parse_gsni_cgn_translation(worksheet,col):
    
    row = 2
    info = dict()
    info['name']   = worksheet.cell(row,col).value.strip()
    info['subnet'] = worksheet.cell(row + 2,col).value  
    info['hosts']  = add_hosts_gsni_cgn_translation_tab(6,col,worksheet)                           
    return info

def parse_hres(worksheet,col):
    row = 2
    info = dict()
    info['name']   = worksheet.cell(row,col).value.strip()
    info['vlan']   = worksheet.cell(row+1,col).value.replace("VxLAN:","").strip()
    info['subnet'] = worksheet.cell(row + 2,col).value  
    info['gsni_subnet'] = worksheet.cell(row + 2,col+3).value
    info['hosts']  = add_hosts_hres(6,col,worksheet)                           
    return info

def parse_sl_public_sub(worksheet,col):
    
    row = 2
    info = dict()
    info['name']   = worksheet.cell(row,col).value.strip()
    info['vlan']   = worksheet.cell(row+1,col).value.split('-')[0].strip()
    info['type']   = worksheet.cell(row+1,col).value.split('-')[1].strip()
    info['subnet'] = worksheet.cell(row + 2,col).value  
    info['hosts']  = add_hosts_sl_public_tab(6,col,worksheet)                           
    return info
