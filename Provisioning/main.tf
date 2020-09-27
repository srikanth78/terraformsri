/* Virtual network peering done by manaully from azure portal */
provider "azurerm" {
  # version = "=2.0.0"
  version = "~> 2.0"
  features {}
}

terraform {
  backend "azurerm" {
    storage_account_name = "internaldemoapp"
    container_name       = "appstore1"
    access_key           = "LcT0g0zuFni8Js0uY/bdUykQKFDW0lSbGJdZkXNWWH3Ozekz9zJ+zjyLNGSZzTdUNXokyZfFJTZ1losTsBqLtA=="
  }
}

/* Create Resource group */
module "rg" {
  source              = "../azure-network/rg/"
  resource_group_name = format("%s%s.%s", var.resource_prefix, var.location, var.virtual_network_name)
  location            = var.location
  tags                = var.tags
}
