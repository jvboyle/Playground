#!/usr/bin/env python2

import argparse
import httplib
import os
import socket
import ssl

TARGET_PORT=3444

def get_arguments():
  parser = argparse.ArgumentParser(description='Upload file using mutual authentication')
  parser.add_argument('--target-server', '-t', required=True, help='Target server to upload file to')
  parser.add_argument('--cert', '-c', required=True, help='Client certificate')
  parser.add_argument('--key', '-k', required=True, help='Client key')
  parser.add_argument('--payload', '-p', required=True, help='File to upload')
  parser.add_argument('--name', '-n', required=True, help='Relative path to file on server')

  args = parser.parse_args()

  return args.target_server, args.cert, args.key, args.payload, args.name

def main():

  server, cert, key, payload, name = get_arguments()

  if not (os.path.isfile(cert) and os.path.isfile(key)):
    print('%s or %s was not found. Aborting' % (key, cert))
    exit(1)
  context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
  context.load_cert_chain(certfile=cert, keyfile=key)
  connection = httplib.HTTPSConnection(host=server, port=TARGET_PORT, context=context)

  with open(payload, 'r') as p:
    try:
      connection.request('PUT', 'https://%s:%s/%s' % (server, TARGET_PORT, name), p)
    except socket.error:
      print('Connection could not be established. Aborting...')
      exit(1)
    except ssl.SSLError:
      print('SSL connection could not be established. Aborting...')
      exit(1)
    response = connection.getresponse()
    upload_successful = (response.status == httplib.CREATED) or (response.status == httplib.NO_CONTENT)

  if not upload_successful:
    print('File could not be uploaded. Return code: %s, response message below:' % response.status)
    print(response.msg)
    exit(1)

  print('Upload succeeded')
  exit(0)

if __name__ == "__main__":
  main()
