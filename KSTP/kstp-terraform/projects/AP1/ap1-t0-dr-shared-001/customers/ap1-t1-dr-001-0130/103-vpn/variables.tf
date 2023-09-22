
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
variable "local_ep" {

  default = "Add Local endpoint address here"
  
}
variable "peer_address"{
  description = "VPN Peer Address"
  #VPN Peer IP addres ADD Below
  default = "Add here Peer IP Address"
}            
variable "Encryption_domian_source" {
  #Encryption domain source IP address
  default = "ADD here source IP address"
  
}
variable "Encryption_domian_Destination"{
  #Encryption domain Destination IP address
  default = "Add here Destination IP address"
}
variable "ike_profile_path" {

  default = "Add Profile path here"
  
}
