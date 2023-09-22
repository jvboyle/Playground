# Network Automation Ansible Playbooks

## Purpose:
FW Rule Automation


### Configurable Parameters

| Parameter	| Purpose | Comments |
| ---------- | ------------ |  ------------ |
| vcenter | 'ag1vc1.ag1.sp.ibm.local' | to replace  Connect-NsxServer -vCenterServer  |
| drNumber |  < 2 Char DRES number> |  |
| customerPrefixName |  <3chars> |  |
| customerRegionPrefixName | "eu1" or "ag1"  |
| Excel FW Rule Template Spreadsheet name for the solution |  This is a spreadsheet in which the rules are managed. | |

## USAGE

Create YML files for each FW rule

"USAGE: create-segment-configfiles.py <Excel spreadsheet path and filename> <DRES Number>"

`python create-FWRule-configfiles.py test-fw-rules.xlsx 22`

`powershell Create-FW-RUles-for-AA-ver02.ps1 `
