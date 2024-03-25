resource "azurerm_log_analytics_workspace" "ls_workspace" {
  name                = var.log_analytics_workspace["law_name"]
  location            = var.location
  resource_group_name = var.rg
  sku                 = var.log_analytics_workspace["log_sku"]
  retention_in_days   = var.log_analytics_workspace["retention"]
  depends_on          = [var.rg]
  tags                = local.common_tags
}
resource "azurerm_recovery_services_vault" "recovery_vault" {
  name                = var.recovery_services_vault["vault_name"]
  location            = var.location
  resource_group_name = var.rg
  sku                 = var.recovery_services_vault["vault_sku"]
  depends_on          = [var.rg]
  tags                = local.common_tags
}
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account
  resource_group_name      = var.rg
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.common_tags
}
