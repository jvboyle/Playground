# -*- coding: utf-8 -*-

import subprocess

ANSIBLE_PLAYBOOKS = {
  'test connection': '/app/service/ansible-playbooks/test-connection.yml'
}

def create_ansible_inventory(customer_object, customer_name):
  machines = []
  with open('/sasg_data/userdata/customers/%s/inventory' % customer_name, 'w') as inventory_file:
    if 'PRIVATE_VYOS_IP' in customer_object.keys():
      inventory_file.write('[sasfw]\n')
      machines.append('sasfw')
      inventory_file.write('sasfw ansible_host=%s\n\n' % customer_object['PRIVATE_VYOS_IP'])
    if 'BPM_IP' in customer_object.keys():
      inventory_file.write('[bpm]\n')
      machines.append('bpm')
      inventory_file.write('bpm ansible_host=%s\n\n' % customer_object['BPM_IP'])
    if 'EE_IP' in customer_object.keys():
      inventory_file.write('[ee]\n')
      machines.append('ee')
      inventory_file.write('ee ansible_host=%s\n\n' % customer_object['EE_IP'])
    if 'CHEF_IP' in customer_object.keys():
      inventory_file.write('[chef]\n')
      machines.append('chef')
      inventory_file.write('chef ansible_host=%s\n\n' % customer_object['CHEF_IP'])
    if 'CEBW_IP' in customer_object.keys():
      inventory_file.write('[cebw]\n')
      machines.append('cebw')
      inventory_file.write('cebw ansible_host=%s\n\n' % customer_object['CEBW_IP'])
    if 'ASB_IP' in customer_object.keys():
      inventory_file.write('[asb]\n')
      machines.append('asb')
      inventory_file.write('asb ansible_host=%s\n\n' % customer_object['ASB_IP'])
    if 'CSC_IP' in customer_object.keys():
      inventory_file.write('[csc]\n')
      machines.append('csc')
      inventory_file.write('csc ansible_host=%s\n\n' % customer_object['CSC_IP'])
    if 'RCP_IP' in customer_object.keys():
      inventory_file.write('[rcp]\n')
      machines.append('rcp')
      inventory_file.write('rcp ansible_host=%s\n\n' % customer_object['RCP_IP'])
    if 'RCP_BPM' in customer_object.keys():
      inventory_file.write('[rcp_bpm]\n')
      machines.append('rcp_bpm')
      inventory_file.write('rcp_bpm ansible_host=%s\n\n' % customer_object['RCP_BPM'])
    if 'RCP_ROR' in customer_object.keys():
      inventory_file.write('[rcp_ror]\n')
      machines.append('rcp_ror')
      inventory_file.write('rcp_ror ansible_host=%s\n\n' % customer_object['RCP_ROR'])

    if machines:
      inventory_file.write('[all:children]\n')
      for machine in machines:
        inventory_file.write('%s\n' % machine)
      inventory_file.write('\n')
      inventory_file.write('[all:vars]\n')
      inventory_file.write('ansible_port=2222\n')
      inventory_file.write('ansible_user=sasauto\n')
      inventory_file.write('ansible_ssh_common_args=\'-o StrictHostKeyChecking=no\'\n')
    
def run_ansible_playbook(customer_name, bluegroup, playbook, host='all'):
  inventory_path = '/sasg_data/userdata/customers/%s/inventory' % customer_name
  private_key = '/sasg_data/userdata/%s/keys/sasauto' % bluegroup
  ansible_playbook_command = [
    '/usr/bin/ansible-playbook',
    '--inventory=%s' % inventory_path,
    '--private-key=%s' % private_key,
    playbook
  ]

  try:
    print('running command')
    # output = subprocess.check_output(['ls', '-l', '/sasg_data/userdata'])
    output = subprocess.check_output(ansible_playbook_command)
    return 0, output
  except subprocess.CalledProcessError as e:
    print('CalledProcessError exception: %s (%s)' % (e.returncode, e.output))
    return e.returncode, e.output
  except Exception as e:
    print('other exception')
    return 1, e.message