terraform {
   required_version = ">= 1.0"
   backend "azurerm" {
      source  = "hashicorp/azurerm"
      version = ">= 3.0.0"
      }
   required_providers {     
      azuread = {
         source  = "hashicorp/azuread"
         version = ">= 2.15.0"
      }
      azurerm = {
         source  = "hashicorp/azurerm"
         version = ">= 3.0.0"
      }
      nsxt = {
         source = "vmware/nsxt"
         version = ">= 3.2.0"
      }
   }
 }

provider "nsxt" {
   allow_unverified_ssl = true
   max_retries = 10
   retry_min_delay = 500
   retry_max_delay = 5000
   retry_on_status_codes = [429]
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}