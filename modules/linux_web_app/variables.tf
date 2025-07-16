variable "resource_prefix" {
  description = "Prefix for all resource names"
  type        = string
}

variable "name" {
  description = "Unique name for the web app"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "app_service_plan_id" {
  description = "ID of the App Service Plan"
  type        = string
}

variable "app_settings" {
  description = "Custom application settings"
  type        = map(string)
  default     = {}
}

variable "custom_domain" {
  description = "Fully qualified domain name to bind to the app"
  type        = string
}

variable "certificate_id" {
  description = "ID of the uploaded SSL certificate"
  type        = string
}

variable "docker_image" {
  type = string
}