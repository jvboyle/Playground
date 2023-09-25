#!/usr/bin/env bash

# ---  Constants -------------------------------------------
  readonly BUILD_ID="$(date "+%Y%m%d_%H%M")-${TRAVIS_BUILD_NUMBER:-local}"
  # Variables should be set in Travis build settings
  readonly MANDATORY_VARIABLES=(
    "DOCKER_IMAGE_NAME"
    "DOCKER_PASSWORD"
    "DOCKER_REGISTRY"
    "DOCKER_USER"
  )

  readonly VPN_TYPES=(
    "openvpn"
    "ipsec"
  )

  readonly SEPARATOR="$(for i in {1..60}; do echo -n "-"; done)"
  if [[ "${TRAVIS_PULL_REQUEST_BRANCH}" == "" ]]; then
    CURRENT_BRANCH="${TRAVIS_BRANCH}"
  else
    CURRENT_BRANCH="${TRAVIS_PULL_REQUEST_BRANCH}"
  fi
  if [[ "${CURRENT_BRANCH}" == "master" ]]; then
    readonly CURRENT_DOCKER_IMAGE_NAME="${DOCKER_IMAGE_NAME}"
  else
    # TODO change docker image after discussing w/ team members
    # readonly CURRENT_DOCKER_IMAGE_NAME="${DOCKER_IMAGE_NAME}-dev" 
    readonly CURRENT_DOCKER_IMAGE_NAME="${DOCKER_IMAGE_NAME}"
  fi
# ---------------------------------------------------------

# -- Checking mandatory variables existence ---------------
  echo -e "-= CHECK MANDATORY VARS =-\n"
  missing_variables=()
  for var in "${MANDATORY_VARIABLES[@]}"; do
    if [[ -z "${!var}" ]]; then 
      missing_variables+=( "${var}" )
      echo "Missing:               ${var}"
      continue
    fi
    echo "OK:                    ${var}"
  done
  if [ ${#missing_variables[@]} != 0 ]; then
    echo "Some mandatory variables are missing:"
    for var in "${missing_variables[@]}"; do
      echo -e "\t* ${var}"
    done
    exit 1
  fi
# ---------------------------------------------------------

# --- Test if travis build commit includes changes in files inside some folder
  function changes_present() {
    COMMIT_RANGE="${1}"
    CHANGE_PATH="${2}"
    if [[ -z $COMMIT_RANGE ]]; then
        echo "Warning: empty commit range"
    fi

    if [[ -z $CHANGE_PATH ]]; then
        echo "Change path cannot be empty"
        exit 1
    fi

    git diff --name-only $1 2>/dev/null | sort -u | uniq | grep $2 > /dev/null
    return $?
  }
# ---------------------------------------------------------

# --- Prepare VPN build files depending on VPN type -------
  # Normally VPN variable is set by Travis
  if [[ -z ${VPN} ]] || ! echo "${VPN_TYPES[*]}" | grep -wq "${VPN}"; then
    echo "VPN variable is not setup (must be one of the following: ${VPN_TYPES[*]}). Aborting"
    exit 1
  fi
  export changes_present
  export VPN

  FORCE_BUILD=0
  echo "The following files were included into commit set ${TRAVIS_COMMIT_RANGE}:"
  git diff --name-only "${TRAVIS_COMMIT_RANGE}" 2>/dev/null | sort -u
  if ! git diff --name-only "${TRAVIS_COMMIT_RANGE}" >/dev/null 2>&1; then
    echo -e "  -= No changed files were found =-\n"
    echo "For safety rebuilding both containers"
    FORCE_BUILD=1
  fi

  if ! changes_present "${TRAVIS_COMMIT_RANGE}" "vpn-flavours/${VPN}/" \
    && ! changes_present "${TRAVIS_COMMIT_RANGE}" container/ \
    && ! changes_present "${TRAVIS_COMMIT_RANGE}" .build/ \
    && ! changes_present "${TRAVIS_COMMIT_RANGE}" .travis.yml \
    && [[ ${FORCE_BUILD} -eq 0 ]] \
  ; then
    echo "No changes found for ${VPN} and no force rebuild triggered"
    exit 0
  fi
# ---------------------------------------------------------

echo "Building container for ${VPN} SASG flavour"

cp -Rf vpn-flavours/"${VPN}"/* container
chmod +x container/sasg_install/*_client.sh

# --- Travis build info -----------------------------------
  echo -e "-= TRAVIS BUILD INFO =-\n"
  echo "Current branch:        ${CURRENT_BRANCH}"
  echo "PR?:                   ${TRAVIS_PULL_REQUEST}"
  echo "Commit:                ${TRAVIS_COMMIT_MESSAGE}"
  echo "Target image:          ${CURRENT_DOCKER_IMAGE_NAME}:${BUILD_ID}"
  echo "${SEPARATOR}"
# ---------------------------------------------------------

# --- Build container -------------------------------------
  cd container
  echo "${DOCKER_PASSWORD}" \
  | docker login \
    --username "${DOCKER_USER}" \
    --password-stdin \
    "${DOCKER_REGISTRY}"

  docker build \
    --tag "${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}${DOCKER_IMAGE_SUFFIX}:latest" \
    --tag "${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}${DOCKER_IMAGE_SUFFIX}:${BUILD_ID}" \
  .

  docker push "${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}${DOCKER_IMAGE_SUFFIX}:latest"
  docker push "${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}${DOCKER_IMAGE_SUFFIX}:${BUILD_ID}"

  if [[ $? -ne 0 ]]; then
    echo "Push result:           FAILURE"
    docker logout "${DOCKER_REGISTRY}"
    echo "${SEPARATOR}"
    exit 1
  fi
  
  echo -e "\nPush result:           SUCCESS"
  docker logout "${DOCKER_REGISTRY}"
  echo "${SEPARATOR}"
  exit 0
# ---------------------------------------------------------
