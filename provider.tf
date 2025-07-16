terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.78.0"
    }
  }
}
provider "azurerm" {
  features {}
  subscription_id = "fbd1a957-d4ea-47e6-9131-8b5171fbc611"  # Replace with your actual subscription ID
}

