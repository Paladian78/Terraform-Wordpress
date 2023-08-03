resource "azurerm_mysql_server" "mysql" {
  name                              = var.mysql_server_name
  location                          = var.location
  resource_group_name               = var.resource_group_name
  administrator_login               = var.administrator_login
  administrator_login_password      = var.administrator_login_password
  sku_name                          = "GP_Gen5_32"
  storage_mb                        = 5120
  version                           = "5.7"
  public_network_access_enabled     = var.public_network_access_enabled
  ssl_enforcement_enabled           = true
  ssl_minimal_tls_version_enforced  = "TLS1_2"
}

resource "azurerm_private_endpoint" "privateEP" {
  name                = "demo-endpoint"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = var.subnet_id

  private_service_connection {
    name                           = "demo-privateserviceconnection"
    private_connection_resource_id = azurerm_mysql_server.mysql.id
    subresource_names              = ["mysqlServer"]
    is_manual_connection           = false
  }
}