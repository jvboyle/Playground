resource "nsxt_policy_gateway_policy" "DRES_110_LB" {
  display_name    = "DRES110-LB-Access"
  description     = "Terraform provisioned Gateway Policy"
  category        = "LocalGatewayRules"
  locked          = false
  sequence_number = 3
  stateful        = true
  tcp_strict      = false

  rule {
    display_name       = "DRES110-LB_in"
    destination_groups = ["/infra/domains/default/groups/TF-AP1-IPSET-ap1d110lpbpi-vip1"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/AP1-Host-to-DRES110-LB"]
    services           = ["/infra/services/TCP-22623","/infra/services/TCP-8443","/infra/services/TCP-6443","/infra/services/HTTPS","/infra/services/HTTP"]
    scope              = [local.gw_scope]
  }
  rule {
    display_name       = "Netcool Flow"
    destination_groups = ["172.20.0.101","172.20.0.102","172.20.0.111","172.20.0.112"]
    action             = "ALLOW"
    logged             = true
    source_groups      = ["/infra/domains/default/groups/SG-DRES110-OCP4-Cluster02"]
    services           = ["/infra/services/TCP-16443","/infra/services/SSH"]
    scope              = [local.gw_scope]
  }
}