resource "nsxt_policy_gateway_policy" "policies_TF-SRES-IAM_PHASE4" {
   display_name    = "TF-GW-SRES103-{}"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-SRES103-{}"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1976-User-Web-Access"
         notes        = "SR50880868 SR51140346 - added SG-SRES-IAM-THY-PROXY-PROD"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2016-IAMaaS-THY-to-IRES-Domain-Controller"
         notes        = "SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 -SG-SRES-IAM-WINDOWS-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to the existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/KERBEROS",
               "/infra/services/NBDG-Unicast",
               "/infra/services/WINS",
               "/infra/services/LDAP",
               "/infra/services/LDAP-UDP",
               "/infra/services/WINS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/Active_Directory_Server",
               "/infra/services/NBNS-Unicast",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/SMTP",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/NBSS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/DNS-UDP",
               "/infra/services/DHCP-Server",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/MS-DS-TCP",
               "/infra/services/SOAP"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2291-ALL-Win-Servers-to-Staas2-&-DNS02"
         notes        = "SR50942226"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2312-Certification-Authority"
         notes        = "SR50945469 SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 SG-SRES-IAM-WINDOWS-SIDT added to existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2336-IAM--IBM-Blue-to-nonProd-Remote-Access-Server"
         notes        = "SR50954319 SR50997001 SG-SRES-IAM-THY-RAS-PROD added to the destination"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/Terminal_Services_(UDP)"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2484-IAM-PROD-Remote-Access-Server-to-Proxies"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-5672",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-5671",
               "/infra/services/TCP-9343"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2485-IAM-PROD-Remote-Access-Server-to-Windows-VMs"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-3389",
               "/infra/services/TCP-3389"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2486-IAM-PROD-Remote-Access-Server-to-SVG"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2487-IAM-PROD-Proxies-to-SVG"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-11443",
               "/infra/services/TCP-9343",
               "/infra/services/TCP-10444",
               "/infra/services/TCP-9443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2488-IAM-PROD-Proxies-to-Secret"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2489-IAM-PROD-Remote-Access-Server-to-Linux-VMs"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/SSH",
               "/infra/services/HTTP"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2490-ISM-PROD--All-but-DB-to-Proxies"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8892",
               "/infra/services/TCP-1098",
               "/infra/services/TCP-445",
               "/infra/services/UDP-51010",
               "/infra/services/TCP-1099",
               "/infra/services/UDP-50010",
               "/infra/services/TCP-9343",
               "/infra/services/HTTPS",
               "/infra/services/SSH",
               "/infra/services/TCP-139",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-51010",
               "/infra/services/TCP-50010",
               "/infra/services/TCP-2821",
               "/infra/services/TCP-5672",
               "/infra/services/UDP-2821",
               "/infra/services/SNMP",
               "/infra/services/TCP-9112",
               "/infra/services/TCP-135",
               "/infra/services/UDP-1098",
               "/infra/services/TCP-9443",
               "/infra/services/UDP-1099"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2491-IAM-PROD-Secret-to-Session-Server"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprfs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-137",
               "/infra/services/TCP-139",
               "/infra/services/TCP-445",
               "/infra/services/UDP-138"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2492-IAM-PROD-Secret-to-Rabbit-MQ"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671",
               "/infra/services/TCP-5672"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2493-IAM-PROD-Secret-to-MS-SQL"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-139",
               "/infra/services/TCP-445",
               "/infra/services/TCP-1433",
               "/infra/services/TCP-135"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2494-IAM-PROD-SVG-to-SDI-and-SDI-to-SVG"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SNMP",
               "/infra/services/TCP-8892",
               "/infra/services/TCP-1098",
               "/infra/services/TCP-9112",
               "/infra/services/TCP-2821",
               "/infra/services/UDP-1098",
               "/infra/services/TCP-1099",
               "/infra/services/SSH",
               "/infra/services/TCP-9437-9439",
               "/infra/services/UDP-2821",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343",
               "/infra/services/UDP-1099"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2496-IAM-PROD-Distrib-Engine-to-Rabbit-MQ"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671",
               "/infra/services/TCP-5672"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2497-IAM-PROD-Distrib-Engine-to-Secret"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2498-IAM-PROD-SDI-to-SDI"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2499-IAM-PROD-Rabbit-MQ-to-Rabbit-MQ"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2501-IAM-PROD-SQL-to-SQL"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2503-IAM-PROD-Secret-to-Secret"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2504-IAM-PROD-Proxies-to-Proxies"
         notes        = "CH50079731 and SR50980015"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2694-IAMAAS_to_bluepages"
         notes        = "SR51036565"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2706-Thycotic-to-UAT-LA"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-Thycotic-UAT-LA"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2707-IAMAAS_Thy_secret_prod_to_SMTP"
         notes        = "SR51043256 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2722-IAMAAS-sdi-prod-to-db2prod"
         notes        = "SR51043485"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-51010",
               "/infra/services/TCP-51010",
               "/infra/services/TCP-50010",
               "/infra/services/UDP-50010"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2734-IAMAAS-prod-sdi-to-secret-"
         notes        = "SR51044565"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-HOST",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2738-IAMAAS-PROD--Proxy-to-DE,RMQ,SECRET-"
         notes        = "SR51046819"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2739-IAMAAS-PROD-DE,RMQ,SECRET-to-PROXY"
         notes        = "SR51046819"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2761-Thycotic-IAMAAS-SDI-to-SVG-"
         notes        = "SR51054677"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1100"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2842-Thycotic-Secret-PROD-to-IAM-Windows--"
         notes        = "SR51100545"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2843-Thycotic-DE-PROD-to-IAM-Windows--"
         notes        = "SR51100545"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445",
               "/infra/services/TCP-135"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2878-Thycotic-SVG/SDI-to-Infra-ports-"
         notes        = "SR51119267"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2880-Thycotic-SVG/SDI-to-Infra-ports"
         notes        = "SR51119267"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PROD"
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2888-Thycotic-SVG/SDI-to-Infra-ports-----"
         notes        = "SR51119267"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-45580"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2890-IAM-PROD-SID->-DE-"
         notes        = "SR51132852 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1100"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-2996-IAMAAS-Secret-to-Blue"
         notes        = "SR51186649 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2001"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3202-SRES-to-ICP"
         notes        = "SR51306624"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16351"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3262-ICP-to-SRES"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3263-SRES-to-ICP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-"
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3270-PenTest-VM-for-ChatOps"
         notes        = "CH50099191"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3276-SRES-to-ICP"
         notes        = "SR51357166"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3437-UAT-Shared-to-DSS-NA"
         notes        = "RITM0122210"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-HOST-UAT-Shared"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3482-IBM-CLOUD-to-THY"
         notes        = "RITM0116065"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-icdalpamhapxy01-cloudprivate-local",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-icamspamhapxy01-cloudprivate"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-5671-5672"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3483-NA-to-EU-Chatops-integration"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3526-CHATOPS-to-ICD"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3527-ICD-to-CHATOPS"
         notes        = "RITM0118985"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3530-EU-to-NA-SRES"
         notes        = "RITM0118704"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES-LB"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-5671",
               "/infra/services/TCP-5672"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3585-MCMS-EU-to-PAM"
         notes        = "RITM0121602"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-icamspamhapxy01-cloudprivate"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3638-IAM-to-IAMAAS-ZABBIX"
         notes        = "RITM0127633"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3661-ZABBIX-to-SRES"
         notes        = "RITM0131427"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wniamsb-All",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3745-KSTP-2023-Pen-Test-SRES-scan"
         notes        = "RITM0139451"
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3768-IAM-dedicated-RAS-to-DDE"
         notes        = "RITM0140602"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamprra"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276wpDDE"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/TCP-3390"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3769-Reverse-proxyto-KSTP-NA-PAM-RMQ"
         notes        = "RITM0140602"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276lprevpxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3770-Reverse-proxy-to-KSTP-NA-PAM-Proxy"
         notes        = "RITM0140602"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1d276lprevpxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3801-AG-SRES-to-UAT-LA"
         notes        = "RITM0143380"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiampre2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA2"
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
               tag = "TF-SRES-AG1"
            }
      }
}