output "ICP Console URL" {
  value = "https://${local.cluster_vip}:8443"
}

output "ICP Admin Username" {
  value = "admin"
}

output "ICP Admin Password" {
  value = "${var.icppassword}"
}
