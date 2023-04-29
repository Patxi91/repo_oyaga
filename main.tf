resource "azurerm_resource_group" "oyaga_azure_k8s" {
  location = var.location
  name     = local.name
  tags     = var.tags
}

resource "random_id" "azure_random" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "azure_works" {
  location            = var.location
  name                = "k8s-workspace-${random_id.azure_random.hex}"
  resource_group_name = azurerm_resource_group.oyaga_azure_k8s.name
  sku                 = "PerGB2018"
  retention_in_days   = 15
}

resource "azurerm_log_analytics_solution" "azure_logs" {
  location              = azurerm_resource_group.oyaga_azure_k8s.location
  resource_group_name   = azurerm_resource_group.oyaga_azure_k8s.name
  solution_name         = "ContainerInsights"
  workspace_name        = azurerm_log_analytics_workspace.azure_works.name
  workspace_resource_id = azurerm_log_analytics_workspace.azure_works.id
  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}

resource "azurerm_virtual_network" "vnet" {
  address_space       = [element(var.address_space, 0)]
  location            = var.location
  name                = "${local.name}-vnet"
  resource_group_name = azurerm_resource_group.oyaga_azure_k8s.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "${local.common_name}-subnet"
  resource_group_name  = azurerm_resource_group.oyaga_azure_k8s.name
  virtual_network_name = azurerm_virtual_network.vnet.name
}

resource "azurerm_public_ip" "public_ip" {
  location            = var.location
  name                = "${local.name}-public_ip"
  resource_group_name = azurerm_resource_group.oyaga_azure_k8s.name
  allocation_method = "Static"
  sku = element(var.publicip_sku,1 )
}