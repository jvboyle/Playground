data "azurerm_resource_group" "select" {
  name     = "rg-kstp-mvp-infra-kcl-eastus-009"
}

resource "azurerm_container_registry" "acr" {
  name                = "kstp0core0acr"
  resource_group_name = data.azurerm_resource_group.select.name
  location            = data.azurerm_resource_group.select.location
  sku                 = "Basic"

  tags = {    
    Project     = var.project
    Environment = var.environment
  }
}