resource "nsxt_policy_gateway_policy" "policies_TF-Monitoring-EU1-HRES-wave2" {
  display_name    = "TF-GW-Monitoring"
  category        = "LocalGatewayRules"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-GW-Monitoring"
  comments        = ""
  sequence_number = 0
  rule {
    display_name = "TF-8411-SL1-Data-Collectors-to-All-Linux-VMs"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1rhellic01",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lnbzztest",
      "/infra/domains/default/groups/TF-EU1-HOSTS-LinuxOS-All",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1cntrl1",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1dxdev02"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SSH"
    ]
    scope                 = ["/infra/tier-0s/4b193c06-a567-4d2f-9b94-b0334836cbf0"]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = true
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-Monitoring-EU1"
    }
  }
}
