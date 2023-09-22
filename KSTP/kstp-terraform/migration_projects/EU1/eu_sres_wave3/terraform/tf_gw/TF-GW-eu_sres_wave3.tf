resource "nsxt_policy_gateway_policy" "policies_TF-eu_sres_wave3-eu_sres_wave3" {
   display_name    = "TF-GW-eu_sres_wave3"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-eu_sres_wave3"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-5075-Netcool-Probe-to-Netcool-Omnibus"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d104lptsbtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d104lptsbtnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4997-BlueCare-sync-HTEMS-post-migration-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES109-MNEAAS-LEG-NCPP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3661"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5000-HTEMS-event-forward-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES109-MNEAAS-LEG-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8326-Sync-Deamon-Portal-Push"
         notes        = "SR51427119"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR109-MnE-SL1-DB"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8327-Sync-Deamon-SL1"
         notes        = "SR51427119"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR109-MnE-SL1-DB"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8975-Copy-of-SL1-API-"
         notes        = "RITM0139957"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR109-eu1d109lplegsldb-vip"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9063-Copy-of-Copy-of-SL1-API-"
         notes        = "RITM0144845"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR109-eu1d109lplegsldb-vip"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8383-DRES-ESG-to-SRES"
         notes        = "RITM0075063"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR113-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5165-Sync-Daemon"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-eu1d115lpeaysldb1-vip"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5166-Sync-Daemon"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbc1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5171-Netcool-MsgBus-Probe"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbc1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5172-Netcool-Omnibus-communication"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaytnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaytnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5350-Probes-event-forward-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES121-MNEAAS-AEX-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5341-BlueCare-sync-HTEMS-post-migration-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES122-MNEAAS-BOT-NCPP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3661"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5346-HTEMS-event-forward-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES122-MNEAAS-BOT-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5352-BlueCare-sync-HTEMS-post-migration-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES125-MNEAAS-ULL-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-3130-CCEP-Pri_Sec-Probe-Netcool-Impact-Primary_Sec"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000ip1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascnp000ip1rm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6771-Netcool-Omnibus"
         notes        = "SR50973050 SR51019758 SR51064482"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d138lpmlptnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d138lpmlptnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6345-SRM-Integration-doValue"
         notes        = "SR50948369"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Host-eu1d15lpdv1sldb-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpdv1sldbc1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpdv1sldbp1"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7890-Sync-Deamon-SL1"
         notes        = "SR51278016"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000dc1rm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Host-eu1d15lpdv1sldb-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpdv1sldbc1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpdv1sldbp1"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8405-SL1-Netcool-"
         notes        = "RITM0075350"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpdv1sldbc1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d15lpdv1sldbp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5874-Netcool-Probe-to-Object-Server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-LR5-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-EUSHR1-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6609-Event-Forwarding"
         notes        = "SR50961081 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d167lpklstnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d167lpklstnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6834-Event-Forwarding"
         notes        = "SR50981715 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d169lptratnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d169lptratnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6606-Event-Forwarding"
         notes        = "SR50960674 SR51201580 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d173lpbrstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d173lpbrstnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6459-Proxy-Probe-to-Netcool"
         notes        = "CH50076763"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lpluftnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lpluftnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6764-LB-to-SRES"
         notes        = "SR50967845 SR51144224 SR51148605"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR176-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTPS_16443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7083-SRES-to-DRES"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700",
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7085-SRES-to-DRES"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7086-DRES-to-SRES"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lpluftnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lpluftnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7087-DRES-to-PDR-and-SRES"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6588-Netcool-Probe-to-Netcool-Omnibus"
         notes        = "SR50960672"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpkpmtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpkpmtnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6723-Event-forwarding-from-probes-to-Netcool-core"
         notes        = "SR50970040 SR51044671"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d178lprgltnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d178lprgltnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6978-Netcool-MsgBus-Probe"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6979-Sync-Daemon"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR176-ScienceLogic-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6980-Sync-Daemon"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4985-HTEMS-event-forward-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES18-MNEAAS-BOI-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4988-BlueCare-sync-HTEMS-post-migration-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES18-MNEAAS-BOI-NCPP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3661"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6865-Sciencelogic-collector-selfmon"
         notes        = "SR50990884 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esldc1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d184lpnxtsldc"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICMP_Echo",
               "/infra/services/SSH",
               "/infra/services/SNMP",
               "/infra/services/TCP-7706-gAqBnqVYn",
               "/infra/services/ICMP_Echo_Reply"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6862-Event-Forwarding"
         notes        = "SR50993578 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpvrbtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpvrbtnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7231-Event-Forwarding"
         notes        = "SR51080228"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR195-SML-lpsmltnp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-SLM-pm1e"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7101-NOT-DEFINED-"
         notes        = "SR51044688"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfstnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7103-DRES-to-SRES-FIrewalls"
         notes        = "SR51044688"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfstnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc3",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esd3-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500",
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8535-ITM-Bluecare-sync-"
         notes        = "RITM0113600"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfstnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3661"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-1238-Netcool-Ping-Probe-OMNibus-Prim-Sec"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000bgerm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-1402-Netcool-Ping-Probe-OMNibus-Prim-Sec"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspre00bgeerm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7107-Event-Forwarding"
         notes        = "SR51042100 SR51075034 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lplumtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lplumtnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7758-Copy-of-Event-Forwarding-"
         notes        = "SR51106686"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16443",
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7186-SRES-to-DRES"
         notes        = "SR51065694 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8684-Netcool-MsgBus-Probe-to-Netcool-Omnibus"
         notes        = "CHGEU0175842"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8819-ScienceLogic-API"
         notes        = "RITM0127931 RITM0144845"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES205-eu1d205lpkrnsd-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9042-Netcool-HTTPS"
         notes        = "RITM0143025 RITM0144845"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7121-Netcool-Probe-to-Netcool-Omnibus"
         notes        = "SR51052357 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d206lpcbjtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d206lpcbjtnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7389-Event-Forwarding"
         notes        = "CH50086951"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpifctnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpifctnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7218-HTTPS"
         notes        = "SR51071705 SR51113434"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR209-M-EaaS-lphlctnp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500",
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7463-DRES209-to-SRES"
         notes        = "SR51173867"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR209-eu1d209lphlcsdp-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp3"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7464-8443"
         notes        = "SR51173867 RITM0075144"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR209-eu1d209lphlcsdp-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlcsdp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlctnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lphlctnp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9066-SL1-API"
         notes        = "RITM0144845"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR209-eu1d209lphlcsdp-vip"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7241-Event-Forwarding"
         notes        = "SR51076359 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpsprtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpsprtnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8442-PhoneHome"
         notes        = "RITM0077995"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpsprtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpsprtnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-SL1-DB-Cluster-VIP"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7563-DRES-to-SRES-Event-Forwarding"
         notes        = "SR51215506 RITM0119795"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3",
               "10.42.105.28"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8217-DRES-ESG-to-SRES-Netcool"
         notes        = "SR51402535"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR218-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Netcool_16443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8220-DRES-ESG-to-SRES-Netcool"
         notes        = "SR51402535"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR218-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8223-SRES-Netcool-to-DRES-LB-VIP-MnEaaS"
         notes        = "SR51402535"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR218-LB-VIP1"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8653-Netcool-Event-Forwarding-Adeslas"
         notes        = "RITM0119795"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8687-Event-Forwarding"
         notes        = "RITM0121439 RITM0122188"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-6969"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8159-Event-Forwarding"
         notes        = "SR51383392"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d219lpwestnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d219lpwestnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4990-Probes-event-forward-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES22-MNEAAS-CPW-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7477-Event-Forwarding"
         notes        = "CH50087786"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d222lpsshtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d222lpsshtnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7493-Sync-Daemon-shared-SL1"
         notes        = "CH50089155"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR226-ScienceLogic-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-DR226-MNEAAS-SL1-1"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7803-Netcool-MsgBus-to-Netcool-Omnibus"
         notes        = "SR51260083"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperitnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperitnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8976-Copy-of-SL1-API-"
         notes        = "RITM0139957"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR226-eu1d226lperisd-vip"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9064-Copy-of-Copy-of-SL1-API-"
         notes        = "RITM0144845 RITM0152302"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperisdc",
               "/infra/domains/default/groups/TF-EU1-IPSET-DR226-eu1d226lperisd-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperisdp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7814-Event-forwarding-Netcool-probes-to-Netcool-Omnibus"
         notes        = "SR51260202 SR51375490"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d235lpmm0tnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d235lpmm0tnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7816-Netcool"
         notes        = "SR51263128"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d239lpmtktnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d239lpmtktnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7988-Event-Data-to-Netcool-Omnibus"
         notes        = "SR51314103"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d242lptlftnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d242lptlftnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7817-Netcool-"
         notes        = "SR51263128"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d243lpmtdtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d243lpmtdtnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8031-Netcool-Probe-to-Object-Server"
         notes        = "SR51318204"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR244-MNEAAS-AFL-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-EUSHJP-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8246-DRES-ESG-to-SRES-Netcool"
         notes        = "SR51395519"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR245-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-7923-Netcool-probes-to-Netcool-Omnibus"
         notes        = "CH50097111 SR51286372 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d247lpmaatnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d247lpmaatnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8028-NOT-DEFINED-"
         notes        = "SR51320471"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d249lpmhitnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d249lpmhitnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8402-Event-Forwarding"
         notes        = "RITM0075223"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d262lpblftnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d262lpblftnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8295-Netcool-MsgBus-Probe-Netcool-Omnibus"
         notes        = "CH50102785"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1tnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1tnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8553-Event-Forwarding-for-Netcool"
         notes        = "RITM0114868"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1tnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1tnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8555-SRES-to-DRES-API-Call"
         notes        = "RITM0114868"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdp",
               "/infra/domains/default/groups/TF-EU1-IPSET-SG-DR265-eu1d265lpkt1sd-vip"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9067-Copy-of-SL1-API-"
         notes        = "RITM0144845"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SG-DR265-eu1d265lpkt1sd-vip"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9068-SL1-API"
         notes        = "RITM0144845 RITM0152558"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdp",
               "/infra/domains/default/groups/TF-EU1-IPSET-SG-DR265-eu1d265lpkt1sd-vip"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8472-DRES-ESG-to-SRES-Netcool"
         notes        = "RITM0077872"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR269-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8578-Netcool-Probe-to-Object-Server"
         notes        = "RITM0115465 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR272-MNEAAS-DT1-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-EUSHR2-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8755-Sync-Daemon-SL1"
         notes        = "CHGEU0180151"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdp",
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1d280lpncysd-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdc"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8756-SL1-Netcool"
         notes        = "CHGEU0180151"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdc"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8773-SL-Event-Forwarding"
         notes        = "CHGEU0179733 RITM0152969"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncytnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncytnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1erms"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8905-Event-Forwarding"
         notes        = "RITM0133426"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpptstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpptstnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8937-Event-Forwarding"
         notes        = "CHGEU0191336"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9005-Event-Forwarding"
         notes        = "CHGEU0194240"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d304lpbtltnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d304lpbtltnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9039-DRES-ESG-to-SRES-Netcool"
         notes        = "CHGEU0197050"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR306-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9059-Event-Forwarding"
         notes        = "CHGEU0198493"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9129-SL1-Event-Forwarding"
         notes        = "CHGEU0203392"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d331lpsi7tnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d331lpsi7tnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8514-DRES-ESG-to-SRES-Netcool"
         notes        = "RITM0092092"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR48-ESG-LB-Source"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4126-Solarwinds-DR62-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR62-SolarwindsOrion-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wprkeswo1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wprkeswo2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4620-Firewall-Rules-for-SolarWinds"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR62-SolarwindsOrion-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wprkeswo1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62wprkeswo2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5100-Netcool-Probe-to-Netcool-Omnibus"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpecntnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9142-SL1-Netcool-MsgBus-Probe"
         notes        = "RITM0143541"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-eu1d62lpecnsmc"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-3970-Netcool-MsgBus-Probe-JumpHosts-SL1"
         notes        = "SR51178701"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR63-ScienceLogic-Cluster-VIP"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-3971-Netcool-MsgBus-Probe"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbs",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080",
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4511-Netcool-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR63-ScienceLogic-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbs",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbp"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4727-Netcool-Omnibus-communication"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpwgctnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpwgctnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6859-DB2-connection"
         notes        = "SR50992186 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5259-HTEMS-event-forward-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES66-MNEAAS-CFS-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5261-BlueCare-sync-HTEMS-post-migration-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES66-MNEAAS-CFS-NCPP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3661"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8974-Copy-of-SL1-API-"
         notes        = "RITM0139957"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR66-eu1d66lpcpksldb-vip"
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
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-9065-Copy-of-Copy-of-SL1-API-"
         notes        = "RITM0144845"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR66-eu1d66lpcpksldb-vip"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-4580-Netcool-Ping-Probe-OMNibus-Prim-Sec"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d73lpbvatnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d73lpbvatnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5343-BlueCare-sync-HTEMS-post-migration-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES86-MNEAAS-H3G-NCPP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3661"
            ]
         scope = [local.gw_scope]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-5348-HTEMS-event-forward-to-Netcool"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES86-MNEAAS-H3G-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-UKI-NCO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-6956-Event-Forwarding"
         notes        = "SR51012919 SR51428540"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpciftnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d88lpciftnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epno3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecno3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8180-ITM-Bluecare-sync"
         notes        = "SR51395690"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d91lptvgtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d91lptvgtnp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3661"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8200-Event-Forwarding"
         notes        = "SR51403583"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d91lptvgtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d91lptvgtnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
   rule {
         display_name = "TF-8829-Event-Forwarding"
         notes        = "RITM0128099"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d93lpaxdtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d93lpaxdtnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave3-EU1"
            }
      }
}