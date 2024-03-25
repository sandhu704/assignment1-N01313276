variable "vnet" {
  default = "N01313276-VNET"

}
variable "vnet_space" {

  default = ["10.0.0.0/16"]

}
variable "subnet1" {

  default = "N01313276-SUBNET"
}

variable "subnet_space1" {
  default = ["10.0.1.0/24"]
}


variable "nsg1" {
  default = "network-nsg1"
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