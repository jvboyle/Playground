
#tfsec:ignore:GEN003
provider "azuread" {
}

provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}

provider "tls" {}


data "azurerm_resource_group" "tfstate" {
  name = "rg-kstp-mvp-infra-kcl-eastus-009"
}


#tfsec:ignore:azure-storage-default-action-deny
resource "azurerm_storage_account" "tfstate" {
  name                     = "kstp0storage0act"
  resource_group_name      = data.azurerm_resource_group.tfstate.name
  location                 = data.azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  #  allow_blob_public_access = false
  min_tls_version = "TLS1_2"

  blob_properties {
    versioning_enabled = true
  }

  tags = {
    Project       = "kstp Global"
    Environment   = "kstp Global"
    OwnedBy       = "Renato Ramos"
    accountid     = "KIWAAPJ"
    practice      = "cloud"
    teamorproject = "KSTP"
    Managed_By    = split("/", path.cwd)[length(split("/", path.cwd)) - 1]
  }
}

resource "azurerm_storage_container" "tfstate_ag1" {
  name                  = "ag1-kstp-tf-state-blob"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "tfstate_ap1" {
  name                  = "ap1-kstp-tf-state-blob"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "tfstate_eu1" {
  name                  = "eu1-kstp-tf-state-blob"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "tfstate_dt1" {
  name                  = "dt1-kstp-tf-state-blob"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "tfstate_azure_infra" {
  name                  = "azure-infra-kstp-tf-state-blob"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}

resource "azurerm_storage_container" "tfstate_in1" {
  name                  = "in1-kstp-tf-state-blob"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}
