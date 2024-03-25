variable "rg" {
  default = "N01313276-RG"
  type    = string
}
variable "location" {
  default = "canadacentral"
}
variable "resource_group" {
  default = "N01313276-RG"
}
locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Yuvraj.Sandhu"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }
}
variable "common_tags" {
  type = map(string)
  default = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "Yuvraj.Sandhu"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }

}