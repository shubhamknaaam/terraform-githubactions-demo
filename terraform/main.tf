locals {
  environment_tag = lookup(var.environments, var.environment)
  region          = lookup(var.regions, var.region)
  rg_name         = lower("bhs-${local.environment_tag}-${local.region.prefix}-rg")
}

#Client Configuration Data
data "azurerm_client_config" "current" {

}

#Create Resource Group
resource "azurerm_resource_group" "resource_group" {
  name     = local.rg_name
  location = local.region.name
}