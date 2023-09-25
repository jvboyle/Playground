''' SASGaaS Logging Lib
'''

import datetime
import json
import os

LOG_OBJECT_KEYS = [
  'ts',
  'username',
  'action',
  'customer',
  'success'
]
SASG_LOG_PATH = '/sasg_data/logs/log.json'

def log_action(username, customer, action, success=True):
  log_object = {
    'ts': datetime.datetime.now().ctime(),
    'username': username,
    'action': action,
    'customer': customer,
    'success': str(success)
  } 
  try:
    with open(SASG_LOG_PATH, 'a') as json_file:
      log_line_array = []
      for log_key in LOG_OBJECT_KEYS:
        log_line_array.append('"%s": "%s"' % (log_key, log_object[log_key]))
      json_file.write('{ %s }\n' % ', '.join(log_line_array).strip().replace('\n', '\\n'))
  except Exception as e:
    print('Exception trying to write logs: %s' % e)