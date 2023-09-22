resource "nsxt_policy_security_policy" "policies_TF-IAM_PHASE1-IAM_PHASE1" {
   display_name    = "TF-IAM_PHASE1"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-IAM_PHASE1"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-2005-Distributed-Engine-to-DRES-JH"
         notes        = "SR50808657 SR50832825 SR50870192 SR50971783 SG-SRES-IAM-THY-DE-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-THY-DE-UAT added to the existing source CH50079588 and SR50978536 Add to destination ag1dlniamjpfdv2 ag1dlniamjpfts2 ag1dlniamjpfua2 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20000-20008",
               "/infra/services/TCP-1024-1027"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
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
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3390",
               "/infra/services/SSH",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2397-IAM-SVG-and-SDI-to-DRES-port-forwarder"
         notes        = "SR50971783 CH50078675 and SR50970216 added sourceSG-SRES-IAM-THY-SVG-UAT and SG-SRES-IAM-THY-SDI-UAT CH50079588 and SR50978536 Add to destination ag1dlniamjpfdv2 ag1dlniamjpfts2 ag1dlniamjpfua2 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2903-Test-DE-to-JPF"
         notes        = "SR51157680"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2983-JPF-to-EPW2-"
         notes        = "SR51198745"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPW2-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/RDP",
               "/infra/services/UDP-5986",
               "/infra/services/SSH",
               "/infra/services/TCP-45580",
               "/infra/services/TCP-5986",
               "/infra/services/UDP-5985"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPW2-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2984-EPW2-to-JPF-"
         notes        = "SR51198745"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPW2-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-443",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPW2-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2997-DE2-to-JPF2"
         notes        = "SR51210228"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-10000-10010"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wniamtse2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-3127-JPF-to-Endpoints-"
         notes        = "SR51248073"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/TCP-45580",
               "/infra/services/TCP-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep4",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-1982-Distributed-Engine-to-DRES-JH"
         notes        = "SR50971783 SG-SRES-IAM-THY-DE-SIDT added to the existing source CH50078675 and SR50970216 SG-SRES-IAM-THY-DE-UAT added to the existing source CH50079588 and SR50978536- Add to destination ag1dlniamjpfdv1 ag1dlniamjpfts1 ag1dlniamjpfua1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1024-1030",
               "/infra/services/TCP-20000-20006"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2075-DRES-JH-to-Distributed-Engine-"
         notes        = "SR50971783 SG-SRES-IAM-THY-DE-SIDT added to the existing destination CH50078675 and SR50970216 SG-SRES-IAM-THY-DE-UAT added to the existing destination CH50079588 and SR50978536- Add to source ag1dlniamjpfdv1 ag1dlniamjpfts1 ag1dlniamjpfua1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-3390",
               "/infra/services/SSH",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2376-IAM-SVG-and-SDI-to-DRES-port-forwarder"
         notes        = "SR50971783 CH50078675 and SR50970216 SG-SRES-IAM-THY-SVG-UAT SG-SRES-IAM-THY-SDI-UAT added to the existing source CH50079588 and SR50978536- Add to destination ag1dlniamjpfdv1 ag1dlniamjpfts1 ag1dlniamjpfua1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SVG-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-SIDT",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-SDI-UAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2904-Test-DE-to-JPF"
         notes        = "SR51157680"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-DE-SIDT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2979-JPF-to-EPWL1-UAT-"
         notes        = "SR51198745"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPW1-UAT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/RDP",
               "/infra/services/UDP-5986",
               "/infra/services/TCP-45580",
               "/infra/services/TCP-5986",
               "/infra/services/UDP-5985"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPW1-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-2981-EPWL1-UAT-to-JPF"
         notes        = "SR51198745"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPW1-UAT"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-443",
               "/infra/services/TCP-9443",
               "/infra/services/TCP-9343"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-IAM-THY-EPW1-UAT",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
   rule {
         display_name = "TF-3128-JPF-to-Endpoints"
         notes        = "SR51248073"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/HTTPS",
               "/infra/services/RDP",
               "/infra/services/TCP-45580",
               "/infra/services/TCP-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wpiamuep2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE1-AG1"
            }
      }
}