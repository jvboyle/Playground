### This essentially processes the items in the "services" Column

Connect-NsxServer -vCenterServer $Args[1]
service_name=$Args[2]

#Check and create custom services
#If (-Not (Get-NsxService -Name "tcp-")) { Write-Host -foregroundcolor "Green" "Creating " "tcp-"; New-NsxService -Name "tcp-" -Protocol tcp -port "" -Description "tcp/" }

## ??? would this work????
#If (-Not (Get-NsxService -Name $service_name)) { Write-Host -foregroundcolor "Green" "Creating " $service_name; New-NsxService -Name $service_name -Protocol tcp -port "" -Description $service_name }


If (-Not (Get-NsxService -Name "tcp-135"))   { Write-Host -foregroundcolor "Green" "Creating " "tcp-135";   New-NsxService -Name "tcp-135"   -Protocol tcp -port "135"   -Description "tcp/135" }
If (-Not (Get-NsxService -Name "tcp-445"))   { Write-Host -foregroundcolor "Green" "Creating " "tcp-445";   New-NsxService -Name "tcp-445"   -Protocol tcp -port "445"   -Description "tcp/445" }
If (-Not (Get-NsxService -Name "tcp-465"))   { Write-Host -foregroundcolor "Green" "Creating " "tcp-465";   New-NsxService -Name "tcp-465"   -Protocol tcp -port "465"   -Description "tcp/465" }
If (-Not (Get-NsxService -Name "tcp-578"))   { Write-Host -foregroundcolor "Green" "Creating " "tcp-578";   New-NsxService -Name "tcp-578"   -Protocol tcp -port "578"   -Description "tcp/578" }
If (-Not (Get-NsxService -Name "tcp-1688"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-1688";  New-NsxService -Name "tcp-1688"  -Protocol tcp -port "1688"  -Description "tcp/1688" }
If (-Not (Get-NsxService -Name "tcp-4001"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-4001";  New-NsxService -Name "tcp-4001"  -Protocol tcp -port "4001"  -Description "tcp/4001" }
If (-Not (Get-NsxService -Name "tcp-4002"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-4002";  New-NsxService -Name "tcp-4002"  -Protocol tcp -port "4002"  -Description "tcp/4002" }
If (-Not (Get-NsxService -Name "tcp-5985"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-5985";  New-NsxService -Name "tcp-5985"  -Protocol tcp -port "5985"  -Description "tcp/5985" }
If (-Not (Get-NsxService -Name "tcp-8181"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-8181";  New-NsxService -Name "tcp-8181"  -Protocol tcp -port "8181"  -Description "tcp/8181" }
If (-Not (Get-NsxService -Name "tcp-9427"))  { Write-Host -foregroundcolor "Green" "Creating " "tcp-9427";  New-NsxService -Name "tcp-9427"  -Protocol tcp -port "9427"  -Description "tcp/9427" }
If (-Not (Get-NsxService -Name "tcp-22443")) { Write-Host -foregroundcolor "Green" "Creating " "tcp-22443"; New-NsxService -Name "tcp-22443" -Protocol tcp -port "22443" -Description "tcp/22443" }
If (-Not (Get-NsxService -Name "udp-445"))   { Write-Host -foregroundcolor "Green" "Creating " "udp-445";   New-NsxService -Name "udp-445"   -Protocol udp -port "445"   -Description "udp/445" }
If (-Not (Get-NsxService -Name "udp-22443")) { Write-Host -foregroundcolor "Green" "Creating " "udp-22443"; New-NsxService -Name "udp-22443" -Protocol udp -port "22443" -Description "udp/22443" }
