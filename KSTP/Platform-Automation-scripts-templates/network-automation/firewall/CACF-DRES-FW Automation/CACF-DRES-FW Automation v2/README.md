V2 Updates
- Update to Firewall rules: removed wrong Source and Apply To
- Added SRES Jump Hosts to CACF DRES Proxy Server Firewall Rule
- Fixed NAT: removed the NAT Rules that are not needed.

Known Issues 
- The Script considers the CACF Proxy Virtual IP Address is configured on Proxy VM1. If the VIP is on VM2 then the IPSet&NATs will be created for the IP ending in .51 instead of .50. Check for the message to end with .50: CACF Proxy IP:  X.X.X.50



## Create-FW-Rules for CACF
Example on how to use it can be found in the scripts.

##You Need to Edit the required script to connect to the Vcenter before running the scrips
Example: 
For EU: Connect-NsxServer -vCenterServer eu1vc1.eu1.sp.ibm.local
For NA: Connect-NsxServer -vCenterServer ag1vc1.eu1.sp.ibm.local

## Usage
This automation is created using the NSX extension for PowerShell.
This is a command line automation executed from the Windows Jump Host in PowerShell
