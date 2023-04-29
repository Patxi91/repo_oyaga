variable "location" {
  default = "eastus"
}

locals {
  name = "Azure_K8S"
}

variable "tags" {
  default = {
    terraform = "yes",
    resource  = "AKS",
    purpose   = "demo"
  }
}

variable "address_space" {
  default = ["10.1.0.0/16", "10.1.0.0/24", "10.1.0.0/32"]
}

variable "publicip_sku" {
  default = ["Basic","Standard"]
}