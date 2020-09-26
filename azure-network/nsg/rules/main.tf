resource "azurerm_network_security_rule" "security_rule" {
  name                        = var.nsg_rule_name
  priority                    = var.nsg_priority
  direction                   = var.nsg_direction
  access                      = var.nsg_access
  protocol                    = var.nsg_protocol
  source_port_range           = var.nsg_source_port_range
  destination_port_range      = var.nsg_destination_port_range
  source_address_prefix       = var.nsg_source_address_prefix
  destination_address_prefix  = var.nsg_destination_address_prefix
  resource_group_name         = var.resource_group_name
  network_security_group_name = var.nsg_name
}
