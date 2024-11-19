resource "azurerm_resource_group" "rg" {
  name     = "rg-aks-nlb"
  location = "East US"
}

# Public IP for Load Balancer
resource "azurerm_public_ip" "public_ip" {
  name                = "public-ip-nlb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Dynamic"
  sku                 = "Standard"
}

# AKS Cluster
module "aks_cluster" {
  public_ip_id        = azurerm_public_ip.public_ip.id
  source              = "./modules/aks_cluster"
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myaks"
  node_count          = 3
  vm_size             = "Standard_DS2_v2"
  subnet_id           = azurerm_subnet.aks_subnet.id
}

# Network Load Balancer
module "network_lb" {
  source              = "./modules/network_lb"
  name                = "my-nlb"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  public_ip_id        = azurerm_public_ip.public_ip.id
}
