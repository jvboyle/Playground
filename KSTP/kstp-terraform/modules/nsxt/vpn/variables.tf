
variable "project" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Name of the Environment"
  type        = string
}

variable "customer" {
  description = "Name of the customer"
  type        = string
}


variable "name" {
  description = "named used to build the display name for vpn"
  type        = string
}

variable "endpoint_local_address" {
  description = "Local public peer ip "
  type        = string
}

variable "static_gateway_path" {
  description = "Path for Mapping vpn to a T0 or T1"
  type        = string
}

variable "local_endpoint_path" {
  description = "Path for Mapping local endpoint ( local fortigate ip )"
  type        = string
}

/*
variable "ike_profile_path" {
  description = "path to ike profile"
  type        = string
}

variable "tunnel_profile_path" {
  description = "path to esp profile"
  type        = string
}

variable "dpd_profile_path" {
  description = "path to Dead Peer profile"
  type        = string
}
*/

variable "enalbed" {
  description = "enabled service and vpn defaults to false"
  type        = bool
  default     = false
}

variable "bypass_rule_config" {
  description = "list of subnets for source"
  type        = map(any)
  default     = null
}

variable "next_hop" {
  description = "next hop to reach the internet "
  type        = string
}

variable "peer_address" {
  description = "vpn peer address"
  type        = string
}

variable "vpn_service_path" {
  description = "if set to true(default) will create the VPN service"
  type        = string
}

variable "ike_encryption_algorithms" {
  description = ""
  type        = string
}

variable "ike_digest_algorithms" {
  description = ""
  type        = string
}

variable "ike_dh_groups" {
  description = ""
  type        = string
}

variable "ike_version" {
  description = ""
  type        = string
}

variable "ike_sa_life_time" {
  description = ""
  type        = string
}

variable "ipsec_encryption_algorithms" {
  description = ""
  type        = string
}

variable "ipsec_digest_algorithms" {
  description = ""
  type        = string
}

variable "ipsec_dh_groups" {
  description = ""
  type        = string
}

variable "ipsec_sa_life_time" {
  description = ""
  type        = string
}
