variable "resource_prefix" {
  description = "Prefix to be used for all resources (e.g., dev, prod)"
  type        = string
}

variable "resource_group_name" {
  description = "The base name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}
