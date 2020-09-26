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
  source              = "../srikanth78/terraformsri/azure-network/rg/"
  resource_group_name = format("%s%s.%s", var.resource_prefix, var.location, var.virtual_network_name)
  location            = var.location
  tags                = var.tags
}
/*
/* Create Virtual Network */
module "vnet" {
  source                        = "../../../../../../common/provisioning/modules/azure-network/vnet/"
  resource_group_name           = module.rg.output_rg
  location                      = module.rg.output_location
  virtual_network_name          = format("%s%s.%s", var.resource_prefix, var.location, var.virtual_network_name)
  virtual_network_address_space = var.virtual_network_address_space
  tags                          = var.tags
}
/* Create Subnet */
module "subnet_aks" {
  source               = "../../../../../../common/provisioning/modules/azure-network/subnet/"
  subnet_name          = format("%s%s.%s.%s", var.resource_prefix, var.location, var.virtual_network_name, var.subnet_name[0])
  resource_group_name  = module.rg.output_rg
  virtual_network_name = module.vnet.output_vnet
  subnet_address_space = var.subnet_address_space[0]
}

/* Create AKS */
module "aks" {
  source                = "../../../../../../common/provisioning/modules/azure-container/aks-pvt/"
  subnet_id             = module.subnet_aks.output_subnet_id
  resource_group_name   = module.rg.output_rg
  virtual_network_name  = module.vnet.output_vnet
  cluster_name          = var.cluster_name
  location              = var.location
  dns_prefix            = var.cluster_name
  load_balancer_sku     = var.load_balancer_sku
  os_disk_size_gb       = var.os_disk_size_gb
  agent_count           = var.agent_count
  vm_size               = var.vm_size
  client_id             = substr("__serverappid__", 0, 36)
  client_secret         = "__serverappsecret__"
  docker_bridge_cidr    = var.docker_bridge_cidr
  dns_service_ip        = var.dns_service_ip
  service_cidr          = var.service_cidr
  network_plugin        = var.network_plugin
  tags                  = var.tags
  client_app_id         = "__clientappid__"
  server_app_id         = "__serverappid__"
  server_app_secret     = "__serverappsecret__"
  tenant_id             = "__tenantid__"
  worker_node_pool_name = var.worker_node_pool_name
  enable_auto_scaling   = var.enable_auto_scaling
  kubernetes_version    = var.kubernetes_version
}
*/

/*
# Create Route Table 
module "rt_aks" {
  source              = "../../../../../../common/provisioning/modules/azure-network/route/"
  route_table_name    = format("%s-rt", module.subnet_aks.output_subnet_name)
  rt_ass_subnet_id    = module.subnet_aks.output_subnet_id
  location            = module.rg.output_location
  resource_group_name = module.rg.output_rg
  tags                = var.tags
}

resource "azurerm_subnet_route_table_association" "subnet_rt_assoc_aks" {
  subnet_id      = module.subnet_aks.output_subnet_id
  route_table_id = module.rt_aks.output_rt_id
}

# Create Route Table with Virtaul Appliance 
module "route_va_aks_udr1" {
  source                        = "../../../../../../common/provisioning/modules/azure-network/route/udr-virtualappliance/"
  udr_va_name                   = format("%s-rt-udr1", module.subnet_aks.output_subnet_name)
  route_table_name              = module.rt_aks.output_rt_name
  resource_group_name           = module.rg.output_rg
  udr_va_address_prefix         = var.udr_va_address_prefix[0]
  udr_va_next_hop_type          = var.udr_va_next_hop_type
  udr_va_next_hop_in_ip_address = var.udr_va_next_hop_in_ip_address[0]
}

module "route_va_aks_udr2" {
  source                        = "../../../../../../common/provisioning/modules/azure-network/route/udr-virtualappliance/"
  udr_va_name                   = format("%s-rt-udr2", module.subnet_aks.output_subnet_name)
  route_table_name              = module.rt_aks.output_rt_name
  resource_group_name           = module.rg.output_rg
  udr_va_address_prefix         = var.udr_va_address_prefix[1]
  udr_va_next_hop_type          = var.udr_va_next_hop_type
  udr_va_next_hop_in_ip_address = var.udr_va_next_hop_in_ip_address[1]
}

module "route_va_aks_udr3" {
  source                        = "../../../../../../common/provisioning/modules/azure-network/route/udr-virtualappliance/"
  udr_va_name                   = format("%s-rt-udr3", module.subnet_aks.output_subnet_name)
  route_table_name              = module.rt_aks.output_rt_name
  resource_group_name           = module.rg.output_rg
  udr_va_address_prefix         = var.udr_va_address_prefix[2]
  udr_va_next_hop_type          = var.udr_va_next_hop_type
  udr_va_next_hop_in_ip_address = var.udr_va_next_hop_in_ip_address[1]
}

*/
