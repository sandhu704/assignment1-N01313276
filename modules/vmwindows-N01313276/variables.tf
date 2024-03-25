locals {
  common_tags = {
    Name         = "Terraform-Class"
    Project      = "Learning"
    ContactEmail = "n01313276@humber.ca"
    Environment  = "Test"
  }
}
variable "windows_avs" {
  default = "windows_avs"
}
variable "wos_disk_attr" {
  type = map(string)
  default = {
    wos_storage_account_type = "Premium_LRS"
    wos_disk_size            = "128"
    wos_disk_caching         = "ReadWrite"
  }
}
variable "windows_admin_user" {
  default = "winadm"
}
variable "windows_os" {
  default = {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
variable "vm_size" {
  default = "Standard_B1s"
}

variable "windows_name" {
  default = "n01313276-w-vm"
}
variable "location" {
  default = "canadacentral"
}
variable "rg" {
  default     = "N01313276-RG"
  type        = string
  description = "This resource group is to"
}
variable "resource_group" {
  default = "N01313276-RG"
}
variable "subnet_id" {
  type = string
}

variable "nb_count" {
  default = "1"
}
variable "storage_account_uri" {
  type = string
}
variable "AntimalwareVer" {
  default = "1.0"
  type    = string
}