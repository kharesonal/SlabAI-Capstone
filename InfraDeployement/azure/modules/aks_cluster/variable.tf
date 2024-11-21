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

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster"
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster"
  type        = number
}

variable "vm_size" {
  description = "The size of the virtual machine for the AKS nodes"
  type        = string
}

# variable "subnet_id" {
#   description = "The subnet ID for the AKS cluster"
#   type        = string
# }

variable "tags" {
  description = "Tags for the AKS cluster"
  type        = map(string)
  default     = {}
}


# variable "public_ip_id" {
#   description = "The ID of the public IP associated with the Load Balancer"
#   type        = string
# }