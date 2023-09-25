#!/bin/bash

GCM_DIR="/sasg/bin/GCM"
GCM_CRONTAB="* 0 * * *"
GCM_LAUNCH_SCRIPT="${GCM_DIR}/run_check.sh"
GCM_BINARY_ARCHIVE="${GCM_DIR}/HCLauncher.tgz"

function install_gcm_infrastructure() {
  local INSTALL_ROOT="$1"
  local CLIENT_DIR="$2"

  echo -e " -= GCM Infrastructure Installation =- \n\n"
  echo "Installing GCM infrastructure w/ params:"
  echo "  * Install root:       ${INSTALL_ROOT}"
  echo "  * Installation dir:   ${GCM_DIR}"
  echo "  * Crontab schedule:   ${GCM_CRONTAB}"
  echo

  _gcm_check_java || echo "Could not identify proper Java package"
  _gcm_install "${CLIENT_DIR}" || return 1
  _gcm_update_crontab || return 1

  echo -e "\n\n -= GCM Infrastructure Installation COMPLETE=-"
}

function _gcm_check_java(){

  if [[ ! "$(id -u $(whoami))" == "0" ]]; then
    echo "ERROR: user $(whoami) cannot install Java"
    return 1
  fi

  if ! which java > /dev/null 2>&1; then
    echo "Java was not found"
    return 1
  fi

  if ! java -version 2>&1 | grep version | grep -q "1.8."; then
    echo "Java version is not 1.8"
    return 1
  fi

  return 0
}

function _gcm_install() {
  local CLIENT_DIR="$1"

  mkdir -p "${GCM_DIR}"

  if ! rm -rf "${GCM_DIR}"; then
    echo "ERROR: could not cleanup previous GCM installation dir ${GCM_DIR}"
    return 1
  fi
  if ! cp -rf "${INSTALL_ROOT}" "${GCM_DIR}"; then
    echo "ERROR: could not copy GCM files into ${GCM_DIR}"
    return 1
  fi

  if [[ ! -f  "${GCM_LAUNCH_SCRIPT}" ]] || [[ ! -f "${GCM_BINARY_ARCHIVE}" ]]; then
    echo "ERROR: required files are not present in ${GCM_DIR}"
    return 1
  fi

  cd "${GCM_DIR}"
  if ! tar xzf "${GCM_BINARY_ARCHIVE}"; then
    echo "ERROR: could not extract ${GCM_BINARY_ARCHIVE}"
    return 1    
  fi
  rm -f "${GCM_BINARY_ARCHIVE}"
  cp -f ./policy_docker.xml ./policy_OS.xml ./run_check.sh ./HCLauncher
  chown -R root:root ./HCLauncher

  unlink ./HCLauncher/sasg-gcm 2>/dev/null
  ln -s "/sasg/clients/${CLIENT_DIR}/gcm" "./HCLauncher/sasg-gcm"

  chmod +x "./HCLauncher/run_check.sh"

  cd -

  return 0
}

function _gcm_update_crontab() {
  local TMP_CRONTAB="${INSTALL_ROOT}/crontab.tmp"

  echo "GCM Install: updating crontab"

  local gcm_script="${GCM_DIR}/HCLauncher/run_check.sh"

  crontab -l 2>/dev/null > "${TMP_CRONTAB}"
  
  while grep -q "${gcm_script}" "${TMP_CRONTAB}"; do
    local line_number="$(grep -n "${gcm_script}" "${TMP_CRONTAB}" | head -1 | cut -d: -f1)"
    sed -i "${line_number}d" "${TMP_CRONTAB}"
  done

  echo "${GCM_CRONTAB} ${gcm_script}" >> "${TMP_CRONTAB}"
  crontab "${TMP_CRONTAB}"
  rm -f "${TMP_CRONTAB}"
}