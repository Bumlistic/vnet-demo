# Public IP for RDP access
resource "azurerm_public_ip" "vnet1_public_ip" {
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
}

# NIC for the VM
resource "azurerm_network_interface" "vnet1_network_interface" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vnet1_public_ip.id
  }
}

# NSG to allow RDP (3389) and ICMP (optional)
resource "azurerm_network_security_group" "vnet1_nsg" {
  name                = "${var.vm_name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "RDP"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  # Ensure NSG is destroyed after NIC association
  depends_on = [
    azurerm_network_interface_security_group_association.vnet1_nic_nsg
  ]
}

# NSG association with NIC
resource "azurerm_network_interface_security_group_association" "vnet1_nic_nsg" {
  network_interface_id      = azurerm_network_interface.vnet1_network_interface.id
  network_security_group_id = azurerm_network_security_group.vnet1_nsg.id
}

# Windows VM
resource "azurerm_windows_virtual_machine" "vnet1_virtual_machine" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.vnet1_network_interface.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  tags = var.tags
}
