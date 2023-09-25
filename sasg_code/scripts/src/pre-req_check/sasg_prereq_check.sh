#!/usr/bin/env bash

# --- constants --------------------------------------------------------
  SEPARATOR="----------------------------------------------------------------------"
  SASG_DIR="/sasg"
  MIN_CORES=4
  DUO_SERVER="api-7a2d8e99.duosecurity.com"
  DUO_PORT="443"
# ----------------------------------------------------------------------

# --- initial checks ---------------------------------------------------
  if [[ "$(id --user "$(whoami)")" -ne 0 ]]; then
    echo "We need to gather some system-level information therefore please run this script with elevated privileges"
    exit 1
  fi
  PACKAGES="$(yum list installed 2>/dev/null | grep -e wget -e nmap-ncat)"
  if ! { echo "${PACKAGES[@]}" | grep -q "^wget." && echo "${PACKAGES[@]}" | grep -q "^nmap-ncat."; }; then
    echo "Both wget & nmap-ncat packages should be installed. If any of them is missing below pls install it and retry"
    echo "${PACKAGES[@]}"
    exit 1
  fi
# ----------------------------------------------------------------------

# --- functions --------------------------------------------------------
  function get_dmi_info_field {
    TYPE="${1}"
    FIELD="${2}"

    which dmidecode > /dev/null 2>&1
    if [[ $? -ne 0 ]]; then
      echo "tool for querying BIOS was not found"
      exit 1
    fi
    dmidecode --type "${TYPE}" | grep "${FIELD}:" | sed "s/^[[:space:]]*${FIELD}: \(.*\)$/\1/"
  }
  function get_docker_info {
    TOOL="${1}"
    PARAM="${2}"

    which "${TOOL}" > /dev/null 2>&1
    if [[ $? -ne 0 ]]; then
      echo "${TOOL} was not found"
      exit 1
    fi

    ${TOOL} --version | sed "s/^[Dd]ocker.*\(version.*\)$/\1/" | tr "," "\n" | grep "${PARAM}" | awk '{ print $2 }'
  }
# ----------------------------------------------------------------------

clear
echo -e "               -= PRE-REQUISITE CHECK FOR SASg =-\n\n"

# --- general ----------------------------------------------------------
  echo -e " -= GENERAL =-\n"
  echo -e "FQDN:                        $(uname -n)"
  echo
  echo -e "# of cores(min - 4):         $(lscpu | grep "^CPU(s):" | awk '{ print $2 }') ($(lscpu | grep "^Thread(s) per core:" | awk '{ print $4 }') thread(-s) per core)"
  echo -e "RAM size (at least 8Gb):     $(free --giga | grep Mem: | awk '{ print $2 }')"
  echo
  echo -e "Average load:                $(cut --delimiter=" " --fields=3 /proc/loadavg)"
  echo -e "Processes (all/running):     $(cut --delimiter=" " --fields=4 /proc/loadavg)"
  echo
  echo -e "Network inteface speed:      $(dmesg | grep -i duplex)"
  echo
  echo -e "OS version(min - RHEL 7.4):  $([ -f "/etc/redhat-release" ] && cat "/etc/redhat-release" || echo -e "unsupported OS")"
  echo -e "Kernel:                      $(uname -r)"
  echo
  echo -e "Repositories:"
  yum repoinfo enabled 2>/dev/null | grep "^Repo-name" | cut -d":" -f2 \
    | while read -r repo; do
      echo "    * ${repo}"                             
    done
  echo
  echo -e "automate user presence:      $(id automate > /dev/null 2>&1 && echo yes || echo no)"
  echo "${SEPARATOR}"
# ----------------------------------------------------------------------

# --- duo-related ------------------------------------------------------
  echo -e "-= DUO =-\n"
  duo_package_version="$(yum list installed 2>/dev/null | grep -v "Loaded plugins" | grep "duo_unix" | awk '{print $2}')"
  duo_exec_version="$([[ -f "/usr/sbin/login_duo" ]] && /usr/sbin/login_duo -v 2>&1 | awk '{print $2}')"
  echo "Duo package version:         $([[ "${duo_package_version}" != "" ]] && echo "${duo_package_version}" || echo "n/a")"
  echo "Duo executable version:      $([[ "${duo_exec_version}" != "" ]] && echo "${duo_exec_version}" || echo "n/a")"
  echo "Duo LB connection:           $(
    read -p "Is proxy server used? (y/N): ";
    if [[ "${REPLY^^}" == "Y" ]]; then
      while true; do
        read -p "Proxy server IP address: "
        if [[ -n "${REPLY}" ]]; then
          HTTPS_PROXY="${REPLY}"
          break
        fi
      done
      while true; do
        read -p "Proxy server port: "
        if [[ -n "${REPLY}" ]]; then
          HTTPS_PROXY_PORT="${REPLY}"
          break
        fi
      done
    fi
    if [[ -n "${HTTPS_PROXY}" ]] && [[ -n "${HTTPS_PROXY_PORT}" ]]; then
      wget \
          --timeout=2 --connect-timeout=2 --tries=1 \
          "https://${DUO_SERVER}:${DUO_PORT}" \
          -e https_proxy="${HTTPS_PROXY}:${HTTPS_PROXY_PORT}" --no-check-certificate 2>&1 | grep -q "200 OK" \
        && echo "established (with proxy ${HTTPS_PROXY}:${HTTPS_PROXY_PORT})" \
        || echo "failed (with proxy ${HTTPS_PROXY}:${HTTPS_PROXY_PORT})"
    else
      nc -v "${DUO_SERVER}" "${DUO_PORT}" >/dev/null 2>&1 < /dev/null \
        && echo "established (without proxy)" \
        || echo "failed (without proxy)"
    fi
  )"
  # --- prepare regex for sshd parsing ---------------------------------
    regex_2fa="^[[:space:]]*"
    regex_2fa="${regex_2fa}ForceCommand[[:space:]]*/usr/sbin/login_duo"
    regex_2fa="${regex_2fa}[[:space:]]*(#.*)?$"
  # --------------------------------------------------------------------
  echo "Duo sshd setup:              $(egrep "${regex_2fa}" "/etc/ssh/sshd_config" || echo "n/a")"
  # --- prepare regex for PAM parsing ----------------------------------
    regex_2fa_sufficient="^[[:space:]]*auth[[:space:]]*sufficient[[:space:]]*/lib64/security/pam_duo.so[[:space:]]*(#.*)?$"
    regex_2fa_required="^[[:space:]]*auth[[:space:]]*required[[:space:]]*/lib64/security/pam_duo.so[[:space:]]*(#.*)?$"
  # --------------------------------------------------------------------
  echo "Duo PAM setup:               $(egrep -e "${regex_2fa_sufficient}" -e "${regex_2fa_required}" "/etc/pam.d/system-auth" || echo "n/a")"
  echo "${SEPARATOR}"
# ----------------------------------------------------------------------

# --- fs ---------------------------------------------------------------
  echo -e "-= FS =-\n"
  echo "sasg folder:                 $([ -d "${SASG_DIR}" ] && { ls -l --directory "${SASG_DIR}" | awk '{ print "'${SASG_DIR}' - "$3":"$4" ("$1")" }'; } || echo -e "\"${SASG_DIR}\" folder was not found")"
  echo "sasg fs info:                $([ -d "${SASG_DIR}" ] && { df --human-readable "${SASG_DIR}" | tail --lines=1 | awk '{ print $6 }'; } || echo -e "\"${SASG_DIR}\" folder was not found")"
  echo "sasg fs size(min  - 200Gb):  $([ -d "${SASG_DIR}" ] && { df --human-readable "${SASG_DIR}" | tail --lines=1 | awk '{ print $4" available (out of "$2")" }'; } || echo -e "\"${SASG_DIR}\" folder was not found")"
  echo "root (/) fs size:            $(df --human-readable / | tail --lines=1 | awk '{ print $4" available (out of "$2")" }')"
  echo "${SEPARATOR}"
# ----------------------------------------------------------------------

# --- docker -----------------------------------------------------------
  echo -e "-= DOCKER =-\n"
  echo "Docker version:              $(get_docker_info "docker" "version")"
  echo "Docker build:                $(get_docker_info "docker" "build")"
  echo "Docker X features enabled:   $(docker info 2>/dev/null | grep "Experimental" | awk '{print $2}')"
  echo "Docker networks supported:   $(docker info 2>/dev/null | grep "Network:" | cut -d":" -f2 | sed "s/^ //")"
  echo
  echo "Docker-compose version:      $(get_docker_info "docker-compose" "version")"
  echo "Docker-compose build:        $(get_docker_info "docker-compose" "build")"
  echo "${SEPARATOR}"
# ----------------------------------------------------------------------

# --- hypervisor -------------------------------------------------------
  echo -e "-= HYPERVISOR =-\n"
  echo "Hypervisor type:             $(dmidecode -s system-product-name)"
  echo "Hypervisor version:          $(dmidecode --type System | grep Version) :not possible to determine patch version level for Spectre/Meltdown"
  echo "${SEPARATOR}"
# ----------------------------------------------------------------------

# --- ha ---------------------------------------------------------------
  echo -e "-= HA =-\n"
  echo "sgadm user presence:         $(id sgadm > /dev/null 2>&1 && echo yes || echo no)"
  echo "ha-peer host presence:       $(
    # Make sure record exists &  is not commented
    if egrep -v "[[:space:]]*#" /etc/hosts | grep -qw ha-peer; then
      # Removing leading spaces & getting the first value i.e. ip
      echo "yes; $(egrep -v "[[:space:]]*#" /etc/hosts | grep -w ha-peer | sed 's/^[[:space:]]*//' | cut -d" " -f1)"
    else
      echo "no"
    fi
  )"
  echo "ha-peer login:               $(
    if ssh -oBatchMode=yes sgadm@ha-peer exit 2>/dev/null; then
      echo "Success"
    else
      echo "Failure"
    fi
  )"
  
  if ! egrep -q "^[[:space:]]*Match[[:space:]]*Host[[:space:]]*ha-peer[[:space:]]*$" /etc/ssh/sshd_config; then
    # if there is no match instruction for ha-peer then we consider no restrictions to be applied
    echo "ha-peer ssh setup:           no ssh restrictions for ha-peer applied"
  else
    echo "ha-peer ssh setup:"
    # Checking all possible ip addresses in case some of them are forbidden for ssh
    ip addr show | grep -w inet | awk '{ print $2 }' | cut -d"/" -f1 | sort | while read -r ip_addr; do
      sshd_config="$(sshd -T -C host="ha-peer" -C user="sgadm" -C addr="${ip_addr}")"

      if echo "${sshd_config}" | grep -q "allowusers sgadm"; then
        SGADM_ALLOWED="yes"
      else
        SGADM_ALLOWED=" no"
      fi
      if echo "${sshd_config}" | grep "allowusers" | grep -qv "allowusers sgadm"; then
        OTHER_FORBIDDEN=" no"
      else
        OTHER_FORBIDDEN="yes"
      fi
      # Make sure the following output is properly formatted
      format_space=""; for ((i=${#ip_addr}; i<=22; i++)); do format_space+=" "; done
      echo "    * ${ip_addr}${format_space}sgadm allowed:     ${SGADM_ALLOWED};     other ids forbidden to login: ${OTHER_FORBIDDEN}"
    done
  fi

  echo "${SEPARATOR}"
# ----------------------------------------------------------------------

# --- meltdown/spectre -------------------------------------------------
  echo -e "-= MELTDOWN/SPECTRE PATCHING INFO =-\n"

  # run spectre-meltdown fix check as root
  THIS=$(pwd)
  sudo su - root -c "$THIS/spectre-meltdown-checker.sh --no-color"
  echo "${SEPARATOR}"
# ----------------------------------------------------------------------
