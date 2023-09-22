variable "map_svc" {
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