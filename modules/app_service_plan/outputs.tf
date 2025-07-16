# Output the ID of the App Service Plan (used by Web App module)
output "id" {
  description = "The ID of the App Service Plan"
  value       = azurerm_service_plan.this.id
}

# Output the name of the App Service Plan
output "name" {
  description = "The name of the App Service Plan"
  value       = azurerm_service_plan.this.name
}
