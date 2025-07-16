variable "resource_prefix" {
  type        = string
  description = "Prefix for all resources"
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region for the resource group"
  type        = string
  default     = "East US"
}

variable "app_service_plan_name" {
  type        = string
  description = "Name part for App Service Plan (without prefix)"
}

variable "web_app_name" {
  type        = string
  description = "Name part for Web App (without prefix)"
}

variable "docker_image" {
  type        = string
  description = "Docker image to run (e.g., nginx:latest or custom registry)"
}

variable "pfx_password" {
  type        = string
  description = "Password for .pfx certificate file"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to all resources"
  default = {
    environment = "dev"
    project     = "demo"
    owner       = "vijay"
  }
}

variable "environment" {
  type        = string
  default     = "dev"
  description = "Environment name (used in resource names and tagging)"
}
variable "app_service_sku" {
  description = "SKU Tier for App Service Plan (F1, B1, S1, etc.)"
  type        = string
}