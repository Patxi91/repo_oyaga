resource "azurerm_resource_group" "oyaga_azure_k8s" {
  location = var.location
  name     = local.name
  tags     = var.tags
}