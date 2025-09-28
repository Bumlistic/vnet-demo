variable "vm_name" {
  type        = string
  description = "Name of the Windows VM"
  default = "vnet1-vm"
}

variable "location" {
  type        = string
  description = "Azure region"
  default = "Canada Central"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group name"
  default = "vnet1-rg"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to attach the VM NIC"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B2ms"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
}

variable "admin_password" {
  type        = string
  description = "Admin password for the VM"
  sensitive   = true
}

variable "tags" {
  type        = map(string)
  default     = {}
}
