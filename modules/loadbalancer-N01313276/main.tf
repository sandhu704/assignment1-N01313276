resource "azurerm_public_ip" "assignment1lb_pip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.rg
  allocation_method   = "Static"
  sku                 = "Basic"
  tags                = var.common_tags
}

resource "azurerm_lb" "assignment1lb" {
  name                = var.lb_name
  location            = var.location
  resource_group_name = var.rg
  sku                 = "Basic"
  tags                = var.common_tags

  frontend_ip_configuration {
    name                 = var.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.assignment1lb_pip.id
  }
}

resource "azurerm_lb_backend_address_pool" "assignment1lb_backend_address_pool" {
  loadbalancer_id = azurerm_lb.assignment1lb.id
  name            = var.backend_address_pool_name
}

resource "azurerm_lb_probe" "assignment1lb_probe" {
  loadbalancer_id = azurerm_lb.assignment1lb.id
  name            = "httpProbe"
  protocol        = "Http"
  request_path    = "/health"
  port            = 80
}

resource "azurerm_lb_rule" "assignment1lb_rule" {
  loadbalancer_id                = azurerm_lb.assignment1lb.id
  name                           = "httpRule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = var.frontend_ip_configuration_name
  probe_id                       = azurerm_lb_probe.assignment1lb_probe.id
}

resource "azurerm_network_interface_backend_address_pool_association" "main" {
  for_each                = var.linux_nic_ids
  network_interface_id    = each.value
  ip_configuration_name   = "${each.key}-ipconfig"
  backend_address_pool_id = azurerm_lb_backend_address_pool.assignment1lb_backend_address_pool.id
}
