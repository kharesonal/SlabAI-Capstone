resource "azurerm_resource_group" "rg" {
  name     = "sukhil-batch5"
  location = "Australia East"
}

# resource "azurerm_virtual_network" "vnet" {
#   name                = "vnet-aks"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   address_space       = ["10.1.0.0/16"]
# }

# resource "azurerm_subnet" "aks_subnet" {
#   name                 = "aks-subnet"
#   resource_group_name  = azurerm_resource_group.rg.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.1.1.0/24"]
# }

# # Public IP for Load Balancer
# resource "azurerm_public_ip" "public_ip" {
#   name                = "public-ip-nlb"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   allocation_method   = "Static"
#   sku                 = "Standard"
# }

# AKS Cluster
module "aks_cluster" {
  # public_ip_id        = azurerm_public_ip.public_ip.id
  source              = "./modules/aks_cluster"
  name                = "my-aks-cluster"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "myaks"
  node_count          = 1
  vm_size             = "Standard_D2s_v3"
  # subnet_id           = azurerm_subnet.aks_subnet.id
}

# # Network Load Balancer
# module "network_lb" {
#   depends_on = [ azurerm_subnet.aks_subnet ]
#   source              = "./modules/network_lb"
#   name                = "my-nlb"
#   location            = azurerm_resource_group.rg.location
#   resource_group_name = azurerm_resource_group.rg.name
#   public_ip_id        = azurerm_public_ip.public_ip.id
# }
