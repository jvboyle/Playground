resource "nsxt_policy_security_policy" "policies_TF-NSX-V2T-json_2_tf" {
   display_name    = "TF-NSX-V2T"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-NSX-V2T"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-2660-Access-Installer-Interface-from-SRES-WIN-JH"
         notes        = "SR51098996 To Access the installer interface from SRES Windows Jump servers"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-TKG-MGMTs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5555",
               "/infra/services/TCP-31234",
               "/infra/services/TCP-30167",
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-TKG-MGMTs",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2834-SRES-JH-to-TKG-Cluster-Access"
         notes        = "SR51098996 SRES JH to TKG cluster access"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2835-AUTH-Login-to-TKG-Clusters-from-Jumphosts"
         notes        = "SR51098996 Allow Login to the TKG Clusters"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-31234",
               "/infra/services/TCP-30167",
               "/infra/services/TCP-31637",
               "/infra/services/TCP-31531"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2896-OCP-4-6-build"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "100.71.244.0/24"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/DNS-UDP",
               "/infra/services/TCP-30000-32767",
               "/infra/services/HTTP",
               "/infra/services/DNS",
               "/infra/services/HTTPS",
               "/infra/services/TCP-8500",
               "/infra/services/TCP-8181",
               "/infra/services/TCP-18080",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-8001",
               "/infra/services/TCP-8053",
               "/infra/services/TCP-4789",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-10250",
               "/infra/services/TCP-6443",
               "/infra/services/TCP-22623"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2916-NSX-V-to-T-migration-playbooks"
         notes        = "SR51162904"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr0",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ag1nsxt-vc-ag1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr1",
               "/infra/domains/default/groups/TF-AG1-IPSET-INFRA-ag1nsxm1-",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ag1nsxt-vc-sp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr0",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ag1nsxt-vc-ag1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-nsxt-nsxt-ctrlmgr1",
               "/infra/domains/default/groups/TF-AG1-IPSET-INFRA-ag1nsxm1-",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ADNSnsxt1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-ag1nsxt-vc-sp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2952-MoM-Jump-server-AG-to-CACF-NA-DevTest-cluster"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "100.71.244.2",
               "100.71.244.4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-6443",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-3023-OCP5-to-CACF-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
         rule {
         display_name = "TF-3832-CISO-AWS-to-KSTP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-CISO-TOOLS-AWS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-RMQ-PROD-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpiamciprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-5671"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-IAM-CIO-RMQ-PROD-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpiamciprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1sr1lpiamciprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-CISO-TOOLS-AWS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
######################################################
# migration: IAM_PHASE5
######################################################
   rule {
         display_name = "TF-2650-V2T-Test-rule-1"
         notes        = "SR51025105"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "100.65.2.0/23",
               "100.71.234.0/23",
               "100.64.65.0/24",
               "10.211.161.0/24",
               "100.71.242.0/24",
               "100.71.243.0/24",
               "100.71.244.0/27",
               "10.211.12.192/26",
               "100.65.0.0/23"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICMP_Echo_Reply",
               "/infra/services/SSH",
               "/infra/services/ICMP_Time_Exceeded",
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/ICMP-GROUP",
               "/infra/services/ICMP_Destination_Unreachable",
               "/infra/services/ICMP_Redirect"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2660-Access-Installer-Interface-from-SRES-WIN-JH"
         notes        = "SR51098996 To Access the installer interface from SRES Windows Jump servers"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-TKG-MGMTs"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-31234",
               "/infra/services/TCP-5555",
               "/infra/services/TCP-30167",
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-TKG-MGMTs",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2778-Tanzu-Mgmt-to-IRES-LDAP"
         notes        = "NSX-T POC Migration"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-sres-tanzu-workload-06",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP06-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster05-SNAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-sres-tanzu-workload-05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NTP",
               "/infra/services/LDAP",
               "/infra/services/TCP-636"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-sres-tanzu-workload-06",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-AD-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP06-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster05-SNAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-sres-tanzu-workload-05",
               "/infra/domains/default/groups/TF-AG1-IPSET-NSXT-SRES-OCP-Cluster04-SNAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2834-SRES-JH-to-TKG-Cluster-Access"
         notes        = "SR51098996 SRES JH to TKG cluster access"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2835-AUTH-Login-to-TKG-Clusters-from-Jumphosts"
         notes        = "SR51098996 Allow Login to the TKG Clusters"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-31531",
               "/infra/services/TCP-31637",
               "/infra/services/TCP-30167",
               "/infra/services/TCP-31234"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-mgmt-subnets",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-02-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2889-DNS-delegation-to-AVI"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AVI-NS1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-AVI-NS1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2896-OCP-4-6-build"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "100.71.244.0/24"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8181",
               "/infra/services/SSH",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/HTTPS",
               "/infra/services/TCP-8053",
               "/infra/services/TCP-6443",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-8080",
               "/infra/services/HTTP",
               "/infra/services/TCP-4789",
               "/infra/services/TCP-22623",
               "/infra/services/DNS-UDP",
               "/infra/services/TCP-18080",
               "/infra/services/TCP-10250",
               "/infra/services/TCP-8443",
               "/infra/services/TCP-8001",
               "/infra/services/TCP-30000-32767",
               "/infra/services/TCP-8500"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster7-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SL-IRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2952-MoM-Jump-server-AG-to-CACF-NA-DevTest-cluster"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "100.71.244.2",
               "100.71.244.4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS",
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2969-NSXV_Windows_JH_to_NSXT_OCP4"
         notes        = "SR51195107"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-3023-OCP5-to-CACF-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpi1pprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-ag1sr1lpi1pprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-3870-DRES308-NTP-DNS"
         notes        = "RITM0149324"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d308-AD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d308-AD"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
######################################################
# migration: IAM_PHASE8
######################################################
   rule {
         display_name = "TF-2966-SRES_ocp_5_to_NSXT_NFS"
         notes        = "SR51198268"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpocpnfs01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NFS-Server-TCP",
               "/infra/services/NFS_Client_UDP",
               "/infra/services/NFS-Server-UDP",
               "/infra/services/NFS_Client",
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpocpnfs01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP05-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-2967-NSXT_SRES_OCP4_to_OCP2vip"
         notes        = "SR51195107"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP04-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP04-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-3183-SRES_ocp_6_to_NSXT_NFS-"
         notes        = "SR51198268"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP06-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpocpnfs01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NFS-Server-TCP",
               "/infra/services/NFS_Client_UDP",
               "/infra/services/NFS-Server-UDP",
               "/infra/services/NFS_Client",
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpocpnfs01",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP07-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-NSXT-OCP06-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-3372-NA-to-EU-MoM"
         notes        = "SR51426553"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SG-SRES-OCP-Cluster05-MOM"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU1-SG-SRES-OCP-Cluster05-MOM",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
######################################################
# migration: IAM_PHASE9
######################################################
   rule {
         display_name = "TF-3315-HWSH-to-AIOps-Tanzu"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Brazil-Maximo-Shared-Dev-QA",
               "/infra/domains/default/groups/TF-AG1-IPSET-Brazil-Maximo-Shared-Prod",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-eu1sr1dxdev02",
               "158.87.52.5"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlphwcls01",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-04-Subnet",
               "/infra/domains/default/groups/TF-AG1-IPSET-Brazil-Maximo-Shared-Dev-QA",
               "/infra/domains/default/groups/TF-AG1-IPSET-EU-eu1sr1dxdev02",
               "/infra/domains/default/groups/TF-AG1-IPSET-Brazil-Maximo-Shared-Prod",
               "/infra/domains/default/groups/TF-AG1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-3869-DRES308-AD"
         notes        = "RITM0148619"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d308-Server"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Win_2008_-_RPC,_DCOM,_EPM,_DRSUAPI,_NetLogonR,_SamR,_FRS",
               "/infra/services/LDAP-UDP",
               "/infra/services/NBSS",
               "/infra/services/DNS-YgYUhldeX",
               "/infra/services/WINS-UDP",
               "/infra/services/Active_Directory_Server_UDP",
               "/infra/services/NBDG-Unicast",
               "/infra/services/NTP_Time_Server",
               "/infra/services/Active_Directory_Server",
               "/infra/services/SOAP",
               "/infra/services/NBNS-Unicast",
               "/infra/services/SMTP",
               "/infra/services/Windows-Global-Catalog-over-SSL",
               "/infra/services/WINS",
               "/infra/services/NBDG-Broadcast",
               "/infra/services/MS-DS-TCP",
               "/infra/services/DHCP-Server",
               "/infra/services/NBNS-Broadcast",
               "/infra/services/KERBEROS-UDP",
               "/infra/services/LDAP-over-SSL",
               "/infra/services/MS-DS-UDP",
               "/infra/services/MS_RPC_TCP",
               "/infra/services/Windows-Global-Catalog",
               "/infra/services/KERBEROS",
               "/infra/services/LDAP",
               "/infra/services/DNS-UDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS",
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1d308-Server"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
   rule {
         display_name = "TF-3878-DRES327-AD-"
         notes        = "RITM0148619"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR327-VMs"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-60014"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR327-VMs",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-STaaS-AD-DNS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-AG1"
            }
      }
}