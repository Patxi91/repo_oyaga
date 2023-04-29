# Azure K8 Kubernetes Service with Terraform

This repository provides a Terraform script for creating an Azure kubernetes cluster, using infrastructure as code (IaC) to automate the deployment process. The cluster is built on top of Azure infrastructure and uses Kubernetes for container orchestration. In this setup, the master node is managed by Azure, while worker nodes are used to host one container or application each.

## Overview

The primary objective of this repository is to help users create an kubernetes cluster on Azure infrastructure using Terraform. The following resources will be provisioned as part of the deployment process:

- Azure Resource Group
- Virtual Network (VNet)
- Azure Kubernetes Service (AKS) cluster
- Azure Container Registry (ACR)
- Elastic Search Stack
- Kibana (stateful set) with Load Balancer

Once deployed, the Kibana application will be accessible using the public IP address.

## Prerequisites

To use this Terraform script, you will need the following prerequisites:

- An Azure account
- Terraform installed on your local machine
- Azure CLI installed on your local machine

## Getting Started

1. Clone this repository to your local machine using the following command:

    ```git clone https://github.com/your_username/your_repository.git```

2. Navigate to the repository's directory:

    ```cd your_repository```

3. Update the variables.tf file with your own values. This file contains the variables that will be used to deploy the Azure kubernetes cluster.

4. Run the following commands to initialize Terraform and apply the configuration:

    ```
    terraform init
    terraform apply
    ```

5. Once the deployment is complete, you can access the Kibana application using the public IP address.


### Conclusion

This repository provides a simple and automated way to deploy an Azure kubernetes cluster using Terraform. By using infrastructure as code, we can easily deploy and manage our cluster, allowing to focus on developing and deploying apps.

------------------------------------------------------------------------

## Description

Creation of the service principal via Azure CLI:
```
az ad sp create-for-rbac

{
  "appId": "fcb0218e-3526-4f73-8afe-333a53639b1f",
  "displayName": "azure-cli-2023-04-29-09-28-23",
  "password": "secret",
  "tenant": "2968a404-4e44-4565-ab42-27eee32f4851"
}
```

After "terraform plan", see terraform logs:

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # azurerm_kubernetes_cluster.k8s_cluster will be created
  + resource "azurerm_kubernetes_cluster" "k8s_cluster" {
      + api_server_authorized_ip_ranges     = (known after apply)
      + dns_prefix                          = "azurek8sdemo"
      + fqdn                                = (known after apply)
      + http_application_routing_zone_name  = (known after apply)
      + id                                  = (known after apply)
      + image_cleaner_enabled               = false
      + image_cleaner_interval_hours        = 48
      + kube_admin_config                   = (sensitive value)
      + kube_admin_config_raw               = (sensitive value)
      + kube_config                         = (sensitive value)
      + kube_config_raw                     = (sensitive value)
      + kubernetes_version                  = "1.26.3"
      + location                            = "eastus"
      + name                                = "Azure_K8S-k8scluster"
      + node_resource_group                 = (known after apply)
      + node_resource_group_id              = (known after apply)
      + oidc_issuer_url                     = (known after apply)
      + portal_fqdn                         = (known after apply)
      + private_cluster_enabled             = false
      + private_cluster_public_fqdn_enabled = false
      + private_dns_zone_id                 = (known after apply)
      + private_fqdn                        = (known after apply)
      + public_network_access_enabled       = true
      + resource_group_name                 = "Azure_K8S"
      + role_based_access_control_enabled   = true
      + run_command_enabled                 = true
      + sku_tier                            = "Free"
      + tags                                = {
          + "purpose"   = "epo"
          + "resource"  = "azure_kubernetes_cluster"
          + "terraform" = "yes"
        }
      + workload_identity_enabled           = false

      + default_node_pool {
          + kubelet_disk_type    = (known after apply)
          + max_pods             = (known after apply)
          + name                 = "defaultpool"
          + node_count           = 2
          + node_labels          = (known after apply)
          + orchestrator_version = (known after apply)
          + os_disk_size_gb      = (known after apply)
          + os_disk_type         = "Managed"
          + os_sku               = (known after apply)
          + scale_down_mode      = "Delete"
          + type                 = "VirtualMachineScaleSets"
          + ultra_ssd_enabled    = false
          + vm_size              = "Standard_D2s_v3"
          + workload_runtime     = (known after apply)
        }

      + network_profile {
          + dns_service_ip     = (known after apply)
          + docker_bridge_cidr = (known after apply)
          + ip_versions        = (known after apply)
          + load_balancer_sku  = "basic"
          + network_mode       = (known after apply)
          + network_plugin     = "azure"
          + network_policy     = "azure"
          + outbound_type      = "loadBalancer"
          + pod_cidr           = (known after apply)
          + pod_cidrs          = (known after apply)
          + service_cidr       = (known after apply)
          + service_cidrs      = (known after apply)
        }

      + service_principal {
          + client_id     = "fcb0218e-3526-4f73-8afe-333a53639b1f"
          + client_secret = (sensitive value)
        }
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + client_certificate = (known after apply)
  + kube_config        = (sensitive value)

───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

azurerm_kubernetes_cluster.k8s_cluster: Creation complete after 3m22s [id=/subscriptions/735e6b07-348b-4e40-9f40-53e96bcde8c0/resourceGroups/Azure_K8S/providers/Microsoft.ContainerService/managedClusters/Azure_K8S-k8scluster]

```



