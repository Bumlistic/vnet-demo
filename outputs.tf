output "vnet_id" {
  value = module.vnet.vnet_id
}

output "subnet_id" {
  value = module.vnet.subnet_id
}

output "vm_id" {
  value = module.windows_vm.vm_id
}

output "vm_private_ip" {
  value = module.windows_vm.vm_private_ip
}

output "vm_public_ip" {
  value = module.windows_vm.vm_public_ip
}
