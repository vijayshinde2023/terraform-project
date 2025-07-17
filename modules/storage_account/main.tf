resource "azurerm_storage_account" "this" {
  name                     = lower(substr(replace("${var.resource_prefix}st${var.name}", "-", ""), 0, 24))
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

output "name" {
  value = azurerm_storage_account.this.name
}
