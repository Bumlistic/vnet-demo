module "vnet" {
  source               = "./modules/vnet"
  vnet_name            = var.vnet_name
  location             = var.location
  resource_group_name  = var.resource_group_name
  address_space        = var.address_space
  subnet_name          = var.subnet_name
  subnet_prefixes      = var.subnet_prefixes
  tags                 = {
    "environment" = "development"
    "Created with" = "Terraform"
  }
}

module "windows_vm" {
  source              = "./modules/windows-vm"
  vm_name             = "vnet1-winvm"
  location            = var.location
  resource_group_name = var.resource_group_name
  subnet_id           = module.vnet.subnet_id     # <-- Use subnet output from VNet module
  vm_size             = "Standard_B2ms"
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  tags = {
    "Environment" = "Development"
    "Created with" = "Terraform"
  }
}