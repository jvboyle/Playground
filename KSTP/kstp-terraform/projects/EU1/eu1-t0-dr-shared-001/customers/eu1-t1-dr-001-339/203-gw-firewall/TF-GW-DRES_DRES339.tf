resource "nsxt_policy_gateway_policy" "policies_TF-DRES_339-DRES_339" {
   display_name    = "TF-GW-DRES_339"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES_339"
   comments        = ""
   sequence_number = 0
      rule {
         display_name = "TF-DRES to SRES SL1"
         notes        = "CHGEU0209188"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d339lpmh0tnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d339lpmh0tnp2"
            ]
         destination_groups = [
            "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp7",
            "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc7",
            "/infra/domains/default/groups/TF-EU1-IPSET-eu1srlpm1esd7-vip",
            "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk7"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7705"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_339-EU1"
            }
      }
   rule {
         display_name = "TF-DRES-to-SRES-SL-eventforwoard"
         notes        = "CHGEU0209188"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d339lpmh0tnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d339lpmh0tnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_339-EU1"
            }
      }
   rule {
         display_name = "TF-DRES-to-SRES-Samba"
         notes        = "CHGEU0209188"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d339lpmh0tnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d339lpmh0tnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-UDP-137-139",
               "/infra/services/TCP-UDP-455"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_339-EU1"
            }
      }
   rule {
         display_name = "TF-SRES-to_DRES"
         notes        = "CHGEU0209188"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d339lpmh0tnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d339lpmh0tnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES_339-EU1"
            }
      }
   }