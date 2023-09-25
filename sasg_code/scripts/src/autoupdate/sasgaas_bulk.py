#!/usr/bin/python2

import argparse
import json
import logging
import os
import ssl
import threading
import urllib
import urllib2

SASGAAS_API_ACTIONS = {
  'create_package': 'generate-image-package',
  'upload_package': 'upload-image-package',
  'request_upgrade': 'initiate-update'
}

ENV_VAR_SASGAAS_SERVER = 'SASGAAS_API_SERVER'
ENV_VAR_SASGAAS_USER = 'SASGAAS_API_USER'
ENV_VAR_SASGAAS_KEY = 'SASGAAS_API_KEY'
ENV_VAR_SASGAAS_BG = 'SASGAAS_API_BG'

RESULT_SUCCESS = 0
RESULT_HTTP_ERROR = 1
RESULT_URL_ERROR = 2
RESULT_OTHER_ERROR = 3

def init_var_from_arg_or_env(argument, env_var, description):
  if not argument:
    if not env_var in os.environ.keys():
      print('%s was not set. Pls use correspondent argument ' % description
            + 'or environment variable %s' % env_var)
      exit(1)
    
    return os.environ[env_var]
  
  return argument

def get_args():
  parser = argparse.ArgumentParser(description='Run SASGaaS processes in a bulk')
  parser.add_argument('-s', '--server',
                      help=('SASGaaS server (<proto>://<machine>:<port>) '
                            + '(%s environmental variable)' % ENV_VAR_SASGAAS_SERVER))
  parser.add_argument('-u', '--user',
                      help=('SASGaaS API user (%s environmental variable)'
                            % ENV_VAR_SASGAAS_USER))
  parser.add_argument('-k', '--key',
                      help=('SASGaaS API user key (%s environmental variable)'
                            % ENV_VAR_SASGAAS_KEY))
  parser.add_argument('-b', '--bg',
                      help=('SASGaaS blue group (%s environmental variable)'
                            % ENV_VAR_SASGAAS_BG))
  parser.add_argument('-c', '--customer', nargs='+', required=True,
                      help='ID(-s) of customer(-s) to process')
  parser.add_argument('-a', '--action', choices=SASGAAS_API_ACTIONS.keys(), required=True,
                      help='Action to perform')
  args = parser.parse_args()

  args.server = init_var_from_arg_or_env(args.server, 
                                        ENV_VAR_SASGAAS_SERVER,
                                        'SASGaaS server')
  args.user = init_var_from_arg_or_env(args.user, 
                                        ENV_VAR_SASGAAS_USER,
                                        'API user')
  args.key = init_var_from_arg_or_env(args.key, 
                                        ENV_VAR_SASGAAS_KEY,
                                        'API user key')
  args.bg = init_var_from_arg_or_env(args.bg, 
                                        ENV_VAR_SASGAAS_BG,
                                        'API BlueGroup')

  return args

def perform_request(url, user, key, bg, customer, print_lock):
  headers = {
    'X-Api-Id': user,
    'X-Api-Key': key,
    'X-Api-BG': bg
  }

  payload = urllib.urlencode({'CUSTOMER_NAME': customer})

  request = urllib2.Request(url, data=payload, headers=headers)
  context = ssl.SSLContext(ssl.PROTOCOL_TLS)
  context.verify_mode = ssl.CERT_NONE

  try:
    response = urllib2.urlopen(request, context=context)
    result, message = RESULT_SUCCESS, json.dumps(json.load(response))

  except urllib2.HTTPError as e:
    result, message = RESULT_HTTP_ERROR, '%s' % e
  except urllib2.URLError as e:
    result, message = RESULT_URL_ERROR, '%s' % e
  except Exception as e:
    result, message = RESULT_OTHER_ERROR, '%s' % e

  print_lock.acquire()
  print('%s: %s (%s)' % (customer, message, result))
  print_lock.release()

def main():
  args = get_args()
  print_lock = threading.Lock()

  for customer in args.customer:
    thread = threading.Thread(target=perform_request, 
                              args=(
                                '%s/%s' % (args.server, SASGAAS_API_ACTIONS[args.action]),
                                args.user,
                                args.key,
                                args.bg,
                                customer,
                                print_lock
                              ))
    thread.start()

if __name__ == '__main__':
  main()
