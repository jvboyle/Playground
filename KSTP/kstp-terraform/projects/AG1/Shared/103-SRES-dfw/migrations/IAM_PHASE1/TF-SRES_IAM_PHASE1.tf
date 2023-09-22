resource "nsxt_policy_security_policy" "policies_TF-SRES-IAM_PHASE1" {
   display_name    = "TF-SRES"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-SRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-2016-IAMaaS-THY-to-IRES-Domain-Controller"
         notes        = "SR50963446 - SG-SRES-IAM-WINDOWS-PEN SR50971783 -SG-SRES-IAM-WINDOWS-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-WINDOWS-UAT added to the existing source CH50079731 and SR50980015 SG-SRES-IAM-WINDOWS-PROD added to source"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/DNS-UDP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/SMTP",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/LDAP-UDP",
               "/infra/services/DHCP-Server",
               "/infra/services/DNS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/WINS",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/LDAP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/NBSS",
               "/infra/services/Active_Directory_Server"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
            ]
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
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/DNS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
            ]
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
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/MS_RPC_TCP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02"
            ]
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
         display_name = "TF-2351-IAM-PEN-Remote-Access-Server-to-Windows-VMs"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Terminal_Services_(UDP)",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
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
         display_name = "TF-2375-SRES-IAMAAS-THY-PT-Test-Dev_to_IRES_DNS"
         notes        = "SR50971663"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAMAAS-THY-PT-Test-Dev"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/DNS-UDP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/SMTP",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/LDAP-UDP",
               "/infra/services/DHCP-Server",
               "/infra/services/DNS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/WINS",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/LDAP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/NBSS",
               "/infra/services/Active_Directory_Server"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAMAAS-THY-PT-Test-Dev"
            ]
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
         display_name = "TF-2379-IAM-SIDT-Remote-Access-Server-to-Windows-VMs"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-3389",
               "/infra/services/TCP-3389"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
            ]
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
         display_name = "TF-2380-IAM-SIDT-Remote-Access-Server-to-Linux-VMs"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH",
               "/infra/services/HTTP",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
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
         display_name = "TF-2381-IAM-SIDT-Proxies-to-Secret"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2383-ISM-SIDT--All-but-DB-to-Proxies"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH",
               "/infra/services/SNMP",
               "/infra/services/TCP-50010",
               "/infra/services/TCP-51010",
               "/infra/services/TCP-135",
               "/infra/services/TCP-139",
               "/infra/services/TCP-443",
               "/infra/services/TCP-445",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-9343",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-5672",
               "/infra/services/TCP-1098",
               "/infra/services/TCP-1099",
               "/infra/services/TCP-2821",
               "/infra/services/TCP-8892",
               "/infra/services/TCP-9112",
               "/infra/services/TCP-9437",
               "/infra/services/TCP-9438",
               "/infra/services/TCP-9439",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343",
               "/infra/services/UDP-50010",
               "/infra/services/UDP-51010",
               "/infra/services/UDP-1098",
               "/infra/services/UDP-1099",
               "/infra/services/UDP-2821"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
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
         display_name = "TF-2384-IAM-SIDT-Secret-to-MS-SQL"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135",
               "/infra/services/TCP-139",
               "/infra/services/TCP-445",
               "/infra/services/TCP-1433"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2385-IAM-SIDT-Secret-to-Rabbit-MQ"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671",
               "/infra/services/TCP-5672"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2387-IAM-SIDT-Distrib-Engine-to-Rabbit-MQ"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671",
               "/infra/services/TCP-5672"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
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
         display_name = "TF-2388-IAM-SIDT-SVG-to-SDI-and-SDI-to-SVG"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1098-1099-2821-8892-9112-9437-9438-9439-9443-9343",
               "/infra/services/SSH",
               "/infra/services/SNMP",
               "/infra/services/UDP-1098",
               "/infra/services/UDP-1099",
               "/infra/services/UDP-2821"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
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
         display_name = "TF-2391-IAM-SIDT-Secret-to-Secret"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2394-IAM-SIDT-SQL-to-SQL"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
            ]
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
         display_name = "TF-2395-IAM-SIDT-SDI-to-SDI"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
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
         display_name = "TF-2396-IAM-SIDT-Rabbit-MQ-to-Rabbit-MQ"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
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
         display_name = "TF-2440-IAM-SIDT-Secret-to-Session-Recording-File-Server"
         notes        = "CH50079174 and SR50974431"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtsfs",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2478--IAM-SIDT-SECRET-to-HAPROXY"
         notes        = "SR50980868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671",
               "/infra/services/TCP-5672"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2480-IAM-SIDT-HAPROXY-to-RabbitMQ"
         notes        = "SR50980868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671",
               "/infra/services/TCP-5672"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
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
         display_name = "TF-2482-IAM-SIDT-DE-to-proxy,Rmq-"
         notes        = "SR50980868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671",
               "/infra/services/TCP-5672"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
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
         display_name = "TF-2509-IAMAAS-SDI-SIDT_PROXY-SIDT"
         notes        = "SR50980752"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-51010",
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
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
         display_name = "TF-2510-IAMAAS-SDI-SIDT_-DB2-SIDT"
         notes        = "SR50980752"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-51010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
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
         display_name = "TF-2531-IAM-SIDT-DE->TDI-on-port-22-"
         notes        = "SR50985477 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
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
         display_name = "TF-2533-IAM-SIDT-DE->All-TSS-components-"
         notes        = "SR50985477 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-3389",
               "/infra/services/UDP-5985-5986",
               "/infra/services/TCP-3390",
               "/infra/services/TCP-49152-65535",
               "/infra/services/TCP-3389",
               "/infra/services/UDP-3390",
               "/infra/services/UDP-49152-65535",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2535-IAM-SIDT->All-SVG-Linux-Box-"
         notes        = "SR50985477"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
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
         display_name = "TF-2537-IAM-SIDT-SVG-->TSS-Windows-port-45580-"
         notes        = "SR50985477"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-45580"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
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
         display_name = "TF-2539-IAM-SDI-SID->-DE"
         notes        = "SR50985477 SR51132852 - tcp 1100"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1100",
               "/infra/services/TCP-1098",
               "/infra/services/TCP-28210"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
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
         display_name = "TF-2541-IAM-SIDT-DE->SDI-"
         notes        = "SR50985477"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1099",
               "/infra/services/TCP-28210"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
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
         display_name = "TF-2581-IAM-SIDT"
         notes        = "SR50991602"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671",
               "/infra/services/HTTPS",
               "/infra/services/TCP-5672"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-Thycotic-UAT-LA"
            ]
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
         display_name = "TF-2720-IAMAAS-sdi-sidt-to-db2-sidt"
         notes        = "SR51043485"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-51010-50010",
               "/infra/services/TCP-51010",
               "/infra/services/TCP-50010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
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
         display_name = "TF-2732-IAMAAS-sidt-sdi-to-secret-"
         notes        = "SR51044565"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
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
         display_name = "TF-2742-IAMAAS-SIDT--PROXY-to-DE,RMQ,SECRET-"
         notes        = "SR51046819"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2743-IAMAAS-SIDT-DE,RMQ,SECRET-to-PROXY"
         notes        = "SR51046819"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-2759-Thycotic-IAMAAS-SDI-to-SVG-"
         notes        = "SR51054677"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1100"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
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
         display_name = "TF-2793-IAMAAS-windows-adapter-pentest"
         notes        = "SR51074869"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445",
               "/infra/services/TCP-135",
               "/infra/services/TCP-139"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
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
         display_name = "TF-2836-Thycotic-Secret-PEN-to-IAM-Windows-"
         notes        = "SR51100545"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
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
         display_name = "TF-2837-Thycotic-DE-PEN-to-IAM-Windows"
         notes        = "SR51100545"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135",
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
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
         display_name = "TF-2840-Thycotic-Secret-SIDT-to-IAM-Windows--"
         notes        = "SR51100545"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
            ]
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
         display_name = "TF-2841-Thycotic-DE-SIDT-to-IAM-Windows-"
         notes        = "SR51100545"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135",
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
            ]
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
         display_name = "TF-2844-Thycotic-RAS-Nonprod-to-Noprod-DE"
         notes        = "SR51100743 SR51115251 - port 3390"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3390",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
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
         display_name = "TF-2877-Thycotic-SVG/SDI-to-Infra-ports--"
         notes        = "SR51119267 SR51126861 - SG-SRES-IAM-THY-DE-SIDT SG-SRES-IAM-THY-SVG-SIDT added to source"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
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
         display_name = "TF-2881-Thycotic-SVG/SDI-to-Infra-ports---"
         notes        = "SR51119267"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
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
         display_name = "TF-2887-Thycotic-SVG/SDI-to-Infra-ports-----"
         notes        = "SR51119267 SR51126861 - SG-SRES-IAM-THY-DE-SIDT SG-SRES-IAM-THY-SDI-SIDT added to source"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-45580",
               "/infra/services/UDP-5985",
               "/infra/services/UDP-5986",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
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
         display_name = "TF-2940-IAMAAS_Thycotic_EP_to_Domain"
         notes        = "SR51183587"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG_IAMAAS_Thycotic_Windows_EP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/WINS-UDP",
               "/infra/services/DNS-UDP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/SMTP",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/LDAP-UDP",
               "/infra/services/DHCP-Server",
               "/infra/services/DNS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/WINS",
               "/infra/services/NBNS-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/LDAP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/NBSS",
               "/infra/services/Active_Directory_Server"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG_IAMAAS_Thycotic_Windows_EP"
            ]
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2001"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         display_name = "TF-3020-Thycotic-IMaas-DC-domain"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/UDP-53",
               "/infra/services/UDP-389",
               "/infra/services/TCP-88",
               "/infra/services/TCP-135",
               "/infra/services/TCP-139",
               "/infra/services/TCP-389",
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
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
         display_name = "TF-3021-Thycotic-IMaas-Domain-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/UDP-53",
               "/infra/services/UDP-389",
               "/infra/services/TCP-88",
               "/infra/services/TCP-135",
               "/infra/services/TCP-139",
               "/infra/services/TCP-389",
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
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
         display_name = "TF-3121-IAMAAS_VA_to_TSS"
         notes        = "SR51247197 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/UDP-443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1aniamtssvg1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1"
            ]
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
         display_name = "TF-3201-UAT-QA-IE-to-Secret-"
         notes        = "SR51311443 SR51312669 - SG-SRES-IAM-THY-PROXY-SIDT RITM0133222 RITM0135152"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IAMssS-UAT-QA-IE"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-IAMssS-UAT-QA-IE",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-MNE-Dev-Test",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
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
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-"
            ]
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
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-"
            ]
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
            ]
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
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
         display_name = "TF-3430-KALI-to-IAM"
         notes        = "RITM0092300 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnmnepen1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnmnepen1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
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
         display_name = "TF-3478-AG-SRES-to-AG-SRES"
         notes        = "RITM0114560"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
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
         display_name = "TF-3479-AG-SRES-to-Blue"
         notes        = "RITM0114560"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-BLUE-uid-urtext-aix1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-BLUE-uid-urtext-aix1"
            ]
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-nlaspnp000m1erms",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
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
         display_name = "TF-3525-SRES-to-SRES-EP-Connectivity"
         notes        = "RITM0119630"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
            ]
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT"
            ]
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
         display_name = "TF-3564-IAM-UAT-SDI>>-test"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-389",
               "/infra/services/TCP-636",
               "/infra/services/TCP-45580",
               "/infra/services/TCP-443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-All-VMs"
            ]
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
         display_name = "TF-3649-Blue-to-DSS-sitest"
         notes        = "RITM0130135"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtst1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
            ]
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
         display_name = "TF-3662-THY-DE-SIDT-to-UAT-"
         notes        = "RITM0131697"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-US"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-US"
            ]
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
         display_name = "TF-3722-iam-to-Sres-"
         notes        = "RITM0136195"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/TCP-5986",
               "/infra/services/TCP-45580",
               "/infra/services/UDP-5986",
               "/infra/services/TCP-636",
               "/infra/services/TCP-389"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
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
         display_name = "TF-3738-IAMaaS-DSS-CISO-ep"
         notes        = "RITM0137980 RITM0138945 - 135 139 udp tcp 445 udp tcp 636 udp tcp 49152-65535 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/TCP-139",
               "/infra/services/UDP-445",
               "/infra/services/LDAP-over-SSL-UDP",
               "/infra/services/TCP-135",
               "/infra/services/TCP-49152-65535",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/TCP-445",
               "/infra/services/UDP-49152-65535"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
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
         display_name = "TF-3740-Copy-of-IAMaaS-DSS-CISO-ep-"
         notes        = "RITM0138945 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-139",
               "/infra/services/UDP-445",
               "/infra/services/LDAP-over-SSL-UDP",
               "/infra/services/TCP-135",
               "/infra/services/TCP-49152-65535",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/TCP-445",
               "/infra/services/UDP-49152-65535"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
            ]
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-NET-SRES-APP"
            ]
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
         display_name = "TF-3764-UAT-LA-to-IAMUAEP"
         notes        = "RITM0137784"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
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