resource "nsxt_policy_security_policy" "policies_TF-eu_sres_wave4-eu_sres_wave4" {
   display_name    = "TF-eu_sres_wave4"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-eu_sres_wave4"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-7636-IAM-automation"
         notes        = "CH50088707"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lplegbkp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lplegbkp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-8590-ISIM-Proxy-listeners-"
         notes        = "RITM0116507"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-30000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-8591-ISIM-Proxy-listeners"
         notes        = "RITM0116507"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM05-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-20999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d109lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM05-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-6810-ISIM-connect-to-DRES-proxy"
         notes        = "SR50977933 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d113lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES113-CACF-ProxyVIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-23000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d113lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES113-CACF-ProxyVIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7921-ISIM-IAM"
         notes        = "SR51287904"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM01-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lpisilht"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-23000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lpisilht",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM01-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7922-ISIM-IAM-infra-"
         notes        = "SR51287904"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lpisilht"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-30000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lpisilht"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-8586-ISIM-proxy-mgmt"
         notes        = "RITM0114858"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-30000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-8587-ISIM-proxy-listeners"
         notes        = "RITM0114858"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM05-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-43000-49999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d18lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM05-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7637-IAM-automation"
         notes        = "CH50090846"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpcacprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d185lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7041-ISIM-connect-to-DRES-proxy"
         notes        = "SR51022645 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam82",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam80",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam81",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam83"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d191lpisimsg1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-24999-25999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d191lpisimsg1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam82",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam83",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam80",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam81"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-6964-ISIM-connect-to-DRES-proxy"
         notes        = "CH50082062 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam82",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam80",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam81",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam83"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d194lpisikit1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-23000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d194lpisikit1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam82",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam83",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam80",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwam81"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-8912-ISIM-Proxy-management"
         notes        = "CHGEU0189039"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfsprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-30000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfsprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-8913-ISIM-proxy-listeners"
         notes        = "CHGEU0189039"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM05-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfsprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-20999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d199lpbfsprx1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM05-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7509-ISIM-proxy-mgmt"
         notes        = "CH50088519"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d225lpisiams1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-30000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d225lpisiams1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7510-ISIM-connect-to-DRES-proxy"
         notes        = "CH50088519"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-CH50088519"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d225lpisiams1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-23000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d225lpisiams1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-CH50088519"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7966-ISIM"
         notes        = "SR51255291"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM08-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-20999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM08-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d226lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7603-ISIM-IAM-automation"
         notes        = "CH50089604"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d229lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d229lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d229lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d229lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7797-ISIM"
         notes        = "CH50092081"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d239lpmtktnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d239lpmtktnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d239lpmtktnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d239lpmtktnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7759-ISIM"
         notes        = "CH50095414"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d240lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d240lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7932-ISIM-proxy-listeners"
         notes        = "CH50097772"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM06-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d252lpisibph"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-20999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d252lpisibph",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM06-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7933-IAM-ISIM-proxy-mgmt"
         notes        = "CH50097772"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d252lpisibph"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-30000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d252lpisibph",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-9002-ISIM-proxy-mgmt"
         notes        = "CHGEU0194232"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d303lptlfprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-30000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d303lptlfprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-9003-ISIM-proxy-listeners"
         notes        = "CHGEU0194232"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM05-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d303lptlfprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-20999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d303lptlfprx1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM05-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-6918-SSH-for-IAM-automation"
         notes        = "SR51002457 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-6869-IAM-automation"
         notes        = "SR50994786 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d51lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai04",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai02",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwai03",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d51lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7638-IAM-automation"
         notes        = "CH50090896"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpcacprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d62lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7995-ISIM-proxy-mgmt-"
         notes        = "SR51305292"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM08-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR63-SSH-Proxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-20999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAM08-WAS",
               "/infra/domains/default/groups/TF-EU1-SG-DR63-SSH-Proxy"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
   rule {
         display_name = "TF-7996-ISIM-proxy-mgmt"
         notes        = "SR51305292"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR63-SSH-Proxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-30000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR63-SSH-Proxy",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave4-EU1"
            }
      }
}