variable "map_policies" {
   type = any
}

variable "map_groups" {
   type = map
   default = {
   }
}

variable "map_services" {
   type = map
   default = {
   }
}

/*
variable "map_ipset" {
   type = map
   default = {
   }
}
*/

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