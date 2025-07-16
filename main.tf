# Generate a random ID to append to resource names for uniqueness
resource "random_id" "random" {
  byte_length = 4
}

# Fetch tenant and client information from the current Azure CLI session
data "azurerm_client_config" "current" {}

# Create a resource group using module
module "resource_group" {
  source               = "./modules/resource_group"
  resource_prefix      = var.resource_prefix
  resource_group_name  = var.resource_group_name
  location             = var.location
}

# Create an App Service Plan (Linux) inside the above resource group
module "app_service_plan" {
  source              = "./modules/app_service_plan"
  resource_prefix     = var.resource_prefix
  name                = var.app_service_plan_name
  location            = var.location
  resource_group_name = module.resource_group.name
  sku_name            = var.app_service_sku
}

# Deploy MySQL Flexible Server + Database in the same resource group
module "mysql" {
  source              = "./modules/mysql"
  server_name         = "mysql-flex-${random_id.random.hex}"
  resource_prefix     = var.resource_prefix
  db_name             = "appdb"
  admin_username      = "dbadmin"
  admin_password      = "P@ssword1234!" # Store this in Key Vault in production
  resource_group_name = module.resource_group.name
  location            = var.location
}

# Create Azure Key Vault and store DB credentials
module "key_vault" {
  source              = "./modules/key_vault"
  name                = "kv-${random_id.random.hex}"
  resource_prefix     = var.resource_prefix
  location            = var.location
  resource_group_name = module.resource_group.name
  db_user             = module.mysql.admin_username
  db_pass             = module.mysql.admin_password
  admin_object_id     = data.azurerm_client_config.current.object_id
}

# Assign Key Vault access to the Web App's system-assigned identity
resource "azurerm_key_vault_access_policy" "webapp_access" {
  key_vault_id = module.key_vault.vault_id
  tenant_id    = data.azurerm_client_config.current.tenant_id
  object_id    = module.linux_web_app.identity_principal_id

  secret_permissions = [
    "Get",
    "List"
  ]
}

# Upload SSL Certificate for custom domain
resource "azurerm_app_service_certificate" "ssl_cert" {
  name                = "my-ssl-cert"
  resource_group_name = module.resource_group.name
  location            = var.location

  pfx_blob = filebase64("${path.module}/certs/your-cert.pfx")
  password = var.pfx_password
}

# Deploy a Linux Web App using Docker container with Key Vault and MySQL configurations
module "linux_web_app" {
  source              = "./modules/linux_web_app"
  resource_prefix     = var.resource_prefix
  name                = var.web_app_name
  location            = var.location
  resource_group_name = module.resource_group.name
  app_service_plan_id = module.app_service_plan.id
  docker_image        = var.docker_image
  custom_domain       = "yourdomain.com"
  certificate_id      = azurerm_app_service_certificate.ssl_cert.id

  app_settings = {
    DB_HOST = module.mysql.fqdn
    DB_USER = module.mysql.admin_username
    DB_PASS = module.mysql.admin_password
    DB_NAME = module.mysql.db_name
  }
}
