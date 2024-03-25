resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
  tags = var.common_tags
}