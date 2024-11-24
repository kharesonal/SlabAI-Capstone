terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.76.0"
    }
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.10.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
  client_id       = var.client_id
  client_secret   = var.client_secret
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id

}

provider "aws" {
  region  = var.aws_region
  access_key = var.aws_accesskey
  secret_key = var.aws_secretkey
}

module "aws" {
  source = "./aws"
}

module "azure" {
  source = "./azure"
}
