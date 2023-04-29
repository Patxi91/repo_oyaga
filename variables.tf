variable "location" {
  default = "eastus"
}

locals {
  name = "Azure_K8S"
}

variable "tags" {
  default = {
    terraform = "yes",
    resource  = "azure_kubernetes_cluster",
    purpose   = "epo"
  }
}

variable "address_space" {
  default = ["10.1.0.0/16", "10.1.0.0/24", "10.1.0.0/32"]
}

variable "publicip_sku" {
  default = ["Basic","Standard"]
}

variable "dns_prefix" {
  default = "azurek8sdemo"
}

variable "agent_pool" {
  default = ["defaultpool","Standard_D2s_v3"]
}

variable "client_id" {
  default = ""
}

variable "client_secret" {
  default = ""
}

variable "network_profile" {
  default = ["azure", "kubenet", "Standard"]
}