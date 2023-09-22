resource "nsxt_policy_security_policy" "policies_TF-SRES-eu_sres_wave2" {
   display_name    = "TF-SRES"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-SRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1160-SRES-clinets-to-SRES-AD,DNS"
         notes        = "RITM0131047"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-Clients"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/NBSS",
               "/infra/services/LDAP",
               "/infra/services/WINS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/SMTP",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/DHCP-Server",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/DNS-UDP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/Windows-Global-Catalog-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-Clients"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-2768-StaaS-General-Services-and-Access"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP",
               "/infra/services/TCP-34952",
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-8443",
               "/infra/services/HTTP",
               "/infra/services/APP_SNMP",
               "/infra/services/FTP",
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-3122-StaaS-General-Services-and-Access"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-34952",
               "/infra/services/HTTP",
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS",
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-3212-to-SMTP-server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1rpabp11"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-SMTP-Relay"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-SMTP-Relay",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1rpabp11"
            ]
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
   rule {
         display_name = "TF-3974-STAAS-Microstratergy-DRES-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
            ]
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
   rule {
         display_name = "TF-3975-STAAS-Microstratergy-SRES-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview"
            ]
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
   rule {
         display_name = "TF-4077-STAAS-for-ISIM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-ISIM-EUSTaaS-DRES-Members",
               "/infra/domains/default/groups/TF-EU1-SG-ISIM-EUSTaaS-SRES-Members"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
               "/infra/domains/default/groups/TF-EU1-SG-ISIM-EUSTaaS-DRES-Members",
               "/infra/domains/default/groups/TF-EU1-SG-ISIM-EUSTaaS-SRES-Members"
            ]
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
   rule {
         display_name = "TF-4600-BDS-Master-Repo-to-PDR-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
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
   rule {
         display_name = "TF-4601-SRES-Linux-Jump-to-BDS-Master-Repo"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/TCP-8081",
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-4663-ISPW-SRES-Jump-servers-to-BDS-Master-Repo-VM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/TCP-8081",
               "/infra/services/HTTP",
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-4688-BDS-Master-Repo-to-IBM-Bluepages"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IBM-Bluepages",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
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
   rule {
         display_name = "TF-4753-ILMT-to-bluepages"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer",
               "/infra/domains/default/groups/TF-EU1-IPSET-IBM-Bluepages"
            ]
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
   rule {
         display_name = "TF-4754-Windows-&-Linux-Jump-to-ILMT-BigFix"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-52000",
               "/infra/services/TCP-50000",
               "/infra/services/TCP-3000",
               "/infra/services/TCP-52311",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-4755-Linux-&-Windows-Jump-to-ILMT"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081",
               "/infra/services/HTTPS",
               "/infra/services/TCP-50000",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-4756-ILMT-BigFix-to-ILMT"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-4757-ILMT-to-ILMT+BigFix"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-4854-IBM-Cloud-to-CACF-BDS"
         notes        = ""
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
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
   rule {
         display_name = "TF-4864-IBM-Blue-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
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
   rule {
         display_name = "TF-4896-9-x-to-ILMT-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
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
   rule {
         display_name = "TF-4897-9-x-to-ILMT-BigFix"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-3000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
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
   rule {
         display_name = "TF-5070-SRES-PDR-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Socks-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1080",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Socks-Server"
            ]
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
   rule {
         display_name = "TF-5071-SRES-PDR-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-M-EaaS-Proxy-100-72-69-4",
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-IPSET-M-EaaS-Proxy-100-72-69-4",
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server"
            ]
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
   rule {
         display_name = "TF-5115-ILMT-Bigfix-to-SFS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "158.87.52.165",
               "100.79.232.2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster1-VIP"
            ]
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
   rule {
         display_name = "TF-5116-ILMT-to-GW"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5117-GW-to-ILMT"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5118-ILMT/GW-Bigfix-to-CEDP/BRAVO"
         notes        = "SR50950251"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
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
   rule {
         display_name = "TF-5457-ILMT-Bigfix-to-github-ibm-com"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1plpscxdan-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1plpscxdan-vip",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
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
   rule {
         display_name = "TF-5523-ILMT1,2,3-,-Bigfix-to-SFS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster03-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5526-SRES-STaaS-AD-to-SRES"
         notes        = " SR50818254 SR50999204 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/NBSS",
               "/infra/services/LDAP",
               "/infra/services/WINS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/SMTP",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/DHCP-Server",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/DNS-UDP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/Windows-Global-Catalog-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5527-SRES-to-SRES-STaaS-AD"
         notes        = " SR50818254 SR50999204 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/NBSS",
               "/infra/services/LDAP",
               "/infra/services/WINS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/SMTP",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/DHCP-Server",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/DNS-UDP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/Windows-Global-Catalog-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5530-STaaS-Ansible-to-PDR-SMTP"
         notes        = " SR50706757 SR50818254 SR50913499 SR50999204 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-SMTP-Relay"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easbcp",
               "/infra/domains/default/groups/TF-EU1-SG-PDR-SMTP-Relay"
            ]
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
   rule {
         display_name = "TF-5531-STaaS-Ansible-to-PDR-Proxy"
         notes        = " SR50815808 SR50818254 SR50999204 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
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
   rule {
         display_name = "TF-5532-STaaS-Ansible-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stl",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66stl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142lpHBipq",
               "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142lpHBskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142lpHBstl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr35stl",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64stl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stl",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48stl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66stl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142lpHBipq",
               "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-Arxview",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142lpHBskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr35stl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142lpHBstl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64stl"
            ]
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
   rule {
         display_name = "TF-5533-STaaS-Ansible-to-DRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-ISIM-EUSTaaS-DRES-Members",
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142wphbstw",
               "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/TCP-5986",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-ISIM-EUSTaaS-DRES-Members",
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr142wphbstw",
               "/infra/domains/default/groups/TF-EU1-SG-DR64-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-AD-DNS"
            ]
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
   rule {
         display_name = "TF-5608-Ansible-SRES-Flows"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-MSTR"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5731-DNS-resolution-of-CS-domains"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-DNS-NTP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-C7hECM7oS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5732-to-obtain-computer-certificate-from-CA"
         notes        = "SR50838935 SR51097951"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-dr64-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-AD-Clients"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/MS_RPC_TCP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-dr64-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR13-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR142-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR104-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
               "/infra/domains/default/groups/TF-EU1-SG-DR48-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR66-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR33-STaaS-AD-Clients",
               "/infra/domains/default/groups/TF-EU1-SG-DR35-STaaS-AD-Clients"
            ]
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
   rule {
         display_name = "TF-5735-to-validate-Certificates-on-CA-(via-LDAP)"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP",
               "/infra/services/KERBEROS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AD-DNS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5739-ISPW-SSH-Proxies-to-BDS-Master"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpi2pprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpi2pprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5766-Ansible-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5767-Ansible"
         notes        = "SR50953390 SR50818254 CH50068966 SR50865880 CH50070383 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas15",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/TCP-5985",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas15",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-5886-ILMT-to-Bravo"
         notes        = "SR50856178"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IBM-Blue-ehngsa-ibm-com"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IBM-Blue-ehngsa-ibm-com",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
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
   rule {
         display_name = "TF-5998-Ansible-endpoint-communications"
         notes        = "SR50878633"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-AMS-CGN-subnets",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-AMS-GSNI-subnets",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-AMS-CGN-subnets",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-AMS-GSNI-subnets",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
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
   rule {
         display_name = "TF-6380-Linux-&-Windows-Jump-to-ILMT4"
         notes        = "CH50074961"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081",
               "/infra/services/HTTPS",
               "/infra/services/TCP-50000",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-6381-ILMT,-ILMT-BigFix-to-GW"
         notes        = "CH50074961"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-6382-ILMT4-to-ILMT-BigFix"
         notes        = "CH50074961"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-6383-ILMT4,-GW,-ILMT-Bigfix-to-SFS"
         notes        = "CH50074961"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster01-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster01-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-6385-ILMT3-to-SFS"
         notes        = "SR50950983"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
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
   rule {
         display_name = "TF-6394-ILMT-to-Blue-HTTPS"
         notes        = "SR50942719"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
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
   rule {
         display_name = "TF-6414-ILMT3-to-SFS"
         notes        = "SR50950878 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IBM-Blue-girsm01a"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IBM-Blue-girsm01a",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
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
   rule {
         display_name = "TF-6617-STaaS-SRES-for-Ansible-"
         notes        = "SR50964017"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas17",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas14"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-6800-ISIM-connect-to-server"
         notes        = "SR50974892 SR51023015"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1rhellic01",
               "/infra/domains/default/groups/TF-EU1-SG-SR51023015-DPT-22-VM-List",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lnbzztest",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1dxdev02",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1",
               "/infra/domains/default/groups/TF-EU1-SG-SR50974892-DPT-22-VM-List",
               "/infra/domains/default/groups/TF-EU1-HOSTS-LinuxOS-All",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1cntrl1",
               "/infra/domains/default/groups/TF-EU1-SG-ISIM-VM-DESTINATION-SSH"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1rhellic01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04",
               "/infra/domains/default/groups/TF-EU1-SG-SR51023015-DPT-22-VM-List",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lnbzztest",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1dxdev02",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-SG-SR50974892-DPT-22-VM-List",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOSTS-LinuxOS-All",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1cntrl1",
               "/infra/domains/default/groups/TF-EU1-SG-ISIM-VM-DESTINATION-SSH",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
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
   rule {
         display_name = "TF-6802-ISIM-connect-to-server-"
         notes        = "SR50974892 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-snat-to-SL-SVC",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SR50974892-DPT-10890-VM-List"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10890"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-snat-to-SL-SVC",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04",
               "/infra/domains/default/groups/TF-EU1-SG-SR50974892-DPT-10890-VM-List"
            ]
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
   rule {
         display_name = "TF-7056-Ansible"
         notes        = "SR51032021"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7244-ISIM"
         notes        = "SR51078989 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam43",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisildm50",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam53",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam50",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt5",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam52",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisildm40",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisidbm40",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam51",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam42",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam40",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisidbm50",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam41"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam43",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam50",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt5",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam40",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam41",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam52",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisildm40",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisidbm40",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam51",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam42",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisidbm50",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisildm50",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam53"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7407-IBM-Blue-to-STaaS-SRES-Netcool"
         notes        = "CH50087288"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
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
   rule {
         display_name = "TF-7408-Windows-JH-to-STaaS-Netcool"
         notes        = "CH50087288"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7409-STAAS-to-PDR-Proxy"
         notes        = "CH50087288"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-Internet-Proxy-Server",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
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
   rule {
         display_name = "TF-7410-STAAS-Sendmail"
         notes        = "CH50087288"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-SMTP-Relay"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-PDR-SMTP-Relay",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
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
   rule {
         display_name = "TF-7411-Ansible-to-STAAS"
         notes        = "CH50087288"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7412-SRES-->SRES-DC-Internal"
         notes        = "CH50087288"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/NBSS",
               "/infra/services/LDAP",
               "/infra/services/WINS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/SMTP",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/DHCP-Server",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/DNS-UDP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/Windows-Global-Catalog-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7413-SRES-->SRES-DC-Internal"
         notes        = "CH50087288"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/NBSS",
               "/infra/services/LDAP",
               "/infra/services/WINS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/SMTP",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/DHCP-Server",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/DNS-UDP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/Windows-Global-Catalog-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7527-MCDS-UKI-CACF"
         notes        = "SR51191584"
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
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
   rule {
         display_name = "TF-7538-Isim-ssh"
         notes        = "SR51195488 SR51234008"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcpkbkp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisildap",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlphstp1ncl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d219lpwestnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpelk1001",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lpisihlc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d140lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d140lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpifctnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk5",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpifctnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d222lpsshtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d225lpisiams1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d222lpsshtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlphsts1ncl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperitnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk4",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperitnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpsprtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d219lpwestnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d139lpcd8sbk",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpsprtnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcpkbkp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisildap",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlphstp1ncl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d219lpwestnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpelk1001",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d209lpisihlc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d140lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d140lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpifctnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk5",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d207lpifctnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d222lpsshtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d225lpisiams1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d222lpsshtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlphsts1ncl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperitnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk4",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lperitnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpsprtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d219lpwestnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d139lpcd8sbk",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d218lpscatnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpsprtnp2"
            ]
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
   rule {
         display_name = "TF-7587-Ansible--STaaS-DRES"
         notes        = "SR51216347"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48hsqrm1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpwgctnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpstl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpstl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48hsqrm3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48hsqrm2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpstl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpwgctnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpwgctnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48hsqrm1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpstl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpstl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48hsqrm3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpstl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48hsqrm2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d63lpwgctnp2"
            ]
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
   rule {
         display_name = "TF-7624-STaaS-AD-integration-"
         notes        = "SR51234768"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas15"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/NBSS",
               "/infra/services/LDAP",
               "/infra/services/WINS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/SMTP",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/DHCP-Server",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/DNS-UDP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/Windows-Global-Catalog-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas15",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7625-STaaS-AD-integration"
         notes        = "SR51234768"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas15"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/NBSS",
               "/infra/services/LDAP",
               "/infra/services/WINS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/SMTP",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/DHCP-Server",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/DNS-UDP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/Windows-Global-Catalog-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas16",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1staas15",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STAAS-Netcool-Dashboard"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7656-ILMT-Bravoopening"
         notes        = "SR51207324"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8084"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-GatewayService",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-BigFixServer"
            ]
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
   rule {
         display_name = "TF-7768-ANSIBLE-MCDS-toAD"
         notes        = "SR51234291"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-ALL-MCDS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SL-IRES-AD-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP",
               "/infra/services/TCP-639"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SL-IRES-AD-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-ALL-MCDS"
            ]
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
   rule {
         display_name = "TF-7769-ANSIBLE-MCDS-to-NTP-DNS"
         notes        = "SR51234291"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-ALL-MCDS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SL-IRES-AD-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/TCP-123",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SL-IRES-AD-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-ALL-MCDS"
            ]
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
   rule {
         display_name = "TF-7770-Ansible-MCDS"
         notes        = "SR51234291 SR51320522"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7771-MCDS-proxy-to-Ansible"
         notes        = "SR51234291"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdhapxy1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdhapxy2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-STW-DB-MCDS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-STW-DB-MCDS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdhapxy2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdhapxy1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7772-Ansible-MCDS"
         notes        = "SR51234291 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-STW-DB-MCDS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-STW-DB-MCDS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-15672",
               "/infra/services/TCP-4369",
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/TCP-5432",
               "/infra/services/SSH",
               "/infra/services/TCP-25672"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-STW-DB-MCDS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7775-ISIM-to-Ansible"
         notes        = "CH50095101"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-ALL-MCDS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Ansible-ALL-MCDS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7843-Access-between-dashboard-server"
         notes        = "SR51275778"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5601",
               "/infra/services/TCP-9200",
               "/infra/services/HTTP",
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7845-Jump-MCDS"
         notes        = "SR51278125 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1srlpmcdanstw-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS",
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1srlpmcdanstw-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7846-Jump-MCDS"
         notes        = "SR51338518"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/BDS-8081",
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7847-MCDS"
         notes        = "SR51278125 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdhapxy1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdhapxy2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdhapxy2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdhapxy1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-7901-MCDS-to-AP-and-AG"
         notes        = "SR51286363 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
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
   rule {
         display_name = "TF-8072-MCDS-NA-to-EU-SRES"
         notes        = "SR51335137"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-CACF-AG-AnsibleTower"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-CACF-AG-AnsibleTower"
            ]
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
   rule {
         display_name = "TF-8140-MCDS-EU-to-AP/AG1-BDS"
         notes        = "SR51362650"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AP-SRES-CACF-BDS-Server",
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-CACF-BDS-Server",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AP-SRES-CACF-BDS-Server",
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-CACF-BDS-Server",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
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
   rule {
         display_name = "TF-8141-MCDS--Execute-Playbooks-on-jumphost"
         notes        = "SR51370358"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-8205-MCDS-dedicated-jump-host-"
         notes        = "CH50101832"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
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
   rule {
         display_name = "TF-8206-MCDS-dedicated-jump-host-"
         notes        = "CH50101832"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-CACF-BDS-Server",
               "/infra/domains/default/groups/TF-EU1-IPSET-AP-SRES-CACF-BDS-Server",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-CACF-BDS-Server",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump",
               "/infra/domains/default/groups/TF-EU1-IPSET-AP-SRES-CACF-BDS-Server",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
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
   rule {
         display_name = "TF-8207-Ansible-tower->-new-dedicated-jumphost"
         notes        = "CH50101832"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-AG1-SG-SRES-OCP-Cluster04-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-CACF-AG-AnsibleTower",
               "/infra/domains/default/groups/TF-EU1-IPSET-HOST_CACF_NEW_JUMPHOST",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-AG1-SG-SRES-OCP-Cluster04-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-CACF-AG-AnsibleTower",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump",
               "/infra/domains/default/groups/TF-EU1-IPSET-HOST_CACF_NEW_JUMPHOST",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2"
            ]
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
   rule {
         display_name = "TF-8249-Mysql-DB-connection"
         notes        = "SR51394624"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1dxdev02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-33060",
               "/infra/services/TCP-3306"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1dxdev02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-8333-Microstrategy-KSTP-EU-to-MCMS-EU-DB-Server"
         notes        = "SR51428615"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/MySQL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpabcmstr"
            ]
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
   rule {
         display_name = "TF-8365-MCDS-"
         notes        = "RITM0074770 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4243"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-8393-IQ-server"
         notes        = "RITM0075411"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8070-8071"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-8395-Nexus"
         notes        = "RITM0075325"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-8494-MCDS-dedicated-jump-host-to-nexus"
         notes        = "RITM0092777"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
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
   rule {
         display_name = "TF-8545-HWSW--ILMT-API-Connectivity"
         notes        = "RITM0114254 RITM0115008 INCEU15134615"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt5",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt5"
            ]
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
   rule {
         display_name = "TF-8618-ILMT-to-IBM-BLUE-servers"
         notes        = "RITM0115570"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-Blue-ILMT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-Blue-ILMT",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
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
   rule {
         display_name = "TF-8619-ILMT-SMTP"
         notes        = "RITM0115570"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-ILMT-Servers-Destination-SMTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP",
               "/infra/services/UDP-25"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-ILMT-Servers-Destination-SMTP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-8620-ILMT-to-SFS-"
         notes        = "RITM0115570"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster01-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster01-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-ILMT-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-EU1"
            }
      }
   rule {
         display_name = "TF-8622-MCDS"
         notes        = "RITM0116740"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-AT-OCP6N-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-AT-OCP6N-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1"
            ]
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
   rule {
         display_name = "TF-8702-STaaS-SSH-"
         notes        = "RITM0121632"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66lpskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13lpskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48lpskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr35lpskl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpmpcansb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr66lpskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13lpskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr48lpskl",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr35lpskl"
            ]
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
   rule {
         display_name = "TF-8791-HTTPS-Exec-node-to-AT-node"
         notes        = "RITM0126460"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
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