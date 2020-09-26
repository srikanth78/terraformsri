resource "azurerm_route" "udr_route_virtualappliance" {
  name                   = var.udr_va_name
  route_table_name       = var.route_table_name
  resource_group_name    = var.resource_group_name
  address_prefix         = var.udr_va_address_prefix
  next_hop_type          = var.udr_va_next_hop_type
  next_hop_in_ip_address = var.udr_va_next_hop_in_ip_address
}
