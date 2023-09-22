resource "nsxt_policy_gateway_policy" "DRES_114_LB" {
  display_name    = "DRES114-LB-Access"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "DRES114-LB_in"
    destination_groups = ["/infra/domains/default/groups/TF-AP1-IPSET-ap1d114lpnab-vip1"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/AP1-Host-to-DRES114-LB"]
    services           = ["/infra/services/TCP-22623","/infra/services/TCP-8443","/infra/services/TCP-6443","/infra/services/HTTPS","/infra/services/HTTP"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
  rule {
    display_name       = "Netcool Flow"
    destination_groups = ["130.103.173.100","130.103.173.70","130.103.173.71"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/TF-AP1-SG-DRES114-OCP-Cluster01"]
    services           = ["/infra/services/TCP-16443"]
    scope              = [data.nsxt_policy_tier0_gateway.T0_0.path]
  }
}