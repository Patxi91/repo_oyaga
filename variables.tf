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
