/* Virtual network peering done by manaully from azure portal */
provider "azurerm" {
  # version = "=2.0.0"
  version = "=2.7.0"
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
  source              = "../azure-network/rg/"
  resource_group_name = var.resource_group_name
  location            = var.location
 }
