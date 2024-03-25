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

variable "rg" {
  default     = "N01313276-RG"
  type        = string
}
variable "location" {
  default = "canadacentral"
}
variable "resource_group" {
  default = "resource_group"  
}
variable "linux_name" {
  default = {
    n01313276-cos-vm1 = "Standard_B1s"
    n01313276-cos-vm2 = "Standard_B1ms"
    n01313276-cos-vm3 = "Standard_B1s"
  }
}

variable "data_disk_attr" {
  type = map(string)
  default = {
    data_disk_type = "Premium_LRS"
    data_disk_size            = 32
    data_disk_caching              = "ReadWrite"
    data_disk_create_option = "Empty"
  }

}
variable "linux_ids" {
    type = map(string)
}