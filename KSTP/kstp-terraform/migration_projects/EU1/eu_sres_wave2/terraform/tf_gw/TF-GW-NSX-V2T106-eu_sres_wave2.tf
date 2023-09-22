resource "nsxt_policy_gateway_policy" "policies_TF-NSX-V2T-eu_sres_wave2" {
   display_name    = "TF-GW-NSX-V2T106-eu_sres_wave2"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-NSX-V2T106-eu_sres_wave2"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-7821-MCDS-V-to-T"
         notes        = "SR51257009 SR51320522"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/HTTP",
               "/infra/services/HTTPS",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-902",
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
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-7822-Dedicated-vSphere-cluster"
         notes        = "SR51257009 SR51320522"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-8081",
               "/infra/services/TCP-8182",
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
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8018-Dedicated-vSphere-cluster-to-exec"
         notes        = "SR51257009 SR51320522"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8182",
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
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8032-MCDS-Execution-Node-to-ESXi"
         notes        = "SR51337318"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-MCDS-CLUSTER-ESXI-MGMT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8124-MCDS-Kali-Linux"
         notes        = "SR51362902"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-MCDS-Kali-eu-vm0079-pt"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1nsxt-mcdstower",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS",
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
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8780-MCDS-to-NSXT"
         notes        = "RITM0125663"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/TCP-5986",
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
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8944-Ansible-to-BDS-child"
         notes        = "RITM0137971 RITM0140044"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-HRES-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
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
               tag = "TF-NSX-V2T-EU1"
            }
      }
}