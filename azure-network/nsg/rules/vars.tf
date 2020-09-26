variable "resource_group_name" {}
variable "location" {}
variable "nsg_rule_name" {}
variable "nsg_name" {}
variable "nsg_priority" {}
variable "nsg_direction" {}
variable "nsg_access" {}
variable "nsg_protocol" {}
variable "nsg_source_port_range" {}
variable "nsg_destination_port_range" {}
variable "nsg_source_address_prefix" {}
variable "nsg_destination_address_prefix" {}
variable "tags" { type = map }
