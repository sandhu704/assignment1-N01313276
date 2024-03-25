terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01313276RG"
    storage_account_name = "tfstaten01313276sa"
    container_name       = "tfstatefiles"
    key                  = "terraform-state-lab05"
  }
}