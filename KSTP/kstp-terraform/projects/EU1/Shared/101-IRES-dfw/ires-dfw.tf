resource "nsxt_policy_security_policy" "policies_TF-IRES-eu_sres_wave2" {
   display_name    = "TF-IRES"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-IRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-5752-Connectivity-between-SL-and-domain-controllers"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SolarWinds-DC"
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
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AD-DNS",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SolarWinds-DC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-7600-JDBC-Integration-for-STaaS-Dashboard"
         notes        = "SR51201165"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascno000iswrm",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspno000iswrm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3306"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascno000iswrm",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspno000iswrm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPtmmch",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlPdshbrd"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
      ######################################################
# migration: eu_sres_wave3
######################################################
   rule {
         display_name = "TF-5951-SL1-to-DB2-Servers"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspdb000iswrm",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascdb000iswrm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000-50006"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspdb000iswrm",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascdb000iswrm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-6338-SL1-DC-DB2-Server"
         notes        = "SR50945970 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000-50006"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-6340-SL1-monitoring-for-WebGUI"
         notes        = "SR50946721"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr4-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr2-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr3-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr1-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr5-NAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspnw000iswrm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16310-16311"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr4-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr2-NAT",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr3-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr1-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspnw000iswrm",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr5-NAT",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-7382-SL1-Prod-to-MnEaaS-Pre-Prod"
         notes        = "SR51128536 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr4-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr2-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr3-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr1-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr5-NAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr4-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr2-NAT",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr3-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr1-NAT",
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-nlaspsl1dcr5-NAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-7543-Qradar-log-collection-by-SFTP-"
         notes        = "SR51187985"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-EU-MSS-QRADAR-DC"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-OTHER-MNEAAS-EU-NWG",
               "/infra/domains/default/groups/TF-EU1-SG-IRES-MNEAAS-EU-NCI",
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-EU-NCI",
               "/infra/domains/default/groups/TF-EU1-SG-OTHER-MNEAAS-EU-NCI",
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-EU-NWG",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-EU-NCI",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-EU-NWG",
               "/infra/domains/default/groups/TF-EU1-SG-IRES-MNEAAS-EU-NWG"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-OTHER-MNEAAS-EU-NWG",
               "/infra/domains/default/groups/TF-EU1-SG-IRES-MNEAAS-EU-NWG",
               "/infra/domains/default/groups/TF-EU1-SG-IRES-MNEAAS-EU-NCI",
               "/infra/domains/default/groups/TF-EU1-SG-EU-MSS-QRADAR-DC",
               "/infra/domains/default/groups/TF-EU1-SG-OTHER-MNEAAS-EU-NCI",
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-EU-NCI",
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-EU-NWG",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-EU-NWG",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNEAAS-EU-NCI"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
######################################################
# migration: eu_sres_wave5
######################################################
   rule {
         display_name = "TF-5681-SRES-Jump-to-SG-IRES-SL1-Collectors-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-IRES-SL1-Collectors"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-6967-Jenkins-Server-Jenkins-Agent"
         notes        = "SR51015109"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-MnEaaS-IBMCloud-K8s-Nodes"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-IPSET-MnEaaS-IBMCloud-K8s-Nodes"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-7855-test"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1ljmp01",
               "10.175.10.130",
               "10.175.10.131"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1ljmp01",
               "10.175.10.130",
               "10.175.10.131"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135",
               "/infra/services/TCP-8888",
               "/infra/services/SSH",
               "/infra/services/TCP-88",
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1ljmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
######################################################
# migration: eu_sres_wave6
######################################################
   rule {
         display_name = "TF-1028-Internet-Proxy-Clients-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Primary-ESXi-vmk0",
               "/infra/domains/default/groups/TF-EU1-SG-SL-IRES-Internet-Proxy-Clients",
               "10.175.10.130-10.175.10.136"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SL-IRES-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3128"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Primary-ESXi-vmk0",
               "/infra/domains/default/groups/TF-EU1-SG-SL-IRES-Internet-Proxy-Clients",
               "/infra/domains/default/groups/TF-EU1-IPSET-SL-IRES-VSI-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SL-IRES-Internet-Proxy-Server"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
   rule {
         display_name = "TF-1124-Terminal-Servers-to-Licensing-Server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-TS-Session-Hosts",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-IRES-TS-License-SErver"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NetBios_Name_Service_(UDP)",
               "/infra/services/TCP-5986",
               "/infra/services/TCP-5985",
               "/infra/services/SMB",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/NetBios_Datagram_(UDP)",
               "/infra/services/NetBios_Session_Service_(TCP)",
               "/infra/services/Win_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS_-_TCP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-TS-Session-Hosts",
               "/infra/domains/default/groups/TF-EU1-SG-IRES-TS-License-SErver",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-Portable"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IRES-EU1"
            }
      }
}