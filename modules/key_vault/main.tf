# Create an Azure Key Vault with access policy for admin
resource "azurerm_key_vault" "this" {
 name = "${var.resource_prefix}-kv-${var.name}"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name                    = "standard"
  soft_delete_retention_days = 7
 # Grant admin access to manage secrets
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = var.admin_object_id  # Typically your user object ID
    secret_permissions = [
      "Set", "Get", "List", "Delete"
    ]
  }
}

# Store DB username as a secret in Key Vault
resource "azurerm_key_vault_secret" "db_user" {
  name         = "db-user"
  value        = var.db_user
  key_vault_id = azurerm_key_vault.this.id
}
# Store DB password as a secret in Key Vault
resource "azurerm_key_vault_secret" "db_pass" {
  name         = "db-pass"
  value        = var.db_pass
  key_vault_id = azurerm_key_vault.this.id
}
