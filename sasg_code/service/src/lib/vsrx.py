import csv
import json
import os.path
import re

class VsrxConfig:
  def __init__(self, config):
    self.config = config
    
    self._detect_missing_values()

    filename_base = os.path.join('/tmp', self.config['hostname'])
    self.global_addr_csv = '%s%s' % (filename_base, '-firewalls-vSRX-global_addr.csv')
    self.addr_set_csv = '%s%s' % (filename_base, '-firewalls-vSRX-addr_set.csv')
    self.rules_csv = '%s%s' % (filename_base, '-firewalls-vSRX-rules.csv')
    self.nats_csv = '%s%s' % (filename_base, '-nats-vSRX-nats.csv')
    self.rule_sets_csv = '%s%s' % (filename_base, '-nats-vSRX-rule-sets.csv')

  def _detect_missing_values(self):
    if not 'exclude' in self.config.keys():
      self.config['exclude'] = False
    for str_field in [ 'ip', 'key', 'user' ]:
      if not str_field in self.config.keys():
        self.config[str_field] = ''
    for list_field in [ 'global_addresses', 'header', 'footer' ]:
      if not list_field in self.config.keys():
        self.config[list_field] = []
    if not 'port' in self.config.keys():
      self.config['port'] = 22
    for map_field in [ 'address_sets', 'rules', 'rule_sets', 'nats']:
      if not map_field in self.config.keys():
        self.config[map_field] = {}

  def dump_csv(self):
    self._dump_csv_global_addr(self.global_addr_csv)
    self._dump_csv_addr_set(self.addr_set_csv)
    self._dump_csv_rules(self.rules_csv)
    self._dump_csv_nats(self.nats_csv)
    self._dump_csv_rule_sets(self.rule_sets_csv)
  
  def cleanup(self):
    if os.path.isfile(self.global_addr_csv): os.remove(self.global_addr_csv)
    if os.path.isfile(self.addr_set_csv): os.remove(self.addr_set_csv)
    if os.path.isfile(self.rules_csv): os.remove(self.rules_csv)
    if os.path.isfile(self.nats_csv): os.remove(self.nats_csv)
    if os.path.isfile(self.rule_sets_csv): os.remove(self.rule_sets_csv)

  def _dump_csv_global_addr(self, outfile):
    headers = [
      'global_address'
    ]

    with open(outfile, 'wb') as csv_file:
      csv_writer = csv.DictWriter(csv_file, fieldnames=headers)
      csv_writer.writeheader()
      if 'global_addresses' in self.config.keys():
        for global_address in self.config['global_addresses']:
          csv_writer.writerow({
            'global_address': global_address
          })

  def _dump_csv_addr_set(self, outfile):
    headers = [
      'address_set',
      'global_address'
    ]

    with open(outfile, 'wb') as csv_file:
      csv_writer = csv.DictWriter(csv_file, fieldnames=headers)
      csv_writer.writeheader()
      if 'address_sets' in self.config.keys():
        for address_set in self.config['address_sets'].keys():
          for global_address in self.config['address_sets'][address_set]:
            csv_writer.writerow({
              'address_set': address_set,
              'global_address': global_address
            })

  def _dump_csv_rules(self, outfile):
    headers = [
      'hostname',
      'policy_name',
      'from_zone',
      'to_zone',
      'source_address_name',
      'source_address',
      'destination_address_name',
      'destination_address',
      'application_protocol',
      'application_ports',
      'action'
    ]
  
    with open(outfile, 'wb') as csv_file:
      csv_writer = csv.DictWriter(csv_file, fieldnames=headers)
      csv_writer.writeheader()
      if 'rules' in self.config.keys():
        for rule in self.config['rules'].keys():
          csv_writer.writerow({
            'hostname': self.config['hostname'],
            'policy_name': rule,
            'from_zone': self.config['rules'][rule]['from_zone'],
            'to_zone': self.config['rules'][rule]['to_zone'],
            'source_address_name': self.config['rules'][rule]['source_address_name'],
            'source_address': ','.join(self.config['rules'][rule]['source_address']),
            'destination_address_name': self.config['rules'][rule]['destination_address_name'],
            'destination_address': ','.join(self.config['rules'][rule]['destination_address']),
            'application_protocol': ','.join(self.config['rules'][rule]['application_protocol']),
            'application_ports': ';'.join(self.config['rules'][rule]['application_ports']),
            'action': self.config['rules'][rule]['action']
          })

  def _dump_csv_nats(self, outfile):
    headers = [
      'hostname',
      'rule_set',
      'nat_type',
      'description',
      'source_address',
      'source_port',
      'destination_address',
      'destination_port',
      'protocol',
      'translated_address',
      'translated_port'
    ]
  
    with open(outfile, 'wb') as csv_file:
      csv_writer = csv.DictWriter(csv_file, fieldnames=headers)
      csv_writer.writeheader()
      if 'nats' in self.config.keys():
        for nat in self.config['nats']:
          csv_nat = {
            'hostname': self.config['hostname'],
            'rule_set': nat['rule_set'],
            'nat_type': nat['nat_type'],
            'description': nat['description'],
            'source_address': ','.join(nat['source_address']),
            'source_port': ';'.join(nat['source_port']),
            'destination_address': ','.join(nat['destination_address']),
            'destination_port': ';'.join(nat['destination_port']),
            'protocol': ','.join(nat['protocol'])
          }
          if nat['interface']: 
            csv_nat['translated_address'] = 'interface'
            csv_nat['translated_port'] = 'interface'
          elif nat['exclude']:
            csv_nat['translated_address'] = 'exclude'
            csv_nat['translated_port'] = 'exclude'
          else:
            csv_nat['translated_address'] = nat['translated_address']
            csv_nat['translated_port'] = nat['translated_port']
          csv_writer.writerow(csv_nat)

  def _dump_csv_rule_sets(self, outfile):
    headers = [
      'name',
      'set_type',
      'from_type',
      'from_name',
      'to_type',
      'to_name'
    ]
  
    with open(outfile, 'wb') as csv_file:
      csv_writer = csv.DictWriter(csv_file, fieldnames=headers)
      csv_writer.writeheader()
      if 'rule_sets' in self.config.keys():
        for rule_set in self.config['rule_sets'].keys():
          csv_writer.writerow({
            'name': rule_set,
            'set_type': self.config['rule_sets'][rule_set]['set_type'],
            'from_type': self.config['rule_sets'][rule_set]['from_type'],
            'from_name': self.config['rule_sets'][rule_set]['from_name'],
            'to_type': self.config['rule_sets'][rule_set]['to_type'],
            'to_name': self.config['rule_sets'][rule_set]['to_name']
          })

class VsrxCsvConverter:
  def __init__(self, vsrx_csv_builder):
    self.csv_builder = vsrx_csv_builder
    self.disable_vyatta_protect_removal = False
    self.outfile = os.path.join('/tmp', 'vsrx-%s.set' % self.csv_builder.config['hostname'])

  def get_firewall_info(self):
    addr_sets = {}
    global_addrs = {}
    rules = []
    if self.csv_builder.addr_set_csv and os.path.isfile(self.csv_builder.addr_set_csv):
      with open(self.csv_builder.addr_set_csv, 'r') as csv_file:
        for addr_set in csv.DictReader(csv_file):
          if not addr_set['address_set'] in addr_sets.keys():
            addr_sets[addr_set['address_set']] = []
          addr = addr_set['global_address']
          if not '/' in addr and not '-' in addr:
            addr = '%s/32' % addr
          addr_name = addr.replace('.' , '-').replace('/' , '_')
          addr_sets[addr_set['address_set']].append(addr_name)
    
    if self.csv_builder.global_addr_csv and os.path.isfile(self.csv_builder.global_addr_csv):
      with open(self.csv_builder.global_addr_csv, 'r') as csv_file:
        for global_addr in csv.DictReader(csv_file):
          if global_addr['global_address'] == 'any':
            continue
          if '-' in global_addr['global_address']: # processing range as it is
            addr_name = global_addr['global_address'].replace('.' , '-')
            global_addrs[addr_name] = global_addr['global_address']
            continue
          if not global_addr['global_address'] == 'any':
            addr = global_addr['global_address']
            if not '/' in addr:
              addr = '%s/32' % addr
            addr_name = addr.replace('.' , '-').replace('/' , '_')
            global_addrs[addr_name] = addr
    
    if self.csv_builder.rules_csv and os.path.isfile(self.csv_builder.rules_csv):
      with open(self.csv_builder.rules_csv, 'r') as csv_file:
        for rule in csv.DictReader(csv_file):
          rules.append(rule)

    return rules, global_addrs, addr_sets

  def get_nat_info(self):
    nats = []

    if self.csv_builder.nats_csv and os.path.isfile(self.csv_builder.nats_csv):
      with open(self.csv_builder.nats_csv, 'r') as csv_file:
        for nat in csv.DictReader(csv_file):
          nats.append(nat)

    return nats

  def get_rule_sets(self):
    rule_sets = {}

    if self.csv_builder.rule_sets_csv and os.path.isfile(self.csv_builder.rule_sets_csv):
      with open(self.csv_builder.rule_sets_csv, 'r') as csv_file:
        for rule_set in csv.DictReader(csv_file):
          rule_sets[rule_set['name']] = rule_set

    return rule_sets

  def add_global_addr(self, global_addr_name, global_addr, config_file):
    # set security address-book global address 158-87-200-224-158-87-200-231 range-address 158.87.200.224 to 158.87.200.231 
    if '-' in global_addr: 
      lower_address, upper_address = global_addr.split('-')
      self.write_to_config('set security address-book global address %s range-address %s to %s\n' % (global_addr_name, lower_address, upper_address), config_file)
    else:
      self.write_to_config('set security address-book global address %s %s\n' % (global_addr_name, global_addr), config_file)

  def add_addr_set(self, addr_set_name, addr_set, config_file):
    for address in addr_set:
      self.write_to_config('set security address-book global address-set %s address %s\n' % (addr_set_name, address), config_file)
    
  def add_rule(self, rule, config_file, applications, addr_sets, global_addrs):
    if rule['source_address_name'] == 'undefined':
      source = rule['source_address']
      if not '/' in source and not source == 'any': source = '%s/32' % source
      source = source.replace('.', '-').replace('/', '_')
    else: source = rule['source_address_name']
    if rule['destination_address_name'] == 'undefined':
      destination = rule['destination_address']
      if not '/' in destination and not destination == 'any': destination = '%s/32' % destination
      destination = destination.replace('.', '-').replace('/', '_')
    else: destination = rule['destination_address_name']

    action = 'permit' if rule['action'] == 'accept' else 'reject'
    from_zone = 'from-zone %s' % rule['from_zone'] if rule['from_zone'] != 'undefined' else ''
    to_zone = 'to-zone %s' % rule['to_zone'] if rule['to_zone'] != 'undefined' else ''

    self.write_to_config('set security policies %s %s policy %s match source-address %s\n' % (
      from_zone, to_zone, rule['policy_name'], source
    ), config_file)

    self.write_to_config('set security policies %s %s policy %s match destination-address %s\n' % (
      from_zone, to_zone, rule['policy_name'], destination
    ), config_file)

    for port in rule['application_ports'].split(';'):
      if rule['application_protocol'] == port == 'any':
        self.write_to_config('set security policies %s %s policy %s match application any\n' % (
          from_zone, to_zone, rule['policy_name']
        ), config_file)
      else:
        application_name = '%s%s' % (rule['application_protocol'][0], port)
        applications[application_name] = {
          'protocol': rule['application_protocol'],
          'port': port
        }
        self.write_to_config('set security policies %s %s policy %s match application %s\n' % (
          from_zone, to_zone, rule['policy_name'], application_name
        ), config_file)

    self.write_to_config('set security policies %s %s policy %s then %s\n' % (
      from_zone, to_zone, rule['policy_name'], action
    ), config_file)

  def add_nat_pool(self, key, pool, config_file):
    nat_type, address, name = pool['type'], pool['address'], pool['name']
    vsrx_type = 'source' if nat_type[0] == 's' else 'destination'
    if address.strip() != 'any':
      if '-' in address:
        lower_address, upper_address = address.split('-')
        if not '/' in lower_address: lower_address = '%s/32' % lower_address
        if not '/' in upper_address: upper_address = '%s/32' % upper_address
        self.write_to_config('set security nat %s pool %s address %s to %s\n' % (vsrx_type, name, lower_address, upper_address), config_file)
      else:
        if not '/' in address: address = '%s/32' % address
        self.write_to_config('set security nat %s pool %s address %s\n' % (vsrx_type, name, address), config_file)

  def add_rule_set(self, rule_set, config_file):
    name, set_type = rule_set['name'], rule_set['set_type']
    from_type, from_name = rule_set['from_type'], rule_set['from_name']
    to_type, to_name = rule_set['to_type'], rule_set['to_name']

    if from_type.strip() != 'any' and from_name.strip() != 'any':
      self.write_to_config('set security nat %s rule-set %s from %s %s\n' 
          % (set_type, name, from_type, from_name), config_file)
    if to_type.strip() != 'any' and to_name.strip() != 'any':
      self.write_to_config('set security nat %s rule-set %s to %s %s\n' 
          % (set_type, name, to_type, to_name), config_file)

  def get_address_or_pool(self, address_record, record_type, nat_pools, is_translated_nat_address):
    if '-' in address_record:
      pool_name = address_record.replace('.', '').replace('-', '').split('/')[0]
      pool_key = '%s_%s' % (record_type[0], pool_name)
      if not pool_key in nat_pools.keys():
        nat_pools[pool_key] = {
          'name': pool_name,
          'type': record_type,
          'address': address_record
        }
      return pool_name, 'pool '
    elif is_translated_nat_address:
      pool_name = address_record.replace('.', '-').replace('/', '-')
      pool_key = '%s_%s' % (record_type[0], pool_name)
      if not pool_key in nat_pools.keys():
        nat_pools[pool_key] = {
          'name': pool_name,
          'type': record_type,
          'address': address_record
        }
      return pool_name, 'pool '
    else:
      if '/' not in address_record: address_record = '%s/32' % address_record
      return address_record, ''

  def add_nat(self, nat, rule_sets, rule_counters, nat_pools, config_file):

    source_addr = nat['source_address']
    dest_addr = nat['destination_address']
    nat_type, rule_set_name = nat['nat_type'], nat['rule_set']
    rule_number = (rule_counters[rule_set_name] + 1) if rule_set_name in rule_counters.keys() else 1
    rule_counters[rule_set_name] = rule_number

    rule_set = rule_sets[rule_set_name]

    if source_addr.strip() != 'any':
      source_addr, is_pool = self.get_address_or_pool(source_addr, 'source', nat_pools, False)
      self.write_to_config('set security nat %s rule-set %s rule %s_%03d match source-address %s%s\n' 
        % (nat_type, rule_set_name, rule_set_name, rule_number, is_pool, source_addr), config_file)

    for source_port in [ 
      port for sublist in [ 
        port.split(';') for port in nat['source_port'].split(',') 
      ] for port in sublist 
    ]:
      if source_port.strip() != 'any':
        self.write_to_config('set security nat %s rule-set %s rule %s_%03d match source-port %s\n' 
          % (nat_type, rule_set_name, rule_set_name, rule_number, source_port), config_file)

    if dest_addr.strip() != 'any':
      dest_addr, is_pool = self.get_address_or_pool(dest_addr, 'destination', nat_pools, False)
      self.write_to_config('set security nat %s rule-set %s rule %s_%03d match destination-address %s%s\n' 
        % (nat_type, rule_set_name, rule_set_name, rule_number, is_pool, dest_addr), config_file)

    for dest_port in [ 
      port for sublist in [ 
        port.split(';') for port in nat['destination_port'].split(',') 
      ] for port in sublist 
    ]:
      if dest_port.strip() != 'any':
        self.write_to_config('set security nat %s rule-set %s rule %s_%03d match destination-port %s\n' 
          % (nat_type, rule_set_name, rule_set_name, rule_number, dest_port), config_file)
    
    nat_param_type = rule_set['from_type'] if nat_type == 'source' else rule_set['to_type']
    if nat_param_type.strip() == 'interface' or nat['translated_address'].strip() == 'interface':
      self.write_to_config('set security nat %s rule-set %s rule %s_%03d then %s-nat interface\n' 
        % (nat_type, rule_set_name, rule_set_name, rule_number, nat_type), config_file)
    elif nat['translated_address'].strip() == 'exclude' or nat['translated_port'].strip() == 'exclude':
      self.write_to_config('set security nat %s rule-set %s rule %s_%03d then %s-nat off\n' 
        % (nat_type, rule_set_name, rule_set_name, rule_number, nat_type), config_file)
    else:
      translated_address = nat['translated_address']
      translated_address, is_pool = self.get_address_or_pool(translated_address, nat_type, nat_pools, True)
      self.write_to_config('set security nat %s rule-set %s rule %s_%03d then %s-nat %s%s\n' 
        % (nat_type, rule_set_name, rule_set_name, rule_number, nat_type, is_pool, translated_address), config_file)
    
    if not nat['description'].strip() in [ '', 'n/a']:
      self.write_to_config('set security nat %s rule-set %s rule %s_%03d  description "%s"\n' 
        % (nat_type, rule_set_name, rule_set_name, rule_number, nat['description'].strip()), config_file)

  def add_application(self, app_name, application, config_file):
    protocols = application['protocol']
    protocols = 'tcp,udp' if protocols.strip() == 'any' else protocols

    for protocol in protocols.split(','):
      self.write_to_config('set applications application %s term %s protocol %s\n' % 
        (app_name, protocol, protocol), config_file)
      if application['port'].strip() != 'any':
        self.write_to_config('set applications application %s term %s destination-port %s\n' % 
        (app_name, protocol, application['port']), config_file)

  def write_to_config(self, value, outfile):

    if not self.disable_vyatta_protect_removal:
      if 'PROTECT_VYATTA' in value.upper():
        return

    outfile.write(re.sub(' +', ' ', value))

  def write_static_commands(self, static_lines, outfile):
    for static_line in static_lines:
      if not static_line.strip() or static_line.strip()[0] == '#':
        continue
      
      self.write_to_config('%s%s' % (static_line, '\n'), outfile)
    
    self.write_to_config('\n', outfile)

  def cleanup(self):
    if os.path.isfile(self.outfile): os.remove(self.outfile)
