output "vm_id" {
  value = azurerm_windows_virtual_machine.vnet1_virtual_machine.id
}

output "vm_private_ip" {
  value = azurerm_network_interface.vnet1_network_interface.private_ip_address
}

output "vm_public_ip" {
  value = azurerm_public_ip.vnet1_public_ip.ip_address
}
