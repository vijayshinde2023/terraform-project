variable "resource_prefix" {
  description = "Prefix for naming all resources"
  type        = string
}

variable "name" {
  description = "Unique identifier or name for the Key Vault"
  type        = string
}

variable "location" {
  description = "Azure region to deploy resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "admin_object_id" {
  description = "Azure AD object ID of the administrator"
  type        = string
}

variable "db_user" {
  description = "Database admin username to be stored as secret"
  type        = string
}

variable "db_pass" {
  description = "Database admin password to be stored as secret"
  type        = string
}

data "azurerm_client_config" "current" {}
