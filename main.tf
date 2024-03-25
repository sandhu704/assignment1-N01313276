module "rgroup-N01313276" {
  source     = "./modules/rgroup-N01313276"
  rg = "N01313276-RG"
  location   = "canadacentral"
}
module "network-N01313276" {
  source ="./modules/network-N01313276"
  rg = "N01313276-RG"
  location = module.rgroup-N01313276.rg.location
  resource_group = module.rgroup-N01313276.rg.name
  vnet = "vnet1"
  vnet_space = ["10.0.0.0/16"]
  subnet1 = "subnet1"
  subnet_space1 = ["10.0.1.0/24"]
  nsg1 = "nsg1"
}

module "common-N01313276" {
  source ="./modules/common-N01313276"
  rg = "N01313276-RG"
  location = module.rgroup-N01313276.rg.location
  resource_group = module.rgroup-N01313276.rg.name
  log_analytics_workspace = {
    law_name = "N01313276-LAW"
    log_sku = "PerGB2018"
    retention = 30 
  }
  recovery_services_vault = {
    vault_name = "N01313276-VAULT"
    vault_sku = "Standard"
  }
  storage_account = "n01313276storageacccount"
}
module "vmlinux-N01313276"{
  source ="./modules/vmlinux-N01313276"
  location = module.rgroup-N01313276.rg.location
  resource_group = module.rgroup-N01313276.rg.name
  subnet_id = module.network-N01313276.subnet1_id
  storage_account_uri = module.common-N01313276.storage_account_uri
  admin_username = "yuvra"
  pub_key = "C:/Users/yuvra/.ssh/id_rsa.pub"
  priv_key = "C:/Users/yuvra/.ssh/id_rsa"
  os_disk = {
    storage_account_type = "Premium_LRS"
    disk_size            = "32"
    caching              = "ReadWrite"
  }

  linux_name = {
    n01313276-cos-vm1 = "Standard_B1s"
    n01313276-cos-vm2 = "Standard_B1ms"
    n01313276-cos-vm3 = "Standard_B1s"
  }

cent_os =  {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "8_2"
    version   = "latest"
  }
  linux_avs = "linux_avs"
  NetworkWatchVer = "1.0"
  }
  module "vmwindows-N01313276" {
  source ="./modules/vmwindows-N01313276"
  location = module.rgroup-N01313276.rg.location
  resource_group = module.rgroup-N01313276.rg.name
  subnet_id = module.network-N01313276.subnet1_id
  storage_account_uri = module.common-N01313276.storage_account_uri
  windows_admin_user = "winadm"
  windows_name = "n01313276-w-vm"
  nb_count = 1
  vm_size = "Standard_B1s"
  wos_disk_attr = {
    wos_storage_account_type = "Premium_LRS"
    wos_disk_size            = "128"
    wos_disk_caching              = "ReadWrite"
  }
windows_os =  {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
  windows_avs = "windows_avs"
  AntimalwareVer = "1.0"
}
module "datadisk-N01313276"{
  source = "./modules/datadisk-N01313276"
  location = module.rgroup-N01313276.rg.location
  resource_group = module.rgroup-N01313276.rg.name
  linux_ids = module.vmlinux-N01313276.linux_ids

   linux_name = {
    n01313276-cos-vm1 = "Standard_B1s"
    n01313276-cos-vm2 = "Standard_B1ms"
    n01313276-cos-vm3 = "Standard_B1s"
  }
   data_disk_attr = {
    data_disk_type = "Premium_LRS"
    data_disk_size            = "32"
    data_disk_caching              = "ReadWrite"
    data_disk_create_option = "Empty"
  }
}
module "loadbalancer-N01313276"{
    source = "./modules/loadbalancer-N01313276"
    location = module.rgroup-N01313276.rg.location
   resource_group = module.rgroup-N01313276.rg.name
    linux_nic_ids = module.vmlinux-N01313276.linux_nic_ids
}
module "database-N01313276" {
  source = "./modules/database-N01313276"
  location = module.rgroup-N01313276.rg.location
  resource_group = module.rgroup-N01313276.rg.name
  postgres_server_name      = "assignment1db-postgres-server"
  postgres_admin_username   = "postgresadmin"
  postgres_admin_password   = "P@ssword!2305"
}
