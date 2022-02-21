#Required Output
output "rg-name" {
  value = azurerm_resource_group.resource_group.name
}

output "vnet-name" {
  value = azurerm_virtual_network.vnet.name
}

output "vnet-id" {
  value = azurerm_virtual_network.vnet.id
}

output "subnets" {
  value = azurerm_subnet.subnet
}

output "public-ip" {
  value = azurerm_public_ip.public_ip.ip_address
}

output "public-ip-id" {
  value = azurerm_public_ip.public_ip.id
}