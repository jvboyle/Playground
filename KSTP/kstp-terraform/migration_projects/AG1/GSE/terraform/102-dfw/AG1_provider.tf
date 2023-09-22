terraform {
   required_providers {
      nsxt = {
         source = "vmware/nsxt"
         version = ">= 3.1.1"
      }
   }
}

terraform {
  backend "azurerm" {
    source  = "hashicorp/azurerm"
    version = "=3.0.0"
  }
}

provider "azuread" {
}

provider "azurerm" {
  skip_provider_registration = "true"
  container_name = ag1-kstp-tf-state-blob
  features {}
}

provider "tls" {}

provider "nsxt" {
   allow_unverified_ssl = true
   max_retries = 10
   retry_min_delay = 500
   retry_max_delay = 5000
   retry_on_status_codes = [429]
}
