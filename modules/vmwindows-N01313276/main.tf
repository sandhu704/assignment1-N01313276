resource "azurerm_availability_set" "avsetwin" {
  name                         = var.windows_avs
  location                     = var.location
  resource_group_name          = var.rg
  platform_fault_domain_count  = "2"
  platform_update_domain_count = "5"
  tags                         = local.common_tags
}
resource "azurerm_windows_virtual_machine" "vmwindows" {
  count                 = var.nb_count
  name                  = "${var.windows_name}${(format("%1d", count.index + 1))}"
  location              = var.location
  resource_group_name   = var.rg
  tags                  = local.common_tags
  network_interface_ids = [element(azurerm_network_interface.windows_nic[*].id, count.index + 1)]
  computer_name         = "${var.windows_name}${(format("%1d", count.index + 1))}"
  size                  = var.vm_size
  admin_username        = var.windows_admin_user
  admin_password        = "P@ssword!2305"
  availability_set_id   = azurerm_availability_set.avsetwin.id
  depends_on            = [azurerm_availability_set.avsetwin]

  os_disk {
    name                 = "${var.windows_name}${var.windows_name}${format("%1d", count.index + 1)}-os-disk"
    caching              = var.wos_disk_attr["wos_disk_caching"]
    storage_account_type = var.wos_disk_attr["wos_storage_account_type"]
    disk_size_gb         = var.wos_disk_attr["wos_disk_size"]
  }
  source_image_reference {
    publisher = var.windows_os.publisher
    offer     = var.windows_os.offer
    sku       = var.windows_os.sku
    version   = var.windows_os.version
  }
  winrm_listener {
    protocol = "Http"
  }
  boot_diagnostics {
    storage_account_uri = var.storage_account_uri
  }
}
resource "azurerm_network_interface" "windows_nic" {
  count               = var.nb_count
  name                = "${var.windows_name}${format("%1d", count.index + 1)}-nic"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.common_tags

  ip_configuration {
    name                          = "${var.windows_name}${var.windows_name}${format("%1d", count.index + 1)}-ipconfig"
    subnet_id                     = var.subnet_id
    public_ip_address_id          = element(azurerm_public_ip.windows_pip[*].id, count.index + 1)
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_public_ip" "windows_pip" {
  count               = var.nb_count
  name                = "${var.windows_name}${var.windows_name}${format("%1d", count.index + 1)}-pip"
  location            = var.location
  resource_group_name = var.rg
  tags                = local.common_tags
  domain_name_label   = "${var.windows_name}${format("%1d", count.index + 1)}"
  allocation_method   = "Dynamic"
}

resource "azurerm_virtual_machine_extension" "NetworkWatcher" {
  count                      = var.nb_count
  name                       = "Antimalware"
  virtual_machine_id         = element(azurerm_windows_virtual_machine.vmwindows[*].id, count.index + 1)
  publisher                  = "Microsoft.Azure.Security"
  type                       = "IaaSAntimalware"
  type_handler_version       = var.AntimalwareVer
  auto_upgrade_minor_version = "true"
  depends_on                 = [azurerm_windows_virtual_machine.vmwindows]
  tags                       = local.common_tags
}