output "rg" {
  value = module.rgroup-N01313276.rg
}
output "vnet_name" {
  value = module.network-N01313276.vnet_name
}
output "subnet1_name" {
  value = module.network-N01313276.subnet1_name
}
output "log_analytics_workspace" {
  value = module.common-N01313276.log_analytics_workspace
}
output "recovery_services_vault" {
  value = module.common-N01313276.recovery_services_vault
}
output "storage_account" {
  value = module.common-N01313276.storage_account
}

output "linux_hostnames"{
  value = module.vmlinux-N01313276.linux_hostnames
}

  output "linux_dns_names" {
  value = module.vmlinux-N01313276.linux_dns_names
}
output "linux_private_ips" {
  value = module.vmlinux-N01313276.linux_private_ips
}
output "linux_public_ips" {
  value = module.vmlinux-N01313276.linux_public_ips
}
output "windows_hostname" {
  value = module.vmwindows-N01313276.windows_hostname
}
output "windows_private_ip" {
  value = module.vmwindows-N01313276.windows_private_ip
}
output "windows_public_ip" {
  value = module.vmwindows-N01313276.windows_public_ip
}
output "windows_dns_name" {
   value = module.vmwindows-N01313276.windows_dns_name
}
output "linux_ids"{
  value = module.vmlinux-N01313276.linux_ids
}
output "load_balancer_name"{
  value = module.loadbalancer-N01313276.load_balancer_name
}
output "postgresql_server_name" {
  value = module.database-N01313276.postgresql_server_name
}
