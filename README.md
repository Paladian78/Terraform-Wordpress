# Introduction

This is a terraform code to deploy Wordpress in a docker and a SQL Database with it.

## Prerequisites

- One must have an active Azure Subscription
- Azure CLI tool should be installed in the system
- Terraform must be intalled

## Input

| Name                            | Description                                                 | Type     |
| ------------------------------- | ----------------------------------------------------------- | -------- |
| prefix                          | This is the prefix for the resources that would be deployed | `string` |
| resource_group_name             | The resource group                                          | `string` |
| location                        | Location for the resource group                             | `string` |
| domain_name_label               | The domain name label for your public IP                    | `string` |
| mysql_server_name               | The name for MY SQL Server                                  | `string` |
| sql_adminstrator_login          | The admin name for MySQL server                             | `string` |
| sql_adminstrator_login_password | SQL Login password                                          | `string` |
| public_network_access_enabled   | Should public access be enabled in MySQL Server             | `bool`   |
| admin_username                  | The admin username for your virtual machine                 | `string` |
| admin_password                  | The password for Virtual machine                            | `string` |
| wordpress_image                 | The image of wordpress to deploy via Docker with tag        | `string` |

## Steps to deploy

- Edit the values in the param.tfvars file according to your preference
- Login to your Azure Account using Azure CLI
  - Command: `az login`
- The above step would redirect you to a browser and you need to log in with your credentials for the azure account.
- Once you get logged in you can deploy the code using the following command:
  - Command: `terraform init`
  - The above command will initialize the terraform in your directory and download all the required modules and providers to run your script.
  - Command: `terraform plan -var-file param.tfvars` (Optional)
  - The above command will lay out all the resources that would be deployed by this script.
  - Command: `terraform apply -var-file param.tfvars`
  - The above command will deploy the resource to your azure environment. You'll be prompted to enter `yes` after the plan is displayed to confirm the deployment.
