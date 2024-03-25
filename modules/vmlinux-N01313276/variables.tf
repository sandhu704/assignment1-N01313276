locals {
  common_tags = {
    Assignment = "CCGC 5502 Automation Assignment"
    Name = "Yuvraj.Sandhu"
    ExpirationDate = "2024-12-31"
    Environment = "Learning"
  }
}
variable "linux_name" {
  default = {
    n01313276-cos-vm1 = "Standard_B1s"
    n01313276-cos-vm2 = "Standard_B1ms"
    n01313276-cos-vm3 = "Standard_B1s"
  }
}

variable "admin_username" {
  default = "yuvra"
}
variable "pub_key" {
  default = "C:/Users/yuvra/.ssh/id_rsa.pub"
}
variable "priv_key" {
  default = "C:/Users/yuvra/.ssh/id_rsa"
}
variable "os_disk" {
  type = map(string)
  default = {
    storage_account_type = "Premium_LRS"
    disk_size            = "32"
    caching              = "ReadWrite"
  }
}
variable "cent_os" {
  default = {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
}
variable "linux_avs" {
  default = "linux_avs"
}
variable "rg" {
  default     = "N01313276-RG"
  type        = string
  description = "This resource group is to"
}
variable "resource_group" {
  default = "N01313276-RG"  
}
variable "location" {
  default = "canadacentral"
}
variable "subnet_id" {
  type = string
}
variable "NetworkWatchVer" {
  default = "l.0"
  type = string
}
variable "storage_account_uri" {
  type = string
}
