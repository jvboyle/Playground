resource "nsxt_policy_security_policy" "policies_TF-Monitoring-eu_sres_wave2" {
   display_name    = "TF-Monitoring"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-Monitoring"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-8410-SL1-Data-Collector-to-All-Windows-VMs"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOSTS-WindowsOS-All"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/TCP-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOSTS-WindowsOS-All",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-Monitoring-EU1"
            }
      }
   rule {
         display_name = "TF-8411-SL1-Data-Collectors-to-All-Linux-VMs"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1rhellic01",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lnbzztest",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1dxdev02",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1",
               "/infra/domains/default/groups/TF-EU1-HOSTS-LinuxOS-All",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1cntrl1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1rhellic01",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lnbzztest",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzprod2",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1dxdev02",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1sr1lpbzzprod",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-HOST-eu1srlpmsatcld1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpi2pprx1",
               "/infra/domains/default/groups/TF-EU1-HOSTS-LinuxOS-All",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1cntrl1",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-SL-IRES-EM7-Data-Collector"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-Monitoring-EU1"
            }
      }
}