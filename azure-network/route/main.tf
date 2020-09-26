resource "azurerm_route_table" "rt" {
  name                          = var.route_table_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  disable_bgp_route_propagation = false
  tags                          = var.tags
}
