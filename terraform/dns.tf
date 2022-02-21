#DNS Zone and A Record Creation
resource "azurerm_dns_zone" "dns_zone" {
  name                = "demo.bhs.com"
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_dns_a_record" "dns_a_record" {
  name                = "test"
  zone_name           = azurerm_dns_zone.dns_zone.name
  resource_group_name = azurerm_resource_group.resource_group.name
  ttl                 = 300
  target_resource_id  = azurerm_public_ip.public_ip.id
}