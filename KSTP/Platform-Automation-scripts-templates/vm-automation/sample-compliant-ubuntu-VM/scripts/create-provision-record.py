import yaml
import io
import os
import sys

if len(sys.argv) <= 1:
	print "USAGE: create-provision-record.py <vm-information> "
	sys.exit()

vm_information = sys.argv[1]
print (vm_information)
#

my_dict = yaml.load(open(sys.argv[1]))

print ( my_dict)

# Read YAML file
#with open(vm_information, 'r') as stream:
#    data_loaded = yaml.load(stream)

print("vm_name:",my_dict['instance']['hw_name'])
