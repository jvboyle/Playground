#!/bin/bash

CONFIG_ROOT="/sasg/listener/uploads"
SASFW_MACHINE="$1"
CSV_SEPARATOR=";"

function output_report_line() {
  local machine="$1"
  local sasg_vip="$2"
  local sasg_ip="$3"
  local policy_file="$4"
  local policy_file_is_present="$5"
  local number_of_violations="$6"

  local output_params=(
    "${machine}"
    "${sasg_vip}"
    "${sasg_ip}"
    "${policy_file}"
    "${policy_file_is_present}"
    "${number_of_violations}"
  )

  echo "${output_params[*]}" | tr " " "${CSV_SEPARATOR}"
}

for sasg_instance in $(ls "${CONFIG_ROOT}"); do
  [[ "${sasg_instance}" == "autoupdate" ]] && continue
  [[ ! -d "${CONFIG_ROOT}/${sasg_instance}" ]] && continue
  [[ -f "${CONFIG_ROOT}/${sasg_instance}/disable.gcm.check" ]] && continue
  for sasg_ip in $(ls "${CONFIG_ROOT}/${sasg_instance}"); do

    sasg_ip_path="${CONFIG_ROOT}/${sasg_instance}/${sasg_ip}"

    [[ ! -d "${sasg_ip_path}" ]] && continue
    [[ "${sasg_ip}" == "configs" ]] && continue

    for report in "policy_OS_result.xml" "policy_docker_result.xml"; do
      policy_report_path="${sasg_ip_path}/gcm/${report}"

      if [[ ! -f "${policy_report_path}" ]]; then
        output_report_line \
          "${SASFW_MACHINE}" \
          "${sasg_instance}" \
          "${sasg_ip}" \
          "${report}" \
          "missing" \
          "n/a"
      fi

      number_of_violations="$(grep -o "<violation>" "${policy_report_path}" | wc -l)"
      output_report_line \
        "${SASFW_MACHINE}" \
        "${sasg_instance}" \
        "${sasg_ip}" \
        "${report}" \
        "present" \
        "${number_of_violations}"
    done
  done
done