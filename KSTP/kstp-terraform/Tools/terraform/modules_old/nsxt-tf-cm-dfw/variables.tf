variable "map_policies" {
   type = any
}

variable "nsxt_policy_svc_bltin" {
   type = map
   default = {
   }
}

variable "nsxt_policy_grp_grp" {
   type = map
   default = {
   }
}

variable "nsxt_policy_svc_svc" {
   type = map
   default = {
   }
}

variable "project" {
  description = "Name of the project"
  type = string
} 

variable "environment" {
  description = "Name of the Environment"
  type = string
} 