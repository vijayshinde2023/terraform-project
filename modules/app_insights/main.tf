resource "azurerm_application_insights" "this" {
  name                = "${var.resource_prefix}-ai-${var.name}"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

output "instrumentation_key" {
  value = azurerm_application_insights.this.instrumentation_key
}
output "connection_string" {
  value = azurerm_application_insights.this.connection_string
}
