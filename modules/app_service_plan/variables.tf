# Prefix to use for naming all resources
variable "resource_prefix" {
  description = "Prefix for naming all resources"
  type        = string
}

# Name of the app service plan (e.g., 'myapp')
variable "name" {
  description = "Unique name for the App Service Plan"
  type        = string
}

# Azure region for the App Service Plan
variable "location" {
  description = "Azure location for the resource"
  type        = string
}

# Resource Group where the App Service Plan will reside
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

# SKU (Pricing tier) for the App Service Plan: F1, B1, S1, P1v2, etc.
variable "sku_name" {
  description = "SKU tier of the App Service Plan (F1 for free, B1 for basic)"
  type        = string
}
