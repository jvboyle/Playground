resource "nsxt_policy_security_policy" "policies_TF-IAM_PHASE5-IAM_PHASE5" {
   display_name    = "TF-IAM_PHASE5"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-IAM_PHASE5"
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
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Ingress-Service",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Kubernetes-NodePort"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-1020-DNS-"
         notes        = ""
         source_groups = [

            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-1021-NTP"
         notes        = ""
         source_groups = [

            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-1099-NTP_DRES12"
         notes        = ""
         source_groups = [

            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/NTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-1100-DNS_DRES12"
         notes        = ""
         source_groups = [

            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/DNS-UDP",
               "/infra/services/DNS-YgYUhldeX"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-DNS-NTP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-1142-Netapp-Migration-Tool-Web-Interface"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-8088"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-1278-test-rule-Sendmail"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stl",
               "100.64.76.7"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stw",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr12stl"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-2576-CPREM-Netcool-to-DRES-LB-VIP-CACF"
         notes        = "SR50955801"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-CPREM-NETCOOL"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1-NAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-CPREM-DR158-NAT-Range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/HTTPS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-CPREM-DR158-NAT-Range",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1-NAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-CPREM-NETCOOL"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-2578-CPREM-JH-to-DRES-LB-VIP1-CACF"
         notes        = "SR50955801"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-CPREM-JHOSTS",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1-NAT",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-CPREM-DR158-NAT-Range"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-CPREM-JHOSTS",
               "/infra/domains/default/groups/TF-AG1-IPSET-NET-CPREM-DR158-NAT-Range",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1wjmp01",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1sr1ljmp01",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR158-LB-VIP1-NAT"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-1221-Netapp-Migration-Tool-Web-Interface"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stw"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8443",
               "/infra/services/TCP-8088"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dr19stw",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-2522-SAT-Proxy-to-DRES-ESG-Forwarding"
         notes        = "JZerrich will add"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR19-Forwarding-IP"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SAT-range-2001-2050"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-IPSET-DR19-Forwarding-IP",
               "/infra/domains/default/groups/TF-AG1-HOST-Ag1srlpSATZcld",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpsatpxy1"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
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
               "/infra/services/SSH",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-8443",
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
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-1730-Windows-jump-server-to-CRO-VMs"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES74-CRO-All-Servers"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/TCP-8080",
               "/infra/services/TCP-8443",
               "/infra/services/RDP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-DRES74-CRO-All-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
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
               "/infra/services/RDP",
               "/infra/services/HTTP",
               "/infra/services/TCP-50000-50001"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-DR75-HWSW-Win-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
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
               "/infra/domains/default/groups/TF-AG1-IPSET-DR78-SSH-Proxy-VIP",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1d78lpaecprx2",
               "/infra/domains/default/groups/TF-AG1-IPSET-DR78-SSH-Proxy-VIP"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
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
               "/infra/services/SSH",
               "/infra/services/HTTPS",
               "/infra/services/HTTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-ag1d95lpjllprx-Proxy-VIP",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-2398-IAM-SRES-Linux-Jump-to-DRES-port-forwarder"
         notes        = "SR50971783 CH50079588 and SR50978536 Add to destination ag1dlniamjpfdv2 ag1dlniamjpfts2 ag1dlniamjpfua2 "
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts2",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua2",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
   rule {
         display_name = "TF-2377-IAM-SRES-Linux-Jump-to-DRES-port-forwarder"
         notes        = "SR50971783 CH50079588 and SR50978536- Add to destination ag1dlniamjpfdv1 ag1dlniamjpfts1 ag1dlniamjpfua1"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-2222",
               "/infra/services/SSH"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfts1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpfua1",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dlniamjpf1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
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
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit3lniamjpf",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
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
               "/infra/domains/default/groups/TF-AG1-HOST-ag1dit4lniamjpf",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-IAM_PHASE5-AG1"
            }
      }
}