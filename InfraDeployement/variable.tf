variable "aws_region" {
  description = "Region for aws"
  type = string
  default = "us-east-1"
}

variable "aws_accesskey" {
  description = "accessKey for aws"
  type = string
  sensitive = true
}

variable "aws_secretkey" {
  description = "secretKey for aws"
  type = string
  sensitive = true
}

variable "azure_region" {
  description = "Region for Azure"
  type = string
  default = "East US"
}

variable "client_id" {
  description = "client id of azure"
  type = string
  sensitive = true
}

variable "client_secret" {
  description = "client secret of azure"
  type = string
  sensitive = true
}

variable "subscription_id" {
  description = "subscribtion id of azure"
  type = string
  sensitive = true
}

variable "tenant_id" {
  description = "tenant id of azure"
  type = string
  sensitive = true
}


variable "name" {
  description = "name of the Azure resource"
  type = string
  default = ""
}

variable "location" {
  description = "location of azure resource"
  type = string
  default = ""
}
