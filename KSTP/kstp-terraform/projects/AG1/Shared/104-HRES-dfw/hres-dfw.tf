resource "nsxt_policy_security_policy" "policies_TF-HRES-json_2_tf" {
   display_name    = "TF-HRES"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-HRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1675-SRES-jump-to-hres-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-hres1-lb1-PrimaryIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta1hapProxy",
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta2hapProxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/RDP",
               "/infra/services/HTTP",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta1hapProxy",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta2hapProxy",
               "/infra/domains/default/groups/TF-AG1-IPSET-hres1-lb1-PrimaryIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HRES-AG1"
            }
      }
   rule {
         display_name = "TF-2305-CACF-Test-to-RCP-Perftest-kafka"
         notes        = "SR50941189"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-hres1-lb1-PrimaryIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-RCP-PerfTest-Kafka"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest",
               "/infra/domains/default/groups/TF-AG1-IPSET-RCP-PerfTest-Kafka",
               "/infra/domains/default/groups/TF-AG1-IPSET-hres1-lb1-PrimaryIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HRES-AG1"
            }
      }
   rule {
         display_name = "TF-2319-CACF-Test-to-RCP-PerfTest-Kafka"
         notes        = "SR50941189"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HRES-RCP-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HRES-RCP-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1lpcactest"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HRES-AG1"
            }
      }
######################################################
# migration: IAM_PHASE5
######################################################
   rule {
         display_name = "TF-1412-WIN-Jump-AT-to-HRES-SSH-Proxy-for-AG-Prod-Instance"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-HRES-ag1h1lpta1ssh-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-HRES-TALOS-SSHProxy-SharedProd"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-HRES-TALOS-SSHProxy-SharedProd",
               "/infra/domains/default/groups/TF-AG1-IPSET-HRES-ag1h1lpta1ssh-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster03",
               "/infra/domains/default/groups/TF-AG1-IPSET-SRES-OCP-Cluster6-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HRES-AG1"
            }
      }
   rule {
         display_name = "TF-1675-SRES-jump-to-hres-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-hres1-lb1-PrimaryIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta2hapProxy",
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta1hapProxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta2hapProxy",
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta1hapProxy",
               "/infra/domains/default/groups/TF-AG1-IPSET-hres1-lb1-PrimaryIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HRES-AG1"
            }
      }
######################################################
# migration: IAM_PHASE8
######################################################
   rule {
         display_name = "TF-1677-hres-proxy-to-BDS-Master-Repo"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta1hapProxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-ag1h1lpta1hapProxy",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HRES-AG1"
            }
      }
   rule {
         display_name = "TF-1706-Sres-OCP-to-Proxy-VIP-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1h1lpta2hap-vip",
               "/infra/domains/default/groups/TF-AG1-IPSET-hres1-lb1-PrimaryIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-443",
               "/infra/services/TCP-16443-17443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-ag1h1lpta2hap-vip",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster05",
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-AG1-IPSET-hres1-lb1-PrimaryIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-HRES-AG1"
            }
      }
}