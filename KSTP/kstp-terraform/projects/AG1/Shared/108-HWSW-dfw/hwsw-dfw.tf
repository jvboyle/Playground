resource "nsxt_policy_security_policy" "policies_TF-HWSW-json_2_tf" {
   display_name    = "TF-HWSW"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-HWSW"
   comments        = ""
   sequence_number = 0
   
######################################################
# migration: IAM_PHASE5
######################################################
   rule {
         display_name = "TF-3448-JMP-to-HWW-NA-"
         notes        = "CHGEU0151097"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3459-JMPSER-to-ag1srwphwcgrfdb"
         notes        = "RITM0113729"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
######################################################
# migration: IAM_PHASE6
######################################################
   rule {
         display_name = "TF-3057-HWSW_Str_to_db"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3074-ET1_to_external_IBM"
         notes        = "SR51217276 RITM0115928"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-secure-file-service-cloudapps"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-IPSET-secure-file-service-cloudapps"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3103-HWSW_to_ibmcloud-SSH-DB2-RDP-WEB-Datastage"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-bluezone"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/TCP-9443",
               "/infra/services/SSH",
               "/infra/services/TCP-9093",
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-bluezone",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3157-HWSW-to-IBM-SFS"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM",
               "9.208.59.234"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3158-HWSW-to-Blue-SMTP"
         notes        = "SR51246706"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-SMTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-SMTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3159-HWSW-DB-Access"
         notes        = "SR51246706"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3160-HWSW-Remote-Scripts"
         notes        = "SR51246706"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3161-HWS-Secure-File-server"
         notes        = "SR51246706 RITM0115928 RITM0116703--added one VM ag1srlphwcsss01 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster01-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ap1sr1lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster03-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster01-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ap1sr1lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster03-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3162-HWS-Datastage-Prod"
         notes        = "SR51246706"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-50000",
               "/infra/services/RDP",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3163-HWS-DB-Prod"
         notes        = "SR51246706"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343",
               "/infra/services/SSH",
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3164-HWS-Development-Flows"
         notes        = "SR51246706"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/TCP-9443",
               "/infra/services/SSH",
               "/infra/services/TCP-9093",
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3171-HWSW-to-Internet-Prod-DB"
         notes        = "SR51253684"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-HWSW-SERVERS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-Prod-DB1-INTERNET"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000",
               "/infra/services/TCP-10501"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-Prod-DB1-INTERNET",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-HWSW-SERVERS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3187-SRES-HWSW-Server-to-Blue-Cloud-SanJose"
         notes        = "SR51278412"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-HWSW-SERVERS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-BlueCloud-SanJose"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-HWSW-SERVERS",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-BlueCloud-SanJose"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3193-ag1srwphwcetl01-to-SNI-Network-NY-host"
         notes        = "SR51253684 SR51377801"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HWSW-DB-VM"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-SNI-NYHOST"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1433"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-SNI-NYHOST",
               "/infra/domains/default/groups/TF-AG1-HWSW-DB-VM"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3217-HWSW-ag1srwphwcetl01-to-ag1srlphwcsss01"
         notes        = "CH50098071"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3218-HWSW-ag1srwphwcdb01-to-ag1srlphwcsss01"
         notes        = "CH50098071"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3219-HWSW-ag1srlphwcsss01-to-na-relay-ibm-com"
         notes        = "CH50098071 RITM0126291"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-SMTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-SMTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3224-HWSW-ag1srlphwcsss01-to-IBM-Blue-database-connectivity"
         notes        = "CH50098071"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-database-connectivity"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Blue-database-connectivity"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3243-GRFDS-to-OCP1"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1-NAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1-NAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3272-HWSW-ag1srlphwcsss01-to-bluepages-ibm-com"
         notes        = "SR51361461"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         destination_groups = [
               "9.57.182.78"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3273-HWSW-ag1srlphwcsss01-to-w3-ibm-com"
         notes        = "SR51361461"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         destination_groups = [
               "9.214.128.111"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3274-HWSW-ag1srlphwcsss01-to-itd-nl-ibm-com"
         notes        = "SR51361461"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         destination_groups = [
               "9.142.37.3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3275-HWSW-ag1srlphwcsss01-to-faces-tap-ibm-com"
         notes        = "SR51361461"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         destination_groups = [
               "9.220.2.10"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3317-HWSW360-to-ag1srwphwcgrfds"
         notes        = "SR51388740 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-w3-969"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-w3-969",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3319-IBM-Blue-to-HWSW-SDMS"
         notes        = "SR51392263 RITM0074468"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000",
               "/infra/services/SSH",
               "/infra/services/TCP-50443",
               "/infra/services/HTTPS",
               "/infra/services/TCP-60443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3378-NOT-DEFINED-"
         notes        = "SR51377801"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "9.220.27.85"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3400-HWSW-to-core-ag-db01-gacdw-sl-ibm-com"
         notes        = "RITM0074468"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         destination_groups = [
               "146.89.104.148"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3401-core-ag-db01-gacdw-sl-ibm-com-"
         notes        = "RITM0074468"
         source_groups = [
               "146.89.104.148"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000",
               "/infra/services/SSH",
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcsss01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3440-HWSW-NA-SRES-to-SRES"
         notes        = "CHGEU0151097 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3441-HWSW-NA-SRES-to-AP-SRES"
         notes        = "CHGEU0151097 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-AP-SRES-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-AP-SRES-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3444-HWSW-NA-SRES-to-EU-SRES-"
         notes        = "CHGEU0151097"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-EU-SRES-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-EU-SRES-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3445-SRES-NA-to-HWSW-NA"
         notes        = "CHGEU0151097"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-10051"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3446-AP-SRES-to-HWSW-AP"
         notes        = "CHGEU0151097"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-AP-SRES-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-10051"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-AP-SRES-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3447-EU-SRES-to-HWSW-NA"
         notes        = "CHGEU0151097"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-EU-SRES-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-10051"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-EU-SRES-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3449-NA-HWSW-to-Blue"
         notes        = "CHGEU0151097"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-LDAP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-LDAP",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-Bluepages",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3450-NA-HWSW-to-Blue"
         notes        = "CHGEU0151097"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-NA-RELAY"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-NA-RELAY",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3451-Blue-to-NA-HWSW-"
         notes        = "CHGEU0151097"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3458-Automation-Server-to-HWSW-DB2"
         notes        = "RITM0113694"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-eu1sr1dxdev02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-eu1sr1dxdev02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3481-HWSW-currency-MGMT"
         notes        = "RITM0115580"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-AP-SRES-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-AP-SRES-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3487-ServerMon01-to-Web01"
         notes        = "RITM0115928"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3488-HWSW-NA-SRES-to-EU-SRES-"
         notes        = "RITM0115928"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3490-Mon-to-OCP"
         notes        = "RITM0115928"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-secure-file-service-cloudapps",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ap1sr1lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-anzproductionapp-hwsw-"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-secure-file-service-cloudapps",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ap1sr1lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-anzproductionapp-hwsw-"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3681-GRF-IN-NA"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-in1sr1wpgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-in1sr1wpgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3703-NA-HWSW-to-CACF-CA"
         notes        = "RITM0134876"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CACF-CA-OCP-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CACF-CA-OCP-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3732-HWSW-GRFDB"
         notes        = "RITM0137201"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3751-NA-HWSW-MON-to-IN-HWSW"
         notes        = "RITM0139990"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KSTP-IN-IP-HWSW",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KSTP-IN-IP-HWSW",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KSTP-IN-IP-HWSW",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcmon01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3864-IBM-BLUE-HWSW"
         notes        = "RITM0149144"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
######################################################
# migration: IAM_PHASE8
######################################################
   rule {
         display_name = "TF-3058-Srt_to_web1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3062-web1_to_db1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3066-et1_to_db1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3067-Cet1_to_EU_AP_OCP"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ap1sr1lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AP-SRES-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ap1sr1lpcacprx1-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3070-SRv1todb1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3072-st101_to_db01"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3073-db1_to_Eu"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-3389"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3077-EU-to-HWSW-DB"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-3389",
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3078-cls-to-db"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3081-cstl-to-db-and-web"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-50000",
               "/infra/services/TCP-9093",
               "/infra/services/HTTPS",
               "/infra/services/TCP-3389"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3082-stl-to-db"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3090-HWSW_to_ibmcloud-LDAP"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-LDAP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-LDAP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3091-kafka-live-feed-for-storewise"
         notes        = "SR51217619 RITM0075840"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KAFKA-PROD02-MESSAGEHUB",
               "/infra/domains/default/groups/TF-AG1-IPSET-KAFKA-MH-VZFKDLFLPYDMPMRPRWXT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9093"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KAFKA-PROD02-MESSAGEHUB",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-KAFKA-MH-VZFKDLFLPYDMPMRPRWXT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3093-HWSW_to_ibmcloud-SMTP"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-SMTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-SMTP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3094-IBM-blue-to-HWSW"
         notes        = "SR51217650"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-SERVERS-1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SAP_HTTP",
               "/infra/services/SSH",
               "/infra/services/TCP-50000",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-SERVERS-1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3095-IBM-blue-to-HWSW-"
         notes        = "SR51217650"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-SERVERS-2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SAP_HTTP",
               "/infra/services/SSH",
               "/infra/services/TCP-50000",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-SERVERS-2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3098-HWSW_to_ibmcloud-HTTPS"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-HTTPS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-HTTPS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3099-HWSW_to_ibmcloud-DB2"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-50000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-50000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3102-HWSW_to_ibmcloud-SSH"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-SSH",
               "9.45.126.100"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-SSH",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3104-HWSW_to_ibmcloud-SSH-DB2-RDP-WEB-Datastage-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-bluewashington"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/TCP-50000",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-bluewashington",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3119-HWSW_stl-to-PDR"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8080"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-Internet-Proxy-Server",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3177-blue-to-stl_dbs"
         notes        = "SR51253707"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-50000",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcodb01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3178-blue-to-str01"
         notes        = "SR51253707"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-8196",
               "/infra/services/TCP-8194",
               "/infra/services/TCP-8198",
               "/infra/services/TCP-8192",
               "/infra/services/TCP-8199",
               "/infra/services/HTTPS",
               "/infra/services/TCP-8197",
               "/infra/services/TCP-8195",
               "/infra/services/TCP-8191",
               "/infra/services/RDP",
               "/infra/services/TCP-8190",
               "/infra/services/TCP-9093",
               "/infra/services/TCP-8193"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3188-AG-Proxy-Gacdw-to-HWSW-Server"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-gtscdi-ag-proxy01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-gtscdi-ag-proxy01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3189-ag1srwphwcstr01-to-Blue"
         notes        = "SR512852236"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-LDAP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-LDAP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3313-ag1-to-eu1-"
         notes        = "SR51376490"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlphwcsss01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3314-Copy-of-ag1-to-eu1-"
         notes        = "SR51376490"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlphwcsss01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3512-HWSW-to-Tanzu-WL"
         notes        = "RITM0116981"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-25010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3643-NA-HWSW-to-IN-HWSW"
         notes        = "RITM0129514"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-AG1SRWPHWC"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KSTP-IN-HWSW"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/HTTPS",
               "/infra/services/TCP-50000",
               "/infra/services/RDP",
               "/infra/services/TCP-9043-OPJR-VZo8",
               "/infra/services/TCP-9092-9096"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KSTP-IN-HWSW",
               "/infra/domains/default/groups/TF-AG1-SG-AG1SRWPHWC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3652-IN-HWSW-to-NA-HWSW"
         notes        = "RITM0130082"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KSTP-IN-HWSW"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-AG1SRWPHWC"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-9443",
               "/infra/services/HTTPS",
               "/infra/services/TCP-9043-OPJR-VZo8",
               "/infra/services/RDP",
               "/infra/services/TCP-50000",
               "/infra/services/TCP-9092-9096"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-KSTP-IN-HWSW",
               "/infra/domains/default/groups/TF-AG1-SG-AG1SRWPHWC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3697-HWSW-Storage-To-EU"
         notes        = "RITM0133665"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-SRES01-OCP-Cluster02-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstr01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3884-SRES-WL01-to-HWSW"
         notes        = "RITM0151831"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Host"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcdb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Host"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
######################################################
# migration: IAM_PHASE9
######################################################
   rule {
         display_name = "TF-3053-IBM-blue-to-HWSW"
         notes        = "SR51217650 RITM0120125 RITM0121662 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-446",
               "/infra/services/TCP-447",
               "/infra/services/TCP-444",
               "/infra/services/TCP-8080",
               "/infra/services/SMB",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3059-NA_ETL_to_EU_ETL_DB"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS",
               "/infra/services/TCP-3389",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9093",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3060-ETL1_to_Web1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3061-web1-tost1_etl"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3063-web1_to_srv1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3064-st1_to_web1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3065-et1_to_srv1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3068-srv1_to_et1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3069-Cet1_to_Srv01"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-12201"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3071-srv1_to_cls1"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3079-cls-to-icp"
         notes        = "SR51217276 SR51330117 - Add to destination HOST-Tanzu-Workload-01-subnet HOST-Tanzu-Workload-03-subnet"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ICp-icp2-Ingress-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-agnsrlnicp1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-ICp-icp2-Ingress-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3080-web-to-cls"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3083-stl-to-eu"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpcardb1000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1srlpcardb1000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3084-NA-to-EU-HWSW"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS",
               "/infra/services/TCP-3389",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9093",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3085-EU-to-NA-HWSW-"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS",
               "/infra/services/TCP-3389",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9093",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3086-cstl-cet1-to-wcls"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3087-Copy-of-NA-to-EU-HWSW-"
         notes        = "SR51217276"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000",
               "/infra/services/HTTPS",
               "/infra/services/TCP-3389",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9093",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwccog",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3089-HWSW_to_ibmcloud-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-50001"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50001"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-50001",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3096-IBM-blue-to-HWSW-"
         notes        = "SR51217650"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-wdcdmyyz945126"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/SAP_HTTP",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-wdcdmyyz945126"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3097-IBM-blue-to-HWSW-"
         notes        = "SR51217650"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-SERVERS-3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/SAP_HTTP",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9-SERVERS-3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3100-HWSW_to_ibmcloud-API"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-Retain-API"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3181",
               "/infra/services/TCP-3182"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-Retain-API",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3101-HWSW_to_ibmcloud-HTTPS"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9300"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9300",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-IBM-9300",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcweb01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3105-HWSW_to_ibmcloud-SSH-DB2-RDP-WEB-Datastage-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-bluezone",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-bluewashington"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP",
               "/infra/services/TCP-50000",
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-bluezone",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-bluewashington"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3106-HWSW_to_ibmcloud-DB2"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-22222"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3107-HWSW_to_ibmcloud-DB2"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-IBM-9-DB2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3201"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-IBM-9-DB2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3108-HWSW_to_ibmcloud-mySql-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-3306"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3306"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-3306"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3109-HWSW_to_ibmcloud-DB2"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-446"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-446"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-446"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3110-HWSW_to_ibmcloud-rdp"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-RDP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-RDP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3111-HWSW_to_ibmcloud-DB2-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-50012"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50012"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-50012"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3112-HWSW_to_ibmcloud-DB2-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-50002"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50002"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-50002"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3113-HWSW_to_ibmcloud-DB2-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-51000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-51000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-51000"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3114-HWSW_to_ibmcloud-DB2-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-52000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-52000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-52000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3115-HWSW_to_ibmcloud-DB2-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-60000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-60000"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3116-HWSW_to_ibmcloud-DB2-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-60004"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60004"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-60004",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3117-HWSW_to_ibmcloud-DB2-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-59000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-59000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-59000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3118-HWSW_to_ibmcloud-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-60084"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60084"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-ibmcloud-DB2-60084"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3129-HWSW-to-IBM-blue-"
         notes        = "SR51217636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "9.217.0.113"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10501"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3156-HWSW_to_ibmcloud-RDP"
         notes        = "SR51252491"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445",
               "/infra/services/TCP-49152-65535",
               "/infra/services/UDP-138",
               "/infra/services/TCP-135",
               "/infra/services/UDP-137",
               "/infra/services/TCP-137",
               "/infra/services/TCP-138"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1wtslic01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3168-HWSW-to-OCP-VIP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster06"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster06"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3181-cstl01-cetl01-to-blue-"
         notes        = "SR51278412"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-dgawdchwswa01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50001"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-dgawdchwswa01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3182-cet01-to-blue"
         notes        = "SR51278412"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ddydalssdev01",
               "/infra/domains/default/groups/TF-AG1-IPSET-mopbzp174187"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ddydalssdev01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-mopbzp174187"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3192-SRES-ag1srwphwcetl01-to-VISR16LDWH-01-to-"
         notes        = "SR51278412"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-VISR16LDWH-01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-VISR16LDWH-01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3199-HWSW-ag1srwphwcetl01-to-secure-file-service"
         notes        = "SR51293636"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-secure-file-service",
               "/infra/domains/default/groups/TF-AG1-IPSET-secure-file-service-cloudapps"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-secure-file-service",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-secure-file-service-cloudapps"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3282-HWSW-ag1srwphwcetl01"
         notes        = "SR51364130"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "9.209.228.88"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3283-HWSW-ag1srwphwcetl01-to-blue"
         notes        = "SR51364130"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "9.209.244.151"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-22"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3284-Blue-to-ag1srwphwcstl01"
         notes        = "SR51360851 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3312-ag1-to-eu1"
         notes        = "SR51376490"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlphwcsss01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-60000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SRES-eu1srlphwcsss01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3336-SG-SRES-HWSW-SERVERS"
         notes        = "SR51401173 RITM0135650"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-AP-ProxyVIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10001",
               "/infra/services/TCP-10501"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-CDI-AP-ProxyVIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3344-HWSW-to-GACDW-test-servers"
         notes        = "SR51401173"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-GACDW-DB-test"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-GACDW-DB-test",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3345-HWSW-to-GACDW-servers"
         notes        = "SR51401173"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-GACDW-AP-DB"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10001",
               "/infra/services/TCP-10501"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-GACDW-AP-DB",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3464-ILMT-API-Connectivity"
         notes        = "RITM0114488"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-pdywdchmc0101-sl-bluecloud-ibm-com",
               "/infra/domains/default/groups/TF-AG1-IPSET-ppywdcmalmt01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ppywdclalmt01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ppywdchflmt02",
               "/infra/domains/default/groups/TF-AG1-IPSET-ppywdcigaag01",
               "/infra/domains/default/groups/TF-AG1-IPSET-pgasydaic0101",
               "/infra/domains/default/groups/TF-AG1-IPSET-ppyfragat0101"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-pdywdchmc0101-sl-bluecloud-ibm-com",
               "/infra/domains/default/groups/TF-AG1-IPSET-ppywdcmalmt01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ppywdclalmt01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ppywdchflmt02",
               "/infra/domains/default/groups/TF-AG1-IPSET-ppywdcigaag01",
               "/infra/domains/default/groups/TF-AG1-IPSET-pgasydaic0101",
               "/infra/domains/default/groups/TF-AG1-IPSET-ppyfragat0101",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3486-HWSW-to-Blue"
         notes        = "SREU12964811"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-Blue"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5020"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HWSW-Blue",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3499-ag1srwphwcetl01-to-IBM"
         notes        = "RITM0118191"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ZXGCA-VIPA-UK-IBM-COM"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SAP_Enqueue_Svr",
               "/infra/services/SAP_Dispatcher"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ZXGCA-VIPA-UK-IBM-COM"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3500-HWSW-to-IBM"
         notes        = "RITM0116926 RITM0118742"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-bjy7vr1-tms-stglabs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/MySQL",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-bjy7vr1-tms-stglabs",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3521-HWSW-NA-to-EU"
         notes        = "RITM0119264"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9093"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcetl-",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-eu1sr1wphwcweb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3581-HWSW-AP-to-NA-SRES"
         notes        = "RITM0121173"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-IP-AP1SRWPHWC"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9093"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-AP1-IP-AP1SRWPHWC"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3582-HWSW-Canada-to-NA-SRES"
         notes        = "RITM0121173"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswstr01ra"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9093"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswetl01ra",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-ca1phwswstr01ra"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3702-EU-Server-to-HWSW-NA"
         notes        = "RITM0134861"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1srlpelk1001"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9092-9096"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-eu1srlpelk1001",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3802-HWSW-Azure-CIO"
         notes        = "RITM0136157"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Azure-CIO"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50001",
               "/infra/services/TCP-9081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Azure-CIO",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcsrv01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3885-SRES-WL01-to-HWSW"
         notes        = "RITM0151831"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Host"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcstl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Host"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
   rule {
         display_name = "TF-3976-production-etl-hwsw"
         notes        = "RITM0154383"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-CLOUD-SERVER"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-446"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcetl01",
               "/infra/domains/default/groups/TF-AG1-IPSET-IBM-CLOUD-SERVER"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HWSW-AG1"
            }
      }
}