resource "nsxt_policy_gateway_policy" "policies_TF-TMP-Section-json_2_tf" {
  display_name    = "TF-GW-TMP-Section"
  category        = "LocalGatewayRules"
  locked          = false
  tcp_strict      = true
  stateful        = true
  nsx_id          = "TF-GW-TMP-Section"
  comments        = ""
  sequence_number = 0
  rule {
    display_name = "TF-4053-DA1-0-Nessus-to-CACF"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-EU1-IPSET-DA-Nessus-146-89-167-214"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster02",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta2ssh-VIP",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta3ssh-VIP",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-FSSProd",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster03",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-JP-Shared-Prod",
      "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01",
      "/infra/domains/default/groups/TF-EU1-IPSET-HRES-eu1h1lpta1ssh-VIP",
      "/infra/domains/default/groups/TF-EU1-SG-DR20-SSH-Proxy",
      "/infra/domains/default/groups/TF-EU1-SG-HRES-TALOS-SSHProxy-EU-Shared-Prod"
    ]
    action = "ALLOW"
    services = [

    ]
    scope                 = ["/infra/tier-0s/4b193c06-a567-4d2f-9b94-b0334836cbf0"]
    disabled              = false
    direction             = "IN_OUT"
    ip_version            = "IPV4_IPV6"
    logged                = false
    sources_excluded      = false
    destinations_excluded = false
    tag {
      tag = "TF-TMP-Section-EU1"
    }
  }
}
