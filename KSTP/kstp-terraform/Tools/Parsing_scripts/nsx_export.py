import os.path
import getpass
import sys
from datetime import datetime
from py_modules import logger, filehelper, restapi, foldermenu
from py_modules import names_fix as nf

# 1.01 
#   - changed script's name
#   - changed export path for services and groups
# 2.0
#   - added support for NSX-T dfw rules export
#   - Included disabled field in the exported NSX-T dfw rules
# 2.1
#   - Added section's name to the exported NSX-T dfw rules
#   - Included same name's fix as used in the parse script for rules revalidation
# 2.2
#   - Updated pageSize in "https://{}/api/4.0/edges?pageSize=1024" within the restapi.py module

version = '2.2'

# Get the current working directory (cwd)
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
    ['Please, select the geography:', True, ['AG1', 'AP1', 'EU1', 'IN1']],
    ['What do you need?', True, ['Export NSX-T Services', 'Export NSX-T Groups', 'Export NSX-T DFW Rules', 'Export NSX-V Edges']]
]
myMenu = foldermenu.FolderBasedMenu(my_questions, 'KSTP Export Tool Version {}'.format(version))
myMenu.Question('{}/projects'.format(base_path))
# User exited or an error happened
if (myMenu.exited or myMenu.error):
    print(myMenu.error)
    sys.exit(0) 

geography = myMenu.answers[0]
options = myMenu.answers[1].split(' ')
nsx = options[1].lower()
action = options[2].lower()

now = datetime.now()
export_path = "{}/nsx-exports/{}/{}/{}/{}/{}".format(base_path, geography, action, now.year, now.month, now.day)
log_file = "{}/log/nsx-export.log".format(export_path)
if (action == 'edges'):
    paths = {
        'export_path_edges': '{}/edges_raw'.format(export_path),
        'export_path_vpns': '{}/vpn_raw'.format(export_path),
        'export_edges': '{}/exported/edges'.format(export_path),
        'export_tf': '{}/exported/tf-code'.format(export_path),
    }
if (action == 'services'):
    paths = {
        'export_services': '{}/exported'.format(export_path)
    }
if (action == 'groups'):
    paths = {
        'export_groups': '{}/exported'.format(export_path)
    }
if (action == 'dfw'):
    paths = {
        'export_dfw': '{}/exported'.format(export_path)
    }

# Create the auxiliary objects
myLogger = logger.AppLogger(log_file, 'console', 'file')
log_writer = myLogger.log_writer("NSX-Export")
myJSON = filehelper.fileHelper(log_writer)
myRestAPI = restapi.RestAPICall(log_writer, myLogger, myJSON)

# Get the NSX-V managers options
result = myJSON.read_json_file("{}/Tools/Parsing_scripts/nsx_managers.json".format(base_path))
if (result["error"]):
    log_writer.critical("Couldn't open the NSX managers file")
    log_writer.warning("Error message --> {}".format(result["data"]))
    log_writer.info("Execution will be interrupted")
    myLogger.log_terminate()
else:
    nsx_managers = result["data"]

# Create the export folder
for path_name in paths.values():
    myJSON.create_folder(path_name)
    if (myJSON.file_error):
        log_writer.critical("Couldn't create '{}' folder".format(path_name))
        log_writer.warning("Error message --> {}".format(myJSON.file_data))
        log_writer.info("Execution will be interrupted")
        myLogger.log_terminate()

# Get the required NSX Manager
nsx_manager = nsx_managers[nsx]['managers'][geography]['IP']

# Request the user's ID
print(" ")
print("Please, which ID should be used to connect to '{}'?".format(nsx_manager))
print(" ")
user_id = input("Your ID: ")
if (not user_id):
    print(" ")
    log_writer.info("Empty ID was provided, exiting")
    myLogger.log_terminate()
pwd=getpass.getpass(prompt="'{}' password: ".format(user_id))
print(" ")

# Check what we need to do
if (action == 'edges'):
    myRestAPI.NSXEdges(nsx, nsx_manager, user_id, pwd, paths)
if (action == 'services'):
    myRestAPI.NSXServices(nsx, nsx_manager, user_id, pwd, paths)
if (action == 'groups'):
    myRestAPI.NSXGroups(nsx, nsx_manager, user_id, pwd, paths)
if (action == 'dfw'):
    myRestAPI.NSXDFWRules(nsx, nsx_manager, user_id, pwd, paths)