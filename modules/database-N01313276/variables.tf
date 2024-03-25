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
variable "postgres_server_name" {
  description = "Specifies the name of the PostgreSQL Server."
  type        = string
}

variable "postgres_admin_username" {
  description = "The Administrator Login for the PostgreSQL Server."
  type        = string
}

variable "postgres_admin_password" {
  description = "The Password associated with the administrator_login for the PostgreSQL Server."
  type        = string
  sensitive   = true
}

variable "postgres_sku_name" {
  description = "Specifies the SKU Name for the PostgreSQL Server. The name of the SKU, follows the tier + name pattern."
  type        = string
  default     = "GP_Gen5_2"
}

variable "postgres_storage_mb" {
  description = "Max storage allowed for the PostgreSQL server in MB."
  type        = number
  default     = 5120  # 5GB
}

variable "backup_retention_days" {
  description = "Backup retention days for the PostgreSQL server."
  type        = number
  default     = 7
}

variable "postgres_version" {
  description = "Specifies the version of PostgreSQL to use."
  type        = string
  default     = "11"
}

variable "postgres-ssl_enforcement_enabled" {
  description = "Specifies if SSL should be enforced on connections."
  type        = bool
  default     = true
}