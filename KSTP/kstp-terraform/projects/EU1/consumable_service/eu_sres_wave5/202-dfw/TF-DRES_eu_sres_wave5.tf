resource "nsxt_policy_security_policy" "policies_TF-eu_sres_wave5-eu_sres_wave5" {
   display_name    = "TF-eu_sres_wave5"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-eu_sres_wave5"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1040-ICp-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES01-ICp-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICP-Kubernetes-NodePort",
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Kubernetes-API-Server",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-Ingress-Service",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DRES01-ICp-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-5164-SSH"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeayslbak1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeayslcol1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbc1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeayslbak1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeayslcol1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d115lpeaysldbc1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-1826-AMS-SRES-Shared1-Autobuild-AMS-DRES-Coke-Netcool-Probe"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stl"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stl"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-1827-AMS-DRES-Coke-Netcool-Probe-AMS-SRES-Shared1-Autobuild"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-139",
               "/infra/services/TCP-138",
               "/infra/services/TCP-445"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr13stl",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-3128-CCEP-Pri_Sec-Probe-nlasabuildm1e00p"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000ip1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascnp000ip1rm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-STaaS-DR13-Storage-All"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-137",
               "/infra/services/TCP-139",
               "/infra/services/TCP-455",
               "/infra/services/TCP-138"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-STaaS-DR13-Storage-All",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000ip1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascnp000ip1rm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-3129-nlasabuildm1e00p-CCEP-Pri_Sec-Probe_SSH"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000ip1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascnp000ip1rm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000ip1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascnp000ip1rm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-3691-DRES13-IP1-Probes_to_AMS-SRES-ICP2-Ingress"
         notes        = "SR50627727"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000ip1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascnp000ip1rm"
            ]
         destination_groups = [
               "158.87.52.8"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000ip1rm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascnp000ip1rm"
            ]
         disabled              = true
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7853-CPREM-JH-to-CAFCF-Proxy-BDS"
         notes        = "CH50096982"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES146-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d146lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES146-CACF-Proxy-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-5989-SRES-ssh-WIN-LINUX-to-DR15"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR15-MNEAAS-SL1-ALL-EU-DV1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR15-MNEAAS-SL1-ALL-EU-DV1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-5875-VM-to-Autobuild"
         notes        = "SR50863189"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-MNEAAS-EU-SRES-AUTOBUILD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-LR5-NCPP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-LR5-NCPP",
               "/infra/domains/default/groups/TF-EU1-SG-MNEAAS-EU-SRES-AUTOBUILD"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-5876-Autobuild-to-VM"
         notes        = "SR50863189"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-LR5-NCPP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-MNEAAS-EU-SRES-AUTOBUILD"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NetBios_Datagram_(TCP)",
               "/infra/services/NetBios_Session_Service_(UDP)",
               "/infra/services/SMB_Server_UDP",
               "/infra/services/NetBios_Name_Service_(TCP)",
               "/infra/services/NetBios_Name_Service_(UDP)",
               "/infra/services/NetBios_Session_Service_(TCP)",
               "/infra/services/SMB_Server",
               "/infra/services/NetBios_Datagram_(UDP)"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DRES-MNEAAS-LR5-NCPP",
               "/infra/domains/default/groups/TF-EU1-SG-MNEAAS-EU-SRES-AUTOBUILD"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7084-SRES-to-DRES"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7571-CPREM-JH-to-CAFCF-Proxy-BDS"
         notes        = "CH50090779"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES177-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES177-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d177lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-6985-ScienceLogic-SL1-SSH"
         notes        = "CH50081732 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d176lplufsdp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-1236-Netcool-Ping-Probe-Autobuild-UCD-Relay"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000bgerm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-137",
               "/infra/services/TCP-20080",
               "/infra/services/TCP-139",
               "/infra/services/TCP-20081",
               "/infra/services/TCP-138",
               "/infra/services/TCP-445",
               "/infra/services/TCP-7916"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000bgerm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-1237-M-EaaS-Shared-Portal-Autobuild-Netcool-Ping-Probe"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000bgerm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspnp000bgerm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-1400-Netcool-Ping-Probe-Autobuild-UCD-Relay"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspre00bgeerm"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-137",
               "/infra/services/TCP-20080",
               "/infra/services/TCP-139",
               "/infra/services/TCP-20081",
               "/infra/services/TCP-138",
               "/infra/services/TCP-445",
               "/infra/services/TCP-7916"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspre00bgeerm"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-1401-M-EaaS-Shared-Portal-Autobuild-Netcool-Ping-Probe"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspre00bgeerm"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspre00bgeerm",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7757-JUMP-to-Proxies"
         notes        = "SR51106686"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d202lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8678-JH-to-SL1-SSH"
         notes        = "CHGEU0175842"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnbkp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnbkp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrntnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d205lpkrnsdc"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7899-SRES-JH-to-CAFCF-Proxy-BDS"
         notes        = "CH50097003"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES213-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES213-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d213lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7876-SRES-JH-to-CAFCF-Proxy-BDS"
         notes        = "CH50096998"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d241lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d241lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES241-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d241lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES241-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d241lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7842-CPREM-JH-to-CAFCF-Proxy-BDS"
         notes        = "CH50096698"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d245lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES245-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d245lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d245lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d245lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES245-CACF-Proxy-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8139-SRES-JH-to-CAFCF-Proxy-BDS"
         notes        = "CH50100055"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d260lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d260lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES260-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d260lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d260lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES260-CACF-Proxy-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8275-SRES-JH-to-CAFCF-Proxy-BDS"
         notes        = "CH50102503"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d263lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d263lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES263-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d263lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES263-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d263lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8302-SSH-SL1-Web-Conf-Utility"
         notes        = "CH50102785"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1bkp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1tnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1tnp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-7700",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1bkp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1tnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1sdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d265lpkt1tnp1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8311-SRES-JH-to-CAFCF-Proxy-BDS"
         notes        = "CH50102830"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d267lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d267lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8662-SAS-SRES-SAS-server-to-DRES-SAS-server"
         notes        = "CHGEU0175685"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlnsaspoc1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d275lnsaspoc2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d275lnsaspoc2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlnsaspoc1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8894-DRES-SAS-to-SRES-SAS"
         notes        = "RITM0127613 -correction"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d275lnsaspoc2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlnsaspoc1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8420",
               "/infra/services/TCP-33343"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d275lnsaspoc2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlnsaspoc1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8739-SRES-JH-to-CAFCF-Proxy-BDS"
         notes        = "CHGEU0178119"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES280-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES280-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8757-Jumpserver-to-DB"
         notes        = "CHGEU0180151"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1d280lpncysd-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdp"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1d280lpncysd-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdc",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d280lpncysdp"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8804-SRES-JH-to-CAFCF-Proxy-BDS"
         notes        = "CHGEU0182446"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES287-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d287lpcacprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES287-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d287lpcacprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8906-ScienceLogic-Phonehome"
         notes        = "RITM0133426"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpptstnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpptstnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp7",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esd7-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc7",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk7"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7705"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esd7-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpptstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp7",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc7",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d296lpptstnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk7"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8938-ScienceLogic-Phonehome"
         notes        = "CHGEU0191336"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp3",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esd3-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7705"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdp3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp2",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1esd3-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esdc3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-9046-SRES-to-DRES-Autobuild"
         notes        = "RITM0139481"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-9047-DRES-to-SRES-Autobuild"
         notes        = "RITM0139481"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-137",
               "/infra/services/TCP-139",
               "/infra/services/UDP-138",
               "/infra/services/UDP-139",
               "/infra/services/UDP-455",
               "/infra/services/UDP-137",
               "/infra/services/TCP-138",
               "/infra/services/TCP-455"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d300lpabstnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8953-SRES-JH-to-CAFCF-Proxy-BDS"
         notes        = "CHGEU0191751"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d301lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d301lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES301-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d301lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d301lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES301-CACF-Proxy-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-9057-SSH-Autobuild"
         notes        = "CHGEU0198493"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-9058-Samba"
         notes        = "CHGEU0198493"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-137",
               "/infra/services/TCP-139",
               "/infra/services/UDP-138",
               "/infra/services/UDP-139",
               "/infra/services/UDP-455",
               "/infra/services/UDP-137",
               "/infra/services/TCP-138",
               "/infra/services/TCP-455"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-9060-ScienceLogic-Phonehome"
         notes        = "CHGEU0198493"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-EU-SG-SRES-eu1srlpm1esd3-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-7705"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-EU-SG-SRES-eu1srlpm1esd3-vip",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1esbk3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d307lpdantnp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7047-SSH-HTTPS"
         notes        = "CH50079967 SR50976910 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES32-CACF-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1ddr32lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-DRES32-CACF-Proxy-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-8476-CACF-Support-Access-Flow"
         notes        = "CHGEU0134797"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d48lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d48lpcacprx2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d48lpcacprx1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d48lpcacprx2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-4599-Jump-Servers-to-eu1d57lpjfecac"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-CACF-eu1d57lpjfecac1-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-CACF-eu1d57lpjfecac1-vip"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-4059-Linux-Jump-DR62-solar-winds-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SolarWinds",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-BlueCat"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SolarWinds",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-BlueCat"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-4110-Win-Linux-Jump-DR62-solar-winds-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SolarWinds",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-BlueCat"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/SSH",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SolarWinds",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-BlueCat"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-9141-ScienceLogic-SL1-Admin-Access"
         notes        = "RITM0143541"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-eu1d62lpecnsmc"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-DR62-SL1-eu1d62lpecnsdc",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR62-eu1d62lpecnsmc"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-4798-Autobuild"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpno"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-455",
               "/infra/services/UDP-137-139",
               "/infra/services/TCP-137-139",
               "/infra/services/UDP-455"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpno"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-4800-Autobuild-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpno"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcno",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpdb",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrcni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpwg",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1dr64lpcfrpno"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7752-Netcool-Probe"
         notes        = "SR51250861"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcfrtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcfrtnp1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcfrtnp2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d64lpcfrtnp1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-7864-SRES-to-DRES"
         notes        = "SR51265481"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-DR66-MNEAAS-SL1-1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcpkslmo2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcpkbkp2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/SSH",
               "/infra/services/TCP-7700"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-DR66-MNEAAS-SL1-1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcpkslmo2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d66lpcpkbkp2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-4127-Sres-co-CPREM"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d68lpwppssh1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d68lpwppssh2",
               "100.72.172.10"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d68lpwppssh1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES01-OCP-Cluster01",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1d68lpwppssh2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
   rule {
         display_name = "TF-4713-SRES-jump-to-cacf-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-CACF-eu1d69lpeawprx-vip"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-CACF-eu1d69lpeawprx-vip",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-eu_sres_wave5-EU1"
            }
      }
}