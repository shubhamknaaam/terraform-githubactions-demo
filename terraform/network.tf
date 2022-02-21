locals {
  virtual_network_name        = lower("bhs-${local.environment_tag}-${local.region.prefix}-vnet")
  subnet_name                 = lower("bhs-${local.environment_tag}-${local.region.prefix}-subnet")
  virtual_machine_name        = lower("bhs-${local.environment_tag}-${local.region.prefix}-vm")
  public_ip_name              = lower("bhs-${local.environment_tag}-${local.region.prefix}-pub-ip")
  network_interface_name      = lower("bhs-${local.environment_tag}-${local.region.prefix}-nic")
  network_security_group_name = lower("bhs-${local.environment_tag}-${local.region.prefix}-nsg")
}

#Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = local.virtual_network_name
  address_space       = var.address_space
  location            = local.region.name
  resource_group_name = azurerm_resource_group.resource_group.name
}

#Create Subnet
resource "azurerm_subnet" "subnet" {
  name                 = local.subnet_name
  resource_group_name  = azurerm_resource_group.resource_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.address_prefix
}

#Create Public IP
resource "azurerm_public_ip" "public_ip" {
  name                = local.public_ip_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

#Create Network Interface with IP Configuration
resource "azurerm_network_interface" "network_interface" {
  name                = local.network_interface_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  ip_configuration {
    name                          = "testconfiguration1"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

#Create NSG
resource "azurerm_network_security_group" "network_security_group" {
  name                = local.network_security_group_name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  security_rule {
    name                       = "bhsdev"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = local.environment_tag
  }
}

#Create NIC and NSG Association
resource "azurerm_network_interface_security_group_association" "network_interface_security_group_association" {
  network_interface_id      = azurerm_network_interface.network_interface.id
  network_security_group_id = azurerm_network_security_group.network_security_group.id
}