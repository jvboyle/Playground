resource "nsxt_policy_security_policy" "policies_TF-SRES-IAM_PHASE2" {
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
               "/infra/services/NBNS-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/KERBEROS",
               "/infra/services/SMTP",
               "/infra/services/DHCP-Server",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP",
               "/infra/services/NBSS",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/WINS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/LDAP-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
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
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/HTTPS",
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SEPM",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-SQL",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1srwpetpd1000",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-WSUS",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1vmon",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1twin01",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp02",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1daipwin01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02"
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
         display_name = "TF-2336-IAM--IBM-Blue-to-nonProd-Remote-Access-Server"
         notes        = "SR50954319 SR50997001 SG-SRES-IAM-THY-RAS-PROD added to the destination"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Terminal_Services_(UDP)",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD"
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
         display_name = "TF-2345-IAM-PEN-Rabbit-MQ-to-Rabbit-MQ"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
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
         display_name = "TF-2347-IAM-PEN-SQL-to-SQL"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
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
         display_name = "TF-2349-IAM-PEN-Secret-to-Secret"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
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
         display_name = "TF-2350-IAM-PEN-Proxies-to-Proxies"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN"
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
         display_name = "TF-2352-IAM-PEN-SVG-to-SDI-and-SDI-to-SVG"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-1098",
               "/infra/services/TCP-1098",
               "/infra/services/UDP-1099",
               "/infra/services/TCP-8892",
               "/infra/services/UDP-2821",
               "/infra/services/TCP-9343",
               "/infra/services/TCP-2821",
               "/infra/services/TCP-1099",
               "/infra/services/SNMP",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9437-9439",
               "/infra/services/SSH",
               "/infra/services/TCP-9112"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
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
         display_name = "TF-2354-IAM-PEN-Secret-to-Rabbit-MQ"
         notes        = "SR50954319 RITM0140521 - SRES-LB"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
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
         display_name = "TF-2355-IAM-PEN-Secret-to-MS-SQL"
         notes        = "SR50954319 SR50971394 - 1433"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1433",
               "/infra/services/TCP-135",
               "/infra/services/TCP-445",
               "/infra/services/TCP-139"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
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
         display_name = "TF-2356-IAM-PEN-Proxies-to-SVG"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9343",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-10443",
               "/infra/services/TCP-11443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
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
         display_name = "TF-2357-IAM-PEN-Proxies-to-Secret"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
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
         display_name = "TF-2358-IAM-PEN-Remote-Access-Server-to-Proxies"
         notes        = "SR50954319 SR50979356 SR50979356"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-5671",
               "/infra/services/TCP-9343",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-5672"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
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
         display_name = "TF-2365-IAM-Windows-Failover-Cluster"
         notes        = "SR50963338"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NetBios_Datagram_(UDP)",
               "/infra/services/TCP-3343",
               "/infra/services/NetBios_Session_Service_(TCP)",
               "/infra/services/NetBios_Name_Service_(UDP)",
               "/infra/services/UDP-3343"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq2"
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
         display_name = "TF-2368-IAM-PEN-Remote-Access-Server-to-linux-VMs-"
         notes        = "SR50968305 SR50979356"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/RDP",
               "/infra/services/Terminal_Services_(UDP)",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
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
         display_name = "TF-2369-Thycotic-SS-to-TDI"
         notes        = "SR50963223"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1"
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
         display_name = "TF-2370-Thycotic-TDI-to-SS"
         notes        = "SR50963223"
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1"
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
         display_name = "TF-2378-IAM-SIDT-Remote-Access-Server-to-Proxies"
         notes        = "SR50971783"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343",
               "/infra/services/HTTPS",
               "/infra/services/TCP-5672",
               "/infra/services/TCP-9000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
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
               "/infra/services/SSH",
               "/infra/services/HTTPS",
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
         display_name = "TF-2399-IAM-Remote-Access-Server-to-SVG"
         notes        = "SR50972115 SR51043485 SG-SRES-IAM-THY-SVG-DEVOPS added to the destination"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9343",
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-DevOps"
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
         display_name = "TF-2401-SRES-IAMAAS-THY-UAT_to_IRES_DNS-"
         notes        = "SR50972633"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAMAAS-THY-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SOAP",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/KERBEROS",
               "/infra/services/SMTP",
               "/infra/services/DHCP-Server",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP",
               "/infra/services/NBSS",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/WINS-UDP",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/WINS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/LDAP-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAMAAS-THY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
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
         display_name = "TF-2402-IAM-UAT-Remote-Access-Server-to-Proxies"
         notes        = "CH50078675 and SR50970216 SR51043485 SG-SRES-IAM-THY-PROXY-DEVOPS added to the destination"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343",
               "/infra/services/HTTPS",
               "/infra/services/TCP-5672",
               "/infra/services/TCP-9000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-DevOps",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
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
         display_name = "TF-2403-IAM-UAT-Remote-Access-Server-to-Windows-VMs"
         notes        = "CH50078675 and SR50970216 SR51043485 SG-SRES-IAM-WINDOWS-DEVOPS added to the destination"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-DevOps"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-3389",
               "/infra/services/TCP-3389"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-DevOps"
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
         display_name = "TF-2404-IAM-UAT-Remote-Access-Server-to-Linux-VMs"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-UAT"
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
         display_name = "TF-2405-IAM-UAT-Proxies-to-Secret"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2408-ISM-UAT--All-but-DB-to-Proxies"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-1099",
               "/infra/services/TCP-2821",
               "/infra/services/TCP-9438",
               "/infra/services/UDP-51010",
               "/infra/services/TCP-445",
               "/infra/services/SNMP",
               "/infra/services/TCP-51010",
               "/infra/services/TCP-139",
               "/infra/services/TCP-443",
               "/infra/services/TCP-5672",
               "/infra/services/SSH",
               "/infra/services/TCP-1099",
               "/infra/services/TCP-9343",
               "/infra/services/TCP-9439",
               "/infra/services/TCP-9112",
               "/infra/services/UDP-50010",
               "/infra/services/UDP-2821",
               "/infra/services/TCP-9437",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-135",
               "/infra/services/UDP-1098",
               "/infra/services/TCP-1098",
               "/infra/services/TCP-50010",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-8892"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
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
         display_name = "TF-2409-IAM-UAT-Secret-to-MS-SQL"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445",
               "/infra/services/TCP-139",
               "/infra/services/TCP-1433",
               "/infra/services/TCP-135"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2410-IAM-UAT-Secret-to-Rabbit-MQ"
         notes        = "CH50078675 and SR50970216 RITM0129358 - ag1-sres-lb1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2411-IAM-UAT-Distrib-Engine-to-Secret"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2412-IAM-UAT-Distrib-Engine-to-Rabbit-MQ"
         notes        = "CH50078675 and SR50970216 RITM0129358 - ag1-sres-lb1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
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
         display_name = "TF-2414-IAM-UAT-SVG-to-SDI-and-SDI-to-SVG"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1099",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-2821",
               "/infra/services/UDP-1098",
               "/infra/services/TCP-9439",
               "/infra/services/TCP-9343",
               "/infra/services/TCP-1098",
               "/infra/services/UDP-1099",
               "/infra/services/TCP-9112",
               "/infra/services/SNMP",
               "/infra/services/UDP-2821",
               "/infra/services/TCP-9437",
               "/infra/services/SSH",
               "/infra/services/TCP-8892",
               "/infra/services/TCP-9438"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
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
         display_name = "TF-2416-IAM-UAT-Secret-to-Secret"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2418-IAM-UAT-SDI-to-SDI"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
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
         display_name = "TF-2419-IAM-UAT-Rabbit-MQ-to-Rabbit-MQ"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
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
         display_name = "TF-2421-IAM-UAT-SQL-to-SQL"
         notes        = "CH50078675 and SR50970216"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT"
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
         display_name = "TF-2441-IAM-UAT-Secret-to-Session-Recording-File-Server"
         notes        = "CH50079177 and SR50974434"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuafs",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2457-IAM-PEN-Secret-to-Session-Recording-File-Server"
         notes        = "SR50973757 and CH50079008"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptfs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptfs",
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
         display_name = "TF-2469-IAM-PEN-All-but-DB-to-Proxies"
         notes        = "CH50078679 and SR50964831"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-1099",
               "/infra/services/TCP-2821",
               "/infra/services/UDP-51010",
               "/infra/services/TCP-445",
               "/infra/services/SNMP",
               "/infra/services/TCP-139",
               "/infra/services/TCP-51010",
               "/infra/services/TCP-9437-9439",
               "/infra/services/TCP-5672",
               "/infra/services/SSH",
               "/infra/services/TCP-1099",
               "/infra/services/TCP-9343",
               "/infra/services/TCP-9112",
               "/infra/services/UDP-50010",
               "/infra/services/UDP-2821",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-135",
               "/infra/services/UDP-1098",
               "/infra/services/HTTPS",
               "/infra/services/TCP-1098",
               "/infra/services/TCP-50010",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-8892"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
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
         display_name = "TF-2470-IAM-PEN-Distrib-Engine-to-Secret"
         notes        = "CH50078679 and SR50964831"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
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
         display_name = "TF-2471-IAM-PEN-SRES-Distrib-Engine-to-Rabbit-MQ"
         notes        = "CH50078679 and SR50964831 RITM0140521 - sers-lb"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
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
         display_name = "TF-2473-IAM-PEN-HAPROXY-to-RabbitMQ"
         notes        = "SR50979581 SR50980868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
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
         display_name = "TF-2474-IAM-PEN-SECRET-to-HAPROXY"
         notes        = "SR50979581 -SR50980868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
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
         display_name = "TF-2477-IAM-PEN-DE-to-proxy,Rmq"
         notes        = "SR50980868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
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
         display_name = "TF-2479-IAM-UAT-SECRET-to-HAPROXY"
         notes        = "SR50980868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2481-IAM-UAT-HAPROXY-to-RabbitMQ-"
         notes        = "SR50980868"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
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
         display_name = "TF-2483-IAM-UAT-DE-to-proxy,Rmq-"
         notes        = "SR50980868 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
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
         display_name = "TF-2508-IAMAAS-SDI-UAT_DB2-UAT"
         notes        = "SR50980752"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-51010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
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
         display_name = "TF-2511-IAMAAS-SDI-UAT_PROXY-UAT"
         notes        = "SR50980752"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
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
         display_name = "TF-2512-IAMAAS-SDI-UAT_-RMQ-UAT"
         notes        = "SR50980752"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
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
         display_name = "TF-2513-IAMAAS-SDI-PEN_-RMQ-pen"
         notes        = "SR50980752"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
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
         display_name = "TF-2514-IAMAAS-SDI-PEN_-proxy-pen"
         notes        = "SR50980752"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
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
         display_name = "TF-2524-IAM-PEN-DE->TDI-on-port-22"
         notes        = "SR50985477 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
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
         display_name = "TF-2525-IAM-PEN-DE->All-TSS-components-"
         notes        = "SR50985477 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-3390",
               "/infra/services/UDP-49152-65535",
               "/infra/services/TCP-3389",
               "/infra/services/TCP-5986",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-49152-65535",
               "/infra/services/UDP-5986",
               "/infra/services/UDP-3389",
               "/infra/services/TCP-3390",
               "/infra/services/UDP-5985"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
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
         display_name = "TF-2526-IAM-PEN-SID->-DE"
         notes        = "SR50985477 SR51081470 - tcp 1100"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-28210",
               "/infra/services/TCP-1098",
               "/infra/services/TCP-1100"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
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
         display_name = "TF-2527-IAM-PEN-DE->SDI"
         notes        = "SR50985477"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-28210",
               "/infra/services/TCP-1099"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
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
         display_name = "TF-2528-IAM-PEN-SVG-->TSS-Windows-port-45580"
         notes        = "SR50985477"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-45580"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
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
         display_name = "TF-2529-IAM-DE->All-SVG-Linux-Box"
         notes        = "SR50985477"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
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
         display_name = "TF-2530-IAM-UAT-DE->TDI-on-port-22-"
         notes        = "SR50985477 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
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
         display_name = "TF-2532-IAM-UAT-DE->All-TSS-components-"
         notes        = "SR50985477 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-3390",
               "/infra/services/UDP-49152-65535",
               "/infra/services/TCP-3389",
               "/infra/services/TCP-5986",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-49152-65535",
               "/infra/services/UDP-5986",
               "/infra/services/UDP-3389",
               "/infra/services/TCP-3390",
               "/infra/services/UDP-5985"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2534-IAM-UAT->All-SVG-Linux-Box-"
         notes        = "SR50985477"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
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
         display_name = "TF-2536-IAM-UAT-SVG-->TSS-Windows-port-45580-"
         notes        = "SR50985477"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-45580"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2538-IAM-UAT-SID->-DE-"
         notes        = "SR50985477 SR51132852 - tcp 1100"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-28210",
               "/infra/services/TCP-1098",
               "/infra/services/TCP-1100"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
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
         display_name = "TF-2540-IAM-UAT-DE->SDI-"
         notes        = "SR50985477 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-28210",
               "/infra/services/TCP-1099"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
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
         display_name = "TF-2582-IAM-UAT"
         notes        = "SR50991602"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
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
         display_name = "TF-2583-IAM-pen"
         notes        = "SR50991602"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5672",
               "/infra/services/TCP-5671",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
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
         display_name = "TF-2604-SRES-TDI-to-SQL"
         notes        = "SR50993704 SR50998396 SG-SRES-WIN-Jump-Servers added to the source SR51095899 - added source ag1sr1wniamptra"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-DevOps",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1433"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-DevOps",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-DevOps",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
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
         display_name = "TF-2616-IAM-Non-prod-ras-to-DRES"
         notes        = "SR50999344"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2"
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
         display_name = "TF-2653-IBM-Blue-To-IAMAAS-proxy"
         notes        = "SR51020549"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9343",
               "/infra/services/TCP-9443",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
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
         display_name = "TF-2694-IAMAAS_to_bluepages"
         notes        = "SR51036565"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
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
         display_name = "TF-2719-IAMAAS-sdi-pen-to-db2-pen"
         notes        = "SR51043485"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-51010",
               "/infra/services/TCP-50010",
               "/infra/services/TCP-51010",
               "/infra/services/UDP-50010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
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
         display_name = "TF-2721-IAMAAS-sdi-uat-to-db2-uat"
         notes        = "SR51043485"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-51010",
               "/infra/services/TCP-50010",
               "/infra/services/TCP-51010",
               "/infra/services/UDP-50010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-UAT"
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
         display_name = "TF-2723-IAMAAS-nonprod-to-db2devops"
         notes        = "SR51043485"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-DevOps"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-51010",
               "/infra/services/TCP-50010",
               "/infra/services/TCP-51010",
               "/infra/services/UDP-50010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-DevOps"
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
         display_name = "TF-2724-IAMAAS-nonprod-to-linuxdevops"
         notes        = "SR51043485"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-DevOps"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-DevOps"
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
         display_name = "TF-2733-IAMAAS-pen-sdi-to-secret-"
         notes        = "SR51044565"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
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
         display_name = "TF-2735-IAMAAS-uat-sdi-to-secret"
         notes        = "SR51044565 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2736-IAMAAS-UAT--Proxy-to-DE,RMQ,SECRET-"
         notes        = "SR51046819"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2737-IAMAAS-UAT-DE,RMQ,SECRET-to-PROXY"
         notes        = "SR51046819"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2760-Thycotic-IAMAAS-SDI-to-SVG-"
         notes        = "SR51054677"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1100"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
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
         display_name = "TF-2762-Thycotic-IAMAAS-SDI-to-SVG"
         notes        = "SR51054677"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-1100",
               "/infra/services/TCP-1100"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
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
               "/infra/services/TCP-139",
               "/infra/services/TCP-445",
               "/infra/services/TCP-135"
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
         display_name = "TF-2810-IAM-SDI-PEN-Remote-Access-Server-to-linux-VMs-"
         notes        = "R51082529"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
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
         display_name = "TF-2838-Thycotic-Secret-UAT-to-IAM-Windows-"
         notes        = "SR51100545"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
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
         display_name = "TF-2839-Thycotic-DE-UAT-to-IAM-Windows-"
         notes        = "SR51100545"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135",
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-3390"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
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
         display_name = "TF-2883-Thycotic-SVG/SDI-to-Infra-ports----"
         notes        = "SR51119267"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
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
         display_name = "TF-2885-Thycotic-SVG/SDI-to-Infra-ports---"
         notes        = "SR51119267"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-UAT"
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
         display_name = "TF-2886-Thycotic-SVG/SDI-to-Infra-ports------"
         notes        = "SR51119267"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-45580"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-UAT"
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2001"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
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
         display_name = "TF-3024-Thycotic-IAMAAS-JH-to-DB"
         notes        = "SR51228207"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-51010",
               "/infra/services/UDP-51010"
            ]
         scope = [
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
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus"
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
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus"
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
               "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ag1irlpipam01",
               "/infra/domains/default/groups/TF-AG1-IPSET-agnsrlnicp1p-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-AGNSRLNICP1-ICP-VIP"
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
         display_name = "TF-3279-Thyccotic-connectivity"
         notes        = "SR51362759"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1433",
               "/infra/services/UDP-1433"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra"
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
         display_name = "TF-3386-SRES-ag1sr1lniamuasdi-to-Blue"
         notes        = "RITM0073612"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Blue-dev-aiops-elk"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Blue-dev-aiops-elk"
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-LINUX-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-NODB-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-WINDOWS-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DB2-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-agnsrlnmnepen1"
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
         display_name = "TF-3437-UAT-Shared-to-DSS-NA"
         notes        = "RITM0122210"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-HOST-UAT-Shared"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-HOST-UAT-Shared",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PROD-VIP"
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
         display_name = "TF-3465-NA-SRES-to-AIOPS"
         notes        = "RITM0094921"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NA-AIOPS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NA-AIOPS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamuasdi"
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
         display_name = "TF-3477-AG-SRES-to-AG-SRES"
         notes        = "RITM0114560"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5"
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
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2"
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
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
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-ESLS-UAT",
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
         display_name = "TF-3564-IAM-UAT-SDI>>-test"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-636",
               "/infra/services/TCP-5986",
               "/infra/services/TCP-389",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-443",
               "/infra/services/TCP-45580"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2"
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
         display_name = "TF-3617-IAM-nonPROD--RAS-to-Sandbox-all-VMs"
         notes        = "RITM0125257"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
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
         display_name = "TF-3661-ZABBIX-to-SRES"
         notes        = "RITM0131427"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-IAMAAS-ZABBIX",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
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
         display_name = "TF-3705-iam-sres-test"
         notes        = "RITM0129358 - UAT RITM0140521 - PEN"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
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
         display_name = "TF-3706-iam-sres-test"
         notes        = "RITM0140521"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-UAT-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra"
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
         display_name = "TF-3707-SRES-LB-to-IAMaaS-Backend-Pools"
         notes        = "RITM0129358 - UAT RITM0140521 - PEN"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB1-PrimaryIP"
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
         display_name = "TF-3761-Copy-of-iam-sres-test-"
         notes        = "RITM0129358"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-THY-PROXY-PEN-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra"
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
         display_name = "TF-3800-AG-SRES-to-UAT-LA"
         notes        = "RITM0143380"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1",
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-LA1"
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