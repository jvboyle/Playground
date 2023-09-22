variable "map_policies" {
  type = any
}

variable "nsxt_policy_svc_bltin" {
  type = map(any)
  default = {
  }
}

variable "nsxt_policy_grp_grp" {
  type = map(any)
  default = {
  }
}

variable "nsxt_policy_svc_svc" {
  type = map(any)
  default = {
  }
}

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

variable "category" {
  description = "used to specify rule placement "
  type        = string
  default     = "Application"
}
