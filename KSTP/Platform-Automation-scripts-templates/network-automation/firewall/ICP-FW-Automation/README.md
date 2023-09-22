## Create-FW-Rules for ICP : DRES deployment

## Purpose
The purpose of this automation is to setup the required NSX Firewall rules for an ICP Cluster running in a DRES.
Note the rules are slightly different for an ICP Cluster running in an SRES so that will be covered in a separate automation.

## Usage
This automation is created using the NSX extension for PowerShell.
This is a command line automation executed from the Platform Hosting Automation Control Node.

`Powershell Create-FW-Rules-for-ICP.ps1  <vCenter> <region> <segmentName> <segmentNumber> <segmentId> <clusterName><clusterID>`

Note that in order to run this the following environment variables need to be set:
`export vsphere_user=<username>`
`export vsphere_password=<password>`

### Sample

`Powershell Create-FW-Rules-for-ICP.ps1 ag1vc1.ag1.sp.ibm.local, ag1, DRES, 33, dr1, cluster1, icp1`

## Input Parameters
| Parameter |  Description | Examples |
| --------- |  ----------- | -------- |
| vCenter | the domain name of vCenter | `ag1vc01.poc.ispw.ibm.local` |
| region | identifier of the region  | `ag1` or `eu1`  |
| segmentName | name of the segment; needed to setup the FW Rule | SRES, GRES, DRES, PDR |
| segmentNumber | unique identifying number of the segment. | e.g. 1, 2, 3  |
| segmentId | segmentID | gr1, sr1, etc.... |
| clusterName | The identifier of the clusterName | ( cluster1,  cluster2, ... ) |
| clusterID |  | icp1, icp2 |

## Notes
1. The combination of $region + $segmentIdentifier + $segmentNumber + $clusterIdentifier should equal the VM Prefix used. For example `ag1dr12icp1`

## Output Parameter

None
