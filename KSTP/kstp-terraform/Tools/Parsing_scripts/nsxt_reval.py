# This script will look for the exported Excel file and the 
# exported rules file within the 'reval' folder.
# The output will be saved withitn the same 'reval' folder.

import os
import sys
import json
import pandas as pd
from py_modules import names_fix as nf

cwd = os.getcwd()
cwd = 'C:\\KSTP\\GIT\\kstp-terraform\\Tools\\Parsing_scripts'

reval_folder = cwd + '/reval'

# list the excel files within cwd/reval
excel_files = [file for file in os.listdir(cwd + '/reval') if file.endswith('.xlsx')]
exported_dfw = reval_folder + '/' + excel_files[0]

# list the json files within cwd/reval
json_files = [file for file in os.listdir(cwd + '/reval') if file.endswith('.json')]
exported_rules = reval_folder + '/' + json_files[0]

# if excel_files or json_files is empty, print an error message and exit
if not excel_files or not json_files:
    print('Error: No excel or json files found in the current directory.')
    sys.exit(1)

# excel_files
print('reading Excel file...')
df = pd.read_excel(exported_dfw, sheet_name='Layer 3 Firewall Rules', header=None)
df = df.truncate(before=3).reset_index(drop=True)
df = df.dropna(how='all')
df[0].ffill(inplace=True)
df_rules = df[~df[4].isna()]
selected_columns = [4, 2, 3, 0]
df_selected = df_rules.iloc[:, selected_columns]
df_selected.columns = ['rule_id', 'rule_status', 'rule_name', 'section_name']
nsxv_list = df_selected.to_dict(orient='records')
nsxv = {}
for item in nsxv_list:
    tf_name = f'tf-{item["rule_id"]}-{nf.fix_name(item["rule_name"]).lower()}'
    if (item['rule_id'] == 1173):
        pass
    nsxv.update({
        tf_name: {
            'rule_id': str(item['rule_id']),
            'rule_status': item['rule_status'],
            'rule_name_source': item['rule_name'],
            'section_name': item['section_name']
        }
    })
# Save nsxv to the reveal folder as nsxv.json
# with open(reval_folder + '/nsxv.json', 'w') as f:
#     json.dump(nsxv, f, indent=4)
    
# Read the exported_rules.json file using json.load()
with open(exported_rules, 'r') as f:    
    nsxt = json.load(f)

delta_rules = {}
dup_rules = []
unique_rules = []
for nsxt_rule in nsxt.keys():
    print(f'checking {nsxt_rule}')
    nsxt_disabled = nsxt[nsxt_rule]['disabled']
    # check if nsxt_rule exists in nsxv
    # nsxt_rule = int(nsxt_rule)
    rules = nsxv.keys()
    nsxt_rule = nsxt_rule.lower()
    if nsxt_rule in rules:
        nsxv_disabled = nsxv[nsxt_rule]['rule_status'].lower()
        if (nsxv_disabled == 'disabled'):
            nsxv_disabled = True
        else:
            nsxv_disabled = False
        if nsxt_disabled != nsxv_disabled:
            delta_rules.update({
                nsxt_rule: {
                    'NXS-T disabled': nsxt_disabled,
                    'NXS-V disabled': nsxv_disabled
                }
            })
    # Check for duplicated rules
    if nsxt_rule not in unique_rules:
        unique_rules.append(nsxt_rule)
    else:
        dup_rules.append(nsxt_rule)

delta_rules = {
    'delta_rules': delta_rules,
    'duplicated_rules': dup_rules,
}
# Save delta_rules to the delta_rules.json file within the reval folder
with open(reval_folder + '/delta_rules.txt', 'w') as f:
    json.dump(delta_rules, f, indent=4)

# Print a message to the console
print('The delta_rules.json file has been created within the reval folder.')