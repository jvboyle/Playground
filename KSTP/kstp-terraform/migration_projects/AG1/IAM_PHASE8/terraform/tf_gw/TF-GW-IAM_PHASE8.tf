resource "nsxt_policy_gateway_policy" "policies_TF-IAM_PHASE8-IAM_PHASE8" {
   display_name    = "TF-GW-IAM_PHASE8"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-IAM_PHASE8"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1898-OCP1-OCP5-to-CACF-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d100lpcacpr1-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-16443-17443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1905-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100lpcacpr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d100lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1811-SRES-OCP-Cluster"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR111-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1813-SRES-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d111lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d111lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1881-DRES-CACF-Proxy-to-BDS-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d116lpcacpr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d116lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1883-SRES-OCP-Cluster1-to-CACF-Proxy-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d116lpcacpr-vip"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3425-SRES-OCP-to-ag1dr12stl"
         notes        = "SCTASK0014140 RITM0078600 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stl"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1915-SRES-OCP-Cluster1-to-CACF-Proxy-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d124lpcacpr-vip"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1918-DRES-CACF-Proxy-to-BDS-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d124lpcacpr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d124lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3150-Tower-to-DRES-Proxy"
         notes        = "CH50095515"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR144-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3153-DRES-Proxy-to-SRES-BDS"
         notes        = "CH50095515"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d144lpcacpr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d144lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2574-OCP-Next-to-DRES-LB-VIP-CACF"
         notes        = "SR50955801"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16444",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-17778",
               "/infra/services/TCP-16445"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2575-DRES-ESG-to-OCP-Next"
         notes        = "SR50955801"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR158-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP"
            ]
         action = "ALLOW"
         services = [
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2589-DRES-ESG-to-BDS"
         notes        = "SR50955801"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR158-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2596-OCP-Tower-to-DRES-LB-VIP-CACF"
         notes        = "SR50955801 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-DR158-ESG-VPN-transit1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2051-2054",
               "/infra/services/TCP-2056-2060"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3237-CACF-DOW-BDS-Ansible-Flow-"
         notes        = "CH50097891"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d158lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d158lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3239-DOW-Ansible-Flow"
         notes        = "CH50097891"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d158lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d158lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3254-CACF-Dow-Ansible-flow-"
         notes        = "CH50097891"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2448-OCP-to-DRES-CACF-Proxy-VIP"
         notes        = "SR50977966 CH50078147 SR50987768 port 16444 tcp added "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR162-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-16444",
               "/infra/services/TCP-16443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2453-CACF-Proxy-to-BDS"
         notes        = "SR50977966 CH50078147"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d162lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d162lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2437-DRES182-to-SRES-"
         notes        = "CH50078148 SR50959031"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d182lpcacpr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d182lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2439-SRES-to-Proxy-VIP"
         notes        = "CH50078148 SR50959031"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d182lpcacpr-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2572-Proxy-to-BDS"
         notes        = "SR51132941"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR187-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2573-OCP-to-Proxy-VIP"
         notes        = "SR51132941"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR187-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2543-OCP-to-Proxy-VIP"
         notes        = "CH50079954"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "100.64.162.50"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2551-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d188lpcacpr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d188lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2714-OCP-to-DRES-Proxy-VIP"
         notes        = " CH50083264 SR51042590"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR192-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2717-DRES-Proxy-to-BDS"
         notes        = " CH50083264 SR51042590"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d192lpcacpr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d192lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2629-DRES-ESG-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR196-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2632-OCP-Tower-to-DRES-LB-VIP-CACF"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR196-ESG-VPN-transit1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2051-2060"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2695-OCP-to-DRES-CACF-Proxy-VIP"
         notes        = "CH50082367 SR51018352 SR51231745 - 16443"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR201-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-16443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2696-DRES-to-dres"
         notes        = "CH50082367 SR51018352"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d201lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d201lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2690-SRES-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d203lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d203lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2777-Tower-to-DRES-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR203-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2726-OCP-to-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR204-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2729-BDS-flow"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d204lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d204lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2780-Tower-to-DRES-Proxy"
         notes        = "CH50084281 SR51057793"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR212-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2782-Proxy-to-BDS"
         notes        = "CH50084281 SR51057793"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d212lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d212lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2941-Tower-to-DRES-Proxy"
         notes        = "SR51185388"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR217-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2943-DRES-Proxy-to-SRES-BDS"
         notes        = "SR51185388"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR217-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2905-Tower-to-DRES-Proxy"
         notes        = "CH50087971"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR223-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2907-DRES-Proxy-to-SRES-BDS"
         notes        = "CH50087971"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR223-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2910-Tower-to-DRES-Proxy"
         notes        = "CH50087970"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR224-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2911-DRES-Proxy-to-SRES-BDS"
         notes        = "CH50087970"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR224-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2960-Tower-to-DRES-Proxy"
         notes        = "CH50089486 SR51182807"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR227-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2962-DRES-Proxy-to-SRES-BDS"
         notes        = "CH50089486 SR51182807"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR227-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3002-OCP-cluster01-to-DRES-CACF-proxy"
         notes        = "CH50090458 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR233-PROXY-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3004-DRES-Proxy-to-SRES-BDS"
         notes        = "CH50090458 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d233lpcacpr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d233lpcacpr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3206-Tower-to-DRES-Proxy"
         notes        = "CH50097112 SR51284903"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR251-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3208-DRES-Proxy-to-SRES-BDS"
         notes        = "CH50097112 SR51284903"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR251-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3297-OCP-to-CACF-Prosy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES259-CACF-Proxy"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3298-CACF-Proxy-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES259-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-CACF-BDS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3725-LB-to-BDS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR273-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3567-Tower-to-DRES-Proxy"
         notes        = "RITM0121083"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR278-CACF-Proxy",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR278-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3569-DRES-Proxy-to-SRES-BDS"
         notes        = "RITM0121083"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR278-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3614-Proxy-to-BDS"
         notes        = "CHGEU0181335"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR285-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3630-OCP-to-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR285-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3645-Proxy-to-PDR"
         notes        = "REQ0104040"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR285-CACF-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1lpmcmgw1"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3728-CACF-tp-BDS"
         notes        = "CHGEU0192290"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d299lpcacpr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d299lpcacpr2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3750-Ansible-to-CACF-Proxy-VIP-"
         notes        = "RITM0136150"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DRES299-CACF-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3850-PROXY-to-BDS"
         notes        = "RITM0145058"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR329-PROXY"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-3887-PROXY-to-BDS"
         notes        = "RITM0151221"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR329-PROXY"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2262-DRES-to-BDS"
         notes        = "SR50924776"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59lppr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59lppr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2264-SSH-Proxy-to-OCP-VIP"
         notes        = "SR50924776"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59lppr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr59lppr1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP"
            ]
         action = "ALLOW"
         services = [
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-2267-OCP-Cluster1-to-SSH-Proxy"
         notes        = "SR50924776 SR50934752 - added port range - 17443"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1dr59lppr1-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443-17443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1636-DRES-to-SRES-ag1srlpcacfbds1"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1638-DRES-Tto-OCP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1642-OCP-Cluster-to-SSH-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR78-SSH-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-16443",
               "/infra/services/TCP-17443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1660-SG-SRES01-OCP-Cluster01"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-ag1d95lpjllprx-Proxy-VIP"
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
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
   rule {
         display_name = "TF-1666-cacf-proxy-to-BDS-Master-Repo"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-ag1d95lpjllprx-Proxy-VIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE8-AG1"
            }
      }
}