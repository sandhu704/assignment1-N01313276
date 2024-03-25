resource "azurerm_availability_set" "avset" {
  name                         = var.linux_avs
  location                     = var.location
  resource_group_name          = var.rg
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
  tags                         = local.common_tags
}
resource "azurerm_network_interface" "linux_nic" {
  for_each            = var.linux_name
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.common_tags

  ip_configuration {
    name                          = "${each.key}-ipconfig"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = azurerm_public_ip.linux_pip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_public_ip" "linux_pip" {
  for_each            = var.linux_name
  name                = "${each.key}-pip"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.common_tags
  domain_name_label   = each.key
  allocation_method   = "Dynamic"
}
resource "azurerm_linux_virtual_machine" "vmlinux" {
  for_each              = var.linux_name
  name                  = each.key
  location              = var.location
  resource_group_name   = var.rg
  tags                  = local.common_tags
  network_interface_ids = [azurerm_network_interface.linux_nic[each.key].id]
  computer_name         = each.key
  size                  = each.value
  admin_username        = var.admin_username
  availability_set_id   = azurerm_availability_set.avset.id
  depends_on            = [azurerm_availability_set.avset]
  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.pub_key)
  }
  os_disk {
    name                 = "${each.key}-os-disk"
    caching              = var.os_disk["caching"]
    storage_account_type = var.os_disk["storage_account_type"]
    disk_size_gb         = var.os_disk["disk_size"]
  }
  source_image_reference {
    publisher = var.cent_os.publisher
    offer     = var.cent_os.offer
    sku       = var.cent_os.sku
    version   = var.cent_os.version
  }
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}
resource "azurerm_virtual_machine_extension" "NetworkWatcher" {
  for_each                   = var.linux_name
  name                       = "NetworkWatcherAgentLinux"
  virtual_machine_id         = azurerm_linux_virtual_machine.vmlinux[each.key].id
  publisher                  = "Microsoft.Azure.NetworkWatcher"
  type                       = "NetworkWatcherAgentLinux"
  type_handler_version       = var.NetworkWatchVer
  auto_upgrade_minor_version = "true"
  depends_on                 = [azurerm_linux_virtual_machine.vmlinux, null_resource.linux_provisioner]
  tags                       = local.common_tags
}
