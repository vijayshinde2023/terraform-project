# Create the MySQL Flexible Server
resource "azurerm_mysql_flexible_server" "this" {
  name                = "${var.resource_prefix}-db-${var.server_name}"  # e.g., dev-db-myserver
  location            = var.location
  resource_group_name = var.resource_group_name

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  # SKU and performance tier
  sku_name = var.sku_name  # Example: B_Standard_B1ms
  version  = var.mysql_version
  zone     = var.zone

  # Backup configuration
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false

  # Storage configuration
  storage {
    size_gb = var.storage_gb
  }
}

# Create a MySQL database on the above server
resource "azurerm_mysql_flexible_database" "this" {
  name                = var.db_name
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mysql_flexible_server.this.name
  charset             = "utf8mb4"
  collation           = "utf8mb4_unicode_ci"
}
