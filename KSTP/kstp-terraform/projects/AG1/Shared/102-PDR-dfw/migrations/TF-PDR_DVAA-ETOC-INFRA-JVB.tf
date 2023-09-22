resource "nsxt_policy_security_policy" "policies_TF-PDR-DVAA-ETOC-INFRA-JVB" {
   display_name    = "TF-PDR"
   category        = "Application"
   locked          = false
   tcp_strict      = true
   stateful        = true
   nsx_id          = "TF-PDR"
   comments        = ""
   sequence_number = 0
   rule {
         display_name = "TF-1192-ICP-clusters-to-SMTP-relay"
         notes        = ""
         source_groups = [

            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP",
               "/infra/services/SMTP_TLS"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-AG1"
            }
      }
   rule {
         display_name = "TF-1213-ICp-from-SRES-Jump"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-Cluster01"
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
               "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-Cluster01",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-AG1"
            }
      }
   rule {
         display_name = "TF-1321-SRES-JH-to-ICP"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-agnplicp1"
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
               "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-agnplicp1",
               "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-AG1"
            }
      }
   rule {
         display_name = "TF-2938-ETOC-USA-Servers-"
         notes        = "SR51174459"
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/SMTP"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
               "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
            ]
         disabled              = false
         direction             = "IN_OUT"
         ip_version            = "IPV4_IPV6"
         logged                = true
         sources_excluded      = false
         destinations_excluded = false
         tag {
               tag = "TF-PDR-AG1"
            }
      }
}