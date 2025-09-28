variable "location" {
    type = string
    description = "This is location where the resource will be created"
    default = "Canada Central"
}

variable "resource_group_name" {
    type = string
    description = "The resource group name"
    default = "vnet1-rg"
}

variable "vnet_name" {
    type = string
    description = "Name of the virtual network"
    default = "vnet1"
}

variable "address_space" {
    type = list(string)
    description = "The address space that is used by the virtual network"
    default = ["10.0.0.0/16"]
}

variable "subnet_name" {
    type = string
    description = "The name of the subnet"
  default = "vnet1-subnet"
}

variable "subnet_prefixes" {
    type = list(string)
    description = "prefix of the VNet subnet"
  default = ["10.0.1.0/24"]
}

variable "tags" {
  type        = map(string)
  description = "Tags for the resources"
  default     = {
    "Environment" = "Development"
    "Created with" = "Terraform"
  }
}