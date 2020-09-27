/* Virtual network peering done by manaully from azure portal */
provider "azurerm" {
  # version = "=2.0.0"
  version = "~> 2.0"
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "__storageaccountname__"
    container_name       = "__containername__"
    key                  = "__key__"
    access_key           = "__accesskey__"
  }
}

/* Create Resource group */
module "rg" {
  source              = "../terraformsri/azure-network/rg/"
  resource_group_name = format("%s%s.%s", var.resource_prefix, var.location, var.virtual_network_name)
  location            = var.location
  tags                = var.tags
}
