# Create an Azure Resource Group
resource "azurerm_resource_group" "this" {
  name     = "${var.resource_prefix}-rg-${var.resource_group_name}" # Example: dev-rg-myproject
  location = var.location                                            # Example: East US
}