variable "name" {
  description = "The name of the AKS cluster"
  type        = string
}

variable "location" {
  description = "The location of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}


variable "tags" {
  description = "Tags for the AKS cluster"
  type        = map(string)
  default     = {}
}


variable "public_ip_id" {
  description = "The ID of the public IP associated with the Load Balancer"
  type        = string
}
