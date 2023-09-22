resource "nsxt_policy_gateway_policy" "policies_TF-IRES-IAM_PHASE4" {
   display_name    = "TF-GW-IRES101-IAM_PHASE4"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-IRES101-IAM_PHASE4"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1114-Terminal-servers-to-License-server"
         notes        = "SR51015869 - source SG-SRES-IAM-THY-RAS-PROD SG-SRES-IAM-THY-RAS-NONPROD added to the source"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-TS-Session-Hosts"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-IRES-TS-License-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/SMB",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/TCP-5985",
               "/infra/services/NetBios_Session_Service_(TCP)",
               "/infra/services/Win_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS_-_TCP",
               "/infra/services/NetBios_Datagram_(UDP)",
               "/infra/services/NetBios_Name_Service_(UDP)"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-AG1"
            }
      }
   rule {
         display_name = "TF-2331-IAMaas--Thycotic-Pentest"
         notes        = "SR50955390"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-AG1"
            }
      }
}