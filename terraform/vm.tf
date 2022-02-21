#Create Virtual Machine
resource "azurerm_virtual_machine" "virtual_machine" {
  name                  = local.virtual_machine_name
  location              = azurerm_resource_group.resource_group.location
  resource_group_name   = azurerm_resource_group.resource_group.name
  network_interface_ids = [azurerm_network_interface.network_interface.id]
  vm_size               = var.vm_size

  delete_os_disk_on_termination    = true
  delete_data_disks_on_termination = true
  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = var.comp_name
    admin_username = var.admin_username
    admin_password = var.pwd
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  tags = {
    environment = local.environment_tag
  }
}