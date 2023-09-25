#!/bin/bash

CSR_NAME="sdad.sl.ibm.com.csr"
CSR_CONTENT="-----BEGIN CERTIFICATE REQUEST-----
MIICoDCCAYgCAQAwWzELMAkGA1UEBhMCVVMxETAPBgNVBAgMCE5ldyBZb3JrMQ8w
DQYDVQQHDAZBcm1vbmsxDDAKBgNVBAoMA0lCTTEaMBgGA1UEAwwRKi5zZGFkLnNs
LmlibS5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDCL5Gafg22
APlaASm/pc3GPQIQhJ9U7KelRbtFykQtG2P+SVcHx49swalkm5cOGkcKWQCgCXLz
gObq6Up9Pu2iwJpPDLKO+V23t0iS3C5FicIaN2ubP79VLIXMFVX77xvaH2Y3TI8t
h3RmmC6OsvSqYw4z4H4RoH7KBuZ0b/2q1YNHEY4pKUO6odMgMgSnxdr0AXwepN9T
pEzdVjEnNS5a/8lRHXUSPfPPizLW5f9BgV8J0xemctcVqktEm1bhTIZYpHp4tdlk
+xX5kpAeUMda20X4IYljrgvRdv3bNK29A2GVl14Q3dkHs4voLJaxeA13NyMCe+FG
4afzChZxzyQjAgMBAAGgADANBgkqhkiG9w0BAQsFAAOCAQEAmz764M83UwqY1zCm
kpIv8xMzMfSn0p7Q86pDcu7owSjZqIFBn2CJvUcCOOKMrS9Zf7CG8J49q9oIUfCX
2r4ou9CqLVexBosGAdN7ilJrVHuNt3pvaUiba0EIl1aqbzVOyIOgCHuSNSBJZF99
VIIU3dzVHzEI91Dp8QRb770mme+N2L63p2D1omeVDbtDXzj3Hr2zcAMJ+tP6cqMJ
FUh9agsY4njPHMJhIxPWNExh6hzwCMK5HaV3tuBp6zp8Fg6nGhDWxeJ3/VCbKEUC
I16G4b4IASMpa9pDaqDACziM+KrqvU6lmV4d76lfMXH/nCIh2hTYAxcpy7F/QPcy
wq08cA==
-----END CERTIFICATE REQUEST-----"

KEY_NAME="sdad.sl.ibm.com.key"
KEY_CONTENT="-----BEGIN PRIVATE KEY-----
MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDCL5Gafg22APla
ASm/pc3GPQIQhJ9U7KelRbtFykQtG2P+SVcHx49swalkm5cOGkcKWQCgCXLzgObq
6Up9Pu2iwJpPDLKO+V23t0iS3C5FicIaN2ubP79VLIXMFVX77xvaH2Y3TI8th3Rm
mC6OsvSqYw4z4H4RoH7KBuZ0b/2q1YNHEY4pKUO6odMgMgSnxdr0AXwepN9TpEzd
VjEnNS5a/8lRHXUSPfPPizLW5f9BgV8J0xemctcVqktEm1bhTIZYpHp4tdlk+xX5
kpAeUMda20X4IYljrgvRdv3bNK29A2GVl14Q3dkHs4voLJaxeA13NyMCe+FG4afz
ChZxzyQjAgMBAAECggEADW/rPGySmFCS8KZ59BgOGDSqiugSenbx1t7vaZHoi9KE
Zdk/W3t0skroZNzbZA9vcQjdoTVmLfFyiTjhfa84FHYNd4DibkBVOtxE+lygGxHA
S74gBRsxKzyseYXUcF2IaNyZXyQ+GCFybZMETb2Wbp/yIKbdMm0PuP0nP1FslUCY
MgvqoZS0WA1CngGdCQi0ByHP1M5hJjmSPzjMU2by3if813pn4m7LRxzJZsvAJnDI
QI5o+tI7x5qF1SM0aBGYZTyRispl1EGME2O9BzmRgn8h5+CwuhGUmOtuN9cYzDjY
GFuZYyzT6bMPRVdy4tJD5pULF5xpiOvwHSGSBWkfSQKBgQDqv67xfUJuyaNrrkCP
v/S7SYUh8gO9oolPwQ79RhZZw/vAwAEJlfi1+0mf7T5fol4vAhr5+p31ot1oZgKm
rlIeka8DYNh8MIar48RArx3FDQU3qjMGs1pYHHlErdlKiy6hpEUbmkL5sbQUU25W
9QUFbSg/y6kDhEH6A4xOkGFEdwKBgQDTw9Yu2TZCzngEBZpaKxA7KpRYcinpfXg3
mqqxWyZEPeO+iOls2W5MANkOZF495WvbHEk32dN978NgxZZJY3fscZvV2isd8bW1
R6leVtXwLhM5i1806h0/KpMU8wbKJCJLP9w8xkzMHPwx18PTHIS3RKf/dWXo6yDH
OJyYAx8ktQKBgE08slfcac4/49gbJjzl4KT6pKYtldOANgOats7Yj6QLWrrpsa2w
vXtK6ceH7JzUtH5tB+k172ERrB2casTi2DwcnOPUqoX6BWVq9Hh/5aCfDxdolY9f
1ZrmC3Rwau0e7EHc5awWTnEPafvCE6ziwzss1jBfVwXEL10Oa8yxrn8zAoGAHsSL
cA8bNSWuhlcSEBvFpfMPzrH3qPcT6nBMcKxfqPadCmf2ElydC+nrn42xq6iTvSgk
8zpw4hFd/8d1iIAtQmtXSwEB1r3xur8Iuq4/M0BehrPbR2LkkPLsn9SXnfMWEHzc
0O+25MkpU0yYJSo1ljMhfZpfDjJrdsag6e06LykCgYBHBdiZqvTWbkZfEX7X3/Yn
qzX8AamefqP7RnBPF8qgC7miz/vXiXX4CP+yxmkRC9nmMoiYHnCRGOYDFLYP2XGW
IaYpSqtx50aKvRxfZ/QVDUtX2RfrBwI/8/giCWWjXCDn8ukM04COBvgIVbtK7iUz
GawX+taVnqqMmnWU2bdcbA==
-----END PRIVATE KEY-----"

PEM_NAME="sdad.sl.ibm.com.pem"
PEM_CONTENT="-----BEGIN CERTIFICATE-----
MIIHijCCBnKgAwIBAgIQAfT4UB/XE9zOtO7LZJh9CDANBgkqhkiG9w0BAQsFADBN
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMScwJQYDVQQDEx5E
aWdpQ2VydCBTSEEyIFNlY3VyZSBTZXJ2ZXIgQ0EwHhcNMjAwMjExMDAwMDAwWhcN
MjIwNDE1MTIwMDAwWjCBgzELMAkGA1UEBhMCVVMxETAPBgNVBAgTCE5ldyBZb3Jr
MQ8wDQYDVQQHEwZBcm1vbmsxNDAyBgNVBAoTK0ludGVybmF0aW9uYWwgQnVzaW5l
c3MgTWFjaGluZXMgQ29ycG9yYXRpb24xGjAYBgNVBAMMESouc2RhZC5zbC5pYm0u
Y29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwi+Rmn4NtgD5WgEp
v6XNxj0CEISfVOynpUW7RcpELRtj/klXB8ePbMGpZJuXDhpHClkAoAly84Dm6ulK
fT7tosCaTwyyjvldt7dIktwuRYnCGjdrmz+/VSyFzBVV++8b2h9mN0yPLYd0Zpgu
jrL0qmMOM+B+EaB+ygbmdG/9qtWDRxGOKSlDuqHTIDIEp8Xa9AF8HqTfU6RM3VYx
JzUuWv/JUR11Ej3zz4sy1uX/QYFfCdMXpnLXFapLRJtW4UyGWKR6eLXZZPsV+ZKQ
HlDHWttF+CGJY64L0Xb92zStvQNhlZdeEN3ZB7OL6CyWsXgNdzcjAnvhRuGn8woW
cc8kIwIDAQABo4IELTCCBCkwHwYDVR0jBBgwFoAUD4BhHIIxYdUvKOeNRji0LOHG
2eIwHQYDVR0OBBYEFMon044yMEScNAyG3PPv0g4rZTpjMIHvBgNVHREEgecwgeSC
ESouc2RhZC5zbC5pYm0uY29tgiRzbGEtcC1uYTAwNS1lZS5kYWwwOS5zZGFkLnNs
LmlibS5jb22CJHNsYS1wLW5hMDA2LWVlLmRhbDA5LnNkYWQuc2wuaWJtLmNvbYIk
c2xhLXAtbmEwMDItZWUuZGFsMDkuc2RhZC5zbC5pYm0uY29tgiRzbGEtcC1uYTAw
NC1lZS5kYWwwOS5zZGFkLnNsLmlibS5jb22CJnNsYS1wLWVtZWEwMDEtZWUubG9u
MDIuc2RhZC5zbC5pYm0uY29tgg9zZGFkLnNsLmlibS5jb20wDgYDVR0PAQH/BAQD
AgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMBBggrBgEFBQcDAjBrBgNVHR8EZDBiMC+g
LaArhilodHRwOi8vY3JsMy5kaWdpY2VydC5jb20vc3NjYS1zaGEyLWc2LmNybDAv
oC2gK4YpaHR0cDovL2NybDQuZGlnaWNlcnQuY29tL3NzY2Etc2hhMi1nNi5jcmww
TAYDVR0gBEUwQzA3BglghkgBhv1sAQEwKjAoBggrBgEFBQcCARYcaHR0cHM6Ly93
d3cuZGlnaWNlcnQuY29tL0NQUzAIBgZngQwBAgIwfAYIKwYBBQUHAQEEcDBuMCQG
CCsGAQUFBzABhhhodHRwOi8vb2NzcC5kaWdpY2VydC5jb20wRgYIKwYBBQUHMAKG
Omh0dHA6Ly9jYWNlcnRzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydFNIQTJTZWN1cmVT
ZXJ2ZXJDQS5jcnQwDAYDVR0TAQH/BAIwADCCAX0GCisGAQQB1nkCBAIEggFtBIIB
aQFnAHYARqVV63X6kSAwtaKJafTzfREsQXS+/Um4havy/HD+bUcAAAFwNY7XPwAA
BAMARzBFAiEAmrzKV29RrpLNtcEjXhvUSaIS11xbeZL7IAQdxEANS+cCICgjvHma
mKmmLYOwLUvaPEZkIkSf03fUbKGp8COYwPlxAHYAUaOw9f0BeZxWbbg3eI8MpHrM
GyfL956IQpoN/tSLBeUAAAFwNY7UgAAABAMARzBFAiAMDKGFRKifnPXhmC7yo2R/
F1dbC02wGtu8DO9WcO0jlgIhAKZi5IbYveCaahItw3nXDIffLvrOzluxPuGp8YvV
iDx3AHUAQcjKsd8iRkoQxqE6CUKHXk4xixsD6+tLx2jwkGKWBvYAAAFwNY7TyQAA
BAMARjBEAiB+t7s+obfkWpLRfHK9BkYl1evgxfoZikJBBXaMkChiIwIgQzo139sC
5vTauQc9qgSeY4SyVsr7tMrMfitCGdFEk0owDQYJKoZIhvcNAQELBQADggEBAHus
azE+HCEMSoC3k01df2ka44sVfxw5p0WBCCj9n94SAOX5ORufN9xxG0wjc71VuPbZ
Ct19tcneew9yqMQziegq2k7cmUXTdXFJQBQsuOHBjxxbWmNjHA5fuiLOeCk/+Ctd
c05u3KoWPLM8+i7VgMj0A8F5Cx3B8vizvydoB/T1JGZ38nA15SMAJSp07M86KHgb
WDU9rEZfOG+k8+X7C2TB+DSirAX5n4PAeMD/pykgV+nrxV72msLL4ihbdbAH1LRa
E5MT966rJVC7ie5DojXr8hLKkOHoLPnHF4c3g9QOuG001bY6dIMmIf3kDI7KcbV6
cXiabRk77jZTGBBhJ68=
-----END CERTIFICATE-----
-----BEGIN CERTIFICATE-----
MIIElDCCA3ygAwIBAgIQAf2j627KdciIQ4tyS8+8kTANBgkqhkiG9w0BAQsFADBh
MQswCQYDVQQGEwJVUzEVMBMGA1UEChMMRGlnaUNlcnQgSW5jMRkwFwYDVQQLExB3
d3cuZGlnaWNlcnQuY29tMSAwHgYDVQQDExdEaWdpQ2VydCBHbG9iYWwgUm9vdCBD
QTAeFw0xMzAzMDgxMjAwMDBaFw0yMzAzMDgxMjAwMDBaME0xCzAJBgNVBAYTAlVT
MRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxJzAlBgNVBAMTHkRpZ2lDZXJ0IFNIQTIg
U2VjdXJlIFNlcnZlciBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ANyuWJBNwcQwFZA1W248ghX1LFy949v/cUP6ZCWA1O4Yok3wZtAKc24RmDYXZK83
nf36QYSvx6+M/hpzTc8zl5CilodTgyu5pnVILR1WN3vaMTIa16yrBvSqXUu3R0bd
KpPDkC55gIDvEwRqFDu1m5K+wgdlTvza/P96rtxcflUxDOg5B6TXvi/TC2rSsd9f
/ld0Uzs1gN2ujkSYs58O09rg1/RrKatEp0tYhG2SS4HD2nOLEpdIkARFdRrdNzGX
kujNVA075ME/OV4uuPNcfhCOhkEAjUVmR7ChZc6gqikJTvOX6+guqw9ypzAO+sf0
/RR3w6RbKFfCs/mC/bdFWJsCAwEAAaOCAVowggFWMBIGA1UdEwEB/wQIMAYBAf8C
AQAwDgYDVR0PAQH/BAQDAgGGMDQGCCsGAQUFBwEBBCgwJjAkBggrBgEFBQcwAYYY
aHR0cDovL29jc3AuZGlnaWNlcnQuY29tMHsGA1UdHwR0MHIwN6A1oDOGMWh0dHA6
Ly9jcmwzLmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbFJvb3RDQS5jcmwwN6A1
oDOGMWh0dHA6Ly9jcmw0LmRpZ2ljZXJ0LmNvbS9EaWdpQ2VydEdsb2JhbFJvb3RD
QS5jcmwwPQYDVR0gBDYwNDAyBgRVHSAAMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8v
d3d3LmRpZ2ljZXJ0LmNvbS9DUFMwHQYDVR0OBBYEFA+AYRyCMWHVLyjnjUY4tCzh
xtniMB8GA1UdIwQYMBaAFAPeUDVW0Uy7ZvCj4hsbw5eyPdFVMA0GCSqGSIb3DQEB
CwUAA4IBAQAjPt9L0jFCpbZ+QlwaRMxp0Wi0XUvgBCFsS+JtzLHgl4+mUwnNqipl
5TlPHoOlblyYoiQm5vuh7ZPHLgLGTUq/sELfeNqzqPlt/yGFUzZgTHbO7Djc1lGA
8MXW5dRNJ2Srm8c+cftIl7gzbckTB+6WohsYFfZcTEDts8Ls/3HB40f/1LkAtDdC
2iDJ6m6K7hQGrn2iWZiIqBtvLfTyyRRfJs8sjX7tN8Cp1Tm5gr8ZDOo0rwAhaPit
c+LJMto4JQtV05od8GiG7S5BNO98pVAdvzr508EIDObtHopYJeS4d60tbvVS3bR0
j6tJLp07kzQoH3jOlOrHvdPJbRzeXDLz
-----END CERTIFICATE-----"

SASG_CLIENT_ROOT="/sasg/clients"
EXTERNAL_CERTS_DIR="nginx_ssl_certs"
NGINX_SSL_DIR="/etc/nginx/SSL"
RENEW_CERTS_LOG="/tmp/renew-certificates.log"
INITIAL_DIR="${PWD}"

MACHINE_TYPE_MASTER="master"
MACHINE_TYPE_SLAVE="slave"
MACHINE_TYPE_RESILIENT="resilient"
MACHINE_TYPE_NATIVE="native"

function dump_compose() {
local docker_compose_file="$1"

cat << EOF > "${docker_compose_file}"
version: '2'
networks:
  host-only:
    external:
      name: host-only 
  default:
    external:
      name: ipvlan
services:
  sasgc:
    image: gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg_build:\${SASGC_VERSION}
    read_only: true
    tmpfs:
      - /etc/nginx/conf.d:exec
      - /sasg:exec
      - /var:exec
      - /tmp:exec
      - /tmp/log:exec
      - /run:exec
    cap_add:
      - NET_ADMIN
    networks:
      host-only:
      default:
        ipv4_address: \${IP}
    volumes:
      - \${CLIENTDIR}/\${SASFW}/vars:/opt/sasg/sasg_install/vars
      - \${CLIENTDIR}/\${SASFW}/keys:/opt/sasg/sasg_install/keys
      - \${CLIENTDIR}/\${SASFW}/logs:/sasg/logs
      - \${CLIENTDIR}/\${SASFW}/Nginx:/sasg/Nginx
      - iptables:/etc/iptables
      - ipset:/etc/ipset.d
      - sasg-configs:/sasg/configs
      - /etc/resolv.conf:/etc/resolv.conf
      - ./${EXTERNAL_CERTS_DIR}:${NGINX_SSL_DIR}
    environment:
      - IPVLAN_GW=\${IPVLAN_GW}
      - HOST_ONLY_GW=\${HOST_ONLY_GW}
      - HOST_IP=\${HOST_IP}
  checker:
    image: gts-tia-sasg-dev-docker-local.artifactory.swg-devops.com/sasg-sidecar-checker:\${CHECKER_VERSION}
    read_only: true
    tmpfs:
      - /tmp
      - /var/spool/cron
    volumes:
      - \${CERT}:/certs/client.cert:ro
      - \${KEY}:/certs/client.key:ro
      - /var/log:/host/logs
      - ./logs/Firewall:/host/logs/fw
      - ./logs/VPN:/host/logs/vpn
      - ./gcm:/sasg/gcm
      - /etc/ssh/sshd_config:/host/configs/sshd_config:ro
      - /etc/pam.d/system-auth:/host/configs/system-auth:ro
      - iptables:/sasg/iptables:ro
      - ipset:/sasg/ipset:ro
      - sasg-configs:/sasg/configs:ro
      - ./upload-hashes:/root/upload-hashes
      - ./update-info:/host/update-info
    network_mode: "service:sasgc"
    environment:
      - DOCKER_HOST_NAME=\${DOCKER_HOST_NAME}
      - LOGPUSH_IP=\${LOGPUSH_IP}
      - LOGPUSH_PORT=\${LOGPUSH_PORT}
      - CRON_UPLOAD_LOGS=\${CRON_UPLOAD_LOGS}
      - CRON_CHECK_CONFIG=\${CRON_CHECK_CONFIG}
      - HOST_IP=\${HOST_IP}

volumes:
  iptables:
  ipset:
  sasg-configs:

EOF
}

client_vyos_name=
client_path=
machine_type=
service_name=

function log() {
  log_line="[ $(date "+%Y-%m-%d %H:%M") ] $*"
  echo "${log_line}" | tee -a "${RENEW_CERTS_LOG}"
}
function log_info () {
  log "[ INFO  ] $*"
}
function log_error {
  log "[ ERROR ] $*"
}

if [[ -n "$1" ]]; then
  if [[ "${1,,}" == "${MACHINE_TYPE_NATIVE}" ]]; then
    machine_type="${MACHINE_TYPE_NATIVE}"
    log_info "Machine identified as \"${machine_type}\" according to passed param \"$1\""
  fi
fi

set -u

function get_machine_type() {
  log_info "Trying to determine machine type..."

  if ! which docker > /dev/null; then
    log_info "No docker found. Will treat this machine as native install"
    machine_type="${MACHINE_TYPE_NATIVE}"
    return 0
  fi

  log_info "Found dockerized solution. Searching for the client folder..."
  cd "${SASG_CLIENT_ROOT}"
  for client_folder in $(ls); do
    log_info "Checking folder \"${SASG_CLIENT_ROOT}/${client_folder}\"..."
    if [[ ! -f "${client_folder}/docker-compose.yml" ]]; then
      log_info "No compose file found for \"${SASG_CLIENT_ROOT}/${client_folder}\""
      continue # If there is no docker-compose file this cannot be client folder
    fi
    client_path="${SASG_CLIENT_ROOT}/${client_folder}"
    log_info "Client folder identified: \"${client_path}\""
    break
  done

  if [[ -z "${client_path}" ]]; then
    log_error "Could not get client folder. Aborting"
    return 1
  fi

  client_vyos_name="$(basename "${client_path}")"
  if systemctl is-active "sgha@${client_vyos_name}.service" > /dev/null; then
    service_name="sgha@${client_vyos_name}.service"
    log_info "Found active service \"${service_name}\". Will treat this machine as master"
    machine_type="${MACHINE_TYPE_MASTER}"
    return 0
  fi
  if systemctl is-active "sgha-resilient@${client_vyos_name}.service" > /dev/null; then
    service_name="sgha-resilient@${client_vyos_name}.service"
    log_info "Found active service \"${service_name}\". Will treat this machine as resilient"
    machine_type="${MACHINE_TYPE_RESILIENT}"
    return 0
  fi

  log_info "No active SASG services was found. Will treat this machine as slave"
  machine_type="${MACHINE_TYPE_SLAVE}"
  return 0
}

function shadow_certificates() {
  local sasgc_volumes_line_num
  local ext_certs_dir="${client_path}/${EXTERNAL_CERTS_DIR}"

  mkdir -p "${ext_certs_dir}" && cd "${ext_certs_dir}"
  echo "${CSR_CONTENT}" > "${CSR_NAME}"
  echo "${KEY_CONTENT}" > "${KEY_NAME}"
  echo "${PEM_CONTENT}" > "${PEM_NAME}"
  log_info "New certificates were created:"
  sha256sum ./* | \
    while read hash_line; do
      log_info "  ${hash_line}"
    done

  cd "${client_path}"

  OLD_COMPOSE="docker-compose.$(date "+%Y%m%d_%H%M").yml"

  cp "docker-compose.yml" "${OLD_COMPOSE}"
  dump_compose "docker-compose.yml"

  log_info "Compose file was updated. Volume was mounted:"
  log_info "$(grep "/etc/nginx/SSL" "docker-compose.yml")"
}

function restart_sasg() {
  log_info "Restarting service \"${service_name}\" for \"${machine_type}\" machine"
  systemctl restart "${service_name}"
}

function update_native_certs() {
  local backup_postfix="$(date "+%Y%m%d_%H%M")"
  log_info "Backing up existing nginx certificates..."

  cp "${NGINX_SSL_DIR}/${CSR_NAME}" "${NGINX_SSL_DIR}/${CSR_NAME}.${backup_postfix}"
  cp "${NGINX_SSL_DIR}/${KEY_NAME}" "${NGINX_SSL_DIR}/${KEY_NAME}.${backup_postfix}"
  cp "${NGINX_SSL_DIR}/${PEM_NAME}" "${NGINX_SSL_DIR}/${PEM_NAME}.${backup_postfix}"

  log_info "Backup complete:"
  sha256sum "${NGINX_SSL_DIR}"/* | \
    while read hash_line; do
      log_info "  ${hash_line}"
    done
  
  echo "${CSR_CONTENT}" > "${NGINX_SSL_DIR}/${CSR_NAME}"
  echo "${KEY_CONTENT}" > "${NGINX_SSL_DIR}/${KEY_NAME}"
  echo "${PEM_CONTENT}" > "${NGINX_SSL_DIR}/${PEM_NAME}"

  log_info "New certificates were created:"
  sha256sum "${NGINX_SSL_DIR}"/* | \
    while read hash_line; do
      log_info "  ${hash_line}"
    done  
}
function restart_nginx() {
  log_info "Restarting nginx..."
  if which systemctl > /dev/null; then
    systemctl restart nginx
  else
    /sbin/service nginx restart
  fi
  log_info "Nginx restarted"
}

function main() {
  [[ -z "${machine_type}" ]] && get_machine_type

  case "${machine_type}" in
    "${MACHINE_TYPE_SLAVE}")
      shadow_certificates
      ;;
    "${MACHINE_TYPE_MASTER}") ;&
    "${MACHINE_TYPE_RESILIENT}")
      shadow_certificates
      restart_sasg
      ;;
    "${MACHINE_TYPE_NATIVE}")
      update_native_certs
      restart_nginx
      ;;
    "*")
      log_error "Could not determine machine type: \"${machine_type}\""
  esac

  cd "${INITIAL_DIR}"
  log_info "Done. Pls provide log file \"${RENEW_CERTS_LOG}\" back to SASG team for validation in case of any problems"
  log_info "--------------------------------------------------------"
}

main