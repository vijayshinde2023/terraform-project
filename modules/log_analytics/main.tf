resource "azurerm_log_analytics_workspace" "this" {
  name                = "${var.resource_prefix}-log-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

output "workspace_id" {
  value = azurerm_log_analytics_workspace.this.workspace_id
}
output "workspace_key" {
  value = azurerm_log_analytics_workspace.this.primary_shared_key
}
