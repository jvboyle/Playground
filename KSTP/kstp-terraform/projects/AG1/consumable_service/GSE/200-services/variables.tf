variable "map_svc" {
   type = map
   description = "json file containing map_svr key"
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


