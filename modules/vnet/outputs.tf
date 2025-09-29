output "vnet_id" {
  value = azurerm_virtual_network.vnet1_virtual_network.id
}

output "subnet_id" {
  value = azurerm_subnet.vnet1_subnet.id
}
