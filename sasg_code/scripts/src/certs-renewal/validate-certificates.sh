#!/bin/bash

# Is not used, just for reference
X509_OUTPUT_ORIG="        Validity
            Not Before: Mar  7 00:00:00 2018 GMT
            Not After : Mar 11 12:00:00 2020 GMT
--
            X509v3 Subject Alternative Name:
                DNS:*.sdad.sl.ibm.com, DNS:sdad.sl.ibm.com
            X509v3 Key Usage: critical"

X509_OUTPUT_HASHSUM_ORIG="f631b93d35a5a351c06c34e34285ce49bde8e11e1218aa17ee331d0a1c9f46f2  -"

# Is not used, just for reference
X509_OUTPUT_NEW="        Validity
            Not Before: Feb 11 00:00:00 2020 GMT
            Not After : Apr 15 12:00:00 2022 GMT
--
            X509v3 Subject Alternative Name:
                DNS:*.sdad.sl.ibm.com, DNS:sla-p-na005-ee.dal09.sdad.sl.ibm.com, DNS:sla-p-na006-ee.dal09.sdad.sl.ibm.com, DNS:sla-p-na002-ee.dal09.sdad.sl.ibm.com, DNS:sla-p-na004-ee.dal09.sdad.sl.ibm.com, DNS:sla-p-emea001-ee.lon02.sdad.sl.ibm.com, DNS:sdad.sl.ibm.com
            X509v3 Key Usage: critical"
X509_OUTPUT_HASHSUM_NEW="ea19009b801e2d3a473ac34b41fc8111e35ea9b0a0dae0ac2866eaf626e2af03  -"

SHA256SUMS_ORIG="14948bfc6b1832526e274bca5c46b22bd00fa1766ed6a14aa06d78e4b91c35f3  ./sdad.sl.ibm.com.csr
889dfb64eada478464edc04799f423792ba7368acb001391e562a162f3715419  ./sdad.sl.ibm.com.key
4ba6fc40ea08037ba78e7441743f94078d7ea8eda3ac31697017d58a87494290  ./sdad.sl.ibm.com.pem"
SHA256SUMS_NEW="85db4eea4180d9e6fde2aa34f6ebf91b94ad49790c42dbfd527493fd8f0711c7  ./sdad.sl.ibm.com.csr
a2f56055336f8ae6f86b6d3406d3cdb2e3ed023aae6c4ee018feaebb7323fe34  ./sdad.sl.ibm.com.key
9b828603f22d43555ecc0e9e6e42dbb57db68fa015ad050d8dd8da4011607434  ./sdad.sl.ibm.com.pem"
SHA256SUM_COMPOSE="f911b5f24258d48f4f2e34e1c20378feb9ad84ff41f2407ce871f72ae5b8ede2  ./docker-compose.yml"

MACHINE_TYPE_MASTER="master"
MACHINE_TYPE_SLAVE="slave"
MACHINE_TYPE_RESILIENT="resilient"
MACHINE_TYPE_NATIVE="native"

SASG_CLIENT_ROOT="/sasg/clients"
EXTERNAL_CERTS_DIR="nginx_ssl_certs"
NGINX_SSL_DIR="/etc/nginx/SSL"
INITIAL_DIR="${PWD}"

SEPARATOR="----------------------------------------"

client_vyos_name=
client_path=
machine_type=
service_name=

if [[ -n "$1" ]]; then
  if [[ "${1,,}" == "${MACHINE_TYPE_NATIVE}" ]]; then
    machine_type="${MACHINE_TYPE_NATIVE}"
  fi
fi

function get_machine_type() {

  if ! which docker > /dev/null; then
    machine_type="${MACHINE_TYPE_NATIVE}"
    return 0
  fi

  cd "${SASG_CLIENT_ROOT}"
  for client_folder in $(ls); do
    if [[ ! -f "${client_folder}/docker-compose.yml" ]]; then
      continue # If there is no docker-compose file this cannot be client folder
    fi
    client_path="${SASG_CLIENT_ROOT}/${client_folder}"
    break
  done

  if [[ -z "${client_path}" ]]; then
    echo "Could not get client folder. Aborting"
    exit 1
  fi

  client_vyos_name="$(basename "${client_path}")"
  if systemctl is-active "sgha@${client_vyos_name}.service" > /dev/null; then
    service_name="sgha@${client_vyos_name}.service"
    machine_type="${MACHINE_TYPE_MASTER}"
    return 0
  fi
  if systemctl is-active "sgha-resilient@${client_vyos_name}.service" > /dev/null; then
    service_name="sgha-resilient@${client_vyos_name}.service"
    machine_type="${MACHINE_TYPE_RESILIENT}"
    return 0
  fi

  machine_type="${MACHINE_TYPE_SLAVE}"
  return 0
}

function validate_pem_info() {
  local certificate_info=

  echo "-= PEM Validation =-"
  echo
  if [[ "${machine_type}" == "${MACHINE_TYPE_NATIVE}" ]]; then
    pem_path="${NGINX_SSL_DIR}/sdad.sl.ibm.com.pem"
  else
    pem_path="${client_path}/${EXTERNAL_CERTS_DIR}/sdad.sl.ibm.com.pem"
  fi
  if [[ ! -f "${pem_path}" ]]; then
    echo "* PEM status:                 UPDATE PENDING"
  else
    certificate_info="$(openssl x509 -in "${pem_path}" -text -noout | sha256sum )"
    if [[ "${certificate_info}" == "${X509_OUTPUT_ORIG}" ]]; then
      echo "* PEM status:                 UPDATE PENDING"
    elif [[ "${certificate_info}" == "${X509_OUTPUT_HASHSUM_NEW}" ]]; then
      echo "* PEM status:                 UPDATE COMPLETE"
    else
      echo "* PEM status:                 UNKNOWN"
    fi
    echo "* PEM path:                   ${pem_path}"
    echo "* PEM info:"
    echo "$(openssl x509 -in "${pem_path}" -text -noout 2>&1 | grep -A2 -e Alternative -e Validity)"
  fi
  echo "${SEPARATOR}"
}

function validate_certs_hashsums() {
  echo "-= Hashsums Validation =-"
  echo
  if [[ "${machine_type}" == "${MACHINE_TYPE_NATIVE}" ]]; then
    cd "${NGINX_SSL_DIR}"
    if echo "${SHA256SUMS_ORIG}" | sha256sum -c - > /dev/null 2>&1; then
      echo "* Local hashsum status:       UPDATE PENDING"
    elif echo "${SHA256SUMS_NEW}" | sha256sum -c - > /dev/null 2>&1; then
      echo "* Local hashsum status:       UPDATE COMPLETE"
    else
      echo "* Local hashsum status:       UNKNOWN"
    fi
  else
    if [[ -d "${client_path}/${EXTERNAL_CERTS_DIR}" ]]; then
      cd "${client_path}/${EXTERNAL_CERTS_DIR}"
      if echo "${SHA256SUMS_NEW}" | sha256sum -c - > /dev/null 2>&1; then
        echo "* Local hashsum status:       UPDATE COMPLETE"
      else
        echo "* Local hashsum status:       UPDATE PENDING"
      fi
    else
      echo "* Local hashsum status:       UPDATE PENDING"
    fi
  fi
  # Check inside the container if we're on master or resilient
  if echo "${MACHINE_TYPE_MASTER} ${MACHINE_TYPE_RESILIENT}" | grep -wq "${machine_type}"; then
    cd "${client_path}"
    if docker-compose exec sasgc bash -c "cd \"${NGINX_SSL_DIR}\" && echo \"${SHA256SUMS_ORIG}\" | sha256sum -c - >/dev/null 2>&1"; then
      echo "* Container hashsum status:   UPDATE PENDING"
    elif docker-compose exec sasgc bash -c "cd \"${NGINX_SSL_DIR}\" && echo \"${SHA256SUMS_NEW}\" | sha256sum -c - >/dev/null 2>&1"; then
      echo "* Container hashsum status:   UPDATE COMPLETE"
    else
      echo "* Container hashsum status:   UNKNOWN"
    fi
  fi
  echo "${SEPARATOR}"
}

function validate_docker_compose() {
  echo "-= docker-compose.yml Validation =-"
  echo
  cd "${client_path}"

  if echo "${SHA256SUM_COMPOSE}" | sha256sum -c - >/dev/null 2>&1; then
    echo "* docker-compose status:      UPDATE COMPLETE"
  else
    echo "* docker-compose status:      UPDATE PENDING"
  fi
  echo "${SEPARATOR}"
}

[[ -z "${machine_type}" ]] && get_machine_type

validate_pem_info

validate_certs_hashsums

[[ "${machine_type}" != "${MACHINE_TYPE_NATIVE}" ]] && validate_docker_compose

cd "${INITIAL_DIR}"
