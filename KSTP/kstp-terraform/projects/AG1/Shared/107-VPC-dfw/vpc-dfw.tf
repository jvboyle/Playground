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
         display_name = "TF-2818-Access-to-VPC"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-csc-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1-nat"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-csc-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-AG1"
            }
      }
      ######################################################
# migration: IAM_PHASE5
######################################################
   rule {
         display_name = "TF-2818-Access-to-VPC"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-csc-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1-nat"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-csc-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-sh-nonprod-subnet1-nat",
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1-nat"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-AG1"
            }
      }
######################################################
# migration: IAM_PHASE6
######################################################
   rule {
         display_name = "TF-3338-DX-plat-IKS-Prod-to-GRF-DB"
         notes        = "SR51402877 RITM0128417---added the ag1srlpcardb1000 to the destination "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-vpc-10-dx-platform-prod-subnet1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcardb1000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwphwcgrfdb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-VPC-AG1"
            }
      }
}