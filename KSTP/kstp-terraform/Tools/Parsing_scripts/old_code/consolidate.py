import os
import sys
import copy
import json
import shutil

from py_modules import logger
from py_modules import filehelper
from py_modules import foldermenu

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
    ['Please, select the geography:', True, []]
]
myMenu = foldermenu.FolderBasedMenu(my_questions, 'KSTP Shared Resources Consolidation')
myMenu.Question('{}/projects'.format(base_path))
# User exited or an error happened
if (myMenu.exited or myMenu.error):
    print(myMenu.error)
    sys.exit(0)     

##############################################################
# CREATE REQUIRED VARIABLES AND FOLDERS                      #
##############################################################
# Get the inputs
geography   = myMenu.answers[0]

# Update CWD 
cwd = '{}/projects/{}/Shared'.format(base_path, geography)
std_name = 'DFW.auto.tfvars.json'

# Required files
log_file               = '{}/log/parse_excel.log'.format(cwd)

# Create log and file handler objects
myLoggerObj = logger.AppLogger(log_file, 'console', '')
myLogger    = myLoggerObj.log_writer('KSTP_CONSOLIDATE')
myFiles     = filehelper.fileHelper(myLogger)

print(' ')
myLogger.info('Reading source files ...')
try:
    folders = os.scandir(cwd)
    # Check the folders within the 'Shared' root folder
    for folder in folders:
        if (folder.is_dir() and folder.name.startswith('1')):
            myLogger.info('   |-- Checking {}'.format(folder.name))
            shared_folder = '{}/{}'.format(cwd, folder.name)
            migration_path = '{}/migrations'.format(shared_folder)
            dfw_file = '{}/{}/{}'.format(cwd, folder.name, std_name)
            if (os.path.isfile(dfw_file)):
                result = myFiles.read_json_file(dfw_file)
                if (result['error']):
                    myLogger.critical('      |-- Error -> {}'.format(result['data']))
                    myLogger.warning('      |-- Please correct the error above and try again.')
                    myLogger.info('      |-- Execution interrupted')
                    myLoggerObj.log_terminate()
                else:
                    dfw_data = result['data']
                    myFiles.dfw_tf_format(dfw_data, geography, 'json_2_tf')
                    if (myFiles.file_error):
                        myLogger.critical('      |-- Error -> {}'.format(myFiles.file_data))
                        myLogger.warning('      |-- Please correct the error above and try again.')
                        myLogger.info('      |-- Execution interrupted')
                        myLoggerObj.log_terminate()
                    else:
                        tf_file = '{}/{}/json_2_tf.txt'.format(cwd, folder.name)
                        cleaned_data = myFiles.file_data.replace('\u2192','')
                        # Save the TF format
                        myFiles.write_regular_file(tf_file, cleaned_data)
                        if (myFiles.file_error):
                            myLogger.critical('      |-- Error -> {}'.format(myFiles.file_data))
                            myLogger.warning('      |-- Please correct the error above and try again.')
                            myLogger.info('      |-- Execution interrupted')
                            myLoggerObj.log_terminate()
                        else:
                            dfw_renamed = '{}/{}/DFW.auto.tfvars.old'.format(cwd, folder.name)
                            os.rename(dfw_file, dfw_renamed)
                            myLogger.info('      |-- File {} created'.format(tf_file))
            else:
                myLogger.info('      |-- nothing changed for {}'.format(folder.name))
    myLogger.info('All folders checked')
    myLogger.info('Consolidation done!')
except Exception as ex:
    myLogger.critical('Error -> {}'.format(ex))
    myLogger.warning('Please correct the error above and try again.')
    myLogger.info('Execution interrupted')

