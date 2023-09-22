variable "host" {
   type = string
   default = "10.63.70.200"
}

 variable  "username" {
    type = string
    default = "JBoyle@ap1.sp.ibm.local"
}

variable  "password" {
    type = string
    default = "SVZE(&XqBm%je!X"
} 

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

