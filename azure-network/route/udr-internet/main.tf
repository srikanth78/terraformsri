resource "azurerm_route" "udr_route_internet" {
  name                = var.udr_net_name
  route_table_name    = var.route_table_name
  resource_group_name = var.resource_group_name
  address_prefix      = var.udr_net_address_prefix
  next_hop_type       = var.udr_net_next_hop_type
}
