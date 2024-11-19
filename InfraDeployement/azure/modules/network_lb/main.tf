resource "azurerm_lb" "nlb" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "frontend"
    public_ip_address_id = var.public_ip_id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "backend_pool" {
  name                = "backend-pool"
  loadbalancer_id     = azurerm_lb.nlb.id
}


resource "azurerm_lb_probe" "health_probe" {
  name                = "health-probe"
  protocol            = "Tcp"
  port                = 3000
  interval_in_seconds = 5
  number_of_probes    = 2
  loadbalancer_id     = azurerm_lb.nlb.id
}

resource "azurerm_lb_rule" "http_rule" {
  name                           = "http-rule"
  protocol                       = "Tcp"
  frontend_port                  = 3000
  backend_port                   = 3000
  frontend_ip_configuration_name = "frontend"
  probe_id                       = azurerm_lb_probe.health_probe.id
  loadbalancer_id                = azurerm_lb.nlb.id
}


output "lb_id" {
  value = azurerm_lb.nlb.id
}

output "frontend_ip" {
  value = azurerm_lb.nlb.frontend_ip_configuration[0].public_ip_address_id
}
