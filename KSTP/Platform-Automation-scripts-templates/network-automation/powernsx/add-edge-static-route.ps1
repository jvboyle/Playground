
#psuedo powershell code for adding new dres network routes to existing nsx edges

Write-Host "USAGE: add-edge-static-route  <vCenter Server> <DR number> "

Set-PowerCLIConfiguration -InvalidCertificateAction Ignore -Confirm:$false
Connect-NsxServer -vCenterServer $Args[1]
dr_number=$Args[2]

$edges = Get-NsxEdge
$app_internal_subnet = 100.120.aa.0/24
$app_internal_subnet_prefix = 24
$dres_transit_subnet = 100.120.xx.0/28
$dres_transit_subnet_prefix = 28
$next_hop = dres-esg-provider-transit-ip
$edge_vnic = vnic0 most of the time
$description = "route to {{ new_ls.app_internal.network }}"


for the following EDGES in $edges, agg-esg, svc-esg, sres-esg, pdr-esg, ext1-vpn, do the following:
Get-NsxEdge $edges | Get-NsxEdgeRouting | New-NsxEdgeStaticRoute -Network $app_internal_subnet/$app_internal_subnet_prefix -NextHop $next_hop -Vnic $edge_vnic -Description $description

for the following EDGES in $edges, svc-esg, sres-esg do the following:
Get-NsxEdge $edges | Get-NsxEdgeRouting | New-NsxEdgeStaticRoute -Network $dres_transit_subnet/$dres_transit_subnet_prefix -NextHop $next_hop -Vnic $edge_vnic -Description $description
