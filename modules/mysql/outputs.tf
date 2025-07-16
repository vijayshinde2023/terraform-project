output "server_name" {
  value = azurerm_mysql_flexible_server.this.name
}

output "admin_username" {
  value = var.admin_username
}

output "admin_password" {
  value = var.admin_password
}

output "db_name" {
  value = var.db_name
}

output "fqdn" {
  value = azurerm_mysql_flexible_server.this.fqdn
}


