output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}
output "vnet_space" {
  value = azurerm_virtual_network.vnet.address_space
}
output "subnet1_name" {
  value = azurerm_subnet.subnet1.name
}
output "subnet1_space" {
  value = azurerm_subnet.subnet1.address_prefixes
}

output "ng1_name" {
  value = azurerm_network_security_group.nsg1.name
}

output "subnet1_id" {
  value = azurerm_subnet.subnet1.id
}

