resource "nsxt_policy_gateway_policy" "policies_TF-SRES-EU1-HRES-wave2" {
  display_name    = "TF-GW-SRES"
  category        = "LocalGatewayRules"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-GW-SRES"
  comments        = ""
  sequence_number = 0
  rule {
    display_name = "TF-6800-ISIM-connect-to-server"
    notes        = "SR50974892 SR51023015"
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-ISIM-VM-DESTINATION-SSH",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1rhellic01",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lnbzztest",
      "/infra/domains/default/groups/TF-EU1-HOSTS-LinuxOS-All",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod",
      "/infra/domains/default/groups/TF-EU1-SG-SR50974892-DPT-22-VM-List",
      "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1cntrl1",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1",
      "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1dxdev02",
      "/infra/domains/default/groups/TF-EU1-SG-SR51023015-DPT-22-VM-List"
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
      tag = "TF-SRES-EU1"
    }
  }
}
