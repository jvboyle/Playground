variable  "nsx_id" {
  description = "name assigned to nsx"
  type = string
}

variable "segment_name" {
  description = "name assigned to segment"
  type = string
}

variable  "subnet_cidr" {
  description = "ip cidr"
  type = string
}

variable "display_name" {
  description = "name of the T1 gateway"
  type = string 
}

variable "edge_cluster_path" {
  description = "edge_cluster_path"
  type = string 
}

variable "tier0_path" {
  description = ""
  type = string 
}

variable "transport_zone_path" {
  description = ""
  type = string
}

variable "project" {
  description = "Name of the project"
  type = string
} 

variable "environment" {
  description = "Name of the Environment"
  type = string
} 

variable "customer" {
  description = "Name of the customer"
  type = string
} 