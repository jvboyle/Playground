
#psuedo powershell code for adding Security Tag to a VM

Write-Host "USAGE: add-sectag-vm  <vCenter Server> <DR number> "

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

Get-NsxSecurityTag "ST-SRES-Automation-Control-Node" | New-NsxSecurityTagAssignment -ApplytoVM -VirtualMachine (get-VM "ag1sr1cntrl1")
