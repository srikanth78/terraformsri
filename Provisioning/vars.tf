variable "resource_prefix" { type = string }
variable "location" { type = string }
variable "virtual_network_name" { type = string }
variable "subnet_name" { type = list(string) }
variable "virtual_network_address_space" { type = string }
variable "subnet_address_space" { type = list(string) }

