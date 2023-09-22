
#add a service in NSX

param ($vcenter, $name, $description, $protocol, $port)
Write-Host "USAGE: add-service  -vcenter -name -description -protocol -port"

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $vcenter

New-NsxService -Name $name -Description $description -Protocol $protocol -Port $port

Disconnect-NsxServer -vCenterServer $vcenter
Disconnect-VIServer -Server $vcenter -Confirm:$False

Write-Host -foregroundcolor "Green" "`nScript completed!"
