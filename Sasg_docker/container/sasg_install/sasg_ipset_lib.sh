# Library - NOT to be run directly
# Should be sourced from sasg_iptables

# --- Constants --------------------------------
  readonly IP_SET_TYPE_IP=1
  readonly IP_SET_TYPE_PORT=2

  readonly IP_SET_OPTS_IP="hash:net family inet hashsize 1024 maxelem 65536"
  readonly IP_SET_OPTS_PORT="bitmap:port range 1-65535"

  readonly ERROR_NO_IPSET_FILE=1
  readonly ERROR_WRONG_IPSET_TYPE=2
  readonly ERROR_COULD_NOT_WRITE_TO_IPSET_FILE=2
  readonly ERROR_IPSET_WAS_NOT_CREATED=3
  readonly ERROR_OTHER=99
# ----------------------------------------------

function _add_ipset() {
  local l_IP_SET_NAME="${1}"
  local l_IP_SET_TYPE="${2}"

  # IPSET var should already be set by this time
  if [[ ! -f "${IPSET}" ]]; then
    echo "Could not find ipset file: \"${IPSET}\". Aborting"
    return ${ERROR_NO_IPSET_FILE}
  fi

  l_IP_SET_TYPE=$(( l_IP_SET_TYPE )) # Converting to number

  if [[ ${l_IP_SET_TYPE} -eq ${IP_SET_TYPE_IP} ]]; then
    local l_ipset_line="create ${l_IP_SET_NAME} ${IP_SET_OPTS_IP}"
  elif [[ ${l_IP_SET_TYPE} -eq ${IP_SET_TYPE_PORT} ]]; then
    local l_ipset_line="create ${l_IP_SET_NAME} ${IP_SET_OPTS_PORT}"
  else
    echo "Unrecognized ip set type \"${l_IP_SET_TYPE}\". Aborting"
    return ${ERROR_WRONG_IPSET_TYPE}
  fi

  _write_to_ipset_file "${l_ipset_line}"
  return $?
}

function _add_value_to_ipset() {
  local l_IP_SET_TYPE="${1}"
  shift
  local l_IP_SET_NAME="${1}"
  shift
  local l_VALUES=( "$@" )

  local l_create_ipset_line=
  local l_last_ipset_line=
  local l_add_ipset_line=
  local l_ipset_line_value=

  _add_ipset "${l_IP_SET_NAME}" "${l_IP_SET_TYPE}" || exit $_

  l_create_ipset_line=$(\
    grep --line-number "^create ${l_IP_SET_NAME}" "${IPSET}" \
      | cut -f1 -d":" \
  )
  l_create_ipset_line=$(( l_create_ipset_line ))
  l_last_ipset_line=$(( $(wc -l "${IPSET}" | awk '{ print $1 }') ))

  if [[ ${l_create_ipset_line} -eq 0 ]]; then
    echo "IP set \"${l_IP_SET_NAME}\" was not yet created. Aborting..."
    return ${ERROR_IPSET_WAS_NOT_CREATED}
  fi

  for i_ipset_value in "${l_VALUES[@]}"; do
    l_ipset_line_value="add ${l_IP_SET_NAME} ${i_ipset_value}"
    if [[ ${l_create_ipset_line} -ne ${l_last_ipset_line} ]]; then
      l_add_ipset_line=$(( l_create_ipset_line + 1 ))
      sed --in-place "${l_add_ipset_line}i${l_ipset_line_value}" "${IPSET}"
    else
      echo "${l_ipset_line_value}" >> "${IPSET}"
    fi
  done
}

function _write_to_ipset_file() {
  local l_IPSET_LINE="$@"

  grep -q "^${l_IPSET_LINE}" "${IPSET}" \
    || echo "${l_IPSET_LINE}" >> "${IPSET}"
  if ! grep -q "^${l_IPSET_LINE}" "${IPSET}"; then
    echo "Could not add ipset line \"${l_IPSET_LINE}\" into \"${IPSET}\"file"
    return ${ERROR_COULD_NOT_WRITE_TO_IPSET_FILE}
  fi
  
  return 0
}

function add_ip_to_ip_set() {
  _add_value_to_ipset $IP_SET_TYPE_IP "$@"
}

function add_port_to_ip_set() {
  _add_value_to_ipset $IP_SET_TYPE_PORT "$@"
}