resource "nsxt_policy_security_policy" "policies_TF-GRES-json_2_tf" {
   display_name    = "TF-GRES"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-GRES"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1051-ICp-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICP-Kubernetes-NodePort",
               "/infra/services/ICP-Kubernetes-API-Server",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Ingress-Service"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-GRES-AG1"
            }
      }
   rule {
         display_name = "TF-1065-ICp2-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster02"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICP-Kubernetes-NodePort",
               "/infra/services/ICP-Kubernetes-API-Server",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Ingress-Service"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster02",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = false
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-GRES-AG1"
            }
      }
   rule {
         display_name = "TF-1261-ICp-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster03"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/ICP-Kubernetes-NodePort",
               "/infra/services/ICP-Kubernetes-API-Server",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Ingress-Service"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster03",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-GRES-AG1"
            }
      }
      ######################################################
# migration: IAM_PHASE5
######################################################
   rule {
         display_name = "TF-1023-DNS-Clients-"
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
               tag = "TF-GRES-AG1"
            }
      }
   rule {
         display_name = "TF-1024-NTP-Clients-"
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
               tag = "TF-GRES-AG1"
            }
      }
   rule {
         display_name = "TF-1051-ICp-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster01"
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
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster01",
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
               tag = "TF-GRES-AG1"
            }
      }
   rule {
         display_name = "TF-1065-ICp2-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster02"
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
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster02",
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
               tag = "TF-GRES-AG1"
            }
      }
   rule {
         display_name = "TF-1261-ICp-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster03"
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
               "/infra/domains/default/groups/TF-AG1-SG-GRES01-ICp-Cluster03",
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
               tag = "TF-GRES-AG1"
            }
      }
}