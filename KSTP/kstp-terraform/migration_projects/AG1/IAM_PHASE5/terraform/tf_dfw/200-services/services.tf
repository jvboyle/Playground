resource "nsxt_policy_service" "svc_icp-kubernetes-api-server" {
      display_name = "ICP-Kubernetes-API-Server"
      nsx_id = "ICP-Kubernetes-API-Server"
}

resource "nsxt_policy_service" "svc_icp-docker-registry" {
      display_name = "ICP-Docker-Registry"
      nsx_id = "ICP-Docker-Registry"
}

resource "nsxt_policy_service" "svc_icp-ingress-service" {
      display_name = "ICP-Ingress-Service"
      nsx_id = "ICP-Ingress-Service"
}

resource "nsxt_policy_service" "svc_sat-range-2001-2050" {
      display_name = "SAT-range-2001-2050"
      nsx_id = "SAT-range-2001-2050"
}

resource "nsxt_policy_service" "svc_icp-management-console" {
      display_name = "ICP-Management-Console"
      nsx_id = "ICP-Management-Console"
}

resource "nsxt_policy_service" "svc_icmp-echo" {
      display_name = "ICMP-Echo"
      nsx_id = "ICMP-Echo"
}

resource "nsxt_policy_service" "svc_icp-websphere-application-server-liberty" {
      display_name = "ICP-WebSphere-Application-Server-Liberty"
      nsx_id = "ICP-WebSphere-Application-Server-Liberty"
}

resource "nsxt_policy_service" "svc_icp-kubernetes-nodeport" {
      display_name = "ICP-Kubernetes-NodePort"
      nsx_id = "ICP-Kubernetes-NodePort"
}

resource "nsxt_policy_service" "svc_tcp-16316" {
      display_name = "TCP-16316"
      nsx_id = "TCP-16316"
      dynamic "l4_port_set_entry" {
            content {
                  display_name = "TCP_TCP-16316"
                  protocol = "TCP"
                  destination_ports = "[16316]"
            }
      }
}

resource "nsxt_policy_service" "svc_tcp-16311" {
      display_name = "TCP-16311"
      nsx_id = "TCP-16311"
      dynamic "l4_port_set_entry" {
            content {
                  display_name = "TCP_TCP-16311"
                  protocol = "TCP"
                  destination_ports = "[16311]"
            }
      }
}

resource "nsxt_policy_service" "svc_tcp-10003" {
      display_name = "TCP-10003"
      nsx_id = "TCP-10003"
      dynamic "l4_port_set_entry" {
            content {
                  display_name = "TCP_TCP-10003"
                  protocol = "TCP"
                  destination_ports = "[10003]"
            }
      }
}

resource "nsxt_policy_service" "svc_tcp-8088" {
      display_name = "TCP-8088"
      nsx_id = "TCP-8088"
      dynamic "l4_port_set_entry" {
            content {
                  display_name = "TCP_TCP-8088"
                  protocol = "TCP"
                  destination_ports = "[8088]"
            }
      }
}

