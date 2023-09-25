#!/bin/bash
###########################################################################################
# Description: 
#    Do basic directory structure set-up / copy of keys/vars to proper dir on JH
#    Part of sasg_install.sh executable built on SASFW when DOCKER_CONTAINER=YES
# Main: ./docker_main.sh
# History:
#    2018.02.13 - Original script.
#    2018.02.14 - Cleaned up, added check for host ip, use appropriate sasg_vipX[y] to 
#                 create sasg.env file for docker_compose
#    2018.03.02 - Added CLIENTDIR variable to sasg.env file & copy file to ".env" filename
#    2018.08.22 - Code added to enable HA WATCHDOG 
#    2018.08.23 - Added chmod 755 to each clients dir thats created - prevents issues with log pulls.
################################################################################

source ./vars
PODMAN_SASFW="${DOCKER_SASFW}"
################################################################################################
DATE=`date +"%F_%H%M%S"`
SHOST=`hostname -s`
SASG_LOG=/tmp/sasg_install_${DATE}.log
CLIENTS_DIR="/sasg/clients"
CLIENT_ENV="${CLIENTS_DIR}/${PODMAN_SASFW}/sasg.env"
CLIENT_ENV2="${CLIENTS_DIR}/${PODMAN_SASFW}/.env"
SASG_BIN_DIR="/sasg/bin"
RHEL_RELEASE="$(cut -d: -f5 /etc/system-release-cpe | cut -d. -f1)"
python_command="python3"
test $(which python3 2>/dev/null) || python_command="python2"
################################################################################################

LOG(){
  MSG="$1"
  echo -e "$MSG" | tee -a $SASG_LOG
}

LOGEXIT(){
  MSG="$1"
  echo -e "\nERROR: $MSG" | tee -a $SASG_LOG
  exit 1
}

MKDIR(){
  DIR2MK="$1"
  if [ ! -d "$DIR2MK" ];then
    LOG "$DIR2MK not found..creating ..."
    mkdir -p $DIR2MK
    [[ "$?" -ne 0 ]] && LOGEXIT "mkdir -p $DIR2MK failed."
    chmod 755 $DIR2MK
    [[ "$?" -ne 0 ]] && LOGEXIT "chmod 755 $DIR2MK failed."
  else
    LOG "$DIR2MK already exists ..."
  fi
}

LOG "${DATE}: Podman config setup for client $PODMAN_SASFW\n"
LOG "Checking for required directories and configuration files:\n"

# create clients subdir based on PODMAN_SASFW variable dynamically added to vars on sasfw
MKDIR "$CLIENTS_DIR"
MKDIR "${CLIENTS_DIR}/${PODMAN_SASFW}"
MKDIR "${CLIENTS_DIR}/${PODMAN_SASFW}/logs"
MKDIR "${CLIENTS_DIR}/${PODMAN_SASFW}/Nginx"
MKDIR "${CLIENTS_DIR}/${PODMAN_SASFW}/certs"

# copy over keys
if [ ! -d "./keys" ];then
  LOGEXIT "keys not found in build file."
else
  LOG "copying keys directory to ${CLIENTS_DIR}/${PODMAN_SASFW} ..."
  cp -r ./keys ${CLIENTS_DIR}/${PODMAN_SASFW}
fi

# copy over logpusher cert/key files
LOG "copying logpusher cert/key files to  ${CLIENTS_DIR}/${PODMAN_SASFW}/certs/"
cp --force ./auth-logpush/client.* "${CLIENTS_DIR}/${PODMAN_SASFW}/certs"
[[ "$?" -ne 0 ]] && LOGEXIT "cp ./auth-logpush/client.* \"${CLIENTS_DIR}/${PODMAN_SASFW}/certs\" failed."
sha256sum "${CLIENTS_DIR}/${PODMAN_SASFW}/certs"/* 2>/dev/null

case "${TUNNEL_TYPE}" in 
  "ipsec")
    if [[ ! -f "/tmp/docker-container.sasgc-ipsec.tgz" ]]; then
      LOG "ERROR: No sasg ipsec image was found (/tmp/docker-container.sasgc-ipsec.tgz)"
      exit 1
    fi
    SASGC_VERSION="$(cat /tmp/docker-container.sasgc-ipsec.tgz | podman load | grep "Loaded image" | cut -d":" -f3)"
    [[ "$?" -ne 0 ]] && LOGEXIT "Could not load sasgc container from /tmp/docker-container.sasgc-ipsec.tgz"
    cp ./keys/site0.secrets "${CLIENTS_DIR}/${PODMAN_SASFW}"
    [[ "$?" -ne 0 ]] && LOGEXIT "cp ./keys/site0.secrets \"${CLIENTS_DIR}/${PODMAN_SASFW}/\" failed."
    modprobe af_key
    : > /etc/sysconfig/modules/af_key.modules
    echo '#!/bin/sh' >> /etc/sysconfig/modules/af_key.modules
    echo 'exec /sbin/modprobe af_key  >/dev/null 2>&1' >> /etc/sysconfig/modules/af_key.modules
    chmod +x /etc/sysconfig/modules/af_key.modules
    ;;
  "openvpn") 
    ;&
  *)
    if [[ ! -f "/tmp/docker-container.sasgc.tgz" ]]; then
      LOG "ERROR: No sasg image was found (/tmp/docker-container.sasgc.tgz)"
      exit 1
    fi
    # Import docker images from /tmp & capture versions
    SASGC_VERSION="$(cat /tmp/docker-container.sasgc.tgz | podman load | grep "Loaded image" | cut -d":" -f3)"
    [[ "$?" -ne 0 ]] && LOGEXIT "Could not load sasgc container from /tmp/docker-container.sasgc.tgz"
    ;;
esac   

if [[ ! -f "/tmp/docker-container.checker.tgz" ]]; then
  LOG "ERROR: No checker container was found (/tmp/docker-container.checker.tgz)"
  exit 1
fi
CHECKER_VERSION="$(cat /tmp/docker-container.checker.tgz | podman load | grep "Loaded image" | cut -d":" -f3)"
[[ "$?" -ne 0 ]] && LOGEXIT "Could not load checker container from /tmp/docker-container.checker.tgz"

# Copy over vars file
LOG "copying vars file to ${CLIENTS_DIR}/${PODMAN_SASFW}/vars"
grep -v VERSION ./vars > ${CLIENTS_DIR}/${PODMAN_SASFW}/vars
[[ "$?" -ne 0 ]] && LOGEXIT "cp ./vars ${CLIENTS_DIR}/${PODMAN_SASFW}/vars failed."

##################
# create sasg.env based on which sasg we're running on - 
# matches sasg_ip_1 - figure out array # & then use sasg_vip[array num] in the sasg.env file
##################
if [ -f "${CLIENT_ENV}" ];then
  LOG "copying ${CLIENT_ENV} to ${CLIENT_ENV}.prev ..."
  cp ${CLIENT_ENV} ${CLIENT_ENV}.prev
fi

LOG "gathering server network interface info and determining vip to use for docker container ..."
ip -f inet -o address | while read -r line; do
    if=$(echo $line | cut -d\  -f 2)
    ip=$(echo $line | cut -d\  -f 4 | cut -d/ -f 1)
    subnet=$(echo $line | cut -d\  -f 4 | cut -d/ -f 2)

# changes added for multi-sasg - loop thru sasg_ip arrays
    for ((INDEX=0; INDEX<${#SASG_IP_1[@]}; INDEX++))
    do
      if [ "${SASG_IP_1[$INDEX]}" == "$ip" ];then
        LOG "match on sasg_ip_1 - ${SASG_IP_1[$INDEX]}"
        LOG "using SASG_VIP1[$INDEX] - ${SASG_VIP1[$INDEX]} for docker container sasg.env"
        echo -e "IP=${SASG_VIP1[$INDEX]}" > ${CLIENT_ENV}
        if [ -z ${SASG_VIP2[$INDEX]} ];then
		      LOG "using SASG_VIP2[$INDEX] - ${SASG_VIP2[$INDEX]} for docker container sasg.env"
	        echo -e "IP_IAMaaS=${SASG_VIP2[$INDEX]}" >> ${CLIENT_ENV}
	      fi
        sed --in-place "/^LOGPUSH_IP=.*/d" "${CLIENT_ENV}"
        echo -e "LOGPUSH_IP=${SASG_VIP1[$INDEX]}" >> ${CLIENT_ENV}
        break 2
      fi
    done
    for ((INDEX=0; INDEX<${#SASG_IP_2[@]}; INDEX++))
    do
      if [ "${SASG_IP_2[$INDEX]}" == "$ip" ];then
        LOG "match on sasg_ip_2 - ${SASG_IP_2[$INDEX]}"
        LOG "using SASG_VIP1[$INDEX] - ${SASG_VIP1[$INDEX]} for docker container sasg.env"
        echo -e "IP=${SASG_VIP1[$INDEX]}" > ${CLIENT_ENV}
        if [ -z ${SASG_VIP2[$INDEX]} ];then
		      LOG "using SASG_VIP2[$INDEX] - ${SASG_VIP2[$INDEX]} for docker container sasg.env"
	        echo -e "IP_IAMaaS=${SASG_VIP2[$INDEX]}" >> ${CLIENT_ENV}
	      fi
        sed --in-place "/^LOGPUSH_IP=.*/d" "${CLIENT_ENV}"
        echo -e "LOGPUSH_IP=${SASG_VIP1[$INDEX]}" >> ${CLIENT_ENV}
        break 2
      fi
    done
done

sed --in-place "/^SASFW=.*/d" "${CLIENT_ENV2}"
echo -e "SASFW=${PODMAN_SASFW}" >> ${CLIENT_ENV}
sed --in-place "/^CLIENTDIR=.*/d" "${CLIENT_ENV2}"
echo -e "CLIENTDIR=${CLIENTS_DIR}" >> ${CLIENT_ENV}

# --- Adding ipvlan & host-only gateways to compose's .env file -------------------------------
  PODMAN_IPVLAN_NETWORK="ipvlan"
  PODMAN_HOST_ONLY_NETWORK="host-only"
  if ! podman network ls | grep -qw "${PODMAN_IPVLAN_NETWORK}"; then
    echo "Podman network ${PODMAN_IPVLAN_NETWORK} is not present. Aborting"
    exit 1
  fi
  if ! podman network ls | grep -qw "${PODMAN_HOST_ONLY_NETWORK}"; then
    echo "Podman network ${PODMAN_HOST_ONLY_NETWORK} is not present. Aborting"
    exit 1
  fi
  IPWLAN_PYTHON_GW_EXTRACTOR=(
    "import json;"
    "import sys;"
    "print(json.loads(sys.stdin.read())[0]['plugins'][0]['ipam']['ranges'][0][0]['gateway'])"
  )
  IPVLAN_GW="$(\
    podman network inspect "${PODMAN_IPVLAN_NETWORK}" \
    | ${python_command} -c "${IPWLAN_PYTHON_GW_EXTRACTOR[*]}" \
  )"
  LOG "Found ipvlan gateway IP: ${IPVLAN_GW}"
  sed --in-place "/^IPVLAN_GW=.*/d" "${CLIENT_ENV}"
  echo "IPVLAN_GW=${IPVLAN_GW}" >> "${CLIENT_ENV}"
  HOST_ONLY_PYTHON_GW_EXTRACTOR=(
    "import json;"
    "import sys;"
    "print(json.loads(sys.stdin.read())[0]['plugins'][0]['ipam']['addresses'][0]['gateway'])"
  )
  HOST_ONLY_GW="$(\
    podman network inspect "${PODMAN_HOST_ONLY_NETWORK}" \
    | ${python_command} -c "${HOST_ONLY_PYTHON_GW_EXTRACTOR[*]}" \
  )"
  LOG "Found host-only gateway IP: ${HOST_ONLY_GW}"
  sed --in-place "/^HOST_ONLY_GW=.*/d" "${CLIENT_ENV}"
  echo "HOST_ONLY_GW=${HOST_ONLY_GW}" >> "${CLIENT_ENV}"
# --------------------------------------------------------------------------------

# --- Setup logrotate for SASG VPN & FW logs -------------------------------------
  chmod +x ./logrotate-docker.sh
  ./logrotate-docker.sh
# --------------------------------------------------------------------------------

# --- Add machine ip to compose's .env file --------------------------------------
  # We cannot use DOCKER_HOST var in docker environment hence naming it as follows
  HOST_IP=""
  ALL_HOST_IPS=( $(ip -f inet -o address | awk '{ print $4 }' | cut -d"/" -f1) )
  LOG "Found host IPs: ${ALL_HOST_IPS[@]}"
  ALL_SASG_IPS=()
  # Getting all SASG_IP_x values from vars file
  for i in {1..10}; do
    SASG_VAR_NAME="SASG_IP_${i}[@]"
    for sasg_ip in "${!SASG_VAR_NAME}"; do ALL_SASG_IPS+=( "${sasg_ip}" ); done
  done
  LOG "Found possible SASG IPs: ${ALL_SASG_IPS[@]}"
  for host_ip in "${ALL_HOST_IPS[@]}"; do
    for sasg_ip in "${ALL_SASG_IPS[@]}"; do
      if [[ "${host_ip}" == "${sasg_ip}" ]]; then
        HOST_IP="${host_ip}"
        LOG "Found current SASG IP: ${host_ip}"
        break 2
      fi
    done
  done
  if [[ "${HOST_IP}" == "" ]]; then
    LOG "Could not find IP of the current machine among possible SASG_IPs. Aborting"
    exit 1
  fi
  sed --in-place "/^HOST_IP=.*/d" "${CLIENT_ENV}"
  echo "HOST_IP=${HOST_IP}" >> "${CLIENT_ENV}"
# --------------------------------------------------------------------------------

cp ${CLIENT_ENV} ${CLIENT_ENV2}

# --------------- Update compose environment -------------------------------------
sed --in-place "/^CHECKER_VERSION=.*/d" "${CLIENT_ENV2}"
echo "CHECKER_VERSION=${CHECKER_VERSION}" >> "${CLIENT_ENV2}"
sed --in-place "/^SASGC_VERSION=.*/d" "${CLIENT_ENV2}"
echo "SASGC_VERSION=${SASGC_VERSION}" >> "${CLIENT_ENV2}"
sed --in-place "/^CRON_CHECK_CONFIG=.*/d" "${CLIENT_ENV2}"
echo "CRON_CHECK_CONFIG=" >> "${CLIENT_ENV2}"
sed --in-place "/^CRON_UPLOAD_LOGS=.*/d" "${CLIENT_ENV2}"
echo "CRON_UPLOAD_LOGS=" >> "${CLIENT_ENV2}"
sed --in-place "/^DOCKER_HOST_NAME=.*/d" "${CLIENT_ENV2}"
echo "DOCKER_HOST_NAME=$(uname -n)" >> "${CLIENT_ENV2}"
sed --in-place "/^LOGPUSH_PORT=.*/d" "${CLIENT_ENV2}"
echo "LOGPUSH_PORT=${SASG_LOGPUSH_PORT}" >> "${CLIENT_ENV2}"
sed --in-place "/^CERT=.*/d" "${CLIENT_ENV2}"
echo "CERT=./certs/client.crt" >> "${CLIENT_ENV2}"
sed --in-place "/^KEY=.*/d" "${CLIENT_ENV2}"
echo "KEY=./certs/client.key" >> "${CLIENT_ENV2}"

# Just in case also creating directory for certificates
mkdir --parents ./certs
# --------------------------------------------------------------------------------

# --------------- HA vars --------------------------------------------------------
  HA_SCRIPTS_DIR="${SASG_BIN_DIR}/HA"
  DEFAULT_HA_USER="sgadm"
  HA_USER_PLACEHOLDER="#SASG HA USER#"
  SYSTEMD_UNIT_SGHA_MASTER="sgha"
  SYSTEMD_UNIT_SGHA_SLAVE="sgha-slave"
  SYSTEMD_UNIT_SGHA_WATCHDOG="sgha-watchdog"
  SYSTEMD_UNIT_SGHA_RESILIENCY="sgha-resilient"
  SYSTEMD_UNIT_SGHA_SERVICE_WATCHER="sgha-watcher"
  PODMAN_RUNNER="sasg-runner.sh"
  PRE_MASTER_SCRIPT="pre-start_master.sh"
  PRE_SLAVE_SCRIPT="pre-start_slave.sh"
  POST_MASTER_SCRIPT="post-start_master.sh"
  POST_SLAVE_SCRIPT="post-start_slave.sh"
  SGHA_POLKIT_RULE="10-sgha-user.rules"
  POLKIT_RULES_DIR="/etc/polkit-1/rules.d"
  RESILIENCY_SCRIPT="check-client-container.sh"
  HA_WATCHDOG_SCRIPT="watchdog_podman.sh"
  HA_WATCHDOG_SLAVE_SCRIPT="watchdog_slave.sh"
  HOST_ONLY_DOCKER_ROUTING_SCRIPT="manage-host-only-docker-route.sh"
  HA_SERVICE_WATCHER_SCRIPT="service-watchdog.sh"
  HA_LIB_DIR="lib"
  HA_LIB_SCRIPT="HA.sh"
# --------------------------------------------------------------------------------

# --------------- Set proper HA user name in required files ----------------------
  [[ "${HA_USER}" == "" ]] && HA_USER="${DEFAULT_HA_USER}"
  for ha_file in "${SGHA_POLKIT_RULE}" "./${HA_LIB_DIR}/${HA_LIB_SCRIPT}"; do
    sed --in-place "s/${HA_USER_PLACEHOLDER}/${HA_USER}/g" "${ha_file}"
  done
# --------------------------------------------------------------------------------

# --------------- Install GCM Infrastructure -------------------------------------
  source "./install-gcm-infrastructure.sh"
  if ! install_gcm_infrastructure "./gcm" "${PODMAN_SASFW}"; then
    LOG "Could not install GCM infrastructure. Aborting..."
    exit 1
  fi
# --------------------------------------------------------------------------------

# --------------- Ensure HA watchdog infrastructure is actual --------------------
  LOG "Checking if HA files are actual"
  cat "${SYSTEMD_UNIT_SGHA_MASTER}.podman@.service" > "${SYSTEMD_UNIT_SGHA_MASTER}@.service"
  cat "${SYSTEMD_UNIT_SGHA_RESILIENCY}.podman@.service" > "${SYSTEMD_UNIT_SGHA_RESILIENCY}@.service"
  
  for service_unit in \
      "${SYSTEMD_UNIT_SGHA_MASTER}@.service" \
      "${SYSTEMD_UNIT_SGHA_SLAVE}@.service" \
      "${SYSTEMD_UNIT_SGHA_RESILIENCY}@.service" \
      "${SYSTEMD_UNIT_SGHA_SERVICE_WATCHER}@.service" \
    ; do
    [ -f "/usr/lib/systemd/system/${service_unit}" ] || touch "/usr/lib/systemd/system/${service_unit}"
    diff --brief "${service_unit}" "/usr/lib/systemd/system/${service_unit}"
    if [ "${?}" == "0" ]; then
      LOG "${service_unit} is actual"
    else
      LOG "${service_unit} is not actual. Updating..."
      cp --force "${service_unit}" "/usr/lib/systemd/system/${service_unit}"
      systemctl daemon-reload
    fi
    chmod a+r "/usr/lib/systemd/system/${service_unit}"
  done

  # Explicitly create 2 dirs to indicate we need both
  [ -d "${HA_SCRIPTS_DIR}/" ] || mkdir --parent "${HA_SCRIPTS_DIR}"
  [ -d "${HA_SCRIPTS_DIR}/${HA_LIB_DIR}" ] || mkdir --parent "${HA_SCRIPTS_DIR}/${HA_LIB_DIR}"
  [ -f "${HA_SCRIPTS_DIR}/${HA_LIB_DIR}/${HA_LIB_SCRIPT}" ] || touch "${HA_SCRIPTS_DIR}/${HA_LIB_DIR}/${HA_LIB_SCRIPT}"
  diff --brief "./${HA_LIB_DIR}/${HA_LIB_SCRIPT}" "${HA_SCRIPTS_DIR}/${HA_LIB_DIR}/${HA_LIB_SCRIPT}"
  if [ "${?}" == "0" ]; then
    LOG "${HA_LIB_DIR}/${HA_LIB_SCRIPT} is actual"
  else
    LOG "${HA_LIB_DIR}/${HA_LIB_SCRIPT} is not actual. Updating..."
    cp --force "./${HA_LIB_DIR}/${HA_LIB_SCRIPT}" "${HA_SCRIPTS_DIR}/${HA_LIB_DIR}/${HA_LIB_SCRIPT}"
  fi
  chmod +x "${HA_SCRIPTS_DIR}/${HA_LIB_DIR}/${HA_LIB_SCRIPT}"

  # Adding polkit rule to allow non-root user to manage services
  [ -f "${POLKIT_RULES_DIR}/${SGHA_POLKIT_RULE}" ] || touch "${POLKIT_RULES_DIR}/${SGHA_POLKIT_RULE}"
  diff --brief "./${SGHA_POLKIT_RULE}" "${POLKIT_RULES_DIR}/${SGHA_POLKIT_RULE}"
  if [ "${?}" == "0" ]; then
    LOG "${SGHA_POLKIT_RULE} is actual"
  else
    LOG "${SGHA_POLKIT_RULE} is not actual. Updating..."
    #cp --force "./${HA_LIB_DIR}/${SGHA_POLKIT_RULE}" "${POLKIT_RULES_DIR}/${SGHA_POLKIT_RULE}"
    #issue119 -fixed source of polkit rule for copy cmd.
    cp --force "./${SGHA_POLKIT_RULE}" "${POLKIT_RULES_DIR}/${SGHA_POLKIT_RULE}"
  fi
  chmod 644 "${POLKIT_RULES_DIR}/${SGHA_POLKIT_RULE}"
  # Restart polkit to force new policy
  systemctl restart polkit

  for HA_script in \
    "${PRE_MASTER_SCRIPT}" \
    "${PRE_SLAVE_SCRIPT}" \
    "${POST_MASTER_SCRIPT}" \
    "${POST_SLAVE_SCRIPT}" \
    "${RESILIENCY_SCRIPT}" \
    "${HA_WATCHDOG_SLAVE_SCRIPT}" \
    "${HOST_ONLY_DOCKER_ROUTING_SCRIPT}" \
    "${HA_SERVICE_WATCHER_SCRIPT}" \
    "${PODMAN_RUNNER}" \
    ; do
    [ -f "${HA_SCRIPTS_DIR}/${HA_script}" ] || touch "${HA_SCRIPTS_DIR}/${HA_script}"
    diff --brief "./${HA_script}" "${HA_SCRIPTS_DIR}/${HA_script}"
    if [ "${?}" == "0" ]; then
      LOG "${HA_script} is actual"
    else
      LOG "${HA_script} is not actual. Updating..."
      cp --force "./${HA_script}" "${HA_SCRIPTS_DIR}/${HA_script}"
    fi
    chmod +x "${HA_SCRIPTS_DIR}/${HA_script}"
    chcon -t bin_t "${HA_SCRIPTS_DIR}/${HA_script}"
  done
# --------------------------------------------------------------------------------

# --------------- Ensure autoupdate infrastructure is actual --------------------
  LOG "Checking if autoupdate files are actual"
  service_unit="sgha-updater@.service"
  [ -f "/usr/lib/systemd/system/${service_unit}" ] || touch "/usr/lib/systemd/system/${service_unit}"
  diff --brief "${service_unit}" "/usr/lib/systemd/system/${service_unit}"
  if [ "${?}" == "0" ]; then
    LOG "${service_unit} is actual"
  else
    LOG "${service_unit} is not actual. Updating..."
    cp --force "${service_unit}" "/usr/lib/systemd/system/${service_unit}"
    systemctl daemon-reload
  fi
  chmod a+r "/usr/lib/systemd/system/${service_unit}"

  update_script="/sasg/bin/update/upgrade.sh"
  mkdir --parent "$(dirname "${update_script}")"
  [ -f "${update_script}" ] || touch "${update_script}"
  diff --brief "./$(basename "${update_script}")" "${update_script}"
  if [ "${?}" == "0" ]; then
    LOG "${update_script} is actual"
  else
    LOG "${update_script} is not actual. Updating..."
    cp --force "./$(basename "${update_script}")" "${update_script}"
  fi
  chmod +x "${update_script}"
# --------------------------------------------------------------------------------

# -------------- Enable HA Supplementary subsytems -------------------------------
# Make sure arp_notify is enabled in run time to avoid reboot
echo 1 > /proc/sys/net/ipv4/conf/default/arp_notify

# Ensure kernel param addition survives the reboot
[ -d "/etc/sysctl.d" ] || mkdir --parent "/etc/sysctl.d"
echo "net.ipv4.conf.default.arp_notify = 1"  > "/etc/sysctl.d/HA.conf"

systemctl enable "sgha-updater@${PODMAN_SASFW}.service" && systemctl start "sgha-updater@${PODMAN_SASFW}.service"
# --------------------------------------------------------------------------------

LOG "Docker config complete for client $PODMAN_SASFW\n"
LOG "--------------------------------------------------------------"
LOG ""
LOG "For resiliency (single node setup) run the following commands:"
LOG ""
LOG "     systemctl enable ${SYSTEMD_UNIT_SGHA_RESILIENCY}@${PODMAN_SASFW}.service"
LOG "     systemctl start ${SYSTEMD_UNIT_SGHA_RESILIENCY}@${PODMAN_SASFW}.service"
LOG "--------------------------------------------------------------"
LOG "For HA (multi nodes setup) run the following commands:"
LOG "Ensure resiliency is disabled:"
LOG "     systemctl stop ${SYSTEMD_UNIT_SGHA_RESILIENCY}@${PODMAN_SASFW}.service"
LOG "     systemctl disable ${SYSTEMD_UNIT_SGHA_RESILIENCY}@${PODMAN_SASFW}.service"
LOG ""
LOG "On master machine:"
LOG "     systemctl enable ${SYSTEMD_UNIT_SGHA_MASTER}@${PODMAN_SASFW}.service"
LOG "     systemctl start ${SYSTEMD_UNIT_SGHA_MASTER}@${PODMAN_SASFW}.service"
LOG
LOG "On slave machine:"
LOG "     systemctl enable ${SYSTEMD_UNIT_SGHA_SLAVE}@${PODMAN_SASFW}.service"
LOG "     systemctl start ${SYSTEMD_UNIT_SGHA_SLAVE}@${PODMAN_SASFW}.service"
LOG
exit 0
