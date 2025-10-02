terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }

terraform {
  backend "azurerm" {}
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id 
}
