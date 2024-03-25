output "linux_hostnames" {
  value = { for k, vm in azurerm_linux_virtual_machine.vmlinux : k => vm.name }
}

output "linux_private_ips" {
  value = { for k, nic in azurerm_network_interface.linux_nic : k => nic.private_ip_address }
}

output "linux_public_ips" {
  value = { for k, pip in azurerm_public_ip.linux_pip : k => pip.ip_address }
}

output "linux_dns_names" {
  value = { for k, pip in azurerm_public_ip.linux_pip : k => pip.fqdn }
}

output "linux_avs_names" {
  value = azurerm_availability_set.avset.name
}

output "linux_ids" {
  value = { for k, vm in azurerm_linux_virtual_machine.vmlinux : k => vm.id }
}

output "linux_nic_ids" {
  value = { for k, nic in azurerm_network_interface.linux_nic : k => nic.id }
}
