output "s3_bucket_name" {
  value = module.aws.s3_bucket_name
}

output "s3_website_url" {
  value = module.aws.s3_website_url
}


output "cloudfront_domain_name" {
  value = module.aws.cloudfront_domain_name
}

output "aks_cluster_id" {
  description = "Cluster ID"
  value = module.azure.aks_cluster_id
}


# output "lb_id" {
#   description = "LoadBalancer ID"
#   value = module.azure.lb_id
# }

# output "frontend_ip" {
#   description = "FrontEnd IP"
#   value = module.azure.frontend_ip
# }