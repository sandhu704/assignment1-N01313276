output "windows_hostname" {
  value = azurerm_windows_virtual_machine.vmwindows[*].name
}
output "windows_private_ip" {
  value = azurerm_windows_virtual_machine.vmwindows[*].private_ip_address
}
output "windows_public_ip" {
  value = azurerm_windows_virtual_machine.vmwindows[*].public_ip_address
}
output "windows_dns_name" {
  value = azurerm_public_ip.windows_pip[*].fqdn
}
