variable "linux_nic_ids" {
 type = map(string) 
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

variable "lb_name" {
  description = "The name of the load balancer."
  default     = "assignment11b"
}

variable "public_ip_name" {
  description = "The name of the public IP resource."
  default     = "PublicIPAddress"
}

variable "frontend_ip_configuration_name" {
  description = "The name of the front-end IP configuration."
  default     = "LoadBalancerFrontEnd"
}

variable "backend_address_pool_name" {
  description = "The name of the backend address pool."
  default     = "BackendAddressPool"
}
