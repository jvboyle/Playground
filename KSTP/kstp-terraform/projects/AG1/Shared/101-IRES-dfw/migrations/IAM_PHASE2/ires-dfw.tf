resource "nsxt_policy_security_policy" "policies_TF-IRES-json_2_tf" {
   display_name    = "TF-IRES"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-IRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-3044-win19test-to-IRES-DNS"
         notes        = "SR51242059"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1win19test"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP",
               "/infra/services/SMB",
               "/infra/services/LDAP-UDP",
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/KERBEROS-TCP",
               "/infra/services/NetBios_Session_Service_(TCP)",
               "/infra/services/TCP-135"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1win19test"
            ]
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
   rule {
         display_name = "TF-3381-win19test-to-DC"
         notes        = " RITM0073507 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1win19test",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-IRES-SL1-Collectors"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS",
               "/infra/services/DNS-UDP",
               "/infra/services/TCP-5985-5986",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1win19test",
               "/infra/domains/default/groups/TF-AG1-SG-IRES-SL1-Collectors"
            ]
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
         display_name = "TF-1234-DA-SRES-Win-to-IRES-AD"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/NTP_Time_Server",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/DHCP-Server",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/NBSS",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/Active_Directory_Server",
               "/infra/services/LDAP-UDP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/LDAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SOAP",
               "/infra/services/WINS",
               "/infra/services/WINS-UDP",
               "/infra/services/DNS-UDP",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DNS",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/KERBEROS",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DA",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
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
   rule {
         display_name = "TF-1930-SG-IRES-SL1-Collectors-to-SRES-DNS--NTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-IRES-SL1-Collectors"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-IRES-SL1-Collectors",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
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
   rule {
         display_name = "TF-2959-Copy-of-SG-IRES-SL1-Collectors-to-SRES-DNS--NTP-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-IRES-Network-Automation-Server-Group"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-IRES-Network-Automation-Server-Group"
            ]
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
resource "nsxt_policy_security_policy" "policies_TF-IRES-IAM_PHASE2" {
   display_name    = "TF-IRES"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-IRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1114-Terminal-servers-to-License-server"
         notes        = "SR51015869 - source SG-SRES-IAM-THY-RAS-PROD SG-SRES-IAM-THY-RAS-NONPROD added to the source"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-TS-Session-Hosts"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-IRES-TS-License-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NetBios_Datagram_(UDP)",
               "/infra/services/TCP-5986",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/NetBios_Session_Service_(TCP)",
               "/infra/services/SMB",
               "/infra/services/NetBios_Name_Service_(UDP)",
               "/infra/services/TCP-5985",
               "/infra/services/Win_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS_-_TCP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-SL-IRES-Portable",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD",
               "/infra/domains/default/groups/TF-AG1-SG-TS-Session-Hosts",
               "/infra/domains/default/groups/TF-AG1-SG-IRES-TS-License-Server",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1jump02"
            ]
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
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra",
               #"/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq2",
               #"/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptr2",
               #"/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptra",
               #"/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamptt2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dc2"
            ]
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