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
