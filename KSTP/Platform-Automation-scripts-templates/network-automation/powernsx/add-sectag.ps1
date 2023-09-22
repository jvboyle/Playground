
#psuedo powershell code for adding new Security Tag

Write-Host "USAGE: add-sectag  <vCenter Server> <DR number> "

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

New-NsxSecurityTag -Name "ST-SRES-Automation-Control-Node“
