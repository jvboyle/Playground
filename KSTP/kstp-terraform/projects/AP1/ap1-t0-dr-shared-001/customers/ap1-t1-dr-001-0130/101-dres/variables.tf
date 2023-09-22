
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
variable "SegmentGateway" {

description = "ADD subnet Gateway for DRES Below"
default = "100.80.100.1/24"

}


