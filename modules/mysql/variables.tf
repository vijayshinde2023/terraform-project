variable "resource_prefix" {
  description = "Prefix for naming resources"
  type        = string
}

variable "server_name" {
  description = "Unique name for the MySQL server"
  type        = string
}

variable "db_name" {
  description = "MySQL database name"
  type        = string
}

variable "admin_username" {
  description = "MySQL admin username"
  type        = string
}

variable "admin_password" {
  description = "MySQL admin password"
  type        = string
  sensitive   = true
}

variable "resource_group_name" {
  description = "Azure Resource Group"
  type        = string
}

variable "location" {
  description = "Azure location"
  type        = string
}

variable "sku_name" {
  description = "SKU name for MySQL (e.g., B_Standard_B1ms)"
  type        = string
  default     = "B_Standard_B1ms"
}

variable "mysql_version" {
  description = "MySQL version"
  type        = string
  default     = "8.0.21"
}

variable "zone" {
  description = "Availability zone (e.g., 1, 2, 3)"
  type        = string
  default     = "1"
}

variable "storage_gb" {
  description = "Storage size in GB"
  type        = number
  default     = 32
}
