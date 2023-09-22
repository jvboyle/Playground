import os
import sys
import shlex
import subprocess
import threading
import re

# 3 possible paths:
#   - $ENV/$PROJECT/customers/$CUSTOMER/$TF_CONFIG
#   - $ENV/consumable_service/$CON_SERVICE/$TF_CONFIG
#   - $ENV/$PROJECT/$TF_CONFIG

ENV = 'Please, select the environment: '
PROJECT = 'Please, select your project: '
CUSTOMER = 'Please, select your customer: '
CON_SERVICES = 'Please, select your consumable service: '
TF_CONFIG = 'Please, select the Terraform config to run: '
CUSTOMER_OR_TF = 'Please, select your customer or the Terraform config to run: '
CUSTOMER_OR_CON_SERVICE = 'Plese, select your customer or your consumable service: '

def get_items(folder):
    '''
    It will scan the folder provided and return a dictionary, the "error" (true/false) key will
    indicate if an error happened or not, if True the "data" key will have the error message, 
    otherwise "data" will have the list of folders. The "data" can be empty if there is no sub-folders
    under "folder"
    '''
    try:
        options = []
        items = os.scandir(folder)
        for item in items:
            if (item.is_dir() and 
                not item.name.startswith('.') and 
                not item.name.startswith('_') and
                not item.name.startswith('azure')):
                options.append(item.name)
        result = {
            'error': False,
            'data': options
        }
        options.sort()
    except OSError as OSe:
        result = {
            'error': True,
            'data': OSe.strerror
        }
    except Exception as ex:
         result = {
             'error': True,
             'data': ex.__doc__
         }
    return result

def get_next_msg(cwd, current_folder, selected, folders, msg):
    # The trick part is that the possible paths are different, for some you'll have to check
    # which was the previous question displayed (msg), for couple of them you'll have to check
    # which was the previous path selected (selected), for others you'll have to analyze which
    # are the available folders within the current folder (folders), and the simplest one, 
    # if your current_folder is the same as your working - root - directory (cwd), then you are
    # at the environment levl

    # I'm root, ask for the environment
    if (current_folder == cwd):
        return ENV
    # If you were asked about the ENV, now it is time to ask about the project
    if (msg == ENV):
        # Check if there is consumable service in what will be displayed
        if ('consumable_service' in folders):
            return CUSTOMER_OR_CON_SERVICE
        else:
            return PROJECT
    # If your current folder is called "consumable_service", which would be your project's name
    # ask for the consumable service
    if (selected.lower() == 'consumable_service'):
        return CON_SERVICES    
    # If you were asked about the PROJ, now there are 2 possible next questions, you may have:
    # - $ENV/$PROJECT/customers, or;
    # - $ENV/$PROJECT/$TF_CONFIG
    # The key is to check if there is a folder called "customers" within the current (folders arg) folder
    if ("customers" in folders):
        # You may select "customers" or the terraform config, so ask about one of them
        return CUSTOMER_OR_TF
    # If the previous selected option was "customers", a3sk for the customer
    if (selected.lower() == "customers"):
        return CUSTOMER
    if (msg == CUSTOMER_OR_CON_SERVICE) and (selected.lower() != 'consumable_service'):
        return TF_CONFIG
    # Ask for the terraform config
    if (msg == CON_SERVICES) or (msg == CUSTOMER) or (selected.lower() == "shared") or ((msg == PROJECT) and (not "customers" in folders)):
        return TF_CONFIG
    # If it wasn't none of the above, then you selected any customer, ask for the terraform config
    # Same note from the beginning, as the paths changes their inner structure, this check must be 
    # the last one, or you may have the risk to be asked the wrong question.
    if (msg == PROJECT) and ("customers" in folders):
        return CUSTOMER_OR_TF

ask_me_again = True

# Get current working directory (CWD)
cwd = os.getcwd()
# FOR DEVELOPMENT ONLY #####################
# cwd = 'C:/KSTP/GIT/kstp-terraform/projects'
############################################


# cwd will be the back functionality limit, so we use
# current_folder to change according to the current path
current_folder = cwd

# The code will use a folder list to keep track of the user's choice
# to be able to implement the "back" capability. The last element of
# the list is the current folder
options = []
options.append(current_folder)
message = ENV
prev_msg = []
selected = ''
env_arg = ''
project_arg = ''
customer_arg = ''
con_service_arg = ''
tf_config_arg = ''
back = False
valid_option = True
print(cwd)
# Loop until TF_CONFIG is defined, then stop asking
while ask_me_again:
    if (os.name == 'nt'):
        os.system('cls')
    else:
        os.system('clear')
    if (valid_option):
        folders = get_items(current_folder)
        # Check if some error occurred
        if (folders['error']):
            print(' ')
            print('ERROR: {}'.format(folders['data']))
            print('Exiting ...')
            sys.exit(0)

    # If user pressed B to go back, the message is already set 
    if (back):
        message = prev_msg.pop()
        back = False
    else:
        if(valid_option):
            message = get_next_msg(cwd, current_folder, selected, folders['data'], message)
            if (not message):
                message = "Are you sure that you are in the right place?"
    
    print("  ____ _   _    _         _         _                        _   _                 ")
    print(" / ___| \ | |  / \       / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __  ___ ")
    print("| |   |  \| | / _ \     / _ \| | | | __/ _ \| '_ ` _ \\ / _` | __| |/ _ \| '_ \/ __|")
    print("| |___| |\  |/ ___ \   / ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | \__ \\")
    print(" \____|_| \_/_/   \_\ /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|___/ ")
    print(" ")
    print(' ')
    print('{}'.format(message))
    print(' ')

    # Print the available options
    print('E) EXIT')
    # Enable a 'back' option if makes sense
    if (current_folder != cwd):
        print('B) BACK')
    print(' ')
    for i, option in enumerate(folders['data']):
        print('{}) ../{}'.format(i+1, option))
    print(' ')

    try:
        choice = input("Please, select an option: ")
        if(choice.upper() == 'E'):
            ask_me_again = False
        if(choice.upper() == 'B'):
            if (current_folder != cwd): 
                # Return the 2nd last element of the list, the last element is the current folder
                # we want to go back one level prior to the current
                current_folder = options[-2]
                # remove the "old" current folder from the list as we moved one level back
                options.pop()
                back = True
                # Check wich is the current message displayed to be sure that it will reset the proper variable
                # This is required as the last step validates which variables are set and which are not, to define
                # the proper arguments' list
                if (message == ENV):
                    env_arg = ""
                if (message == PROJECT):
                    project_arg = ""
                if (message == CUSTOMER):
                    customer_arg = ""
                if (message == CON_SERVICES):
                    con_service_arg = ""
                if (message == TF_CONFIG):
                    tf_config_arg = ""
            else:
                message = ENV
        else:
            choice = int(choice) -1
            if 0 <= choice < len(folders['data']):
                previous_msg = message
                selected = folders['data'][choice]
                current_folder = '{}/{}'.format(current_folder, selected)
                # options[] is used when the user pressed B to go back, it will removes the last one, which is where I'm actually is
                # and it will return the folder that I was, so the code will list the right files again going back 1 level in the
                # folder structure
                options.append(current_folder)
                prev_msg.append(message)
                # This is where the code will properly set which arguments were selected once you move to the next folder level
                # i.e.:
                # msg -> "Please, select the environment"
                # 1) AP1
                # 2) AG1
                #
                # You pressed 1) ... meaning that you did your choice
                # selected will be "AP1"
                # prev_msg[-1] -> returns the last element of the list, which in this example will be ENV
                # so, it sets the env_arg as "AP1"
                #
                # So, we check which was the option made based on the message that is displayed to set the proper variable
                # note that tf_config_arg is always the last one to be set, in other words, when tf_config_arg is set
                # we can stop asking and create the command line based on the previous selections
                if (prev_msg[-1] == ENV):
                    env_arg = selected
                elif (prev_msg[-1] == PROJECT):
                    project_arg = selected
                elif (prev_msg[-1] == CUSTOMER_OR_CON_SERVICE) and (project_arg == ''):
                    project_arg = selected
                elif (prev_msg[-1] == CUSTOMER):
                    customer_arg = selected
                elif (prev_msg[-1] == CON_SERVICES):
                    con_service_arg = selected
                elif (prev_msg[-1] == TF_CONFIG) or ((prev_msg[-1] == CUSTOMER_OR_TF) and (selected.lower() != 'customers')):
                    tf_config_arg = selected
                valid_option = True
            else:
                valid_option = False
            # Means that all required arguments were provided
            if (tf_config_arg):
                # Check which command to run based in what was provided
                if (env_arg and customer_arg and tf_config_arg) and (not con_service_arg):
                    # Means that I want to go here
                    # $ENV/$PROJECT/customers/$CUSTOMER/$TF_CONFIG
                    cmd_to_run = ('--env {} --project {} --customer {} --tf_config {}').format(env_arg, project_arg, customer_arg, tf_config_arg)
                elif (env_arg and con_service_arg and tf_config_arg) and (not customer_arg):
                    # Means that I want to go here
                    # $ENV/consumable_service/$CON_SERVICE/$TF_CONFIG
                    cmd_to_run = ('--env {} --project {} --con_service {} --tf_config {}').format(env_arg, project_arg, con_service_arg, tf_config_arg)
                elif (env_arg and tf_config_arg) and (not customer_arg and not con_service_arg):
                    # Means that I want to go here
                    # $ENV/$PROJECT/$TF_CONFIG
                    cmd_to_run = ('--env {} --project {} --tf_config {}').format(env_arg, project_arg, tf_config_arg)
                else:
                    print("Oops, something didn't work as planned. Please try again")
                    sys.exit(0)
                print(' ')
                print('These were the values selected:')
                print(' ')
                if(env_arg):
                    print("|-- Environment........: '{}'".format(env_arg))
                if(project_arg):
                    print("|-- Project............: '{}'".format(project_arg))
                if(customer_arg):
                    print("|-- Customer...........: '{}'".format(customer_arg))
                if(con_service_arg):
                    print("|-- Consumable service.: '{}'".format(con_service_arg))
                if(tf_config_arg):
                    print("|-- Terraform config...: '{}'".format(tf_config_arg))
                print(' ')
                run_it = input('Continue and run \'Terraform plan\'? (y/n): ')
                if (run_it != 'y') and (run_it != 'Y'):
                    # Resets everything and keep asking
                    current_folder = cwd
                    options = []
                    options.append(current_folder)
                    message = ENV
                    prev_msg = []
                    selected = ''
                    env_arg = ''
                    project_arg = ''
                    customer_arg = ''
                    con_service_arg = ''
                    tf_config_arg = ''
                    back = False
                else:
                    # Get out of the loop to run the command
                    ask_me_again = False
    except:
        # Some wrong choice, we don't care.
        # Just avoid the code to break, and keep asking
        pass
if (choice != 'e') and (choice != 'E'):
    print(' ')
    print('Please wait, this process can take few minutes to complete ...')
    print(' ')   
    # Running Terraform plan 
    #args = shlex.split('{}/run.sh {} {}'.format(cwd, cmd_to_run, '--tf_action plan'))
    cmd = './run.sh'
    args = '{} {}'.format(cmd_to_run, '--tf_action plan')
    run_script = subprocess.Popen(['bash', '-c', f'\'{cmd}\' {args}'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
    
    class CustomThread(threading.Thread):
        def __init__(self):
            threading.Thread.__init__(self)
            self.tf_plan = None
            self.error = False

        def run(self):
            tf_plan = '' 
            start_recording = False
            for line in iter(run_script.stdout.readline, b''):
                str_line = line.rstrip()
                print(str_line)
                if ('running plan' in str_line):
                    start_recording = True
                if ('Plan:' in str_line):
                    tf_plan = str_line
                if ('Error' in str_line):
                    self.error = True
                if (str_line == '###################################'):
                    start_recording = False
                if (start_recording): 
                    str_line = re.sub(r'\x1b\[[0-9;]+m', '', str_line)
                if (not run_script.poll() is None):
                    self.tf_plan = tf_plan
                    break

    # start a new thread to read the output
    #thread = threading.Thread(target=read_output())
    thread = CustomThread()
    thread.start()

    # wait for the process to finish
    run_script.wait()
    thread.join()

    tf_plan = thread.tf_plan

    if (thread.error):
        print(' ')
        print(' ')
        print(' |- ATTENTION -------------------------------------------------|')
        print(' |                                                             |')
        print(' |  There are errors in the Terraform output above.            |')
        print(' |                                                             |')
        print(' |  Please, check and correct those errors and try again. The  |')
        print(' |  execution will be stopped.                                 |')
        print(' |                                                             |')
        print(' |-------------------------------------------------------------|')
        print(' ')
        print(' ')
        sys.exit(0)
    if (run_script.returncode == 0):
        if (thread.is_alive()):
            thread.stop()
        print(' ')
        print(' ')
        print(' |- ATTENTION -------------------------------------------------|')
        print(' |                                                             |')
        print(' |  {} {}|'.format(tf_plan, ' '*(70-len(tf_plan))))
        print(' |                                                             |')
        print(' |  Please, check the Terraform output above to be sure about  |')
        print(' |  what will be updated in the production environment before  |')
        print(' |  proceed with the next step.                                |')
        print(' |                                                             |')
        print(' |  If you continue, the production environment will be        |')
        print(' |  updated with the changes identified in the output above.   |')
        print(' |                                                             |')
        print(' |-------------------------------------------------------------|')
        print(' ')
        print(' ')
        print('It will run: {}/run.sh {} {}'.format(cwd, cmd_to_run, '--tf_action apply'))
        print(' ')
        tf_apply = input("Do you want to run the command above? (y/n)")
        if (tf_apply == 'y') or (tf_apply == 'Y'):
            # Running Terraform apply
            # args = shlex.split('{}/run.sh {} {}'.format(cwd, cmd_to_run, '--tf_action apply'))
            cmd = './run.sh'
            args = '{} {}'.format(cmd_to_run, '--tf_action apply')
            run_script = subprocess.Popen(['bash', '-c', f'\'{cmd}\' {args}'], stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            # run_script = subprocess.Popen(args, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, text=True)
            thread2 = CustomThread()
            thread2.start()
            # wait for the process to finish
            run_script.wait()
            thread2.join()
            if (run_script.returncode != 0):
                print(' ')
                print('Please check the outputs above and if necessary, try again')
        else:
            print(' ')
    else:
         print("Something went wrong, return code: {}".format(run_script.returncode))
         print("Please, check the messages above and try again")