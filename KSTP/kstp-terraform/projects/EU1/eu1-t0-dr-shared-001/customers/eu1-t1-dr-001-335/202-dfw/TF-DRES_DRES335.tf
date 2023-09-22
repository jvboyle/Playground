resource "nsxt_policy_security_policy" "policies_TF-DRES335-DRES335" {
   display_name    = "TF-DRES335"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DRES335"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-SRES-OCP9-EU3-to-CACF-Proxy-SSH-VIP"
         notes        = "RITM0152458"
         source_groups = [
               "/infra/domains/default/groups/EU1-SG-SRES-OCP9-Cluster-EU3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-DRES335-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy",
               "/infra/domains/default/groups/EU1-SG-SRES-OCP9-Cluster-EU3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-to-CPREM"
         notes        = "RITM0152458"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CPREM-JH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-to-BDS"
         notes        = "RITM0152458"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-CPREM-to-CACF-Proxy-VIP"
         notes        = "RITM0152458"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CPREM-JH"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-DRES335-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-CPREM-GSNI-NAT-Range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"                             
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-Communication"
         notes        = "RITM0152458"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
                ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-to-CPREM"
         notes        = "RITM0157299"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CPREM-JH_2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-CACF-Proxy-to-CPREM"
         notes        = "RITM0157299"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CPREM-JH_2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CACF-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-CPREM-to-DRES-SL1"
         notes        = "CHGEU0211638,RITM0169046"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CPREM-HOST-SL1",
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CPREM-HOST-SL1_2",
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CPREM-HOST-SL1_3"
                ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp2",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-CPREM-GSNI-NAT-Range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-CPREM-to-DRES-NetcoolProbes"
         notes        = "CHGEU0211638"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES335-CPREM-HOST-Netcool"
                ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp2",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-CPREM-GSNI-NAT-Range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-4200",
               "/infra/services/TCP-4500"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
   rule {
         display_name = "TF-SciencelogicSL1"
         notes        = "CHGEU0211638"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp2"
                ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc7",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp7",
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1srlpm1esd7-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7705"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
      rule {
         display_name = "TF-Netcool"
         notes        = "RITM0158783"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp2"
                ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
                           ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7705"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp1",
               "/infra/domains/default/groups/TF-EU1-VM-eu1d335lpucjtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DRES335-EU1"
            }
      }
}