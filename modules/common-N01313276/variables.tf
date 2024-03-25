locals {
  common_tags = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "Yuvraj.Sandhu"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}
variable "common_tags" {
    type = map(string) 
    default = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "Yuvraj.Sandhu"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
    }
  
}

variable "log_analytics_workspace" {
  type = map(string)
  default = {
    law_name  = "N01313276-LAW"
    log_sku   = "PerGB2018"
    retention = 30
  }
}
variable "recovery_services_vault" {
  type = map(string)
  default = {
    vault_name = "N01313276-VAULT"
    vault_sku  = "Standard"
  }
}
variable "rg" {
  default = "N01313276-RG"
  type    = string
}
variable "location" {
  default = "canadacentral"
}
variable "resource_group" {
  default = "resource_group"
}
variable "storage_account" {
  default = "n01313276storageacccount"
}
