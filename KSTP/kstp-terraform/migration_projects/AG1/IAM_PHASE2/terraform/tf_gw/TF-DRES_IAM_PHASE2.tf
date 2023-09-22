resource "nsxt_policy_security_policy" "policies_TF-IAM_PHASE2-IAM_PHASE2" {
   display_name    = "TF-GW-DRES"
   category        = "LocalGatewayRules"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GW-DRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-2005-Distributed-Engine-to-DRES-JH"
         notes        = "SR50808657 SR50832825 SR50870192 SR50971783 SG-SRES-IAM-THY-DE-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-THY-DE-UAT added to the existing source CH50079588 and SR50978536 Add to destination ag1dlniamjpfdv2 ag1dlniamjpfts2 ag1dlniamjpfua2 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1024-1027",
               "/infra/services/TCP-20000-20008"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2073-DRES-JH-to-Distributed-Engine"
         notes        = "SR50837377 SR50870192 SR50971783 SG-SRES-IAM-THY-DE-SIDT added to existing destination CH50079588 and SR50978536 Add to source ag1dlniamjpfdv2 ag1dlniamjpfts2 ag1dlniamjpfua2 CH50078675 and SR50970216 SG-SRES-IAM-THY-DE-UAT added to existing destination"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-3390",
               "/infra/services/RDP"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2397-IAM-SVG-and-SDI-to-DRES-port-forwarder"
         notes        = "SR50971783 CH50078675 and SR50970216 added sourceSG-SRES-IAM-THY-SVG-UAT and SG-SRES-IAM-THY-SDI-UAT CH50079588 and SR50978536 Add to destination ag1dlniamjpfdv2 ag1dlniamjpfts2 ag1dlniamjpfua2 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2902-DE-to-JPF"
         notes        = "SR51154776 SR51247305 - 20009 20010"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20010",
               "/infra/services/SSH",
               "/infra/services/TCP-20009"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-1982-Distributed-Engine-to-DRES-JH"
         notes        = "SR50971783 SG-SRES-IAM-THY-DE-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-THY-DE-UAT added to the existing source CH50079588 and SR50978536- Add to destination ag1dlniamjpfdv1 ag1dlniamjpfts1 ag1dlniamjpfua1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-20006",
               "/infra/services/TCP-1024-1030"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2075-DRES-JH-to-Distributed-Engine-"
         notes        = "SR50971783 SG-SRES-IAM-THY-DE-SIDT added to the existing destination CH50078675 and SR50970216 SG-SRES-IAM-THY-DE-UAT added to the existing destination CH50079588 and SR50978536- Add to source ag1dlniamjpfdv1 ag1dlniamjpfts1 ag1dlniamjpfua1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-3390",
               "/infra/services/RDP"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2376-IAM-SVG-and-SDI-to-DRES-port-forwarder"
         notes        = "SR50971783 CH50078675 and SR50970216 SG-SRES-IAM-THY-SVG-UAT SG-SRES-IAM-THY-SDI-UAT added to the existing source CH50079588 and SR50978536- Add to destination ag1dlniamjpfdv1 ag1dlniamjpfts1 ag1dlniamjpfua1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2901-DE-to-JPF"
         notes        = "SR51154776 SR51247305 - 20009 20010"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamuae1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20010",
               "/infra/services/SSH",
               "/infra/services/TCP-20009"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2337-IAM-PEN-SRES-Distrib-Engine-to-Secret"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SECRET-PEN"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2338-IAM-PEN-DRES-port-forwarder-to-SRES-Proxies"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2339-IAM-PEN-SVG-and-SDI-to-DRES-port-forwarder"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2342-IAM-PEN-Remote-Access-Server-to-SRES-Distrib-Engine-"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-RAS-NONPROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniampte1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/Terminal_Services_(UDP)",
               "/infra/services/RDP"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2343-IAM-PEN-DRES-port-forwarder-to-Distrib-Engine"
         notes        = "SR50954319 CH50078679 and SR50964831 Remove ag1dit3wniamde Add SG-SRES-IAM-THY-DE-PEN"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-3390",
               "/infra/services/TCP-3389"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2344-IAM-PEN-SRES-Distrib-Engine-to-port-forwarder"
         notes        = "CH50078679 and SR50964831"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES-PEN-IAM-THY-JPF"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2458-IAM-PEN-DRES-port-forwarder-to-Distrib-Engine"
         notes        = "SR50973757 and CH50079008"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3389",
               "/infra/services/SSH",
               "/infra/services/TCP-3390"
            ]
         scope = [local.gw_scope]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2459-IAM-PEN-SRES-Distrib-Engine,svg,sdi-to-port-forwarder"
         notes        = "SR50973757 and CH50079008"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2461-IAM-PEN-DRES-port-forwarder-to-SRES-Proxies"
         notes        = "SR50973757 and CH50079008"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-PROXY-PEN"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
   rule {
         display_name = "TF-2518-IAM-JPF-to-PEN"
         notes        = "SR50985354"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-PEN",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-PEN"
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
               tag = "TF-IAM_PHASE2-AG1"
            }
      }
}