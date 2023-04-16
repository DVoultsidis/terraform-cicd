# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "main" {
  name     = "IndianExample"
  location = var.location
}

# # Create a virtual network within the resource group
resource "azurerm_virtual_network" "main" {
  name                = "IndianNetwork"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  address_space       = ["10.0.0.0/16"]
}


variable "location" {
  type = string

  description = "the location of the server"

  validation {
    condition = length(var.location) > 4
    error_message = "length of location name should be > 4"
  }
}


