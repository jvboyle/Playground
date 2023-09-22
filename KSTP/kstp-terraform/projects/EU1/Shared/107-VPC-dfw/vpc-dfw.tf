resource "nsxt_policy_security_policy" "policies_TF-VPC-json_2_tf" {
   display_name    = "TF-VPC"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-VPC"
   comments        = ""
   sequence_number = 0
    rule {
         display_name = "TF-8359-KSI-Logstash-Cluster"
         notes        = "RITM0074428"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1dxdev02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-6262",
               "/infra/services/TCP-6264"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1dxdev02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8194-Chatops"
         notes        = "SR51384661"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1dxdev02"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-Private-Service-Endpoints"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-31421"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1dxdev02",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-Private-Service-Endpoints"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
  
      ######################################################
# migration: eu_sres_wave3
######################################################
   rule {
         display_name = "TF-7064-SRES-MnE-to-NOI-ROKS"
         notes        = "SR50975710 SR51101872 SR51140506"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-noi-nonprod-subnet1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-noi-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-7065-NOI-ROKS-to-SRES-MnE"
         notes        = "SR50975710 SR51101872"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-noi-nonprod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp",
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-MEaaS-PreProd"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-4500",
               "/infra/services/TCP-16311",
               "/infra/services/TCP-6969",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-noi-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp",
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-MEaaS-PreProd"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-7308-IKS-MnE"
         notes        = "SR51078642 SR51115193"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcwg",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspnw000iswrm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easweb",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Pentest-16351"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpwg",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcwg",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspnw000iswrm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easweb",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-7337-SRES-sync-Daemon-VPC"
         notes        = "SR51108392 SR51160840 SR51186346 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejtnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1ermp",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1etnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-7531-IKS-Prod-DB2-Server"
         notes        = "SR51199156"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb2",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspdb000iswrm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascdb000iswrm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb2",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspdb000iswrm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb2",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascdb000iswrm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8128-M-EaaS-Portal"
         notes        = "SR51368296"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb2",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspdb000iswrm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascdb000iswrm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpdb",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000dc1rm",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecdb2",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlaspdb000iswrm",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epdb2",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlascdb000iswrm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8699-IKS-Prod-WebGUI"
         notes        = "RITM0121297"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1erms"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16311"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg2",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecwg1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epwg2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascno000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejpwg",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ejcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnw000m1ermp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8700-AIOPS-VPC-NA-to-EU-SRES"
         notes        = "RITM0121556"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1erms"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-9079-Dynatrace-to-Portal"
         notes        = "RITM0144658"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecnp3",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-9113-Netcool-to-ag-work01"
         notes        = "RITM0148555"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-ag-work01",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-ag-work01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-9114-AG-VPC-to-Netcool-LDS"
         notes        = "RITM0148555"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-ag-work01",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1erms"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascdb000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-ag-work01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-9115-AG-VPC-to-Netcool"
         notes        = "RITM0148555"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-ag-work01",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1erms",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Netcool_16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES-ag-work01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-9153-Netcool-Pre-prod-to-OCP"
         notes        = "RITM0152496"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1-nat"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000m1erms",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1-nat"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
######################################################
# migration: eu_sres_wave4
######################################################
   rule {
         display_name = "TF-8824-VPC-IKS-to-IAMaaS"
         notes        = "RITM0127132"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam20",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam70",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam50",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam30",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam95",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam40",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam60",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam80",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai90"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam20",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam80",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam70",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam50",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam30",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam40",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam60",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam95",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai90"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8956-VPC-to-SRES"
         notes        = "RITM0137233"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srwnisiwin01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7443",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srwnisiwin01",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8971-SSP-mailing"
         notes        = "RITM0138822 RITM0142793"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-MAIL"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-MAIL",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8996-VPC-to-SRES"
         notes        = "RITM0140502"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-IAMaaS-RITM0140502"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-IAMaaS-RITM0140502",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
      ######################################################
# migration: eu_sres_wave5
######################################################
   rule {
         display_name = "TF-7099-TEMP-AG1-Shared-NonProd-IKS-to-MnE"
         notes        = "SR51014093"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-nlasabuildisw00",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlasabuildisw00",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-Private-Service-Endpoints",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-31673",
               "/infra/services/HTTPS",
               "/infra/services/TCP-31480"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-nlasabuildisw00",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-Private-Service-Endpoints",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-7159-Access-to-VPC"
         notes        = "SR51327244"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet1-nat",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-noi-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1-nat",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1-nat"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet1-nat",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-noi-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1-nat",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-sh-prod-subnet2",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1-nat"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8126-AG1-Shared-NonProd-IKS-to-MnE-"
         notes        = "SR51369687 SR51398149"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srwdhwcgrfds"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srwdhwcgrfds",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-ag1-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8254-HWSW-GRF-VPC"
         notes        = "SR51415692"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srwphwcgrfdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-dx-platform-prod-subnet1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
   rule {
         display_name = "TF-8264-SRES-to-Softlayer-Private-Service-endpoints"
         notes        = "SR51379271 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-nlasabuildisw00",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-Private-Service-Endpoints"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-31220"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-nlasabuildisw00",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-Private-Service-Endpoints"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
      ######################################################
# migration: eu_sres_wave6
######################################################
   rule {
         display_name = "TF-9279-WebGui-Access"
         notes        = "RITM0157623"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-16311"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-vpc-20-mneaas-prod-subnet1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-EU1"
            }
      }
}