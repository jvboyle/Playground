resource "nsxt_policy_security_policy" "policies_TF-PDR-json_2_tf" {
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
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-Cluster01"
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
      "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-Cluster01"
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
      "/infra/domains/default/groups/TF-AG1-SG-SRES-Linux-Jump-Servers",
      "/infra/domains/default/groups/TF-AG1-SG-SRES-WIN-Jump-Servers"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-agnplicp1"
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
      "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-agnplicp1"
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
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpd1000",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1pdr1smtp01",
      "/infra/domains/default/groups/TF-AG1-HOST-ag1srwpetpp1000"
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
    display_name = "TF-1264-ST-SMTP-Client-to-PDR-SMTP-server"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SMTP-Clients"
    ]
    destination_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server"
    ]
    action = "ALLOW"
    services = [
      "/infra/services/SMTP_TLS",
      "/infra/services/SMTP"
    ]
    scope = [
      "/infra/domains/default/groups/TF-AG1-SG-SMTP-Clients",
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
  #IAM Phase2
  rule {
    display_name = "TF-1192-ICP-clusters-to-SMTP-relay"
    notes        = ""
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
    display_name = "TF-1264-ST-SMTP-Client-to-PDR-SMTP-server"
    notes        = ""
    source_groups = [
      "/infra/domains/default/groups/TF-AG1-SG-SMTP-Clients"
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
      "/infra/domains/default/groups/TF-AG1-SG-PDR-SMTP-Server",
      "/infra/domains/default/groups/TF-AG1-SG-SMTP-Clients"
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
    display_name = "TF-1192-ICP-clusters-to-SMTP-relay"
    notes        = ""
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
  ######################################################
# migration: IAM_PHASE5
######################################################
   rule {
         display_name = "TF-1103-PDR-to-SRES-DNS"
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
               tag = "TF-PDR-AG1"
            }
      }
   rule {
         display_name = "TF-1104-pdr-app-internal1"
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
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Ingress-Service",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Kubernetes-NodePort"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-Cluster01",
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
               "/infra/services/ICP-Docker-Registry",
               "/infra/services/ICP-Ingress-Service",
               "/infra/services/ICP-Management-Console",
               "/infra/services/ICP-WebSphere-Application-Server-Liberty",
               "/infra/services/ICP-Kubernetes-NodePort"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-PDR01-ICp-agnplicp1",
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
               tag = "TF-PDR-AG1"
            }
      }
######################################################
# migration: IAM_PHASE8
######################################################
   rule {
         display_name = "TF-1852-PDR-ESG-to-BDS-master"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-pdr-esg01-inside",
               "/infra/domains/default/groups/TF-AG1-IPSET-pdr-esg01-LB-VIP-4"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AG1-IPSET-pdr-esg01-inside",
               "/infra/domains/default/groups/TF-AG1-IPSET-pdr-esg01-LB-VIP-4"
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
         display_name = "TF-2766-Internet-to-PDR-ESG01-BDS-"
         notes        = ""
         source_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-PDR-BDS"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-IPSET-pdr-esg01-LB-VIP-4"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-8081"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-HOST-ag1srlpcacfbds1",
               "/infra/domains/default/groups/TF-AG1-IPSET-Host-PDR-BDS",
               "/infra/domains/default/groups/TF-AG1-IPSET-pdr-esg01-LB-VIP-4"
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
         display_name = "TF-3197-BDS-MCSM-"
         notes        = "SR51302675"
         source_groups = [
               "169.47.188.164",
               "169.47.188.161",
               "169.47.188.165",
               "169.47.188.160/29",
               "169.47.188.163",
               "169.63.90.80/28",
               "169.47.188.162"
            ]
         destination_groups = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
            ]
         action = "ALLOW"
         services = [
               "/infra/services/TCP-443"
            ]
         scope = [
               "/infra/domains/default/groups/TF-AG1-SG-SRES01-OCP-Cluster01"
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
