terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.5.0"
    }
  }
}

provider "azurerm" {
    subscription_id = var.subscription_id
}