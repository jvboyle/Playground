/*
variable "host" {
   type = string
   default = "10.63.70.200"
}

variable "username" {
   type = string
   default = "admin"
}

variable "password" {
   type = string
}
*/

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

variable "map_ipset" {
   type = map
   default = {
   }
}

