# Create the Linux App Service with Docker container
resource "azurerm_linux_web_app" "this" {
  name                = "${var.resource_prefix}-app-${var.name}" # e.g., dev-app-web
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = var.app_service_plan_id

  # Enable managed identity (used for Key Vault access, etc.)
  identity {
    type = "SystemAssigned"
  }

  # App runtime stack and Docker container settings
  site_config {
    always_on = true

    application_stack {
      docker_image_name = "mcr.microsoft.com/azuredocs/aci-helloworld:latest"
      # If needed: docker_image_tag = "latest"
    }
  }

  # App settings (merged with custom values passed from root)
  app_settings = merge(
    {
      WEBSITES_ENABLE_APP_SERVICE_STORAGE   = "false"
      APPINSIGHTS_INSTRUMENTATIONKEY        = var.app_insights_instrumentation_key
      APPLICATIONINSIGHTS_CONNECTION_STRING = var.app_insights_connection_string
    },
    var.app_settings,

  )
}

# Bind a custom domain to the app
resource "azurerm_app_service_custom_hostname_binding" "custom_domain" {
  hostname            = var.custom_domain # e.g., app.mydomain.com
  app_service_name    = azurerm_linux_web_app.this.name
  resource_group_name = var.resource_group_name
}

# Attach an SSL certificate to the custom domain
resource "azurerm_app_service_certificate_binding" "ssl_binding" {
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.custom_domain.id
  certificate_id      = var.certificate_id # passed from root module
  ssl_state           = "SniEnabled"
}
