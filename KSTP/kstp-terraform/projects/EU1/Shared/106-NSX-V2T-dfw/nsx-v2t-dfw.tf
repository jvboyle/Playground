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
         display_name = "TF-7445-NSX-V-to-T-GSE-Temporary-RULES"
         notes        = "SR51160287"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpi2pprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpi2pprx1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SL-IRES-NSXT-NSXM",
               "/infra/domains/default/groups/TF-EU1-IPSET-SL-IRES-NSXM"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SL-IRES-NSXT-NSXM",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpi2pprx2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpi2pprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SL-IRES-NSXM"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-7555-MOM-to-EU,-JP-Towers"
         notes        = "SR51185459"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP5-Cluster-MOM"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster3-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster2-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-6443",
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP5-Cluster-MOM",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster1-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpi2pprx1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster3-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1lpi2pprx2",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster2-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-7556-MOM-Proxy-to-AP,-NA-Proxy"
         notes        = "SR51185459 SR51400220 SR51400229"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster01-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-NA1-SRES-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster3-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-AP1-SRES-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster2-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster01-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-NA1-SRES-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster3-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES01-OCP-Cluster03-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-AP1-SRES-CACF-Proxy-VIP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-LB-OCP-Cluster2-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8100-MOM-Proxy-to-TKG/NFS"
         notes        = "SR51356411 SR51368841"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ebcp3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-tkg-nfs-01",
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-tkg-base-01",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfseu1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfsjp",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfsmom",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfseu2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-tkg-nfs-01",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ebcp3",
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-tkg-base-01",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfseu1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfsjp",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfsmom",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfseu2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8101--TKG/NFS-to-MOM-Proxy"
         notes        = "SR51356411 SR51368841"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-tkg-nfs-01",
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-tkg-base-01",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfseu1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfsjp",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-01-SNAT-IP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfsmom",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfseu2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ebcp3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-tkg-nfs-01",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ebcp3",
               "/infra/domains/default/groups/TF-EU1-IPSET-sres-tkg-base-01",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfseu1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfsjp",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-01-SNAT-IP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfsmom",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lpnfseu2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8277-PEN-TEST-NEXGEN"
         notes        = "SR51422972"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1xforce01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpgsenexgen"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpgsenexgen",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1xforce01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8278-infra---all-nsxt-sres-win-to-nsxv-sres-ansible-load-balancer-VIP"
         notes        = "SR51423168"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WINDOWS-ALL"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/BDS-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WINDOWS-ALL"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8279-infra---ansible-proxies-to-nsxt-sres-win-servers"
         notes        = "SR51423168"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WINDOWS-ALL"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-5986"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-CACF-MOM-Proxy",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WINDOWS-ALL"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8334-SAT-MT"
         notes        = "SR51421830"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-SG-CHGEU0134666-VM",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8521-SCP"
         notes        = "RITM0094137"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmsatcld1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmsatcld1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8767-SAT-MT"
         notes        = "RITM0124152"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmsatcld1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmsatcld1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8770-SAT-MT"
         notes        = "RITM0125017"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmsatcld1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmsatcld1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8781-RH-licensing-on-the-NSXT"
         notes        = "RITM0125552"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1rhellic01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1rhellic01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
      rule {
         display_name = "TF-8944-Ansible-to-BDS-child"
         notes        = "RITM0137971 RITM0140044"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
         rule {
         display_name = "TF-7821-MCDS-V-to-T"
         notes        = "SR51257009 SR51320522"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5986",
               "/infra/services/HTTP",
               "/infra/services/HTTPS",
               "/infra/services/TCP-5985",
               "/infra/services/TCP-902",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-7822-Dedicated-vSphere-cluster"
         notes        = "SR51257009 SR51320522"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-8081",
               "/infra/services/TCP-8182",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdnexus",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8018-Dedicated-vSphere-cluster-to-exec"
         notes        = "SR51257009 SR51320522"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8182",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8032-MCDS-Execution-Node-to-ESXi"
         notes        = "SR51337318"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-MCDS-CLUSTER-ESXI-MGMT"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-MCDS-CLUSTER-ESXI-MGMT",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdexec"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8124-MCDS-Kali-Linux"
         notes        = "SR51362902"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-MCDS-Kali-eu-vm0079-pt"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1nsxt-mcdstower",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/HTTPS",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1nsxt-mcdstower",
               "/infra/domains/default/groups/TF-EU1-IPSET-MCDS-Kali-eu-vm0079-pt",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjenkns"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8780-MCDS-to-NSXT"
         notes        = "RITM0125663"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5985",
               "/infra/services/TCP-5986",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdjump",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw1",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-NSXT-MCDS-DedicatedVMsubnet",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpmcdanstw2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8944-Ansible-to-BDS-child"
         notes        = "RITM0137971 RITM0140044"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpcacfbds1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1hr1lpcacfbds",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
      ######################################################
# migration: eu_sres_wave3
######################################################
   rule {
         display_name = "TF-8168-Integration-AMS-Shared3-with-CACF-Shared"
         notes        = "SR51383546"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8169-Integration-AMS-Shared3-with-CACF-Shared"
         notes        = "SR51383546"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS_16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8786-M-EaaS-SHARED-EMs-1-2-and-3-to-CACF-Next-"
         notes        = "RITM0125712 RITM0135695"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8787-CACF-Next-to-M-EaaS-SHARED-EMs-1-2-and-3-"
         notes        = "RITM0125712"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS_16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3",
               "/infra/domains/default/groups/TF-EU1-HOST-nlascni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni2",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni2",
               "/infra/domains/default/groups/TF-EU1-HOST-nlaspni000m1ermp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1ecni3",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1epni3"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8966-MNE-Autobuild-VM-intecommunication"
         notes        = "CHGEU0192744"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNE-AMS3-Shared"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp4",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp4",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp4",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNE-AMS3-Shared"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8967-MNE-Autobuild-VM-intecommunication"
         notes        = "CHGEU0192744"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp4",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNE-AMS3-Shared"
            ]
         action = "ALLOW"
         services = [

            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp4",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-MNE-AMS3-Shared",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8997-UKI-CACF"
         notes        = "RITM0141555"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpni"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpni",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8998-UKI-CACF"
         notes        = "RITM0141555"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascni",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpni"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS_16443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1eascni",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpm1easpni",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-9149-cacf-Sciencelogic-M-EaaS-"
         notes        = "RITM0151562"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-SL1-DB-Cluster-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-SL1-DB-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srltm1esdp",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srltm1esdc"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
######################################################
# migration: eu_sres_wave4
######################################################
   rule {
         display_name = "TF-7536-ISIM-is-an-automated-IAM-tool"
         notes        = "SR51201010 SR51400220 SR51400229"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-CS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP5-Cluster-MOM",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP5-Cluster-MOM",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-CS"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-7648-ISIM"
         notes        = "SR51239185 SR51400220 SR51400229"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta6base",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta8base",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta9base",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta7base",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta5base"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-IAMInfra-WAS",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta6base",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta8base",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta9base",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta7base",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-ISIM-eu1sr1lpta5base"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8444-RDS-licenses-from-nsxv-to-nsxt"
         notes        = "CHGEU0134714"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-ClientTerminals"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-TS-License-2019"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-1025-65535",
               "/infra/services/UDP-138",
               "/infra/services/TCP-445",
               "/infra/services/UDP-137",
               "/infra/services/TCP-139",
               "/infra/services/TCP-135"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-ClientTerminals",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-TS-License-2019"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8795-DSS-automation-test"
         notes        = "RITM0126473"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-IAM-THY-DE-PROD"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwas01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-20003"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-IAM-THY-DE-PROD",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srlpisiwas01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8992-Mailing-for-UAT"
         notes        = "RITM0140070"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-02-Subnet"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-MAIL"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2525"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-ISIM-MAIL"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
      ######################################################
# migration: eu_sres_wave5
######################################################
   rule {
         display_name = "TF-7431-OCP-4-6-Build-in-NSX-T"
         notes        = "SR51149156 SR51149150 SR51149158 SR51149148 SR51400220 SR51400229 SR51426120"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP5-Cluster-MOM",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP10-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8181",
               "/infra/services/SSH",
               "/infra/services/TCP-22623",
               "/infra/services/DNS-C7hECM7oS",
               "/infra/services/TCP-10250",
               "/infra/services/TCP-8001",
               "/infra/services/TCP-6443",
               "/infra/services/DNS-UDP",
               "/infra/services/TCP-8500",
               "/infra/services/TCP-8053",
               "/infra/services/TCP-9000",
               "/infra/services/TCP-30000-32767",
               "/infra/services/HTTPS",
               "/infra/services/TCP-4789",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-18080",
               "/infra/services/TCP-9000",
               "/infra/services/HTTP",
               "/infra/services/TCP-8443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP5-Cluster-MOM",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-EU1",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP10-Cluster-JP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-7456-NSX-V-to-T-GSNI-Traffic"
         notes        = "SR51400220 SR51400229 SR51426120"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP10-Cluster-JP-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP8-Cluster-JP-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-NET-IBM-Blue",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP10-Cluster-JP-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP7-Cluster-EU2-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP6-Cluster-VIP",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-7941-SRES-JH-to-TKG-Cluster-Access"
         notes        = "SR51301068 CHGEU0129386"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-mgmt-01-subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS",
               "/infra/services/TCP-6443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-mgmt-01-subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-7943-Auth-login-to-TKG-clusters"
         notes        = "SR51301068 CHGEU0129386"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-mgmt-01-subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/tcp-30167",
               "/infra/services/tcp-31234"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-01-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-03-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-02-Subnet",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-mgmt-01-subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8029-MCDS-V-to-T-"
         notes        = "SR51327710 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1ljmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-IRES-NSXT-VC",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1ljmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8127-MCDS-T-to-TV-"
         notes        = "SR51327710 "
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1srlpmcdanstw-VIP"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1ljmp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-eu1srlpmcdanstw-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1ljmp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8353-ARMS-ISI-to-HWSW-EU"
         notes        = "CHGEU0131535"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lparmsisi"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcdb",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1sr1lparmsisi"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8968-MNE-Autobuild-Samba"
         notes        = "CHGEU0192744"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp4",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-137",
               "/infra/services/TCP-139",
               "/infra/services/TCP-455",
               "/infra/services/UDP-138",
               "/infra/services/UDP-455",
               "/infra/services/UDP-139",
               "/infra/services/UDP-137",
               "/infra/services/TCP-138"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp4",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp4",
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8969-MNE-Autobuild-SSH"
         notes        = "CHGEU0192744"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp4",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-nlasabuildm1e00p",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ecnp4",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1epnp4"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-9053-GRF-secure-file-server"
         notes        = "RITM0143910"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srwphwcgrfds"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-OCP9-Cluster-EU3-VIP",
               "/infra/domains/default/groups/TF-EU1-HOST-eu1srwphwcgrfds"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-9086-TANZU3-Auth-login-to-TKG-clusters"
         notes        = "RITM0144472"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/tcp-30167",
               "/infra/services/tcp-31234"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-9118-EU-HWSW-to-BlueID-Azure"
         notes        = "RITM0148927"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-BLUEIDP1-zkpw3uspriv-app-kyndryl-net-138-95-240-6"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50001"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl",
               "/infra/domains/default/groups/TF-EU1-IPSET-BLUEIDP1-zkpw3uspriv-app-kyndryl-net-138-95-240-6"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-9249-HWSW-Currency-Management"
         notes        = "RITM0155091"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpgacdwdb"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-50000"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-HOST-eu1sr1wphwcetl",
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpgacdwdb"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-9270-Dynatrace-Monitoring"
         notes        = "RITM0157338"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ebcp3"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-nlasabuildm1e00p"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-9999"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlpm1ebcp3",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-nlasabuildm1e00p"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
      ######################################################
# migration: eu_sres_wave6
######################################################
   rule {
         display_name = "TF-7942-Copy-of-Auth-login-to-TKG-clusters-"
         notes        = "SR51301068"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-mgmt-01-subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5555"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-mgmt-01-subnet",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8060-DNS-delegation-to-AVI"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-AVI-NS1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-C7hECM7oS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-DNS-NTP",
               "/infra/domains/default/groups/TF-EU1-IPSET-AVI-NS1",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-8852-SAT-NEXT_GEN"
         notes        = "CHGEU0185376"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlPsat2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTPS_9443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-IPSET-SRES-eu1srlPsat2",
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
   rule {
         display_name = "TF-9087-TANZU3-Access-the-installer-interface"
         notes        = "RITM0144472"
         source_groups = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-5555"
            ]
         scope = [
               "/infra/domains/default/groups/TF-EU1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-EU1-IPSET-Tanzu-Workload-03-Subnet"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-NSX-V2T-EU1"
            }
      }
}