resource "azurerm_postgresql_server" "assignment1db" {
  name                = var.postgres_server_name
  location            = var.location
  resource_group_name = var.rg

  administrator_login          = var.postgres_admin_username
  administrator_login_password = var.postgres_admin_password

  sku_name   = var.postgres_sku_name
  storage_mb = var.postgres_storage_mb
  version    = var.postgres_version

  backup_retention_days   = var.backup_retention_days
  ssl_enforcement_enabled = var.postgres-ssl_enforcement_enabled
  tags                    = var.common_tags
}