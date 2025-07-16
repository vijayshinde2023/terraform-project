
# Creates an Azure App Service Plan used to host Web Apps
resource "azurerm_service_plan" "this" {
  name                = "${var.resource_prefix}-plan-${var.name}"  # Naming convention: <prefix>-plan-<name>
  location            = var.location                                # Azure region
  resource_group_name = var.resource_group_name                     # Target resource group
  os_type             = "Linux"                                     # Required for Linux-based Docker hosting
  sku_name            = var.sku_name                                # Tier of the App Service Plan (e.g., F1, B1, S1)
}