output "name" {
  description = "The name of the Linux Web App"
  value       = azurerm_linux_web_app.this.name
}

output "identity_principal_id" {
  description = "The principal ID of the system-assigned identity"
  value       = azurerm_linux_web_app.this.identity[0].principal_id
}
