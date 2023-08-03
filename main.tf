resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# This module creates a virtual network, subnet, public IP address, and network interface.
# AWS Equivalent: VPC, Subnet, Elastic IP, and Network Interface
module "network" {
  source              = "./modules/network"
  prefix              = var.prefix
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  domain_name_label   = var.domain_name_label 
  depends_on = [ 
    azurerm_resource_group.rg
  ]
}

# This module creates a MySQL server and a private endpoint.
# AWS Equivalent: RDS MySQL and VPC Endpoint
module "database" {
  source                        = "./modules/database"
  resource_group_name           = azurerm_resource_group.rg.name
  location                      = azurerm_resource_group.rg.location
  mysql_server_name             = var.mysql_server_name
  administrator_login           = var.sql_administrator_login
  administrator_login_password  = var.sql_administrator_login_password
  public_network_access_enabled = var.public_network_access_enabled
  subnet_id                     = module.network.subnet_id  
  depends_on = [ 
    module.network
  ]
}

# This module creates a virtual machine and installs WordPress.
# AWS Equivalent: EC2 Instance 
module "virtualMachine" {
  source               = "./modules/virtualMachine"
  prefix               = var.prefix
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  domain_name_label    = var.domain_name_label
  network_interface_id = module.network.network_interface_id
  public_ip_address    = module.network.public_ip_address
  admin_username       = var.admin_username
  admin_password       = var.admin_password
  wordpress_image      = var.wordpress_image
  depends_on = [ 
    module.database
  ]
}

