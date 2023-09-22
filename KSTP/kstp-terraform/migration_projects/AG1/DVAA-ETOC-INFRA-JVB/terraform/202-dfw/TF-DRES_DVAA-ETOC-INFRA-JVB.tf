resource "nsxt_policy_security_policy" "policies_TF-DVAA-ETOC-INFRA-JVB-DVAA-ETOC-INFRA-JVB" {
   display_name    = "TF-DVAA-ETOC-INFRA-JVB"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-DVAA-ETOC-INFRA-JVB"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1014-ICp-from-SRES-Jump-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES01-ICp-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICP-Kubernetes-API-Server",
               "/infra/services/ICP-Ingress-Service",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-Kubernetes-NodePort",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Docker-Registry"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-DRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-2620-temp"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Automation-Control-Node"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR180-LB-VIP1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-995",
               "/infra/services/TCP-110"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR180-LB-VIP1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Automation-Control-Node"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-1729-Linux-jump-server-to-CRO-VMs-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES74-CRO-All-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/SSH",
               "/infra/services/TCP-8080",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES74-CRO-All-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-1572-SRES-Jump-Servers-to-HWSW"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DR75-HWSW-Win-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTP",
               "/infra/services/TCP-50000-50001",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-DR75-HWSW-Win-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-1643-SRES-Jump-Servers-to-SSH-Proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR78-SSH-Proxy-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR78-SSH-Proxy-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-1661-SRES-jump-to-cacf-proxy"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-ag1d95lpjllprx-Proxy-VIP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTP",
               "/infra/services/SSH",
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-ag1d95lpjllprx-Proxy-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-2398-IAM-SRES-Linux-Jump-to-DRES-port-forwarder"
         notes        = "SR50971783 CH50079588 and SR50978536 Add to destination ag1dlniamjpfdv2 ag1dlniamjpfts2 ag1dlniamjpfua2 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-2377-IAM-SRES-Linux-Jump-to-DRES-port-forwarder"
         notes        = "SR50971783 CH50079588 and SR50978536- Add to destination ag1dlniamjpfdv1 ag1dlniamjpfts1 ag1dlniamjpfua1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-2340-IAM-PEN-SRES-Linux-Jump-to-DRES-port-forwarder"
         notes        = "SR50954319 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
   rule {
         display_name = "TF-2460-IAM-PEN-SRES-Linux-Jump-to-DRES-port-forwarder"
         notes        = "SR50973757 and CH50079008"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-DVAA-ETOC-INFRA-JVB-AG1"
            }
      }
}