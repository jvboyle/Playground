import os
import sys
import logging
from logging.config import dictConfig

class AppLogger():
    def __init__(self, log_path, console, file):
        # Configure the logging dictionary and initialize the class object
        # Output to the console and to a log file specified by the "log_path" argument
        
        self._err_detail = ""
        self._err_exception = ""

        # At least one handler must be provided
        if (not console) and (not file):
            print("At least one handler, 'console' or 'file', must be informed.")
            print("Please, provide the required argument and try again, -h for help")
            sys.exit(0)
        handlers = []
        handler_data = {}
        if (console):
            console_handler = {
                "console": {
                    'class': 'logging.StreamHandler',
                    'level': 'INFO',                        # Console messages won't show DEBUG information
                    'formatter': 'BASE_FORMAT'
                }
            }
            handler_data.update(console_handler)
            handlers.append("console")
        if (file):
            if (not log_path):
                print("File handler was provided, but the log's filename and path was not.")
                print("Please, provide the log's filename and try again.")
                sys.exit(0)
            file_handler = {
                "file": {
                    'class': 'logging.FileHandler',
                    'level': 'DEBUG',                       # File level log will save all levels (DEBUG, INFO, WARNING, ERROR and CRITICAL)
                    'formatter': 'FILE_FORMAT',
                    'filename': log_path
                }
            }
            handler_data.update(file_handler)
            handlers.append("file")
            # Check if the folder exists, if not, create it.
            try:
                folder = os.path.dirname(log_path)
                if (folder):
                    if (not os.path.isdir(folder)):
                        os.makedirs(folder, exist_ok=True)
            except Exception as ex:
                print("Error creating the log folder '{}'. {}".format(folder, ex.__doc__))
                print("Please, check if you have the required permissions and try again.")
                sys.exit(0)     
        # Now that the proper handlers were identified, finish with the initialization of the logger's configurations
        logdict = {
            'version': 1,
            'formatters': {
                'BASE_FORMAT': {
                    'format': '%(name)s |:| %(levelname)-8s |:| %(message)s',
                },
                'FILE_FORMAT': {
                    'format': '%(asctime)s |:| %(name)s |:| %(levelname)-8s |:| %(message)s', 
                    'datefmt': '%Y-%m-%d %H:%M:%S'
                },
            },
            'handlers': handler_data,
            'root': {
                'level': 'DEBUG',
                'handlers': handlers
            }
        }
        dictConfig(logdict)

    # Class members

    def log_writer(self, name):
        # Return a logging object that is used to output the messages to the
        # console and to the log file
        return logging.getLogger(name)

    def log_terminate(self):
        sys.exit(0)