resource "nsxt_policy_security_policy" "policies_TF-SRES-RPA-json_2_tf" {
   display_name    = "TF-SRES-RPA"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-SRES-RPA"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-5952-CAR-APP-internal-to-RPA"
         notes        = "SR50869997 SR50873939 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-GNA-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-GNA-Pool-Images"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES1-ag1srlpcarwas1000",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcarwas1000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-GNA-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-GNA-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-IPSET-AG1-SRES1-ag1srlpcarwas1000",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcarwas1000"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
      rule {
         display_name = "TF-7505-RPA-Madrid-to-SRES-RPA"
         notes        = "SR51127608"
         source_groups = [
               "158.98.41.85", 
			      "158.98.41.86"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlplmt3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
######################################################
# migration: eu_sres_wave6
######################################################
   rule {
         display_name = "TF-5367-SRES-RPA-to-IBM-Blue"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-RPA-BP-ALL-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-RPA-AA-ALL-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "9.63.66.23"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2001"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-RPA-BP-ALL-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-RPA-AA-ALL-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
   rule {
         display_name = "TF-8921-RPA-to-India-Payroll-Azure"
         notes        = "RITM0136146 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Pool-Images",
               "158.87.60.2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-India-Payroll-zw2uspriv-app-kyndryl-net"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-India-Payroll-zw2uspriv-app-kyndryl-net",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
   rule {
         display_name = "TF-9006-RPA-to-Azure-"
         notes        = "RITM0141335"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Desktop-Pool",
               "158.87.60.2"
            ]
         destination_groups = [
               "138.95.238.8"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
   rule {
         display_name = "TF-9105-Copy-of-RPA-to-Azure-"
         notes        = "RITM0147990 RITM0152303"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         destination_groups = [
               "138.95.95.30",
               "138.95.96.26",
               "138.95.103.5",
               "138.95.101.5",
               "138.95.96.24",
               "138.95.96.25",
               "138.95.94.30",
               "138.95.102.5",
               "138.95.93.30"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-3200-3399"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-BP-GTS-WLA-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
   rule {
         display_name = "TF-9273-India-Offboarding-bots-upload-reports-at-this-SFTP"
         notes        = "RITM0158187"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Pool-Images"
            ]
         destination_groups = [
               "138.95.89.73"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Pool-Images",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-RPA-AA-PH2-Desktop-Pool",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wjmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-SRES-RPA-EU1"
            }
      }
}