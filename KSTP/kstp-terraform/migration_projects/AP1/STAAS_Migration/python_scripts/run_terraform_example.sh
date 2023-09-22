
PWD="$PWD"

python3 generate_terraform_config.py \
-f "$PWD/../json_config/auxiliary_files/DFW_mapped.json" \
-g "$PWD/../json_config/auxiliary_files/Security_groups_by_ip_full_mapped.json" \
-s "$PWD/../json_config/auxiliary_files/Services_full.json" \
-m "$PWD/../json_config/auxiliary_files/Services_and_groups_exists.json"