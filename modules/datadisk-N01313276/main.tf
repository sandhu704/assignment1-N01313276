resource "azurerm_managed_disk" "data_disk" {
  for_each             = var.linux_ids
  name                 = "${each.key}-data-disk"
  location             = var.location
  resource_group_name  = var.rg
  storage_account_type = var.data_disk_attr["data_disk_type"]
  create_option        = var.data_disk_attr["data_disk_create_option"]
  disk_size_gb         = var.data_disk_attr["data_disk_size"]
  tags                 = var.common_tags
}

resource "azurerm_virtual_machine_data_disk_attachment" "data_disk_attach" {
  for_each           = var.linux_ids
  virtual_machine_id = each.value
  managed_disk_id    = azurerm_managed_disk.data_disk[each.key].id
  lun                = 0
  caching            = var.data_disk_attr["data_disk_caching"]
}