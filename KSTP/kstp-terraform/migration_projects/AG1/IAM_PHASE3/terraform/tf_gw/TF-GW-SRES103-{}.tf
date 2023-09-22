resource "nsxt_policy_gateway_policy" "policies_TF-SRES-IAM_PHASE3" {
   display_name    = "TF-GW-SRES103-{}"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-SRES103-{}"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-2291-ALL-Win-Servers-to-Staas2-&-DNS02"
         notes        = "SR50942226"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-All-Windows-Hosts"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wdns02",
               "/infra/domains/default/groups/TF-AG1-IPSET-IRES-NAT-ag1sr1staas2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1staas2"
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
         display_name = "TF-3176-Licensing-server-AD-integration"
         notes        = "CH50096630 SR51365221 - ag1srwpenaPOK1 SR51365221 - ag1srwpenaPOK2 RITM0116949 ----add the below server ag1sr1wpiamsbq1 158 87 49 196 ag1sr1wpiamsbt1 158 87 49 197 ag1sr1wpiamsbr1 158 87 49 198 ag1sr1wpiamsbe1 158 87 49 199"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpenapok1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1w19lic01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-389",
               "/infra/services/UDP-53",
               "/infra/services/UDP-389",
               "/infra/services/TCP-445",
               "/infra/services/TCP-88",
               "/infra/services/TCP-53",
               "/infra/services/TCP-139",
               "/infra/services/TCP-49152-65535",
               "/infra/services/TCP-135"
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
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-me-test-e4v7g-netcool",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-meaas-noi-inn6y-nc2",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-NAT-me-test-e4v7g-netcool"
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
               "/infra/domains/default/groups/TF-AG1-IPSET-test-oc4q5-omnibus",
               "/infra/domains/default/groups/TF-AG1-IPSET-meaas-noi-inn6y-nco-",
               "/infra/domains/default/groups/TF-AG1-IPSET-test-rdszz-omnibus"
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
         display_name = "TF-3477-AG-SRES-to-AG-SRES"
         notes        = "RITM0114560"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5"
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
         display_name = "TF-3493-NA-SRES-servers-to-IRES-JH"
         notes        = "RITM0117063"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-CIO-WIN-LIN-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-UDP",
               "/infra/services/LDAP",
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/DNS-UDP",
               "/infra/services/TCP-135",
               "/infra/services/SMB",
               "/infra/services/TCP-139",
               "/infra/services/KERBEROS-TCP",
               "/infra/services/DNS-YgYUhldeX"
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-Icp-icp1-Ingress-VIP"
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
         display_name = "TF-3536-IAM-CIO-PROD--Proxy-to-Proxy"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
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
         display_name = "TF-3537-IAM-CIO-PROD--Proxies-to-Secret"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
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
         display_name = "TF-3538-IAM-CIO-PROD--Rabbit-MQ-"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
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
         display_name = "TF-3539-IAM-CIO-PROD--Rabbit-MQ"
         notes        = "RITM0120061 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD"
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
         display_name = "TF-3541-IAM-CIO-PROD--Remote-Server"
         notes        = "RITM0120061 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-9000"
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
         display_name = "TF-3546-IAM-CIO-PROD--Secret-to-Secret"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/SSH",
               "/infra/services/RDP"
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
         display_name = "TF-3547-IAM-CIO-PROD--Linux-VMs"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-LINUX-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/SSH",
               "/infra/services/RDP"
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
         display_name = "TF-3548-IAM-CIO-PROD--WIN-(RDP)"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-WINDOWS-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
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
         display_name = "TF-3549-IAM-CIO-PROD--Secret-to-MS-SQL"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMB",
               "/infra/services/NetBios_Session_Service_(TCP)",
               "/infra/services/SAP_Exchange_Groupware_Connector_(DCOM)",
               "/infra/services/APP_MSSQL_TCP"
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
         display_name = "TF-3550-IAM-CIO-PROD--Secret-to-Session-Server"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1wpiamcifs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445"
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
         display_name = "TF-3551-IAM-CIO-PROD--SQL-to-SQL"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD"
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
         display_name = "TF-3552-IAM-CIO-PROD--Bulkloader-to-Proxies"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-BLKLD-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD"
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
         display_name = "TF-3553-IAM-CIO-PROD--ALL-VMs-to-Splunk"
         notes        = "RITM0121201"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-All-VMs"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-IRES-Qradar"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Syslog_(TCP)",
               "/infra/services/Syslog_(UDP)"
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
         display_name = "TF-3560-IAM-CIO-PROD--Bulkloader-to-BluePages"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-BLKLD-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EXT-BLUEPAGES"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
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
         display_name = "TF-3561-IAM-CIO-PROD--Distribution-Engine-to-Secret"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
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
         display_name = "TF-3562-IAM-CIO-PROD--IBM-Blue-to-Remote-Access-Server"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
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
         display_name = "TF-3563-IAM-CIO-PROD--Secret-to-SMTP"
         notes        = "RITM0120061"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
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
         display_name = "TF-3565-IAM-CIO-PROD--All-WINDOWS-to-Domain-Controllers"
         notes        = "RITM0120061 RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-WINDOWS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-WINDOWS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/KERBEROS",
               "/infra/services/DNS-UDP",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/MS-DS-TCP",
               "/infra/services/LDAP-UDP",
               "/infra/services/LDAP",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/SOAP",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SMTP",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/NBSS",
               "/infra/services/NBNS-Unicast",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/NBDG-Unicast",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/MS-DS-UDP",
               "/infra/services/WINS",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/DHCP-Server",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS-UDP"
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
         display_name = "TF-3566-IAM-SandBox-nonPROD--All-but-DB-to-Proxy"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-NODB"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9000",
               "/infra/services/NBSS",
               "/infra/services/SSH",
               "/infra/services/SNMP-Recieve",
               "/infra/services/TCP-8892",
               "/infra/services/SMB",
               "/infra/services/TCP-9112",
               "/infra/services/TCP-135",
               "/infra/services/HTTPS",
               "/infra/services/TCP-9437-9439"
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
         display_name = "TF-3574-SRES-to-IRES"
         notes        = "RITM0121921"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-135",
               "/infra/services/TCP-88"
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
         display_name = "TF-3587-ag1sr1wpiamcira-to-sandbox"
         notes        = "RITM0122558"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcie2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcir3",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcifs",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamciq2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/RDP"
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
         display_name = "TF-3588-IAM-SandBox-nonPROD--Secret-to-SMTP"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
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
         display_name = "TF-3589-IAM-SandBox-nonPROD--Secret-to-Session-Server"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-445"
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
         display_name = "TF-3590-IAM-SandBox-nonPROD--Secret-to-MS-SQL"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-139",
               "/infra/services/TCP-135",
               "/infra/services/TCP-1433",
               "/infra/services/TCP-445"
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
         display_name = "TF-3591-IAM-SandBox-nonPROD--Rabbit-MQ"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1"
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
         display_name = "TF-3592-IAM-SandBox-nonPROD--Proxy-to-Secret"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
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
         display_name = "TF-3593-IAM-SandBox-nonPROD--Distribution-Engine-to-Secret"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
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
         display_name = "TF-3594-IAM-SandBox-nonPROD--Bulkloader-to-BluePages"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EXT-BLUEPAGES"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/LDAP-over-SSL"
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
         display_name = "TF-3595-IAM-SandBox-nonPROD--Bulkloader-to-Proxy"
         notes        = "RITM0120062"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1"
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
         display_name = "TF-3610-IAM-SandBox-nonPROD--All-but-DB-to-Proxy"
         notes        = "RITM0124652"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-NODB"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-SANDBOX-NODB"
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
         display_name = "TF-3612-IAM-CIO-PROD--Secret-to-Proxy-VIP"
         notes        = "RITM0125238"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcit1"
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
         display_name = "TF-3617-IAM-nonPROD--RAS-to-Sandbox-all-VMs"
         notes        = "RITM0125257"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/RDP"
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
         display_name = "TF-3623-IAM-CIO-PROD--VPN-to-Kyndryl-net-URL"
         notes        = "RITM0126230"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
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
         display_name = "TF-3624-IAM-CIO-PROD--VPN-to-Kyndryl-net-URL"
         notes        = "RITM0126419 RITM0129951"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-PROXY-PROD-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1"
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
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbq1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lniamsbbkl1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbr1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-PROXY-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbfs",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-SECRET-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RMQ-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-MSSQL-PROD",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PROD"
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
         display_name = "TF-3722-iam-to-Sres-"
         notes        = "RITM0136195"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-45580",
               "/infra/services/TCP-5986",
               "/infra/services/TCP-389",
               "/infra/services/UDP-5986",
               "/infra/services/RDP",
               "/infra/services/TCP-636",
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
         display_name = "TF-3723-iam-to-sres"
         notes        = "RITM0136195"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6"
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
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-49152-65535",
               "/infra/services/LDAP-over-SSL-UDP",
               "/infra/services/TCP-135",
               "/infra/services/UDP-445",
               "/infra/services/TCP-445",
               "/infra/services/TCP-49152-65535",
               "/infra/services/TCP-139",
               "/infra/services/TCP-5985",
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
         display_name = "TF-3739-IAMaaS-CIO-DE-PROD"
         notes        = "RITM0137980"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamcira"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3390",
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
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/UDP-49152-65535",
               "/infra/services/LDAP-over-SSL-UDP",
               "/infra/services/TCP-135",
               "/infra/services/UDP-445",
               "/infra/services/TCP-445",
               "/infra/services/TCP-49152-65535",
               "/infra/services/TCP-139",
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
         display_name = "TF-3742-Blue-to-IAM-CIO-DE-PROD"
         notes        = "RITM0138889"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/SSH",
               "/infra/services/TCP-5985",
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
         display_name = "TF-3743-Blue-to-IAM-CIO-DE-PROD"
         notes        = "RITM0138889"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/SSH",
               "/infra/services/TCP-5985",
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
         display_name = "TF-3758-SRES-to-Azure-INfra-VNET"
         notes        = "RITM0136763"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Azure-Infra-VNET"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3759-SRES-to-Azure-Infra-Res-VNET"
         notes        = "RITM0136763"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-azure-infra-res-vnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/RDP",
               "/infra/services/TCP-5985"
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
         display_name = "TF-3760-SRES-to-Eastern-Creek-DC"
         notes        = "RITM0136763"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-CIO-DE-PROD",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbe1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Eastern-Creek-DC"
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
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep6",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamuep5",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1wpiamuep3"
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
               tag = "TF-SRES-AG1"
            }
      }
   rule {
         display_name = "TF-3825-UAT-to-DSS-CIO"
         notes        = "RITM0143742"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-UAT-Shared"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpiamciprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamsbt1"
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