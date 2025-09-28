terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.41.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "vnet1-storage-infra-rg"
    storage_account_name = "vnet1demostorageaccount"
    container_name = "vnet1-container"
    key = "vnet1.tfstate"
    subscription_id = "b65e8ffb-04e2-41cf-a206-4af301cfe106"
    }
}

provider "azurerm" {
  # Configuration options
  features {}
  subscription_id = var.subscription_id 
}