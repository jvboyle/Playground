import os.path 
from py_modules import getargs
from py_modules import logger
from py_modules import ipam

# Get the current working directory (cwd)
cwd = os.getcwd()

log_file = "{}/log/parse_ipam.log".format(cwd)

#####################################################################
# FOR DEVELOPMENT ONLY - should be removed for PROD
#####################################################################
# log_file = "{}/Tools/Parsing_scripts/log/parse_ipam.log".format(cwd)

# Get the arguments
myParser = getargs.AppArgs("IPAM subnet and IP parser", [
    ["-f", "Filename to parse, should include full path if the file is not within the script's folder", True, "store"],
    ["-w", "Worksheet to be parsed", True, "store"],
    ["-k", "Keyword to be searched and used to select the proper content from the XLS file", True, "store"],
    ["-p", "Output path, folder where the file will be saved", True, "store"]
])
myArgs = myParser.getargs()

ipam_xls = myArgs["f"]
ipam_worksheet = myArgs["w"]
ipam_keyword = myArgs["k"]
ipam_output_folder = myArgs["p"]

# Create the logger
myLogger = logger.AppLogger(log_file, 'console', 'file')
log_writer = myLogger.log_writer("IPAM_parser")

print("  ____ _   _    _         _         _                        _   _                 ")
print(" / ___| \ | |  / \       / \  _   _| |_ ___  _ __ ___   __ _| |_(_) ___  _ __  ___ ")
print("| |   |  \| | / _ \     / _ \| | | | __/ _ \| '_ ` _ \\ / _` | __| |/ _ \| '_ \/ __|")
print("| |___| |\  |/ ___ \   / ___ \ |_| | || (_) | | | | | | (_| | |_| | (_) | | | \__ \\")
print(" \____|_| \_/_/   \_\ /_/   \_\__,_|\__\___/|_| |_| |_|\__,_|\__|_|\___/|_| |_|___/ ")
print(" ")

log_writer.info("<<<<<<<<<<   STARTING IPAM SUBNET & IP PARSER   >>>>>>>>>>")
log_writer.info("Log file...........: {}".format(log_file))
log_writer.info("Reading source file: {}".format(ipam_xls))

try:
    # Create IPAM object and load the Excel file within the class constructor
    myIPAM = ipam.ParseIPAM(ipam_output_folder, ipam_xls, ipam_keyword)
    # Check if everything was OK
    if (myIPAM.ipam_error):
        log_writer.critical("   |-- Error loading {}.".format(ipam_xls))
        log_writer.error("   |-- Error message: {}".format(myIPAM.ipam_data))
        log_writer.info("   |-- Execution will be interrupted")
        myLogger.log_terminate()
    else:
        # Parse all worksheets provided via -w argument
        log_writer.info("Parsing: {}".format(ipam_worksheet))
        myIPAM.parse_worksheet(ipam_worksheet, log_writer)
        # Check for status
        if (myIPAM.ipam_error):
            log_writer.warning("   |-- Error parsing {}".format(ipam_worksheet))
            log_writer.error("   |-- {}".format(myIPAM.ipam_data))
        else:
            log_writer.info("   |-- {}".format(myIPAM.ipam_data))
        log_writer.info("Please, check the output for possible errors and warnings messages")
        log_writer.info("<<<<<<<<<<   IPAM SUBNET & IP PARSER FINISHED   >>>>>>>>>>")
except Exception as ex:
    # Set the messages that will be logged, and stop the execution
    log_writer.critical("   |-- Error reading the Excel file")
    log_writer.error("   |-- {}".format(ex.__doc__))
    log_writer.info("   |-- Execution will be interrupted.")
    myLogger.log_terminate()