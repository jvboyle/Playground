resource "nsxt_policy_security_policy" "policies_TF-eu_sres_wave6-eu_sres_wave6" {
   display_name    = "TF-eu_sres_wave6"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-eu_sres_wave6"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-8005-ScienceLogic-SL1"
         notes        = "SR51306679"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lplegsldb2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lplegsldb1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7705",
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lplegsldb2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lplegsldb1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5163-SL1-Web-Conf-Utility"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeayslcol1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbc1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeayslcol1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbp1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbc1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5175-SL1-UI"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-eu1d115lpeaysldb1-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-eu1d115lpeaysldb1-vip",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-1146-Netapp-7MTT"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8088",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stw",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5697-SSH-and-HTTPS-access-to-Cisco-ISE-server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146csconise1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146csconise1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5698-RDP-SolarWinds-Orion-Server-and-MS-SQL-DB-server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES146-SDN-Lab-SolarWinds"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES146-SDN-Lab-SolarWinds",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-6775-SRES-to-DRES"
         notes        = "CH50078907 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146lnrpt1002",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146pnrocbam",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146pnroctuf"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146lnrpt1002",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146pnrocbam",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146pnroctuf"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-1170-ISPW-SRES-Windows-Jump-Server-to-DRES-Shared1-Netcool-WebGUI-Impact-Primary-Impact-Secondary-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16316",
               "/infra/services/TCP-16311"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-1172-ISPW-SRES-Windows-Jump-Server-to-ALL-DRES-Shared1-VM-s"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES15-VMs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES15-VMs",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-1173-ISPW-SRES-Windows-Jump-Server-to-DRES-Shared1-OMNibus-Primary-Secondary"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500",
               "/infra/services/TCP-8090",
               "/infra/services/TCP-6969"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-1174-ISPW-SRES-Windows-Jump-Server-to-DRES-Shared1-NOI-Log-Analysis"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000dc1rm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16351",
               "/infra/services/TCP-9987"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000dc1rm",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5993-SRES-WIN-JUMP-to-DR15"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR15-MNEAAS-SL1-ALL-EU-DV1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR15-MNEAAS-SL1-ALL-EU-DV1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-6983-ScienceLogic-SL1-UI"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR176-ScienceLogic-Cluster-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR176-ScienceLogic-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-6984-SL1-Web-Conf-Utility"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-8676-JH-to-SLI-UI"
         notes        = "CHGEU0175842"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-8677-JH-to-SL1-Web-Conf-Utility"
         notes        = "CHGEU0175842"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnbkp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnbkp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-9097-ScienceLogic"
         notes        = "CHGEU0199315"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsap"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsap",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-7229-Web-Administration"
         notes        = "SR51078977"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR209-M-EaaS-lphlcs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR209-M-EaaS-lphlcs"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-9231-ScienceLogic-Admin-to-Administration-Portal"
         notes        = "CHGEU0207691"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscasap"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscasap",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-7491-SL1-UI"
         notes        = "CH50089155"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR226-ScienceLogic-Cluster-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR226-ScienceLogic-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-7492-SL1-Web-Conf-Utility"
         notes        = "CH50089155"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR226-MNEAAS-SL1-1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR226-MNEAAS-SL1-1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5727-JZ-Test"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d23lngnpptst"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/UDP-123",
               "/infra/services/HTTPS",
               "/infra/services/TCP-2000",
               "/infra/services/HTTP",
               "/infra/services/TCP-6014"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d23lngnpptst",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5729-JZ-LB-Test"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR23-esg-lb-vip-100-72-63-2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DR23-esg-lb-vip-100-72-63-3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/UDP-123",
               "/infra/services/HTTPS",
               "/infra/services/TCP-2000",
               "/infra/services/HTTP",
               "/infra/services/TCP-6014"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR23-esg-lb-vip-100-72-63-2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DR23-esg-lb-vip-100-72-63-3",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5743-JZ-LB-Test-4"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR23-esg-lb-main-IP-100-72-64-17"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DR23-esg-lb-main-IP-100-72-64-17",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-6843-JZ-PAT-Test-1"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "100.72.0.225"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2000-3000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-8301-SL1-UI"
         notes        = "CH50102785"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-8758-Jumpserver-to-DB"
         notes        = "CHGEU0180151"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1d280lpncysd-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdp",
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1d280lpncysd-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-8759-Jumpserver-to-DB"
         notes        = "CHGEU0180151"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1d280lpncysd-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdp",
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1d280lpncysd-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-4703-FW-rules-for-Cisco-ISE-VMs"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-CiscoISE"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-80",
               "/infra/services/TCP-9002",
               "/infra/services/TCP-22",
               "/infra/services/TCP-443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-CiscoISE",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-4789-FW-rules-for-Cisco-ISE-VMs"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62pprkecia1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62pprkecia2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9002"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62pprkecia1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62pprkecia2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-6060-ERS-REST-API"
         notes        = "SR50886997"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62pprkecia1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62pprkecia2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9060"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62pprkecia1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62pprkecia2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-9140-ScienceLogic-SL1-WebConfUI"
         notes        = "RITM0143541"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-eu1d62lpecnsmc"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-eu1d62lpecnsmc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-9156-Frontier-RP-Agent-SSH"
         notes        = "RITM0152297"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-JumpHost-NTP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-RestorePoint"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-JumpHost-NTP",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-RestorePoint",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-9169-Frontier-Cisco-ISE-SSH-RDP"
         notes        = "RITM0152294"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-WindowsClients",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-PSN-ISE"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-WindowsClients",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-PSN-ISE",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-9238-Frontier-Cisco-Smart-AM"
         notes        = "RITM0155171 RITM0155676"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkssm1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62apprkssm1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-9262-Frontier-SDDC-RP"
         notes        = "CHGEU0210344"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-JumpHost-NTP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SDDC-RP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-JumpHost-NTP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SDDC-RP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-9309-SAML-Application"
         notes        = "RITM0166037"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-eu1d62apprkise"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-eu1d62apprkise",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-3969-SL1-Web-Conf-Utility"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbs",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbs",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1esldbp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-5279-SL1-Web-Conf-Utility"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1eslc1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpm1eslc1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-4795-Netcool-Omnibus"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500",
               "/infra/services/TCP-6969"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpno",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
   rule {
         display_name = "TF-4796-Netcool-WebGUI"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpni"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16316",
               "/infra/services/TCP-16311"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcni",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpni"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave6-EU1"
            }
      }
}