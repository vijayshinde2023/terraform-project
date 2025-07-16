# Output the name of the created Resource Group
output "resource_group_name" {
  value = module.resource_group.name
  description = "The name of the Azure Resource Group created by the resource_group module"
}

# Output the Azure region where the Resource Group was created
output "resource_group_location" {
  value = module.resource_group.location
  description = "The location/region of the Azure Resource Group"
}

# Output the name of the App Service Plan
output "app_service_plan_name" {
  value = module.app_service_plan.name
  description = "The name of the App Service Plan used by the Web App"
}

# Output the name of the Linux Web App
output "web_app_name" {
  value = module.linux_web_app.name
  description = "The name of the Linux-based Web App (Docker) deployed"
}

# Output the Key Vault URI (used for accessing secrets securely)
output "key_vault_uri" {
  value       = module.key_vault.vault_uri
  description = "The DNS URI of the Azure Key Vault"
}

# Output the Managed Identity (principal ID) of the Web App (used for KV access)
output "web_app_identity_principal_id" {
  value       = module.linux_web_app.identity_principal_id
  description = "The principal ID of the system-assigned managed identity for the Web App"
}
