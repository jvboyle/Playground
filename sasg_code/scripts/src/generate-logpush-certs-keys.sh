#!/usr/bin/env bash

declare -r ROOT_FOLDER="."
declare -r DAYS_VALID=3650
declare -r KEY_CA="${ROOT_FOLDER}/ca.key"
declare -r KEY_CLIENT="${ROOT_FOLDER}/client.key"
declare -r KEY_SERVER="${ROOT_FOLDER}/server.key"
declare -r CERT_CA="${ROOT_FOLDER}/ca.crt"
declare -r CERT_CLIENT="${ROOT_FOLDER}/client.crt"
declare -r CERT_SERVER="${ROOT_FOLDER}/server.crt"
declare -r CSR_CLIENT="${ROOT_FOLDER}/client.csr"
declare -r CSR_SERVER="${ROOT_FOLDER}/server.csr"
declare -r X509_C="US"
declare -r X509_O="IBM"
declare -r X509_OU="SAS"
declare -r X509_CN_CA="SAS-CA"
declare -r X509_CN_SASG="SASG"
declare -r X509_CN_LISTENER="SAS-Listener"
declare -r X509_EMAIL="martin_mclaughlin@uk.ibm.com"

FORCE_REGENERATE=0
if [[ "${1}" == "--force" ]]; then
  echo "Forcing keys and certs regeneration"
  FORCE_REGENERATE=1
fi

x509_line="/C=${X509_C}"
x509_line="${x509_line}/ST=${X509_ST}"
x509_line="${x509_line}/L=${X509_L}"
x509_line="${x509_line}/O=${X509_O}"
x509_line="${x509_line}/OU=${X509_OU}"
x509_line_ca="${x509_line}/CN=${X509_CN_CA}/emailAddress=${X509_EMAIL}"
x509_line_sasg="${x509_line}/CN=${X509_CN_SASG}/emailAddress=${X509_EMAIL}"
x509_line_chef="${x509_line}/CN=${X509_CN_LISTENER}/emailAddress=${X509_EMAIL}"

if [[ ${FORCE_REGENERATE} -ne 1 ]] \
  && [[ -f "${CERT_CA}" ]] \
  && [[ -f "${KEY_CA}" ]] \
  && [[ -f "${CERT_CLIENT}" ]] \
  && [[ -f "${KEY_CLIENT}" ]] \
  && [[ -f "${CERT_SERVER}" ]] \
  && [[ -f "${KEY_SERVER}" ]]; then
  echo "All keys && certs were already generated"
  sha256sum \
    "${KEY_CA}" \
    "${KEY_CLIENT}" \
    "${KEY_SERVER}" \
    "${CERT_CA}" \
    "${CERT_CLIENT}" \
    "${CERT_SERVER}"
  exit 0
fi

[[ -f "${CERT_CA}" ]] && rm --force "${CERT_CA}"
[[ -f "${KEY_CA}" ]] && rm --force "${KEY_CA}"
[[ -f "${CERT_CLIENT}" ]] && rm --force "${CERT_CLIENT}"
[[ -f "${KEY_CLIENT}" ]] && rm --force "${KEY_CLIENT}"
[[ -f "${CSR_CLIENT}" ]] && rm --force "${CSR_CLIENT}"
[[ -f "${CERT_SERVER}" ]] && rm --force "${CERT_SERVER}"
[[ -f "${CSR_SERVER}" ]] && rm --force "${CSR_SERVER}"
[[ -f "${KEY_SERVER}" ]] && rm --force "${KEY_SERVER}"

# We don't need passwords afterwards - it's easier just to regenerated 
# and redistribute the keys if something is wrong
export CA_PWD="$(dd if=/dev/urandom bs=10 count=1 2>/dev/null | base64)"
export SERVER_PWD="$(dd if=/dev/urandom bs=10 count=1 2>/dev/null | base64)"
export CLIENT_PWD="$(dd if=/dev/urandom bs=10 count=1 2>/dev/null | base64)"

mkdir --parent "${ROOT_FOLDER}"

# --- Generate CA key/cert ---
  echo "Generating CA..."
  openssl genrsa \
    -passout env:CA_PWD \
    -des3 \
    -out "${KEY_CA}" \
    4096 \
    2> /dev/null
  openssl req \
    -new \
    -x509 \
    -days ${DAYS_VALID} \
    -key "${KEY_CA}" \
    -passin env:CA_PWD \
    -out "${CERT_CA}" \
    -subj "${x509_line_ca}" \
    2> /dev/null
# ----------------------------

# --- Generate server key/cert ---
  echo "Generating server part..."
  openssl genrsa \
    -passout env:SERVER_PWD \
    -des3 \
    -out "${KEY_SERVER}" \
    1024 \
    2> /dev/null
  openssl req \
    -new \
    -key "${KEY_SERVER}" \
    -out "${CSR_SERVER}" \
    -passin env:SERVER_PWD \
    -subj "${x509_line_chef}" \
    2> /dev/null
  openssl x509 \
    -req \
    -days ${DAYS_VALID} \
    -in "${CSR_SERVER}" \
    -CA "${CERT_CA}" \
    -CAkey "${KEY_CA}" \
    -set_serial 01 \
    -passin env:CA_PWD \
    -out "${CERT_SERVER}" \
    2> /dev/null
  rm --force "${CSR_SERVER}"
# --------------------------------

# --- Generate client key/cert ---
  echo "Generating client part..."
  openssl genrsa \
    -passout env:CLIENT_PWD \
    -des3 \
    -out "${KEY_CLIENT}" \
    1024 \
    2> /dev/null
  openssl req \
    -new \
    -key "${KEY_CLIENT}" \
    -out "${CSR_CLIENT}" \
    -passin env:CLIENT_PWD \
    -subj "${x509_line_sasg}" \
    2> /dev/null
  openssl x509 \
    -req \
    -days ${DAYS_VALID} \
    -in "${CSR_CLIENT}" \
    -CA "${CERT_CA}" \
    -CAkey "${KEY_CA}" \
    -set_serial 01 \
    -passin env:CA_PWD \
    -out "${CERT_CLIENT}" \
    2> /dev/null
  rm --force "${CSR_CLIENT}"
# --------------------------------

# --- Removing passwords from server/client keys ---
  openssl rsa \
    -in "${KEY_SERVER}" \
    -passin env:SERVER_PWD \
    -out "${ROOT_FOLDER}/temp.key" \
    2> /dev/null
  mv --force "${ROOT_FOLDER}/temp.key" "${KEY_SERVER}"
  openssl rsa \
    -in "${KEY_CLIENT}" \
    -passin env:CLIENT_PWD \
    -out "${ROOT_FOLDER}/temp.key" \
    2> /dev/null
  mv --force "${ROOT_FOLDER}/temp.key" "${KEY_CLIENT}"
# --------------------------------------------------

echo "Keys and certs were generated:"
sha256sum \
  "${KEY_CA}" \
  "${KEY_CLIENT}" \
  "${KEY_SERVER}" \
  "${CERT_CA}" \
  "${CERT_CLIENT}" \
  "${CERT_SERVER}"
